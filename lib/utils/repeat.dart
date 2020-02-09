import 'package:meta/meta.dart';
import 'package:objd/core.dart';

/// The Repeat Widget repeats a given action multiple times with a tick delay.
class Repeat extends RestActionAble {
  String name;
  String path;
  Widget child;
  String counter;
  int to;
  int ticks;

  /// The Repeat Widget repeats a given action multiple times with a tick delay.
  Repeat(
    this.name, {
    @required this.child,
    @required this.to,
    this.counter = 'objd_repeat',
    this.path = 'timers',
    this.ticks = 1,
  });

  @override
  Widget generate(Context context) {
    var score = Score(Entity.PlayerName(name), counter);
    var filePath = path + '/' + name;
    return For.of([
      score.set(0),
      File.execute(filePath,
          child: For.of([
            child,
            score.add(1),
            If(
              score.matchesRange(Range.to(to)),
              then: [
                Schedule(filePath, ticks: ticks),
              ],
            )
          ]))
    ]);
  }
}
