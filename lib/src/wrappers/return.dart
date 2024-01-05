import 'package:objd/core.dart';

/// Simple return command with integer return value
class Return extends Widget {
  final int val;
  final Widget? run;

  /// Simple return command with integer return value
  ///
  /// Can be used in conjunction with *File* and scores to calculate with the return value:
  /// ```dart
  ///  Score(Entity.Self(),'test') << File('filename', child: Return(5));
  /// ```
  Return(this.val) : run = null;

  /// Returns the result of a command
  ///
  /// The provided Widget should just return a single command!
  Return.run(Widget this.run) : val = 0;

  /// Returns a failing state(success & value = 0)
  Return.fail()
      : val = 0,
        run = Comment.LineBreak();

  @override
  Widget generate(Context context) {
    if (context.version < 20) {
      throw "Return requires at least version 20";
    }
    if (run != null) {
      if (run case Comment(text: '')) return Command('return fail');
      return Command(
        'return run ${getCommands(run!.generate(context), context: context).first}',
      );
    }

    return Command('return $val');
  }
}
