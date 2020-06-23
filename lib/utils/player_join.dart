import 'package:meta/meta.dart';
import 'package:objd/core.dart';

/// Allows you to specify what should happen if a player joins. This can be triggered every time or just once with PlayerJoin.inital
class PlayerJoin extends Widget {
  final Entity target;
  final String score;
  final Widget then;
  final Widget Function(Score) _then_v;
  final bool _isInitial;

  /// This will create a [score] that counts leave_game stats and thus detects if a player rejoins.
  ///
  /// | constructor |                                                              |
  /// | ----------- | ------------------------------------------------------------ |
  /// | then        | A Widget that gets executed by the player that joins         |
  /// | target      | The targeted player that will throw this event(default = @a) |
  /// | score       | The scoreboard that is used(default = `objd_join`)           |

  PlayerJoin({
    @required this.then,
    this.target,
    this.score = 'objd_join',
  })  : _isInitial = false,
        _then_v = null;

  /// This gives every player a unique id on join and enables you to do something the first time around with the [score] holding the players id.
  ///
  /// | PlayerJoin.inital |                                                                          |
  /// | ----------------- | ------------------------------------------------------------------------ |
  /// | then              | A Function accepting a Score that gets executed by the player that joins |
  /// | target            | The targeted player that will throw this event(default = @a)             |
  /// | score             | The scoreboard that is used(default = `objd_join`)                       |

  PlayerJoin.initial({
    /// A Function accepting a Score that gets executed by the player that joins
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
