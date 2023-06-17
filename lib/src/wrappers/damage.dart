import 'package:objd/core.dart';

class Damage extends Widget {
  final Entity target;
  final double amount;
  final String? damageType;
  final Location? location;
  final Entity? by;
  final Entity? cause;

  /// Wrapper for the damage command which simulates the situation of causing damage to the entity.
  ///
  /// | constructor |                                          |
  /// | ----------- | ---------------------------------------- |
  /// | Entity      | target entity      |
  /// | amount    | floating point number (must >= 0) |
  /// | damageType | String type of damage(optional) |
  /// | location | Location where to deal the damage(optional) |
  /// | by | Entity which deals damage(optional, not together with location) |
  /// | cause |  specifies the cause Entity of the damage(optional, only together with by) |
  ///
  /// ```dart
  /// Damage(
  ///   Entity.Self(),
  ///   amount: 4.5,
  ///   damageType: "minecraft:falling_block"
  /// )
  /// ⇒ damage @s 4.5 minecraft:falling_block
  /// ```
  Damage(
    this.target, {
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
    if (context.version < 19.4) {
      throw "Damage requires at least version 19.4";
    }

    return CommandBuilder('damage $target $amount')
        .string(damageType)
        .when(
          location != null,
          then: 'at $location',
          otherwise: by != null ? 'by $by' : null,
        )
        .string(cause?.toString(), prefix: 'from ');
  }
}
