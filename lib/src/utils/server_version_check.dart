import 'package:objd/core.dart';

/// checks the server version (e.g. 1.14) - increments, such as 1.14.1, aren't and can't be detected
class ServerVersionCheck extends Widget {
  final int? minVersion;
  final List<Widget>? versionTooLow;
  final Widget Function(Score)? then;
  final Score? serverVersion;

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
    var e1 = Entity(type: Entities.armor_stand, tags: ['objd_vers_1315']);
    var e2 = Entity(type: Entities.armor_stand, tags: ['objd_vers_1617']);

    var s = serverVersion ??
        Score(Entity.PlayerName('server_version'), 'objd_data');

    return For.of([
      ArmorStand.staticMarker(
        Location('~ 0 ~'),
        small: true,
        tags: ['objd_vers_1315'],
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
      ArmorStand.staticMarker(
        Location.rel(y: 0),
        small: true,
        tags: ['objd_vers_1617'],
        mainHand: Item(
          Items.hoglin_spawn_egg,
          count: 1,
          nbt: {
            'objd': {'update': 16}
          },
        ),
        offHand: Item(
          Items.glow_ink_sac,
          count: 1,
          nbt: {
            'objd': {'update': 17}
          },
        ),
      ),

      // check items e1
      for (var i in [13, 14, 15])
        If(
          e1.copyWith(nbt: {
            'HandItems': [
              {
                'tag': {
                  'objd': {'update': i}
                }
              }
            ]
          }),
          then: [
            s >> i,
          ],
        ),
      // check items e2
      for (var i in [16, 17])
        If(
          e2.copyWith(nbt: {
            'HandItems': [
              {
                'tag': {
                  'objd': {'update': i}
                }
              }
            ]
          }),
          then: [
            s >> i,
          ],
        ),

      if (then != null) then!(s),

      if (minVersion != null && versionTooLow != null)
        If(
          Condition.not(s >= minVersion),
          then: versionTooLow!,
        ),

      Kill(e1),
      Kill(e2),
    ]);
  }
}
