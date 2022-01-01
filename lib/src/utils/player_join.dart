import 'package:objd/core.dart';

/// Allows you to specify what should happen if a player joins. This can be triggered every time or just once with PlayerJoin.inital
class PlayerJoin extends Widget {
  final Entity? target;
  final String score;
  final Widget? then;
  final Widget Function(Score)? _then_v;
  final String subcommand;

  /// This will create a [score] that counts leave_game stats and checks if the player has the [score] thus detecting if a player joins.
  ///
  /// | constructor |                                                              |
  /// | ----------- | ------------------------------------------------------------ |
  /// | then        | A Widget that gets executed by the player that joins         |
  /// | target      | The targeted player that will throw this event(default = @a) |
  /// | score       | The scoreboard that is used(default = `objd_join`)           |

  PlayerJoin({
    required this.then,
    this.target,
    this.score = 'objd_join',
  })  : subcommand = "join",
        _then_v = null;

  /// This will create a [score] that counts leave_game stats and thus detects if a player rejoins.
  ///
  /// | constructor |                                                              |
  /// | ----------- | ------------------------------------------------------------ |
  /// | then        | A Widget that gets executed by the player that joins         |
  /// | target      | The targeted player that will throw this event(default = @a) |
  /// | score       | The scoreboard that is used(default = `objd_join`)           |
  PlayerJoin.rejoin({
    required this.then,
    this.target,
    this.score = 'objd_join',
  })  : subcommand = "rejoin",
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
    Widget Function(Score)? then,
    this.target,
    this.score = 'objd_join',
  })  : subcommand = "initial",
        then = null,
        _then_v = then;

  @override
  Widget generate(Context context) {
    final type = subcommand == "initial"
        ? 'dummy'
        : 'minecraft.custom:minecraft.leave_game';
    final s = Scoreboard(
      score,
      type: type,
    );
    final current = s[Entity.PlayerName('#current')];
    final self = s[Entity.Self()];
    final t = target ?? Entity.All();

    switch (subcommand) {
      case "initial":
        if (_then_v != null) {
          return Execute(
            as: t,
            If: Condition.not(self >= 0),
            children: [
              s,
              current.add(1),
              _then_v!(current),
              self >> current,
            ],
          );
        }
        break;
      case "join":
        return For.of([
          s,
          // This will only pass if the player doesn't have the score (the score cannot be below 0), therefore triggering on first join
          Execute.as(
            t,
            children: [
              If(
                Condition.or([
                  Condition.not(self >= 0),
                  self > 0,
                ]),
                then: [
                  then!,
                  self >> 0,
                ],
              )
            ],
          )
        ]);
    }

    // if subcommand=rejoin or _then_v=null
    return Execute.as(
      t.copyWith(scores: [self > 0]),
      children: [
        s,
        then!,
        self >> 0,
      ],
    );
  }
}
