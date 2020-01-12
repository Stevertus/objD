import 'package:meta/meta.dart';
import 'package:objd/core.dart';

/// The ScoreTimerModule implements a continuous timer with a delay of a number of ticks. It therefore uses a Score to count up or down in steps and resets to the start value afterwards.
class ScoreTimerModule extends Module {
  Score _score;
  String name;
  String path;
  Widget child;
  Entity selector;
  int steps;
  int ticks;
  int start;

  /// The ScoreTimerModule implements a continuous timer with a delay of a number of ticks. It therefore uses a Score to count up or down in steps and resets to the start value afterwards.
  ///
  /// > To work probably this has to be executed every tick or added to the Packs modules.
  ///
  /// | constructor |  |
  /// |--|--|
  /// |String| the name of the Timer and the Scoreboard |
  /// |ticks| the delay in ticks between each execution(required) |
  /// |child| a Widget that is executed after the delay |
  /// |steps| the number that it counts up every time(default = 1) |
  /// |start| a number that is used to reset the timer after the delay(default = 0) |
  /// |selector| a custom selector to hold the score (default = playername of name) |
  /// |path| a custom path to hold the required function(default = timers/) |
  ///
  /// **Example:**
  ///
  /// ```dart
  /// ScoreTimerModule(
  ///           'timer1',
  ///           ticks: 200, // 10sec
  ///           child: Log('Timer triggered'),
  ///           steps: 1,
  ///           start: 0,
  /// )
  /// ```

  ScoreTimerModule(
    this.name, {
    this.child,
    this.selector,
    this.steps = 1,
    this.path = 'timers/',
    @required this.ticks,
    this.start = 0,
  }) {
    selector ??= Entity.PlayerName(name);
    _score = Score(selector, name);
    assert(ticks != null);
  }
  @override
  Widget generate(Context context) {
    return For.of([
      if (steps >= 0) _score.add(steps),
      if (steps < 0) _score.subtract(steps),
      If(_score.matches(ticks), then: [
        File(path + name, execute: true, create: false),
      ]),
    ]);
  }

  @override
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
