import 'package:objd/src/external/predicates/tag.dart';

class TableBonus extends Tag {
  final String enchantment;
  final List<double> chances;

  TableBonus(this.enchantment, {required this.chances})
      : assert(chances != null);

  @override
  Map<String, dynamic> getJson() => {
        'condition': 'minecraft:table_bonus',
        'enchantment': enchantment,
        'chances': chances,
      };
}
