import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/basic/file.dart';
import 'package:objd/src/basic/extend.dart';
import 'package:objd/src/build/build_pack.dart';
import 'package:objd/src/build/build_project.dart';
import 'context.dart';
import 'scan.dart' as scanner;

List addAndReturn(List list, dynamic item) {
  list.add(item);
  return list;
}

class BuildFile {
  StringBuffer commands;
  Widget? child;

  bool isGen = true;

  BuildFile(File file) : commands = StringBuffer() {
    child = file.child;
    if (file.header != null) commands.writeln(file.header!.text);
  }

  BuildFile.fromWidget(this.child) : commands = StringBuffer();

  BuildFile.extended(Extend file)
      : child = file.child,
        commands = StringBuffer();

  void add(String? str) {
    if (str != null && str.isNotEmpty) {
      commands.writeln(str);
    }
  }

  String toMap() {
    return commands.toString();
  }

  void generate({
    required Context context,
    required BuildPack pack,
    BuildProject? prj,
  }) {
    if (child != null) {
      scanner.scan(
        child!,
        context: context,
        commands: commands,
        pack: pack,
        project: prj,
      );
    }
  }
}
