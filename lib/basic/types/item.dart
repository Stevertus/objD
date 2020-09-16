import 'dart:convert';

import 'package:gson/gson.dart';

import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/types/block.dart';
import 'package:objd/basic/types/slot.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/wrappers/summon.dart';

export 'items.dart';

/// The Item class represents an item in an inventory in Minecraft. It is used in the [Give]() or Nbt Commands.

class Item {
  final String type;
  final int count;
  final int damage;
  final Slot slot;
  final Map<String, dynamic> tag;

  /// The Item class represents an item in an inventory in Minecraft. It is used in the [Give]() or Nbt Commands.
  ///
  /// |constructor | |
  /// |--|--|
  /// |Item \| Block \| String|the type of item(required, see example)|
  /// |count|Integer value for the amount of stacked items|
  /// |slot|The current Slot of the item(does not work for give)|
  /// |damage|the used durability of the item|
  /// |hideFlags|int from 1 to 63 describing which information to hide|
  /// |model|int describing which model variant should be used|
  /// |name|a TextComponent showing a name|
  /// |lore| a  List of TextComponents giving extra information|
  /// |nbt|additional NBT as Dart Map|
  ///
  /// **Example:**
  /// ```dart
  /// Give(Entity.Selected(),
  /// 	item: Item(
  /// 		Items.iron_axe, // OR Blocks.stone OR "whatever id"
  /// 		count: 5,
  /// 		name: TextComponent("My Item",color:Color.Black),
  /// 		lore: [
  /// 			TextComponent("My Description",color:Color.Blue),
  /// 		],
  /// 		damage: 40,
  /// 		model: 3390001,
  /// 		nbt: {
  /// 			"customNBT":1
  /// 		}
  /// 	)
  /// )
  ///
  /// ⇒ give  @s minecraft:iron_axe{"customNBT":1,"Damage":40,"CustomModelData":3390001,"display":{"Name":"{\"text\":\"My Item\",\"color\":\"black\"}","Lore":["{\"text\":\"My Description\",\"color\":\"blue\"}"]}} 5
  /// ```
  Item(
    dynamic type, {
    this.count,
    this.slot,
    this.damage,
    int model,

    /// Used to hide flags, VALUE ranges from 1 to 63
    int hideFlags,
    TextComponent name,
    List<TextComponent> lore,
    Map<String, dynamic> nbt,
  })  : assert(
          type is String || type is Item || type is Block,
          'Please provide either a String, Item or Block',
        ),
        tag = {},
        type = type.toString() {
    // check tags
    _checkTags(model, type, hideFlags, name, lore, nbt);
  }
  const Item.type(
    this.type, {
    this.count,
    this.slot,
    this.damage,
    this.tag,
  });

  Item.SpawnEgg(
    dynamic type,
    Summon entity, {
    this.count,
    this.slot,
    this.damage,
    int model,
    int hideFlags,
    TextComponent name,
    List<TextComponent> lore,
    Map<String, dynamic> nbt,
  })  : assert(
          type is String || type is Item || type is Block,
          'Please provide either a String, Item or Block',
        ),
        tag = {},
        type = type.toString() {
    assert(entity != null, 'Please provide an entity to spawn!');
    nbt ??= {};

    nbt.addAll({
      'EntityTag': {
        'id': entity.type.type,
        ...entity.nbt,
      }
    });

    _checkTags(model, type, hideFlags, name, lore, nbt);
  }

  Item.Book(
    List<BookPage> pages, {
    String title = '',
    String author = '',
    this.count,
    this.slot,
    this.damage,
    int model,
    int hideFlags,
    TextComponent name,
    List<TextComponent> lore,
    Map<String, dynamic> nbt,
  })  : type = Items.written_book.toString(),
        tag = {} {
    nbt ??= {};
    nbt['title'] = title;
    nbt['author'] = author;
    nbt['pages'] = pages
        .map((page) =>
            json.encode(page.list.map((item) => item.toMap()).toList()))
        .toList();

    _checkTags(model, type, hideFlags, name, lore, nbt);
  }

  /// creates a new object based on a existing Item to modify properties.
  static Item clone(Item it) => Item(
        it.type,
        count: it.count,
        slot: it.slot.clone(),
        nbt: it.tag != null ? Map.from(it.tag) : null,
      );

