import 'package:objd/build/create_project.dart';
import 'package:objd/basic/text.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/pack.dart';
import 'package:objd/basic/group.dart';
import 'package:objd/basic/file.dart';
import 'package:objd/basic/scoreboard.dart';
import 'package:objd/basic/extend.dart';

class Context {
  List<String> prefixes;
  String packId;
  String file;
  String loadFile;
  String mainFile;
  Context({this.prefixes, this.packId = "", this.file = "",this.loadFile = "load",this.mainFile="main"}) {
    if (prefixes == null) prefixes = [];
  }

  Context.clone(Context context): this(
    prefixes: new List<String>.from(context.prefixes),
    packId:context.packId,
    file:context.file,
    loadFile:context.loadFile,
    mainFile:context.mainFile
    );

  Context addPrefix(String prev) {
    prefixes.insert(0, prev);
    return this;
  }
}

List addAndReturn(List list, dynamic item) {
  list.add(item);
  return list;
}

class BuildFile {
  String _path;
  Widget _child;
  BuildFile(this._path, this._child);

  String get path => _path;
  Widget get child => _child;

  String generate(Map pack) {
    if (_child == null) return "";
    List<String> ret =
        _generateRek(_child, Context(packId: pack['name'], file: _path, loadFile: pack['load'] ?? 'load',mainFile: pack['main'] ?? 'main'), []);
    // return the final string after going through each child
    return ret.join('\n');
  }

  List<String> _generateRek(Widget wid, Context context, List<String> ret) {
    if (ret == null) ret = List();
    // recursivly step through each child and add all generated commands in ret
    if (wid is File) {
      if (wid.execute) _generateRek(wid.generate(context), context, ret);
      return ret;
    }
    if (wid is Pack || wid is Extend) return ret;

    if (wid is Group) return this._generateRek(wid.generate(context), Context.clone(context).addPrefix(wid.prefix), ret) ;

    if (wid is Text)
      return addAndReturn(
          ret,
          (context.prefixes.length > 0
                  ? (context.prefixes.join(' ') + ' ')
                  : '') +
              wid.generate(context));

    if (wid is Widget) {
      dynamic child = wid.generate(context);
      // is single widget
      if (child is Widget) return this._generateRek(child, context, ret);
      // is list widget
      if (child is List<Widget>) {
        child.forEach((x) {
          ret = this._generateRek(x, context, ret);
        });
        return ret;
      }
      throw "Cannot build Widget: " + wid.toString();
    }

    return ret;
  }

  @override
  String toString() {
    return "File: " +
        _path +
        (_child == null ? '' : ' with child\n' + this.generate({"name":'test'})) +
        '\n';
  }
}

Map build(Project prj) {
  var ret = _getFiles(prj.generate, {'packs': []}, -1);
  ret.addAll(
      {'path': prj.target, 'name': prj.name, 'description': prj.description});
  return ret;
  //return _rekBuild(prj.generate,ret: {"test": "test"}, context: Context(prefixes: [], packId: ""));
}

Map _getFiles(dynamic wid, Map ret, int currentPackIndex) {
  if (wid is File || wid is Extend) {
    // does the current pack exist?
    assert(ret['packs'][currentPackIndex] != null);

    // is there already a file with this path?
    var fileIndex = ret['packs'][currentPackIndex]['files']
        .indexWhere((file) => file.path == wid.path);

    if (fileIndex >= 0) {

      List<Widget> children = [
            ret['packs'][currentPackIndex]['files'][fileIndex].child,
            wid.child
      ];

      if(wid is File || wid.first == true ){
        children = children.reversed.toList();
      }

      ret['packs'][currentPackIndex]['files'][fileIndex] = new BuildFile(
          wid.path,
          For.of(children));
    } else {
      ret['packs'][currentPackIndex]['files']
          .add(new BuildFile(wid.path, wid.child));
    }

    if (wid.child != null && wid.child is Widget) {
      ret = _getFiles(wid.child, ret, currentPackIndex);
      wid.child = Text("");
      return ret;
    }
    return ret;
  }
  // if (wid is Extend) {
  //   var fileIndex = ret['packs'][currentPackIndex]['files']
  //       .indexWhere((file) => file.path == wid.path);
  //   if (fileIndex >= 0) {
  //     ret['packs'][currentPackIndex]['files'][fileIndex] = new BuildFile(
  //         wid.path,
  //         For.of([
  //           ret['packs'][currentPackIndex]['files'][fileIndex].child,
  //           wid.child
  //         ]));
  //   } else {
  //     ret['packs'][currentPackIndex]['files']
  //         .add(new BuildFile(wid.path, wid.child));
  //   }
  //   wid.child = Text("");
  //   return ret;
  // }
  if (wid is Pack) {
    List files = [];
    Map result = {'files': [], 'name': wid.name};
    if (wid.files != null) files = wid.files;
    if (wid.load != null && wid.load is File) {
      result['load'] = wid.load.path;
      files.insert(0, wid.load);
    }
    if (wid.main != null && wid.main is File) {
      result['main'] = wid.main.path;
      files.insert(0, wid.main);
    }
    ret['packs'].add(result);
    currentPackIndex = ret['packs'].indexOf(result);
    files.forEach((file) {
      ret = _getFiles(file, ret, currentPackIndex);
    });
    return ret;
  }
  if (wid is For) {
    wid.children.forEach((x) {
      ret = _getFiles(x, ret, currentPackIndex);
    });
    return ret;
  }
  if (wid is Scoreboard && wid.subcommand == "add") {
      if(ret['scoreboards'] == null) ret['scoreboards'] = [];
      if(ret['scoreboards'].contains(wid.name)) return ret;
      ret['scoreboards'].add(wid.name);
  };
  if (wid is Widget) {
    Map pack = {}; 
    if(currentPackIndex >= 0) pack = ret['packs'][currentPackIndex];
    dynamic child = wid.generate(
      pack != null ?
      Context(packId: pack['name'] ?? '',loadFile: pack['load'] ?? 'load',mainFile: pack['main'] ?? 'main') : Context()
      );
    if (child is Widget) {
      return ret = _getFiles(child, ret, currentPackIndex);
    }
  }
  return ret;
  // throw('Tree ends unexpectedly at' + wid.toString() + '\n Could not build Project!');
}
