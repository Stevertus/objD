import 'package:objd/external/predicates/tag.dart';

class RandomChance extends Tag {
  final double chance;
  final double looting_multiplier;

  RandomChance(this.chance)
      : looting_multiplier = null,
        assert(chance != null),
        assert(
            chance >= 0 && chance <= 1, 'The chance must be between 0 and 1');

  RandomChance.withLooting(this.chance, this.looting_multiplier)
      : assert(chance != null),
        assert(
            chance >= 0 && chance <= 1, 'The chance must be between 0 and 1');

  @override
  Map<String, dynamic> getJson() => looting_multiplier == null
      ? {
          'condition': 'minecraft:random_chance',
          'chance': chance,
        }
      : {
          'condition': 'minecraft:random_chance_with_looting',
          'chance': chance,
          'looting_multiplier': looting_multiplier,
        };
}