  /// creates an Item based on nbt or json data.
  static Item fromJson(Map<String, dynamic> json) {
    String type;
    Slot slot;
    int damage;
    Map<String, dynamic> tag;
    if (json['item'] != null) type = json['item'].toString();
    if (json['id'] != null) type = json['id'].toString();
    if (json['Slot'] != null) {
      slot = Slot(id: int.parse(json['Slot'].toString()));
    }
    if (json['Count'] != null && int.parse(json['Count'].toString()) > 0) {
      int.parse(json['Count'].toString());
    }
    if (json['Damage'] != null && int.parse(json['Damage'].toString()) > 0) {
      damage = int.parse(json['Damage'].toString());
    }

    if (json['tag'] != null) tag = json['tag'] as Map<String, dynamic>;
    return Item(
      type,
      slot: slot,
      damage: damage,
      nbt: tag,
      model: null,
    );
  }

  void _checkTags(
    int model, [
    dynamic type,
    int hideFlags,
    TextComponent name,
    List<TextComponent> lore,
    Map<String, dynamic> nbt,
    Map<String, dynamic> t,
  ]) {
    // check item type

    t ??= tag;

    if (nbt != null && nbt.isNotEmpty) t.addAll(nbt);
    if (damage != null) t['Damage'] = damage;
    if (model != null) t['CustomModelData'] = model;
    if (hideFlags != null) t['HideFlags'] = hideFlags;
    if (name != null) {
      final n = name.toJson();

      t['display'] = t['display'] ?? {};

      // check if the value is even represented in json
      if (n != null) {
        t['display']['Name'] = n;
      } else {
        t['display'].remove('Name');
      }
    }
    if (lore != null) {
      t['display'] = t['display'] ?? {};
      t['display']['Lore'] = lore.map((lor) => lor.toJson()).toList();
    }
  }

  String getGiveNotation({bool withDamage = true}) {
    var result = type;
    if (tag != null && tag.isNotEmpty) {
      result += gson.encode(tag);
    }
    result += ' ';
    if (count != null) result += count.toString();
    if (damage != null && withDamage) result += ' ' + damage.toString();
    return result;
  }

  String getId() => type.replaceFirst('minecraft:', '');

  Map<String, dynamic> getMap() {
    var map = <String, dynamic>{'id': 'minecraft:' + getId()};
    if (tag.isNotEmpty) map['tag'] = tag;
    if (count != null) map['Count'] = Byte(count);
    if (slot != null) {
      if (slot.id == null) throw ('An Item needs the Slot id!');
      if (slot.id < 0) {
        print(
            'Please note that you are using Item with a negative slot. This is reserved for a selected item and can\'t be accessed within the Inventory property!');
      }
      map['Slot'] = Byte(slot.id);
    }
    return map;
  }

  String getNbt() {
    return gson.encode(getMap());
  }

  Item copyWith({
    String type,
    int count,
    int damage,
    Slot slot,
    int model,
    int hideFlags,
    TextComponent name,
    List<TextComponent> lore,
    Map<String, dynamic> nbt,
  }) {
    final t = tag != null ? _copyDeepMap(tag) : <String, dynamic>{};
    _checkTags(model, type, hideFlags, name, lore, nbt, t);

    return Item(
      type ?? this.type,
      count: count ?? this.count,
      damage: damage ?? this.damage,
      slot: slot ?? this.slot,
      nbt: t,
    );
  }

  @override
  String toString() => type;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Item &&
        o.type == type &&
        o.count == count &&
        o.damage == damage &&
        o.slot == slot &&
        o.tag == tag;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        count.hashCode ^
        damage.hashCode ^
        slot.hashCode ^
        tag.hashCode;
  }
}

int HideFlags({
  bool enchantments,
  bool attributes,
  bool unbreakable,
  bool canDestroy,
  bool canPlaceOn,
  bool others,
}) {
  var res = 0;
  if (enchantments) res += 1;
  if (attributes) res += 2;
  if (unbreakable) res += 4;
  if (canDestroy) res += 8;
  if (canPlaceOn) res += 16;
  if (others) res += 32;
  return res;
}

class BookPage {
  List<TextComponent> list;
  BookPage(dynamic content) {
    if (content is TextComponent) list = [content];
    if (content is String) list = [TextComponent(content)];
    if (content is List<TextComponent>) list = content;
  }

  BookPage.customFont(String char) {
    list = [TextComponent.customFont(char)];
  }
}

Map<String, dynamic> _copyDeepMap(Map<String, dynamic> map) {
  final newMap = <String, dynamic>{};

  map.forEach((key, value) {
    print(value);
    newMap[key] =
        (value is Map) ? _copyDeepMap(value.cast<String, dynamic>()) : value;
  });

  return newMap;
}
