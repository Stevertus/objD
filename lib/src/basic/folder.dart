import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/context.dart';

/// The Folder Widget gives you a way to place all following files inside a specific folder path.
class Folder extends Widget {
  String path;
  Widget child;

  /// The Folder Widget gives you a way to place all following files inside a specific folder path.
  ///
  /// | constructor |                                             |
  /// | ----------- | ------------------------------------------- |
  /// | String      | the folder path                             |
  /// | child       | another Widget that inherits the given path |
  ///
  /// **Example:**
  ///
  /// ```dart
  /// Folder(
  /// 	'custom',
  /// 	child: For.of([
  /// 		File('main')
  /// 		File('subfolder/test')
  /// 	]),
  /// )
  /// ```
  ///
  /// Would create 2 functions: `functions/custom/main.mcfunction` and `functions/custom/subfolder/test.mcfunction`

  Folder(
    this.path, {
    required this.child,
  });

  @override
  Widget generate(Context context) => child;
}
