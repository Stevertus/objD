import 'package:objd/basic/text.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/pack.dart';
import 'package:objd/basic/group.dart';
import 'package:objd/basic/file.dart';
import 'package:objd/basic/extend.dart';
import 'context.dart';

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