import 'package:objd/core.dart';

/// checks the server version (e.g. 1.14) - increments, such as 1.14.1, aren't and can't be detected
class ServerVersionCheck extends Widget {
  final int minVersion;
  final List<Widget> versionTooLow;
  final Widget Function(Score) then;
  final Score serverVersion;

  ServerVersionCheck({
    this.minVersion,
    this.versionTooLow,
    this.serverVersion,
    this.then,
  });

  @override
  generate(Context context) {
    Entity e = Entity(type: Entities.armor_stand, tags: ["objd_version_check"]);

    var s = serverVersion ??
        Score(Entity.PlayerName("server_version"), "objd_data");

    return For.of([
      ArmorStand.staticMarker(
        Location("~ 0 ~"),
        small: true,
        tags: ["objd_version_check"],
        mainHand: Item(
          Items.trident,
          count: 1,
          nbt: {
            "objd": {"update": 13}
          },
        ),
        offHand: Item(
          Items.lectern,
          count: 1,
          nbt: {
            "objd": {"update": 14}
          },
        ),
        head: Item(
          Items.bee_spawn_egg,
          count: 1,
          nbt: {
            "objd": {"update": 15}
          },
        ),
      ),

      // check items

      If(
        e.copyWith(nbt: {
          "HandItems": [
            {
              "tag": {
                "fard": {"update": 13}
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
          "HandItems": [
            {
              "tag": {
                "fard": {"update": 14}
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
          "ArmorItems": [
            {
              "tag": {
                "fard": {"update": 14}
              }
            }
          ]
        }),
        then: [
          s >> 15,
        ],
      ),

      if (then != null)
        then(s),

      if (minVersion != null && versionTooLow != null)
        If(
          Condition.not(s >= 15),
          then: versionTooLow,
        ),

      Kill(e),
    ]);
  }
}
