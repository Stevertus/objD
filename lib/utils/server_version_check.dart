import 'package:objd/core.dart';

/// checks the server version (e.g. 1.14) - increments, such as 1.14.1, aren't and can't be detected
class ServerVersionCheck extends Widget {
  final int minVersion;
  final List<Widget> versionTooLow;
  final Widget Function(Score) then;
  final Score serverVersion;

  /// Checks the used Minecraft Version and can give feedback on it(e.g. Errors).
  ///
  /// | constructor |  |
  /// |--|--|
  /// |minVersion| the aimed version number as int(1.15 = `15`) |
  /// |versionTooLow| a List of Widgets that are executed if it detects that the version is lower that minVersion |
  /// |then| a Function that takes in the used Score and reacts respectively returning a Widget(optional) |
  /// |serverVersion| change the scores name(optional) |
  ServerVersionCheck({
    this.minVersion,
    this.versionTooLow,
    this.serverVersion,
    this.then,
  });

  @override
  Widget generate(Context context) {
    var e = Entity(type: Entities.armor_stand, tags: ['objd_version_check']);

    var s = serverVersion ??
        Score(Entity.PlayerName('server_version'), 'objd_data');

    return For.of([
      ArmorStand.staticMarker(
        Location('~ 0 ~'),
        small: true,
        tags: ['objd_version_check'],
        mainHand: Item(
          Items.trident,
          count: 1,
          nbt: {
            'objd': {'update': 13}
          },
        ),
        offHand: Item(
          Items.lectern,
          count: 1,
          nbt: {
            'objd': {'update': 14}
          },
        ),
        head: Item(
          Items.bee_spawn_egg,
          count: 1,
          nbt: {
            'objd': {'update': 15}
          },
        ),
      ),

      // check items

      If(
        e.copyWith(nbt: {
          'HandItems': [
            {
              'tag': {
                'fard': {'update': 13}
              }
            }
          ]
        }),
        then: [
          s >> 13,
        ],
      ),
      If(
        e.copyWith(nbt: {
          'HandItems': [
            {
              'tag': {
                'fard': {'update': 14}
              }
            }
          ]
        }),
        then: [
          s >> 14,
        ],
      ),
      If(
        e.copyWith(nbt: {
          'ArmorItems': [
            {
              'tag': {
                'fard': {'update': 14}
              }
            }
          ]
        }),
        then: [
          s >> 15,
        ],
      ),

      if (then != null) then(s),

      if (minVersion != null && versionTooLow != null)
        If(
          Condition.not(s >= 15),
          then: versionTooLow,
        ),

      Kill(e),
    ]);
  }
}
