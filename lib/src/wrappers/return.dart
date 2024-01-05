import 'package:objd/core.dart';

/// Simple return command with integer return value
class Return extends Widget {
  final int val;

  /// Simple return command with integer return value
  ///
  /// Can be used in conjunction with *File* and scores to calculate with the return value:
  /// ```dart
  ///  Score(Entity.Self(),'test') << File('filename', child: Return(5));
  /// ```
  Return(this.val);

  @override
  Widget generate(Context context) {
    if (context.version < 20) {
      throw "Return requires at least version 20";
    }
    return Command('return $val');
  }
}
