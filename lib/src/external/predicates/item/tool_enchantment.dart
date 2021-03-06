import 'package:objd/src/external/predicates/range.dart';
import 'package:objd/src/external/predicates/tag.dart';

class Enchantment extends Tag {
  final List<EnchantmentData> enchantments;

  Enchantment(this.enchantments);

  @override
  Map<String, dynamic> getJson() => {
        'condition': 'minecraft:table_bonus',
        'enchantments': enchantments.map((e) => e.getJson()).toList(),
      };
}

class EnchantmentData {
  final String enchantment;
  final Range levels;

  EnchantmentData(this.enchantment, {required this.levels});

  Map<String, dynamic> getJson() => {
        'enchantment': enchantment,
        'levels': levels.getJson(),
      };
}
