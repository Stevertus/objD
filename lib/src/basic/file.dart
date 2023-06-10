import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';

import 'package:objd/src/wrappers/comment.dart';

class File extends Widget {
  Widget? child;
  String path;
  String? pack;
  bool execute;
  bool create;
  bool? isRecursive;
  Comment? header;
  bool inheritFolder;

  /// The file class simply generates a new mcfunction file with content and a path.
  ///
  /// The File class can be used as often as you want and where you want, so you can also define a new file in a For container for example.
  /// ```dart
  /// File(
  /// 	path:"main",
  /// 	child: File.execute( // same as execute: true
  /// 		path: 'new'
  /// 		child: Command(...)
  /// 	)
  /// )
  /// ```
  File(
    this.path, {
    this.child,
    this.execute = false,
    this.pack,
    this.create = true,
    this.inheritFolder = true,
    this.header,
  }) {
    path.replaceAll('.mcfunction', '');
    if (path.substring(0, 1) == '/') path = path.substring(1);
  }

  /// the execute subconstructor adds an execution statement forwarding to the new file into the original
  File.execute(
    this.path, {
    this.child,
    this.pack,
    this.create = true,
    this.header,
    this.inheritFolder = true,
  }) : execute = true {
    path.replaceAll('.mcfunction', '');
    if (path.substring(0, 1) == '/') path = path.substring(1);
  }
  File.recursive()
      : isRecursive = true,
        execute = true,
        path = '',
        create = false,
        inheritFolder = true;

  ///  File.strait generates the child strait through a method you give using a StraitWidget. You need a StraitWidget on around every strait content
  ///  ```dart
  ///  File.strait(path, child: (List<Widget> cont) {
  ///   ...
  ///  });
  ///  ```
  factory File.strait(
    String path, {
    required Function(List<Widget>) child,
    bool execute = false,
    String? pack,
    bool create = true,
    Comment? header,
  }) =>
      File(
        path,
        child: StraitWidget(child),
        execute: execute,
        pack: pack,
        create: create,
        header: header,
      );

  factory File.executeStrait(
    String path, {
    required Function(List<Widget>) child,
    String? pack,
    bool create = true,
    Comment? header,
  }) =>
      File(
        path,
        child: StraitWidget(child),
        execute: true,
        pack: pack,
        create: create,
        header: header,
      );

  File run({bool create = false}) => File.execute(
        path,
        pack: pack,
        create: create,
        child: child,
      );

  Path fullPath([Path? p]) => inheritFolder && p != null
      ? p.append(path, type: 'mcfunction')
      : Path.from(path, type: 'mcfunction');

  @override
  Widget generate(Context context) {
    if (isRecursive != null && isRecursive!) path = context.file;

    pack ??= context.packId;
    return Command('function $pack:$path');
  }

  @override
  Map toMap() => {
        'File': {'path': path, 'child': child?.toMap(), 'execute': execute}
      };
}
