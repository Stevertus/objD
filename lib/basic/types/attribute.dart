class Attributes {
  /// A List of all AttributeTypes
  static const List<AttributeType> all = [
    armor,
    armor_toughness,
    attack_damage,
    attack_knockback,
    attack_speed,
    flying_speed,
    follow_range,
    knockback_resistance,
    luck,
    max_health,
    movement_speed,
    horse_jump_strength,
    zombie_spawn_reinforcements,
  ];

  /// A List of all generic AttributeTypes that can be applied to all entities
  static const List<AttributeType> generic = [
    armor,
    armor_toughness,
    attack_damage,
    attack_knockback,
    attack_speed,
    flying_speed,
    follow_range,
    knockback_resistance,
    luck,
    max_health,
    movement_speed,
  ];

  /// _(minecraft:generic.armor)_
  static const AttributeType armor = AttributeType('minecraft:generic.armor');

  /// _(minecraft:generic.armor_toughness)_
  static const AttributeType armor_toughness =
      AttributeType('minecraft:generic.armor_toughness');

  /// _(minecraft:generic.armor_toughness)_
  static const AttributeType attack_damage =
      AttributeType('minecraft:generic.attack_damage');

  /// _(minecraft:generic.attack_knockback)_
  static const AttributeType attack_knockback =
      AttributeType('minecraft:generic.attack_knockback');

  /// _(minecraft:generic.attack_speed)_
  static const AttributeType attack_speed =
      AttributeType('minecraft:generic.attack_speed');

  /// _(minecraft:generic.flying_speed)_
  static const AttributeType flying_speed =
      AttributeType('minecraft:generic.flying_speed');

  /// _(minecraft:generic.follow_range)_
  static const AttributeType follow_range =
      AttributeType('minecraft:generic.follow_range');

  /// _(minecraft:generic.knockback_resistance)_
  static const AttributeType knockback_resistance =
      AttributeType('minecraft:generic.knockback_resistance');

  /// _(minecraft:generic.luck)_
  static const AttributeType luck = AttributeType('minecraft:generic.luck');

  /// _(minecraft:generic.max_health)_
  static const AttributeType max_health =
      AttributeType('minecraft:generic.max_health');

  /// _(minecraft:generic.movement_speed)_
  static const AttributeType movement_speed =
      AttributeType('minecraft:generic.movement_speed');

  /// _(minecraft:horse.jump_strength)_
  static const AttributeType horse_jump_strength =
      AttributeType('minecraft:horse.jump_strength');

  /// _(minecraft:zombie.spawn_reinforcements)_
  static const AttributeType zombie_spawn_reinforcements =
      AttributeType('minecraft:zombie.spawn_reinforcements');
}

class AttributeType {
  final String type;
  const AttributeType(this.type);

  @override
  bool operator ==(dynamic other) {
    if (other is AttributeType && other.type == type) {
      return true;
    }
    if (other is String && other == type) {
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return type;
  }
}
