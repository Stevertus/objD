import 'package:objd/basic/widget.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/file.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/build/build.dart';
import 'package:meta/meta.dart';

class Group extends Widget {
  static int fileId = 1;
  int _myId = 0;
  bool _isFile = false;
  String prefix;
  String filename;
  List<Widget> children;
  int groupMin;
  Group(
      {@required this.prefix,
      @required this.children,
      this.groupMin = 3,
      this.filename = "group"}) {
    assert(children != null);
    if (groupMin > -1 && children.length > 0 && children.length >= groupMin) {
      _myId = Group.fileId;
      Group.fileId++;
      _isFile = true;
    }
  }

  @override
  Widget generate(Context context) {
    if (_isFile) {
      return File(
        execute: true,
        path: 'objd/' + filename + _myId.toString(),
        child: For.of(children),
      );
    }
    return For.of(children);
  }
}
