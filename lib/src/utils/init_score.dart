import 'package:objd/core.dart';

class InitScore extends Widget {
  Score score;
  int value;
  List<Widget>? children;

  /// Initializes Score to value if not set previously
  InitScore(
    this.score, {
    this.value = 1,
    this.children,
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
