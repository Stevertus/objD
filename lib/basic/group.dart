import 'package:objd/basic/widget.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/file.dart';
import 'package:objd/build/build.dart';
import 'package:meta/meta.dart';

class Group extends Widget {
  static int fileId = 1;
  bool _isFile = false;
  String prefix;
  String filename;
  String path;
  List<Widget> children;
  int groupMin;
  Group(
      {@required this.prefix,
      @required this.children,
      this.path = "objd",
      this.groupMin = 3,
      this.filename = "group",generateIDs=true}) {
    assert(children != null);
    if (groupMin > -1 && children.length > 0 && children.length >= groupMin) {
      if(generateIDs){
        filename += fileId.toString();
        fileId++;
      }
      _isFile = true;
    }
  }

  String getPath(){
    return path + '/' + filename;
  }

  @override
  Widget generate(Context context) {
    if (_isFile) {
      return File(
        execute: true,
        path: getPath(),
        child: For.of(children),
      );
    }
    return For.of(children);
  }
}
