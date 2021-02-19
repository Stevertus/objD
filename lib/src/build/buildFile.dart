import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/basic/file.dart';
import 'package:objd/src/basic/extend.dart';
import 'package:objd/src/build/buildPack.dart';
import 'package:objd/src/build/buildProject.dart';
import 'context.dart';
import 'scan.dart' as scanner;

List addAndReturn(List list, dynamic item) {
  list.add(item);
  return list;
}

class BuildFile {
  StringBuffer commands;
  String path;
  Widget child;

  bool isGen = true;

  BuildFile(File file) {
    path = file.path;
    child = file.child;
    commands = StringBuffer();
    if (file.header != null) commands.writeln(file.header.text);
  }

  BuildFile.fromWidget(this.child, this.path) {
    commands = StringBuffer();
  }

  BuildFile.extended(Extend file) {
    path = file.path;
    child = file.child;
    commands = StringBuffer();
  }

  void add(String str) {
    if (str != null && str.isNotEmpty) {
      commands.writeln(str);
    }
  }

  String toMap() {
    return commands.toString();
  }

  void generate({Context context, BuildPack pack, BuildProject prj}) {
    scanner.scan(
      child,
      context: context,
      commands: commands,
      pack: pack,
      project: prj,
    );
  }
}
