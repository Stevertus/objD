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
  List<String> commands;
  String path;
  Widget child;


  BuildFile(File file){
    path = file.path;
    child = file.child;
    commands = [];
  }

  add(String str){
    if(str != null && str.isNotEmpty) commands.add(str);
  }

  @override
  String toString() {
    return commands.toString();
  }

  
}

