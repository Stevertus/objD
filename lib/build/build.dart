import 'package:objd/build/create_project.dart';
import 'package:objd/basic/text.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/pack.dart';
import 'package:objd/basic/group.dart';
import 'package:objd/basic/file.dart';

class Context {
  List<String> prefixes;
  String packId;
  String file;
  Context({this.prefixes, this.packId = "", this.file = ""}){
    if(prefixes == null) prefixes = [];
  }

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
  BuildFile(this._path, [this._child]);

  String generate(String packID) {
    if (_child == null) return "";
    List<String> ret =
        _generateRek(_child, Context(packId: packID, file: _path), []);
    // return the final string after going through each child
    return ret.join('\n');
  }
  String get path => _path;
  List<String> _generateRek(Widget wid, Context context, List<String> ret) {
    if (ret == null) ret = List();
    // recursivly step through each child and add all generated commands in ret
    if (wid is File) {
      if (wid.execute) _generateRek(wid.execution,context,ret);
      return ret;
    }
    if (wid is Pack) return ret;

    if (wid is Group) context.addPrefix(wid.prefix);

    if (wid is Text) return addAndReturn(ret, (context.prefixes.length > 0 ? (context.prefixes.join(' ') + ' '):'') + wid.generate(context));

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
      return "File: " + _path + (_child == null ? '' : ' with child\n' + this.generate('test')) + '\n';
    }
}

Map build(Project prj) {
  var ret = _getFiles(prj.generate, {'packs': []}, -1);
  ret.addAll({'path':prj.target,'name':prj.name,'description':prj.description});
  return ret;
  //return _rekBuild(prj.generate,ret: {"test": "test"}, context: Context(prefixes: [], packId: ""));
}

Map _getFiles(dynamic wid, Map ret, int currentPackIndex) {
  if (wid is File) {
    assert(ret['packs'][currentPackIndex] != null);

    ret['packs'][currentPackIndex]['files'].add(BuildFile(wid.path, wid.child));
    if (wid.child != null && wid.child is Widget) {
      return ret = _getFiles(wid.child, ret, currentPackIndex);
    }
    return ret;
  }
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

  if (wid is Widget) {
    dynamic child = wid.generate(Context());
    if (child is Widget) {
      return ret = _getFiles(child, ret, currentPackIndex);
    }
  }
  return ret;
  // throw('Tree ends unexpectedly at' + wid.toString() + '\n Could not build Project!');
}

dynamic _rekBuild(dynamic wid, {Map ret, Context context}) {
  if (wid is File) {
    Map result = {};
    if (wid.child != null && wid.child is Widget) {
      result['generation'] = _rekBuild(wid.child, ret: ret, context: context);
    }
    result.addAll({'type': 'file', 'path': wid.path});
    return result;
  }

  dynamic widBuild = wid.generate(context);
  try {
    if (widBuild is Text) {
      return ret;
    }

    if (widBuild is Pack) {
      List files = [];
      Map result = {};
      if (widBuild.files != null) files = widBuild.files;
      if (widBuild.load != null) {
        result['load'] = widBuild.load.path;
        files.insert(0, widBuild.load);
      }
      if (widBuild.main != null) {
        result['main'] = widBuild.main.path;
        files.insert(0, widBuild.main);
      }
      result.addAll({
        'type': 'pack',
        'files': files.map((x) =>
            _rekBuild(x, ret: ret, context: Context(packId: widBuild.name)))
      });
      return result;
    }

    // if (widBuild.child != null && widBuild.child is Widget) {
    //   return _rekBuild(widBuild.child, ret: ret,context: context);
    // }

    // if (widBuild.children != null && widBuild.children is List<Widget>) {
    //   return widBuild.children.map((x) {
    //     return _rekBuild(x, ret: ret,context: context);
    //   }).join('\n');
    // }
    if (widBuild is List<Widget>) {
      return widBuild.map((x) => _rekBuild(x, ret: ret, context: context));
    }
    if (widBuild is Widget) {
      // dynamic child = widBuild.generate(context);
      // print(child);
      // if (child is Widget || child is List<Widget>) {
      return _rekBuild(widBuild, ret: ret, context: context);
      //}
    }
  } catch (e) {
    print(e);
  }
  throw "Cannot build Widget: " + widBuild.toString();
}
