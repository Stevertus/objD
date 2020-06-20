import 'package:gson/gson.dart';
import 'package:objd/basic/types/item.dart';
import 'package:objd/external/predicates/item/tool_enchantment.dart';
import 'package:objd/external/predicates/range.dart';
import 'package:objd/external/predicates/tag.dart';

class Tool extends Tag {
  final Range count;
  final Range durability;
  final Item item;
  final String potion;
  final String tag;
  final Map<String, dynamic> nbt;
  final List<EnchantmentData> storedEnchantments;
  final Tag predicate;

  Tool({
    this.predicate,
    this.count,
    this.durability,
    this.item,
    this.potion,
    this.tag,
    this.nbt,
    this.storedEnchantments,
  });

  dynamic _getRangeMap(dynamic val) {
    if (val is Range) {
      return val.getJson();
    } else if (val is num) {
      return val;
    }
    throw ('Please provide either a Range or a double value!');
  }

  @override
  Map<String, dynamic> getJson() {
    var ret = <String, dynamic>{
      'condition': 'minecraft:match_tool',
      'predicate': predicate?.getJson() ?? {},
    };
    if (count != null) ret['predicate']['count'] = _getRangeMap(count);
    if (durability != null) {
      ret['predicate']['durability'] = _getRangeMap(durability);
    }
    if (item != null) ret['predicate']['item'] = item.getId();
    if (potion != null) ret['predicate']['potion'] = potion;
    if (potion != null) ret['predicate']['potion'] = potion;
    if (nbt != null) ret['predicate']['nbt'] = gson.encode(nbt);
    if (storedEnchantments != null && storedEnchantments.isNotEmpty) {
      ret['predicate']['stored_enchantments'] =
          storedEnchantments.map((e) => e.getJson()).toList();
    }
    return ret;
  }
}
