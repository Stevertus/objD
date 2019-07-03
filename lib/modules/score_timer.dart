import 'package:meta/meta.dart';
import 'package:objd/core.dart';

class ScoreTimerModule extends Module {
  Score _score;
  String name;
  String path;
  Widget child;
  Entity selector;
  int steps;
  int ticks;
  int start;

  ScoreTimerModule(
    this.name, {
    this.child,
    this.selector,
    this.steps = 1,
    this.path = "timers/",
    @required this.ticks,
    this.start = 0,
  }) {
    if (selector == null) selector = Entity.PlayerName(name);
    _score = Score(selector, name);
    assert(ticks != null);
  }
  Widget generate(Context context) {
    return For.of([
      if (steps >= 0) _score.add(steps),
      if (steps < 0) _score.subtract(steps),
      If(_score.matches(ticks), Then: [
        File(path + name, execute: true, create: false),
      ]),
    ]);
  }

  List<File> registerFiles() => [
        File(
          path + name,
          child: For.of(
            [
              child,
              _score.set(start),
            ],
          ),
        )
      ];
}
