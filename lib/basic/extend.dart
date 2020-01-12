import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/build.dart';

class Extend extends RestActionAble {
  Widget child;
  String path;
  bool first;

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
  Extend(this.path, {this.child, this.first = false}) {
    assert(path != null, 'Please provide a files path to extend');
    path.replaceAll('.mcfunction', '');
    if (path.substring(0, 1) == '/') path = path.substring(1);
  }

  @override
  Widget generate(Context context) {
    return child;
  }

  @override
  Map toMap() {
    return {
      'File': {'path': path, 'child': child.toMap()}
    };
  }
}
