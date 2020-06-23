import 'package:objd/basic/command.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';

/// The Spawnpoint Widget sets a players spawnpoint to the current or specified [position]
class Spawnpoint extends RestActionAble {
  final Entity entity;
  final Location position;

  /// Sets the respawn point of a player to a certain position.
  ///
  /// | constructor  |                                                                                      |
  /// | ------------ | ------------------------------------------------------------------------------------ |
  /// | entity       | the Entity selector for your player |
  /// | position       | the Location of the spawnpoint(optional) |
  ///
  /// **Example:**
  /// ```dart
  /// Spawnpoint(
  /// 	entity: Entity.Player(),
  /// 	position: Location.rel(y: -10),
  /// )
  /// ⇒ spawnpoint @p ~ ~-10 ~
  /// ```
  Spawnpoint({this.entity, this.position});

  @override
  Widget generate(Context context) {
    var cmd = 'spawnpoint';
    if (entity != null) {
      cmd += ' ' + entity.toString();
      if (position != null) cmd += ' ' + position.toString();
    }

    return Command(cmd);
  }
}
