import 'package:meta/meta.dart';
import 'package:objd/core.dart';

class PlayerJoin extends Widget {
  final Entity target;
  final String score;
  final Widget then;
  final Widget Function(Score) _then_v;
  final bool _isInitial;

  PlayerJoin({
    @required this.then,
    this.target,
    this.score = 'objd_join',
  })  : _isInitial = false,
        _then_v = null;
  PlayerJoin.initial({
    Widget Function(Score) then,
    this.target,
    this.score = 'objd_join',
  })  : _isInitial = true,
        then = null,
        _then_v = then;

  @override
  Widget generate(Context context) {
    final s = Scoreboard(
      score,
      type: _isInitial ? 'dummy' : 'minecraft.custom:minecraft.leave_game',
    );
    final current = s[Entity.PlayerName('#current')];
    final self = s[Entity.Self()];
    final t = target ?? Entity.All();
    if (_isInitial) {
      return Execute(
        as: t,
        If: Condition.not(self >= 0),
        children: [
          current.add(1),
          _then_v(current),
          self >> current,
        ],
      );
    }

    return Execute.as(
      t.copyWith(scores: [self > 0]),
      children: [
        then,
        self >> 0,
      ],
    );
  }
}
