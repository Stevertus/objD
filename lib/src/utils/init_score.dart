import 'package:objd/core.dart';

/// Initializes a Score to value if not set previously .
class InitScore extends Widget {
  Score score;
  int value;

  /// Initializes a Score to value if not set previously .
  ///
  /// | constructor |                              |
  /// | ----------- | ---------------------------- |
  /// | Score       | the mandatory Score          |
  /// | value       | the aimed value(default = 1) |
  /// |             |
  ///
  /// **Example:** (preferably used in a load function)
  ///
  /// ```dart
  /// InitScore(
  /// 	Score(Entity.Self(), 'myscore'),
  /// 	value: 10,
  /// )
  /// ```

  InitScore(
    this.score, {
    this.value = 1,
  });

  @override
  Widget generate(Context context) {
    return If.not(
      Condition(score & score),
      then: [
        score.set(value),
      ],
    );
  }
}
