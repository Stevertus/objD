import 'package:objd/core.dart';

class Damage extends Widget {
  final Entity target;
  final double amount;
  final String? damageType;
  final Location? location;
  final Entity? by;
  final String? cause;

  Damage({
    required this.target,
    required this.amount,
    this.damageType,
    this.location,
    this.by,
    this.cause,
  })  : assert(amount >= 0),
        assert(location == null || cause == null);
  Damage.at(
    this.location, {
    required this.target,
    required this.amount,
    this.damageType,
  })  : by = null,
        cause = null;
  Damage.by(
    this.by, {
    required this.target,
    required this.amount,
    this.damageType,
    this.cause,
  }) : location = null;

  @override
  Widget generate(Context context) {
    return CommandBuilder('damage $target $amount')
        .string(damageType)
        .when(
          location != null,
          then: 'at $location',
          otherwise: 'by $by',
        )
        .string(cause, prefix: 'from ');
  }
}
