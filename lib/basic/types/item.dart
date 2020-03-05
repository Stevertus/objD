import 'package:gson/gson.dart';
import 'package:objd/basic/types/block.dart';
import 'package:objd/basic/types/slot.dart';
import 'dart:convert';

import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/wrappers/summon.dart';

export 'items.dart';

/// The Item class represents an item in an inventory in Minecraft. It is used in the [Give]() or Nbt Commands.

class Item {
  ItemType type;
  int count;
  int damage;
  Slot slot;
  Map<String, dynamic> tag = {};

  /// The Item class represents an item in an inventory in Minecraft. It is used in the [Give]() or Nbt Commands.
  ///
  /// |constructor | |
  /// |--|--|
  /// |ItemType \| Block \| String|the type of item(required, see example)|
  /// |count|Integer value for the amount of stacked items|
  /// |slot|The current Slot of the item(does not work for give)|
  /// |damage|the used durability of the item|
  /// |hideFlags|int from 1 to 63 describing which information to hide|
  /// |model|int describing which model varient should be used|
  /// |name|a TextComponent showing a name|
  /// |lore| a  List of TextComponents giving extra information|
  /// |nbt|addional NBT as Dart Map|
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
  }) {
    // check item type
    if (type is ItemType) {
      this.type = type;
    } else if (type is Block) {
      this.type = ItemType(type.toString());
    } else if (type is String) {
      this.type = ItemType(type);
    } else {
      throw ('Please insert either an ItemType, a Block or a string representing an item type into Item');
    }

    // check tags
    _checkTags(model, hideFlags, name, lore, nbt);
  }

  Item.SpawnEgg(
    ItemType type,
    Summon entity, {
    this.count,
    this.slot,
    this.damage,
    int model,
    int hideFlags,
    TextComponent name,
    List<TextComponent> lore,
    Map<String, dynamic> nbt,
  }) {
    assert(entity != null, 'Please provide an entity to spawn!');
    nbt ??= {};
    this.type = type;

    nbt.addAll({
      'EntityTag': {
        'id': entity.type.type,
        ...entity.nbt,
      }
    });

    _checkTags(model, hideFlags, name, lore, nbt);
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
  }) {
    nbt ??= {};
    type = Items.written_book;
    nbt['title'] = title;
    nbt['author'] = author;
    nbt['pages'] = pages
        .map((page) =>
            json.encode(page.list.map((item) => item.toMap()).toList()))
        .toList();

    _checkTags(model, hideFlags, name, lore, nbt);
  }

  /// creates a new object based on a existing Item to modify properties.
  Item.clone(Item it) {
    type = it.type.clone();
    if (it.count != null) count = it.count;
    if (it.slot != null) slot = it.slot.clone();
    if (it.tag != null) tag = Map.from(it.tag);
  }

  /// creates an Item based on nbt or json data.
  Item.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) type = ItemType(json['item'].toString());
    if (json['id'] != null) type = ItemType(json['id'].toString());
    if (json['Slot'] != null) {
      slot = Slot(id: int.parse(json['Slot'].toString()));
    }
    if (json['Count'] != null && int.parse(json['Count'].toString()) > 0) {
      int.parse(json['Count'].toString());
    }
    if (json['Damage'] != null && int.parse(json['Damage'].toString()) > 0) {
      damage = int.parse(json['Damage'].toString());
    }
    int model;
    if (json['model'] != null) model = int.parse(json['Damage'].toString());
    if (json['tag'] != null) tag = json['tag'] as Map<String, dynamic>;
    _checkTags(model, null, null, null);
  }

  void _checkTags(
    int model, [
    int hideFlags,
    TextComponent name,
    List<TextComponent> lore,
    Map<String, dynamic> nbt,
  ]) {
    if (nbt != null && nbt.isNotEmpty) tag.addAll(nbt);
    if (damage != null) tag['Damage'] = damage;
    if (model != null) tag['CustomModelData'] = model;
    if (hideFlags != null) tag['HideFlags'] = hideFlags;
    if (name != null) {
      tag['display'] = tag['display'] ?? {};
      tag['display']['Name'] = name.toJson();
    }
    if (lore != null) {
      tag['display'] = tag['display'] ?? {};
      tag['display']['Lore'] = lore.map((lor) => lor.toJson()).toList();
    }
  }

  String getGiveNotation({bool withDamage = true}) {
    var result = type.toString();
    if (tag != null && tag.isNotEmpty) {
      result += json.encode(tag);
    }
    result += ' ';
    if (count != null) result += count.toString();
    if (damage != null && withDamage) result += ' ' + damage.toString();
    return result;
  }

  String getId() => type.toString().replaceFirst('minecraft:', '');

  Map<String, dynamic> getMap() {
    var map = <String, dynamic>{'id': 'minecraft:' + getId()};
    if (tag.isNotEmpty) map['tag'] = tag;
    if (count != null) map['Count'] = Byte(count);
    if (slot != null) {
      if (slot.id == null) throw ('An Item needs the Slot id!');
      if (slot.id < 0) {
        print(
            'Please note that you are using Item with a negative slot. This is reserved for a selecteditem and can\'t be accessed within the Inventory propery!');
      }
      map['Slot'] = Byte(slot.id);
    }
    return map;
  }

  String getNbt() {
    return gson.encode(getMap());
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

/// ItemType is like EntityType or Block a utility class to provide a list of all available items.
class ItemType {
  final String _type;

  /// Please consider using Items.[id] instead
  const ItemType(this._type);

  ItemType clone() {
    return ItemType(toString());
  }

  @override
  String toString() {
    return _type;
  }
}
