import 'package:objd/core.dart';

class Ride extends Widget {
  final Entity entity;
  final Entity? vehicle;

  /// Makes one entity ride another.
  /// ```dart
  /// Ride(Entity.Self(), Entity(type: Entities.minecart, limit:1))
  /// ⇒ ride @s mount @e[limit=1,type=minecraft:minecart]
  /// ```
  Ride(
    /// target entity
    this.entity,

    /// vehicle entity, eg. boat, minecart, animal
    Entity this.vehicle,
  );

  /// With `Ride.dismount` you can dismount an entity
  Ride.dismount(this.entity) : vehicle = null;

  @override
  Widget generate(Context context) {
    if (context.version < 19.4) {
      throw "Ride requires at least version 19.4";
    }

    return CommandBuilder('ride $entity').when(
      vehicle == null,
      then: 'dismount',
      otherwise: 'mount $vehicle',
    );
  }
}
