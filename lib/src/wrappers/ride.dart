import 'package:objd/core.dart';

class Ride extends Widget {
  final Entity entity;
  final Entity? vehicle;

  Ride(this.entity, Entity this.vehicle);
  Ride.dismount(this.entity) : vehicle = null;

  @override
  Widget generate(Context context) {
    return CommandBuilder('ride $entity').when(
      vehicle == null,
      then: 'dismount',
      otherwise: 'mount $vehicle',
    );
  }
}
