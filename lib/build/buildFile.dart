import 'package:objd/basic/text.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/pack.dart';
import 'package:objd/basic/group.dart';
import 'package:objd/basic/file.dart';
import 'package:objd/basic/extend.dart';
import 'package:objd/build/buildPack.dart';
import 'package:objd/build/buildProject.dart';
import 'context.dart';
import 'scan.dart' as Scanner;

List addAndReturn(List list, dynamic item) {
  list.add(item);
  return list;
}

class BuildFile {
  List<String> commands;
  String path;
  Widget child;

  bool isGen = true;


  BuildFile(File file){
    path = file.path;
    child = file.child;
    commands = [];
  }
  BuildFile.extended(Extend file){
    path = file.path;
    child = file.child;
    commands = [];
  }

  add(String str){
    if(str != null && str.isNotEmpty){
      commands.add(str);
    } 
  }

  List toMap() {
    return commands;
  }

  generate({Context context, BuildPack pack, BuildProject prj}){
    Scanner.scan(child,context:context,file:this,pack:pack,project:prj);
  }

  
}

