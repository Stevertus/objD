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
    var e = Entity(
        type: Entities.chest_minecart, tags: ['objd_version_check'], limit: 1);

    final s = serverVersion ??
        Score(Entity.PlayerName('server_version'), 'objd_data');

    final items = {
      13: Items.trident,
      14: Items.lectern,
      15: Items.bee_spawn_egg,
      16: Items.hoglin_spawn_egg,
      17: Items.glow_ink_sac,
      18: Items.music_disc_otherside,
    };

    return For.of([
      Summon(
        Entities.chest_minecart,
        tags: ['objd_version_check'],
        location: Location('~ 0 ~'),
        nbt: {
          'Items': items.keys
              .where((v) => v >= (minVersion ?? 0))
              .map((v) => Item(
                    items[v],
                    count: 1,
                    slot: Slot.chest(v - 12),
                    nbt: {
                      'objd': {'update': v}
                    },
                  ).getMap())
              .toList(),
        },
      ),

      // check items e1
      for (var i in items.keys.where((v) => v >= (minVersion ?? 0)))
        If(
          e.copyWith(nbt: {
            'Items': [
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

      Data.merge(e, nbt: {'Items': []}),
      Kill(e),
    ]);
  }
}
