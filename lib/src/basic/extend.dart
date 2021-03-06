import 'package:objd/src/basic/rest_action.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/build.dart';

class Extend extends RestActionAble {
  Widget? child;
  String path;
  bool first;
  bool inheritFolder;

  /// Extend is very similar to File, but instead of creating a new file it adds content to an existing file.
  ///
  /// So lets say we already have some files in our pack, but want to add something to the main file somewhere entirely else in our project:
  ///
  /// ```dart
  /// Extend(
  /// 	"main",
  /// 	child: Command("say okay"),
  /// 	first: true
  /// )
  /// ```
  /// This would add the command `say okay` in front of our main.mcfunction.
  Extend(
    this.path, {
    this.child,
    this.first = false,
    this.inheritFolder = false,
  }) {
    path.replaceAll('.mcfunction', '');
    if (path.substring(0, 1) == '/') path = path.substring(1);
  }

  Path fullPath([Path? p]) => inheritFolder && p != null
      ? p.append(path, type: 'mcfunction')
      : Path.from(path, type: 'mcfunction');

  @override
  Widget? generate(Context context) {
    return child;
  }

  @override
  Map toMap() {
    return {
      'File': {'path': path, 'child': child?.toMap()}
    };
  }
}
