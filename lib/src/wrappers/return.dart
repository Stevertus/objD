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
    if (context.version < 19.4) {
      throw "FillBiome requires at least version 19.4";
    }
    return Command('return $val');
  }
}
