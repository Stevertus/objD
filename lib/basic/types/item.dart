import 'package:gson/gson.dart';
import 'package:objd/basic/types/block.dart';
import 'package:objd/basic/types/slot.dart';
import 'dart:convert';

import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/wrappers/summon.dart';

export 'items.dart';

class Item {
  ItemType type;
  int count;
  int damage;
  Slot slot;
  Map<String, dynamic> tag = {};

  /// The Item class represents an item in an inventory in Minecraft. It is used in the [Give] or Nbt Commands.
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
      throw ("Please insert either an ItemType, a Block or a string representing an item type into Item");
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
    assert(entity != null, "Please provide an entity to spawn!");
    nbt ??= {};
    this.type = type;

    nbt.addAll({
      "EntityTag": {
        "id": "minecraft:" + entity.type.type,
        ...entity.nbt,
      }
    });

    _checkTags(model, hideFlags, name, lore, nbt);
  }

  Item.Book(
    List<BookPage> pages, {
    String title = "",
    String author = "",
    this.count,
    this.slot,
    this.damage,
    int model,
    int hideFlags,
    TextComponent name,
    List<TextComponent> lore,
    Map<String, dynamic> nbt,
  }) {
    if (nbt == null) nbt = {};
    this.type = Items.written_book;
    nbt["title"] = title;
    nbt["author"] = author;
    nbt["pages"] = pages
        .map((page) =>
            json.encode(page.list.map((item) => item.toMap()).toList()))
        .toList();

    _checkTags(model, hideFlags, name, lore, nbt);
  }

  /// creates a new object based on a existing Item to modify properties.
  Item.clone(Item it) {
    this.type = it.type.clone();
    if (it.count != null) this.count = it.count;
    if (it.slot != null) this.slot = it.slot.clone();
    if (it.tag != null) this.tag = Map.from(it.tag);
  }

  /// creates an Item based on nbt or json data.
  Item.fromJson(Map<String, dynamic> json) {
    if (json["item"] != null) type = ItemType(json["item"].toString());
    if (json["id"] != null) type = ItemType(json["id"].toString());
    if (json["Slot"] != null) {
      slot = Slot(id: int.parse(json["Slot"].toString()));
    }
    if (json["Count"] != null && int.parse(json["Count"].toString()) > 0) {
      int.parse(json["Count"].toString());
    }
    if (json["Damage"] != null && int.parse(json["Damage"].toString()) > 0) {
      damage = int.parse(json["Damage"].toString());
    }
    int model;
    if (json["model"] != null) model = int.parse(json["Damage"].toString());
    if (json["tag"] != null) tag = json["tag"] as Map<String, dynamic>;
    _checkTags(model, null, null, null);
  }

  _checkTags(int model,
      [int hideFlags,
      TextComponent name,
      List<TextComponent> lore,
      Map<String, dynamic> nbt]) {
    if (nbt != null && nbt.isNotEmpty) tag.addAll(nbt);
    if (damage != null) tag["Damage"] = damage;
    if (model != null) tag["CustomModelData"] = model;
    if (hideFlags != null) tag["HideFlags"] = hideFlags;
    if (name != null) {
      tag["display"] = tag["display"] ?? {};
      tag["display"]['Name'] = name.toJson();
    }
    if (lore != null) {
      tag["display"] = tag["display"] ?? {};
      tag["display"]['Lore'] = lore.map((lor) => lor.toJson()).toList();
    }
  }

  String getGiveNotation({bool withDamage = true}) {
    String result = type.toString();
    if (tag != null && tag.isNotEmpty) {
      result += json.encode(tag);
    }
    result += " ";
    if (count != null) result += count.toString();
    if (damage != null && withDamage) result += " " + damage.toString();
    return result;
  }

  Map<String, dynamic> getMap() {
    Map<String, dynamic> map = {
      "id": "minecraft:" + type.toString().replaceFirst("minecraft:", "")
    };
    if (tag.isNotEmpty) map["tag"] = tag;
    if (count != null) map["Count"] = Byte(count);
    if (slot != null) {
      if (slot.id == null) throw ("An Item needs the Slot id!");
      if (slot.id < 0) {
        print(
            "Please note that you are using Item with a negative slot. This is reserved for a selecteditem and can't be accessed within the Inventory propery!");
      }
      map["Slot"] = slot.id;
    }
    return map;
  }

  String getNbt() {
    return gson.encode(this.getMap());
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
  int res = 0;
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
  const ItemType(this._type);

  ItemType clone() {
    return ItemType(this.toString());
  }

  @override
  String toString() {
    return _type;
  }

  /// DEPRECATED, please use Items.air
  @deprecated
  static const ItemType air = ItemType('minecraft:air');

  /// DEPRECATED, please use Items.stone
  @deprecated
  static const ItemType stone = ItemType('minecraft:stone');

  /// DEPRECATED, please use Items.granite
  @deprecated
  static const ItemType granite = ItemType('minecraft:granite');

  /// DEPRECATED, please use Items.polished_granite
  @deprecated
  static const ItemType polished_granite =
      ItemType('minecraft:polished_granite');

  /// DEPRECATED, please use Items.diorite
  @deprecated
  static const ItemType diorite = ItemType('minecraft:diorite');

  /// DEPRECATED, please use Items.polished_diorite
  @deprecated
  static const ItemType polished_diorite =
      ItemType('minecraft:polished_diorite');

  /// DEPRECATED, please use Items.andesite
  @deprecated
  static const ItemType andesite = ItemType('minecraft:andesite');

  /// DEPRECATED, please use Items.polished_andesite
  @deprecated
  static const ItemType polished_andesite =
      ItemType('minecraft:polished_andesite');

  /// DEPRECATED, please use Items.grass_block
  @deprecated
  static const ItemType grass_block = ItemType('minecraft:grass_block');

  /// DEPRECATED, please use Items.dirt
  @deprecated
  static const ItemType dirt = ItemType('minecraft:dirt');

  /// DEPRECATED, please use Items.coarse_dirt
  @deprecated
  static const ItemType coarse_dirt = ItemType('minecraft:coarse_dirt');

  /// DEPRECATED, please use Items.podzol
  @deprecated
  static const ItemType podzol = ItemType('minecraft:podzol');

  /// DEPRECATED, please use Items.cobblestone
  @deprecated
  static const ItemType cobblestone = ItemType('minecraft:cobblestone');

  /// DEPRECATED, please use Items.oak_planks
  @deprecated
  static const ItemType oak_planks = ItemType('minecraft:oak_planks');

  /// DEPRECATED, please use Items.spruce_planks
  @deprecated
  static const ItemType spruce_planks = ItemType('minecraft:spruce_planks');

  /// DEPRECATED, please use Items.birch_planks
  @deprecated
  static const ItemType birch_planks = ItemType('minecraft:birch_planks');

  /// DEPRECATED, please use Items.jungle_planks
  @deprecated
  static const ItemType jungle_planks = ItemType('minecraft:jungle_planks');

  /// DEPRECATED, please use Items.acacia_planks
  @deprecated
  static const ItemType acacia_planks = ItemType('minecraft:acacia_planks');

  /// DEPRECATED, please use Items.dark_oak_planks
  @deprecated
  static const ItemType dark_oak_planks = ItemType('minecraft:dark_oak_planks');

  /// DEPRECATED, please use Items.oak_sapling
  @deprecated
  static const ItemType oak_sapling = ItemType('minecraft:oak_sapling');

  /// DEPRECATED, please use Items.spruce_sapling
  @deprecated
  static const ItemType spruce_sapling = ItemType('minecraft:spruce_sapling');

  /// DEPRECATED, please use Items.birch_sapling
  @deprecated
  static const ItemType birch_sapling = ItemType('minecraft:birch_sapling');

  /// DEPRECATED, please use Items.jungle_sapling
  @deprecated
  static const ItemType jungle_sapling = ItemType('minecraft:jungle_sapling');

  /// DEPRECATED, please use Items.acacia_sapling
  @deprecated
  static const ItemType acacia_sapling = ItemType('minecraft:acacia_sapling');

  /// DEPRECATED, please use Items.dark_oak_sapling
  @deprecated
  static const ItemType dark_oak_sapling =
      ItemType('minecraft:dark_oak_sapling');

  /// DEPRECATED, please use Items.bedrock
  @deprecated
  static const ItemType bedrock = ItemType('minecraft:bedrock');

  /// DEPRECATED, please use Items.sand
  @deprecated
  static const ItemType sand = ItemType('minecraft:sand');

  /// DEPRECATED, please use Items.red_sand
  @deprecated
  static const ItemType red_sand = ItemType('minecraft:red_sand');

  /// DEPRECATED, please use Items.gravel
  @deprecated
  static const ItemType gravel = ItemType('minecraft:gravel');

  /// DEPRECATED, please use Items.gold_ore
  @deprecated
  static const ItemType gold_ore = ItemType('minecraft:gold_ore');

  /// DEPRECATED, please use Items.iron_ore
  @deprecated
  static const ItemType iron_ore = ItemType('minecraft:iron_ore');

  /// DEPRECATED, please use Items.coal_ore
  @deprecated
  static const ItemType coal_ore = ItemType('minecraft:coal_ore');

  /// DEPRECATED, please use Items.oak_log
  @deprecated
  static const ItemType oak_log = ItemType('minecraft:oak_log');

  /// DEPRECATED, please use Items.spruce_log
  @deprecated
  static const ItemType spruce_log = ItemType('minecraft:spruce_log');

  /// DEPRECATED, please use Items.birch_log
  @deprecated
  static const ItemType birch_log = ItemType('minecraft:birch_log');

  /// DEPRECATED, please use Items.jungle_log
  @deprecated
  static const ItemType jungle_log = ItemType('minecraft:jungle_log');

  /// DEPRECATED, please use Items.acacia_log
  @deprecated
  static const ItemType acacia_log = ItemType('minecraft:acacia_log');

  /// DEPRECATED, please use Items.dark_oak_log
  @deprecated
  static const ItemType dark_oak_log = ItemType('minecraft:dark_oak_log');

  /// DEPRECATED, please use Items.stripped_oak_log
  @deprecated
  static const ItemType stripped_oak_log =
      ItemType('minecraft:stripped_oak_log');

  /// DEPRECATED, please use Items.stripped_spruce_log
  @deprecated
  static const ItemType stripped_spruce_log =
      ItemType('minecraft:stripped_spruce_log');

  /// DEPRECATED, please use Items.stripped_birch_log
  @deprecated
  static const ItemType stripped_birch_log =
      ItemType('minecraft:stripped_birch_log');

  /// DEPRECATED, please use Items.stripped_jungle_log
  @deprecated
  static const ItemType stripped_jungle_log =
      ItemType('minecraft:stripped_jungle_log');

  /// DEPRECATED, please use Items.stripped_acacia_log
  @deprecated
  static const ItemType stripped_acacia_log =
      ItemType('minecraft:stripped_acacia_log');

  /// DEPRECATED, please use Items.stripped_dark_oak_log
  @deprecated
  static const ItemType stripped_dark_oak_log =
      ItemType('minecraft:stripped_dark_oak_log');

  /// DEPRECATED, please use Items.stripped_oak_wood
  @deprecated
  static const ItemType stripped_oak_wood =
      ItemType('minecraft:stripped_oak_wood');

  /// DEPRECATED, please use Items.stripped_spruce_wood
  @deprecated
  static const ItemType stripped_spruce_wood =
      ItemType('minecraft:stripped_spruce_wood');

  /// DEPRECATED, please use Items.stripped_birch_wood
  @deprecated
  static const ItemType stripped_birch_wood =
      ItemType('minecraft:stripped_birch_wood');

  /// DEPRECATED, please use Items.stripped_jungle_wood
  @deprecated
  static const ItemType stripped_jungle_wood =
      ItemType('minecraft:stripped_jungle_wood');

  /// DEPRECATED, please use Items.stripped_acacia_wood
  @deprecated
  static const ItemType stripped_acacia_wood =
      ItemType('minecraft:stripped_acacia_wood');

  /// DEPRECATED, please use Items.stripped_dark_oak_wood
  @deprecated
  static const ItemType stripped_dark_oak_wood =
      ItemType('minecraft:stripped_dark_oak_wood');

  /// DEPRECATED, please use Items.oak_wood
  @deprecated
  static const ItemType oak_wood = ItemType('minecraft:oak_wood');

  /// DEPRECATED, please use Items.spruce_wood
  @deprecated
  static const ItemType spruce_wood = ItemType('minecraft:spruce_wood');

  /// DEPRECATED, please use Items.birch_wood
  @deprecated
  static const ItemType birch_wood = ItemType('minecraft:birch_wood');

  /// DEPRECATED, please use Items.jungle_wood
  @deprecated
  static const ItemType jungle_wood = ItemType('minecraft:jungle_wood');

  /// DEPRECATED, please use Items.acacia_wood
  @deprecated
  static const ItemType acacia_wood = ItemType('minecraft:acacia_wood');

  /// DEPRECATED, please use Items.dark_oak_wood
  @deprecated
  static const ItemType dark_oak_wood = ItemType('minecraft:dark_oak_wood');

  /// DEPRECATED, please use Items.oak_leaves
  @deprecated
  static const ItemType oak_leaves = ItemType('minecraft:oak_leaves');

  /// DEPRECATED, please use Items.spruce_leaves
  @deprecated
  static const ItemType spruce_leaves = ItemType('minecraft:spruce_leaves');

  /// DEPRECATED, please use Items.birch_leaves
  @deprecated
  static const ItemType birch_leaves = ItemType('minecraft:birch_leaves');

  /// DEPRECATED, please use Items.jungle_leaves
  @deprecated
  static const ItemType jungle_leaves = ItemType('minecraft:jungle_leaves');

  /// DEPRECATED, please use Items.acacia_leaves
  @deprecated
  static const ItemType acacia_leaves = ItemType('minecraft:acacia_leaves');

  /// DEPRECATED, please use Items.dark_oak_leaves
  @deprecated
  static const ItemType dark_oak_leaves = ItemType('minecraft:dark_oak_leaves');

  /// DEPRECATED, please use Items.sponge
  @deprecated
  static const ItemType sponge = ItemType('minecraft:sponge');

  /// DEPRECATED, please use Items.wet_sponge
  @deprecated
  static const ItemType wet_sponge = ItemType('minecraft:wet_sponge');

  /// DEPRECATED, please use Items.glass
  @deprecated
  static const ItemType glass = ItemType('minecraft:glass');

  /// DEPRECATED, please use Items.lapis_ore
  @deprecated
  static const ItemType lapis_ore = ItemType('minecraft:lapis_ore');

  /// DEPRECATED, please use Items.lapis_block
  @deprecated
  static const ItemType lapis_block = ItemType('minecraft:lapis_block');

  /// DEPRECATED, please use Items.dispenser
  @deprecated
  static const ItemType dispenser = ItemType('minecraft:dispenser');

  /// DEPRECATED, please use Items.sandstone
  @deprecated
  static const ItemType sandstone = ItemType('minecraft:sandstone');

  /// DEPRECATED, please use Items.chiseled_sandstone
  @deprecated
  static const ItemType chiseled_sandstone =
      ItemType('minecraft:chiseled_sandstone');

  /// DEPRECATED, please use Items.cut_sandstone
  @deprecated
  static const ItemType cut_sandstone = ItemType('minecraft:cut_sandstone');

  /// DEPRECATED, please use Items.note_block
  @deprecated
  static const ItemType note_block = ItemType('minecraft:note_block');

  /// DEPRECATED, please use Items.powered_rail
  @deprecated
  static const ItemType powered_rail = ItemType('minecraft:powered_rail');

  /// DEPRECATED, please use Items.detector_rail
  @deprecated
  static const ItemType detector_rail = ItemType('minecraft:detector_rail');

  /// DEPRECATED, please use Items.sticky_piston
  @deprecated
  static const ItemType sticky_piston = ItemType('minecraft:sticky_piston');

  /// DEPRECATED, please use Items.cobweb
  @deprecated
  static const ItemType cobweb = ItemType('minecraft:cobweb');

  /// DEPRECATED, please use Items.grass
  @deprecated
  static const ItemType grass = ItemType('minecraft:grass');

  /// DEPRECATED, please use Items.fern
  @deprecated
  static const ItemType fern = ItemType('minecraft:fern');

  /// DEPRECATED, please use Items.dead_bush
  @deprecated
  static const ItemType dead_bush = ItemType('minecraft:dead_bush');

  /// DEPRECATED, please use Items.seagrass
  @deprecated
  static const ItemType seagrass = ItemType('minecraft:seagrass');

  /// DEPRECATED, please use Items.sea_pickle
  @deprecated
  static const ItemType sea_pickle = ItemType('minecraft:sea_pickle');

  /// DEPRECATED, please use Items.piston
  @deprecated
  static const ItemType piston = ItemType('minecraft:piston');

  /// DEPRECATED, please use Items.white_wool
  @deprecated
  static const ItemType white_wool = ItemType('minecraft:white_wool');

  /// DEPRECATED, please use Items.orange_wool
  @deprecated
  static const ItemType orange_wool = ItemType('minecraft:orange_wool');

  /// DEPRECATED, please use Items.magenta_wool
  @deprecated
  static const ItemType magenta_wool = ItemType('minecraft:magenta_wool');

  /// DEPRECATED, please use Items.light_blue_wool
  @deprecated
  static const ItemType light_blue_wool = ItemType('minecraft:light_blue_wool');

  /// DEPRECATED, please use Items.yellow_wool
  @deprecated
  static const ItemType yellow_wool = ItemType('minecraft:yellow_wool');

  /// DEPRECATED, please use Items.lime_wool
  @deprecated
  static const ItemType lime_wool = ItemType('minecraft:lime_wool');

  /// DEPRECATED, please use Items.pink_wool
  @deprecated
  static const ItemType pink_wool = ItemType('minecraft:pink_wool');

  /// DEPRECATED, please use Items.gray_wool
  @deprecated
  static const ItemType gray_wool = ItemType('minecraft:gray_wool');

  /// DEPRECATED, please use Items.light_gray_wool
  @deprecated
  static const ItemType light_gray_wool = ItemType('minecraft:light_gray_wool');

  /// DEPRECATED, please use Items.cyan_wool
  @deprecated
  static const ItemType cyan_wool = ItemType('minecraft:cyan_wool');

  /// DEPRECATED, please use Items.purple_wool
  @deprecated
  static const ItemType purple_wool = ItemType('minecraft:purple_wool');

  /// DEPRECATED, please use Items.blue_wool
  @deprecated
  static const ItemType blue_wool = ItemType('minecraft:blue_wool');

  /// DEPRECATED, please use Items.brown_wool
  @deprecated
  static const ItemType brown_wool = ItemType('minecraft:brown_wool');

  /// DEPRECATED, please use Items.green_wool
  @deprecated
  static const ItemType green_wool = ItemType('minecraft:green_wool');

  /// DEPRECATED, please use Items.red_wool
  @deprecated
  static const ItemType red_wool = ItemType('minecraft:red_wool');

  /// DEPRECATED, please use Items.black_wool
  @deprecated
  static const ItemType black_wool = ItemType('minecraft:black_wool');

  /// DEPRECATED, please use Items.dandelion
  @deprecated
  static const ItemType dandelion = ItemType('minecraft:dandelion');

  /// DEPRECATED, please use Items.poppy
  @deprecated
  static const ItemType poppy = ItemType('minecraft:poppy');

  /// DEPRECATED, please use Items.blue_orchid
  @deprecated
  static const ItemType blue_orchid = ItemType('minecraft:blue_orchid');

  /// DEPRECATED, please use Items.allium
  @deprecated
  static const ItemType allium = ItemType('minecraft:allium');

  /// DEPRECATED, please use Items.azure_bluet
  @deprecated
  static const ItemType azure_bluet = ItemType('minecraft:azure_bluet');

  /// DEPRECATED, please use Items.red_tulip
  @deprecated
  static const ItemType red_tulip = ItemType('minecraft:red_tulip');

  /// DEPRECATED, please use Items.orange_tulip
  @deprecated
  static const ItemType orange_tulip = ItemType('minecraft:orange_tulip');

  /// DEPRECATED, please use Items.white_tulip
  @deprecated
  static const ItemType white_tulip = ItemType('minecraft:white_tulip');

  /// DEPRECATED, please use Items.pink_tulip
  @deprecated
  static const ItemType pink_tulip = ItemType('minecraft:pink_tulip');

  /// DEPRECATED, please use Items.oxeye_daisy
  @deprecated
  static const ItemType oxeye_daisy = ItemType('minecraft:oxeye_daisy');

  /// DEPRECATED, please use Items.cornflower
  @deprecated
  static const ItemType cornflower = ItemType('minecraft:cornflower');

  /// DEPRECATED, please use Items.lily_of_the_valley
  @deprecated
  static const ItemType lily_of_the_valley =
      ItemType('minecraft:lily_of_the_valley');

  /// DEPRECATED, please use Items.wither_rose
  @deprecated
  static const ItemType wither_rose = ItemType('minecraft:wither_rose');

  /// DEPRECATED, please use Items.brown_mushroom
  @deprecated
  static const ItemType brown_mushroom = ItemType('minecraft:brown_mushroom');

  /// DEPRECATED, please use Items.red_mushroom
  @deprecated
  static const ItemType red_mushroom = ItemType('minecraft:red_mushroom');

  /// DEPRECATED, please use Items.gold_block
  @deprecated
  static const ItemType gold_block = ItemType('minecraft:gold_block');

  /// DEPRECATED, please use Items.iron_block
  @deprecated
  static const ItemType iron_block = ItemType('minecraft:iron_block');

  /// DEPRECATED, please use Items.oak_slab
  @deprecated
  static const ItemType oak_slab = ItemType('minecraft:oak_slab');

  /// DEPRECATED, please use Items.spruce_slab
  @deprecated
  static const ItemType spruce_slab = ItemType('minecraft:spruce_slab');

  /// DEPRECATED, please use Items.birch_slab
  @deprecated
  static const ItemType birch_slab = ItemType('minecraft:birch_slab');

  /// DEPRECATED, please use Items.jungle_slab
  @deprecated
  static const ItemType jungle_slab = ItemType('minecraft:jungle_slab');

  /// DEPRECATED, please use Items.acacia_slab
  @deprecated
  static const ItemType acacia_slab = ItemType('minecraft:acacia_slab');

  /// DEPRECATED, please use Items.dark_oak_slab
  @deprecated
  static const ItemType dark_oak_slab = ItemType('minecraft:dark_oak_slab');

  /// DEPRECATED, please use Items.stone_slab
  @deprecated
  static const ItemType stone_slab = ItemType('minecraft:stone_slab');

  /// DEPRECATED, please use Items.smooth_stone_slab
  @deprecated
  static const ItemType smooth_stone_slab =
      ItemType('minecraft:smooth_stone_slab');

  /// DEPRECATED, please use Items.sandstone_slab
  @deprecated
  static const ItemType sandstone_slab = ItemType('minecraft:sandstone_slab');

  /// DEPRECATED, please use Items.cut_sandstone_slab
  @deprecated
  static const ItemType cut_sandstone_slab =
      ItemType('minecraft:cut_sandstone_slab');

  /// DEPRECATED, please use Items.petrified_oak_slab
  @deprecated
  static const ItemType petrified_oak_slab =
      ItemType('minecraft:petrified_oak_slab');

  /// DEPRECATED, please use Items.cobblestone_slab
  @deprecated
  static const ItemType cobblestone_slab =
      ItemType('minecraft:cobblestone_slab');

  /// DEPRECATED, please use Items.brick_slab
  @deprecated
  static const ItemType brick_slab = ItemType('minecraft:brick_slab');

  /// DEPRECATED, please use Items.stone_brick_slab
  @deprecated
  static const ItemType stone_brick_slab =
      ItemType('minecraft:stone_brick_slab');

  /// DEPRECATED, please use Items.nether_brick_slab
  @deprecated
  static const ItemType nether_brick_slab =
      ItemType('minecraft:nether_brick_slab');

  /// DEPRECATED, please use Items.quartz_slab
  @deprecated
  static const ItemType quartz_slab = ItemType('minecraft:quartz_slab');

  /// DEPRECATED, please use Items.red_sandstone_slab
  @deprecated
  static const ItemType red_sandstone_slab =
      ItemType('minecraft:red_sandstone_slab');

  /// DEPRECATED, please use Items.cut_red_sandstone_slab
  @deprecated
  static const ItemType cut_red_sandstone_slab =
      ItemType('minecraft:cut_red_sandstone_slab');

  /// DEPRECATED, please use Items.purpur_slab
  @deprecated
  static const ItemType purpur_slab = ItemType('minecraft:purpur_slab');

  /// DEPRECATED, please use Items.prismarine_slab
  @deprecated
  static const ItemType prismarine_slab = ItemType('minecraft:prismarine_slab');

  /// DEPRECATED, please use Items.prismarine_brick_slab
  @deprecated
  static const ItemType prismarine_brick_slab =
      ItemType('minecraft:prismarine_brick_slab');

  /// DEPRECATED, please use Items.dark_prismarine_slab
  @deprecated
  static const ItemType dark_prismarine_slab =
      ItemType('minecraft:dark_prismarine_slab');

  /// DEPRECATED, please use Items.smooth_quartz
  @deprecated
  static const ItemType smooth_quartz = ItemType('minecraft:smooth_quartz');

  /// DEPRECATED, please use Items.smooth_red_sandstone
  @deprecated
  static const ItemType smooth_red_sandstone =
      ItemType('minecraft:smooth_red_sandstone');

  /// DEPRECATED, please use Items.smooth_sandstone
  @deprecated
  static const ItemType smooth_sandstone =
      ItemType('minecraft:smooth_sandstone');

  /// DEPRECATED, please use Items.smooth_stone
  @deprecated
  static const ItemType smooth_stone = ItemType('minecraft:smooth_stone');

  /// DEPRECATED, please use Items.bricks
  @deprecated
  static const ItemType bricks = ItemType('minecraft:bricks');

  /// DEPRECATED, please use Items.tnt
  @deprecated
  static const ItemType tnt = ItemType('minecraft:tnt');

  /// DEPRECATED, please use Items.bookshelf
  @deprecated
  static const ItemType bookshelf = ItemType('minecraft:bookshelf');

  /// DEPRECATED, please use Items.mossy_cobblestone
  @deprecated
  static const ItemType mossy_cobblestone =
      ItemType('minecraft:mossy_cobblestone');

  /// DEPRECATED, please use Items.obsidian
  @deprecated
  static const ItemType obsidian = ItemType('minecraft:obsidian');

  /// DEPRECATED, please use Items.torch
  @deprecated
  static const ItemType torch = ItemType('minecraft:torch');

  /// DEPRECATED, please use Items.end_rod
  @deprecated
  static const ItemType end_rod = ItemType('minecraft:end_rod');

  /// DEPRECATED, please use Items.chorus_plant
  @deprecated
  static const ItemType chorus_plant = ItemType('minecraft:chorus_plant');

  /// DEPRECATED, please use Items.chorus_flower
  @deprecated
  static const ItemType chorus_flower = ItemType('minecraft:chorus_flower');

  /// DEPRECATED, please use Items.purpur_block
  @deprecated
  static const ItemType purpur_block = ItemType('minecraft:purpur_block');

  /// DEPRECATED, please use Items.purpur_pillar
  @deprecated
  static const ItemType purpur_pillar = ItemType('minecraft:purpur_pillar');

  /// DEPRECATED, please use Items.purpur_stairs
  @deprecated
  static const ItemType purpur_stairs = ItemType('minecraft:purpur_stairs');

  /// DEPRECATED, please use Items.spawner
  @deprecated
  static const ItemType spawner = ItemType('minecraft:spawner');

  /// DEPRECATED, please use Items.oak_stairs
  @deprecated
  static const ItemType oak_stairs = ItemType('minecraft:oak_stairs');

  /// DEPRECATED, please use Items.chest
  @deprecated
  static const ItemType chest = ItemType('minecraft:chest');

  /// DEPRECATED, please use Items.diamond_ore
  @deprecated
  static const ItemType diamond_ore = ItemType('minecraft:diamond_ore');

  /// DEPRECATED, please use Items.diamond_block
  @deprecated
  static const ItemType diamond_block = ItemType('minecraft:diamond_block');

  /// DEPRECATED, please use Items.crafting_table
  @deprecated
  static const ItemType crafting_table = ItemType('minecraft:crafting_table');

  /// DEPRECATED, please use Items.farmland
  @deprecated
  static const ItemType farmland = ItemType('minecraft:farmland');

  /// DEPRECATED, please use Items.furnace
  @deprecated
  static const ItemType furnace = ItemType('minecraft:furnace');

  /// DEPRECATED, please use Items.ladder
  @deprecated
  static const ItemType ladder = ItemType('minecraft:ladder');

  /// DEPRECATED, please use Items.rail
  @deprecated
  static const ItemType rail = ItemType('minecraft:rail');

  /// DEPRECATED, please use Items.cobblestone_stairs
  @deprecated
  static const ItemType cobblestone_stairs =
      ItemType('minecraft:cobblestone_stairs');

  /// DEPRECATED, please use Items.lever
  @deprecated
  static const ItemType lever = ItemType('minecraft:lever');

  /// DEPRECATED, please use Items.stone_pressure_plate
  @deprecated
  static const ItemType stone_pressure_plate =
      ItemType('minecraft:stone_pressure_plate');

  /// DEPRECATED, please use Items.oak_pressure_plate
  @deprecated
  static const ItemType oak_pressure_plate =
      ItemType('minecraft:oak_pressure_plate');

  /// DEPRECATED, please use Items.spruce_pressure_plate
  @deprecated
  static const ItemType spruce_pressure_plate =
      ItemType('minecraft:spruce_pressure_plate');

  /// DEPRECATED, please use Items.birch_pressure_plate
  @deprecated
  static const ItemType birch_pressure_plate =
      ItemType('minecraft:birch_pressure_plate');

  /// DEPRECATED, please use Items.jungle_pressure_plate
  @deprecated
  static const ItemType jungle_pressure_plate =
      ItemType('minecraft:jungle_pressure_plate');

  /// DEPRECATED, please use Items.acacia_pressure_plate
  @deprecated
  static const ItemType acacia_pressure_plate =
      ItemType('minecraft:acacia_pressure_plate');

  /// DEPRECATED, please use Items.dark_oak_pressure_plate
  @deprecated
  static const ItemType dark_oak_pressure_plate =
      ItemType('minecraft:dark_oak_pressure_plate');

  /// DEPRECATED, please use Items.redstone_ore
  @deprecated
  static const ItemType redstone_ore = ItemType('minecraft:redstone_ore');

  /// DEPRECATED, please use Items.redstone_torch
  @deprecated
  static const ItemType redstone_torch = ItemType('minecraft:redstone_torch');

  /// DEPRECATED, please use Items.stone_button
  @deprecated
  static const ItemType stone_button = ItemType('minecraft:stone_button');

  /// DEPRECATED, please use Items.snow
  @deprecated
  static const ItemType snow = ItemType('minecraft:snow');

  /// DEPRECATED, please use Items.ice
  @deprecated
  static const ItemType ice = ItemType('minecraft:ice');

  /// DEPRECATED, please use Items.snow_block
  @deprecated
  static const ItemType snow_block = ItemType('minecraft:snow_block');

  /// DEPRECATED, please use Items.cactus
  @deprecated
  static const ItemType cactus = ItemType('minecraft:cactus');

  /// DEPRECATED, please use Items.clay
  @deprecated
  static const ItemType clay = ItemType('minecraft:clay');

  /// DEPRECATED, please use Items.jukebox
  @deprecated
  static const ItemType jukebox = ItemType('minecraft:jukebox');

  /// DEPRECATED, please use Items.oak_fence
  @deprecated
  static const ItemType oak_fence = ItemType('minecraft:oak_fence');

  /// DEPRECATED, please use Items.spruce_fence
  @deprecated
  static const ItemType spruce_fence = ItemType('minecraft:spruce_fence');

  /// DEPRECATED, please use Items.birch_fence
  @deprecated
  static const ItemType birch_fence = ItemType('minecraft:birch_fence');

  /// DEPRECATED, please use Items.jungle_fence
  @deprecated
  static const ItemType jungle_fence = ItemType('minecraft:jungle_fence');

  /// DEPRECATED, please use Items.acacia_fence
  @deprecated
  static const ItemType acacia_fence = ItemType('minecraft:acacia_fence');

  /// DEPRECATED, please use Items.dark_oak_fence
  @deprecated
  static const ItemType dark_oak_fence = ItemType('minecraft:dark_oak_fence');

  /// DEPRECATED, please use Items.pumpkin
  @deprecated
  static const ItemType pumpkin = ItemType('minecraft:pumpkin');

  /// DEPRECATED, please use Items.carved_pumpkin
  @deprecated
  static const ItemType carved_pumpkin = ItemType('minecraft:carved_pumpkin');

  /// DEPRECATED, please use Items.netherrack
  @deprecated
  static const ItemType netherrack = ItemType('minecraft:netherrack');

  /// DEPRECATED, please use Items.soul_sand
  @deprecated
  static const ItemType soul_sand = ItemType('minecraft:soul_sand');

  /// DEPRECATED, please use Items.glowstone
  @deprecated
  static const ItemType glowstone = ItemType('minecraft:glowstone');

  /// DEPRECATED, please use Items.jack_o_lantern
  @deprecated
  static const ItemType jack_o_lantern = ItemType('minecraft:jack_o_lantern');

  /// DEPRECATED, please use Items.oak_trapdoor
  @deprecated
  static const ItemType oak_trapdoor = ItemType('minecraft:oak_trapdoor');

  /// DEPRECATED, please use Items.spruce_trapdoor
  @deprecated
  static const ItemType spruce_trapdoor = ItemType('minecraft:spruce_trapdoor');

  /// DEPRECATED, please use Items.birch_trapdoor
  @deprecated
  static const ItemType birch_trapdoor = ItemType('minecraft:birch_trapdoor');

  /// DEPRECATED, please use Items.jungle_trapdoor
  @deprecated
  static const ItemType jungle_trapdoor = ItemType('minecraft:jungle_trapdoor');

  /// DEPRECATED, please use Items.acacia_trapdoor
  @deprecated
  static const ItemType acacia_trapdoor = ItemType('minecraft:acacia_trapdoor');

  /// DEPRECATED, please use Items.dark_oak_trapdoor
  @deprecated
  static const ItemType dark_oak_trapdoor =
      ItemType('minecraft:dark_oak_trapdoor');

  /// DEPRECATED, please use Items.infested_stone
  @deprecated
  static const ItemType infested_stone = ItemType('minecraft:infested_stone');

  /// DEPRECATED, please use Items.infested_cobblestone
  @deprecated
  static const ItemType infested_cobblestone =
      ItemType('minecraft:infested_cobblestone');

  /// DEPRECATED, please use Items.infested_stone_bricks
  @deprecated
  static const ItemType infested_stone_bricks =
      ItemType('minecraft:infested_stone_bricks');

  /// DEPRECATED, please use Items.infested_mossy_stone_bricks
  @deprecated
  static const ItemType infested_mossy_stone_bricks =
      ItemType('minecraft:infested_mossy_stone_bricks');

  /// DEPRECATED, please use Items.infested_cracked_stone_bricks
  @deprecated
  static const ItemType infested_cracked_stone_bricks =
      ItemType('minecraft:infested_cracked_stone_bricks');

  /// DEPRECATED, please use Items.infested_chiseled_stone_bricks
  @deprecated
  static const ItemType infested_chiseled_stone_bricks =
      ItemType('minecraft:infested_chiseled_stone_bricks');

  /// DEPRECATED, please use Items.stone_bricks
  @deprecated
  static const ItemType stone_bricks = ItemType('minecraft:stone_bricks');

  /// DEPRECATED, please use Items.mossy_stone_bricks
  @deprecated
  static const ItemType mossy_stone_bricks =
      ItemType('minecraft:mossy_stone_bricks');

  /// DEPRECATED, please use Items.cracked_stone_bricks
  @deprecated
  static const ItemType cracked_stone_bricks =
      ItemType('minecraft:cracked_stone_bricks');

  /// DEPRECATED, please use Items.chiseled_stone_bricks
  @deprecated
  static const ItemType chiseled_stone_bricks =
      ItemType('minecraft:chiseled_stone_bricks');

  /// DEPRECATED, please use Items.brown_mushroom_block
  @deprecated
  static const ItemType brown_mushroom_block =
      ItemType('minecraft:brown_mushroom_block');

  /// DEPRECATED, please use Items.red_mushroom_block
  @deprecated
  static const ItemType red_mushroom_block =
      ItemType('minecraft:red_mushroom_block');

  /// DEPRECATED, please use Items.mushroom_stem
  @deprecated
  static const ItemType mushroom_stem = ItemType('minecraft:mushroom_stem');

  /// DEPRECATED, please use Items.iron_bars
  @deprecated
  static const ItemType iron_bars = ItemType('minecraft:iron_bars');

  /// DEPRECATED, please use Items.glass_pane
  @deprecated
  static const ItemType glass_pane = ItemType('minecraft:glass_pane');

  /// DEPRECATED, please use Items.melon
  @deprecated
  static const ItemType melon = ItemType('minecraft:melon');

  /// DEPRECATED, please use Items.vine
  @deprecated
  static const ItemType vine = ItemType('minecraft:vine');

  /// DEPRECATED, please use Items.oak_fence_gate
  @deprecated
  static const ItemType oak_fence_gate = ItemType('minecraft:oak_fence_gate');

  /// DEPRECATED, please use Items.spruce_fence_gate
  @deprecated
  static const ItemType spruce_fence_gate =
      ItemType('minecraft:spruce_fence_gate');

  /// DEPRECATED, please use Items.birch_fence_gate
  @deprecated
  static const ItemType birch_fence_gate =
      ItemType('minecraft:birch_fence_gate');

  /// DEPRECATED, please use Items.jungle_fence_gate
  @deprecated
  static const ItemType jungle_fence_gate =
      ItemType('minecraft:jungle_fence_gate');

  /// DEPRECATED, please use Items.acacia_fence_gate
  @deprecated
  static const ItemType acacia_fence_gate =
      ItemType('minecraft:acacia_fence_gate');

  /// DEPRECATED, please use Items.dark_oak_fence_gate
  @deprecated
  static const ItemType dark_oak_fence_gate =
      ItemType('minecraft:dark_oak_fence_gate');

  /// DEPRECATED, please use Items.brick_stairs
  @deprecated
  static const ItemType brick_stairs = ItemType('minecraft:brick_stairs');

  /// DEPRECATED, please use Items.stone_brick_stairs
  @deprecated
  static const ItemType stone_brick_stairs =
      ItemType('minecraft:stone_brick_stairs');

  /// DEPRECATED, please use Items.mycelium
  @deprecated
  static const ItemType mycelium = ItemType('minecraft:mycelium');

  /// DEPRECATED, please use Items.lily_pad
  @deprecated
  static const ItemType lily_pad = ItemType('minecraft:lily_pad');

  /// DEPRECATED, please use Items.nether_bricks
  @deprecated
  static const ItemType nether_bricks = ItemType('minecraft:nether_bricks');

  /// DEPRECATED, please use Items.nether_brick_fence
  @deprecated
  static const ItemType nether_brick_fence =
      ItemType('minecraft:nether_brick_fence');

  /// DEPRECATED, please use Items.nether_brick_stairs
  @deprecated
  static const ItemType nether_brick_stairs =
      ItemType('minecraft:nether_brick_stairs');

  /// DEPRECATED, please use Items.enchanting_table
  @deprecated
  static const ItemType enchanting_table =
      ItemType('minecraft:enchanting_table');

  /// DEPRECATED, please use Items.end_portal_frame
  @deprecated
  static const ItemType end_portal_frame =
      ItemType('minecraft:end_portal_frame');

  /// DEPRECATED, please use Items.end_stone
  @deprecated
  static const ItemType end_stone = ItemType('minecraft:end_stone');

  /// DEPRECATED, please use Items.end_stone_bricks
  @deprecated
  static const ItemType end_stone_bricks =
      ItemType('minecraft:end_stone_bricks');

  /// DEPRECATED, please use Items.dragon_egg
  @deprecated
  static const ItemType dragon_egg = ItemType('minecraft:dragon_egg');

  /// DEPRECATED, please use Items.redstone_lamp
  @deprecated
  static const ItemType redstone_lamp = ItemType('minecraft:redstone_lamp');

  /// DEPRECATED, please use Items.sandstone_stairs
  @deprecated
  static const ItemType sandstone_stairs =
      ItemType('minecraft:sandstone_stairs');

  /// DEPRECATED, please use Items.emerald_ore
  @deprecated
  static const ItemType emerald_ore = ItemType('minecraft:emerald_ore');

  /// DEPRECATED, please use Items.ender_chest
  @deprecated
  static const ItemType ender_chest = ItemType('minecraft:ender_chest');

  /// DEPRECATED, please use Items.tripwire_hook
  @deprecated
  static const ItemType tripwire_hook = ItemType('minecraft:tripwire_hook');

  /// DEPRECATED, please use Items.emerald_block
  @deprecated
  static const ItemType emerald_block = ItemType('minecraft:emerald_block');

  /// DEPRECATED, please use Items.spruce_stairs
  @deprecated
  static const ItemType spruce_stairs = ItemType('minecraft:spruce_stairs');

  /// DEPRECATED, please use Items.birch_stairs
  @deprecated
  static const ItemType birch_stairs = ItemType('minecraft:birch_stairs');

  /// DEPRECATED, please use Items.jungle_stairs
  @deprecated
  static const ItemType jungle_stairs = ItemType('minecraft:jungle_stairs');

  /// DEPRECATED, please use Items.command_block
  @deprecated
  static const ItemType command_block = ItemType('minecraft:command_block');

  /// DEPRECATED, please use Items.beacon
  @deprecated
  static const ItemType beacon = ItemType('minecraft:beacon');

  /// DEPRECATED, please use Items.cobblestone_wall
  @deprecated
  static const ItemType cobblestone_wall =
      ItemType('minecraft:cobblestone_wall');

  /// DEPRECATED, please use Items.mossy_cobblestone_wall
  @deprecated
  static const ItemType mossy_cobblestone_wall =
      ItemType('minecraft:mossy_cobblestone_wall');

  /// DEPRECATED, please use Items.brick_wall
  @deprecated
  static const ItemType brick_wall = ItemType('minecraft:brick_wall');

  /// DEPRECATED, please use Items.prismarine_wall
  @deprecated
  static const ItemType prismarine_wall = ItemType('minecraft:prismarine_wall');

  /// DEPRECATED, please use Items.red_sandstone_wall
  @deprecated
  static const ItemType red_sandstone_wall =
      ItemType('minecraft:red_sandstone_wall');

  /// DEPRECATED, please use Items.mossy_stone_brick_wall
  @deprecated
  static const ItemType mossy_stone_brick_wall =
      ItemType('minecraft:mossy_stone_brick_wall');

  /// DEPRECATED, please use Items.granite_wall
  @deprecated
  static const ItemType granite_wall = ItemType('minecraft:granite_wall');

  /// DEPRECATED, please use Items.stone_brick_wall
  @deprecated
  static const ItemType stone_brick_wall =
      ItemType('minecraft:stone_brick_wall');

  /// DEPRECATED, please use Items.nether_brick_wall
  @deprecated
  static const ItemType nether_brick_wall =
      ItemType('minecraft:nether_brick_wall');

  /// DEPRECATED, please use Items.andesite_wall
  @deprecated
  static const ItemType andesite_wall = ItemType('minecraft:andesite_wall');

  /// DEPRECATED, please use Items.red_nether_brick_wall
  @deprecated
  static const ItemType red_nether_brick_wall =
      ItemType('minecraft:red_nether_brick_wall');

  /// DEPRECATED, please use Items.sandstone_wall
  @deprecated
  static const ItemType sandstone_wall = ItemType('minecraft:sandstone_wall');

  /// DEPRECATED, please use Items.end_stone_brick_wall
  @deprecated
  static const ItemType end_stone_brick_wall =
      ItemType('minecraft:end_stone_brick_wall');

  /// DEPRECATED, please use Items.diorite_wall
  @deprecated
  static const ItemType diorite_wall = ItemType('minecraft:diorite_wall');

  /// DEPRECATED, please use Items.oak_button
  @deprecated
  static const ItemType oak_button = ItemType('minecraft:oak_button');

  /// DEPRECATED, please use Items.spruce_button
  @deprecated
  static const ItemType spruce_button = ItemType('minecraft:spruce_button');

  /// DEPRECATED, please use Items.birch_button
  @deprecated
  static const ItemType birch_button = ItemType('minecraft:birch_button');

  /// DEPRECATED, please use Items.jungle_button
  @deprecated
  static const ItemType jungle_button = ItemType('minecraft:jungle_button');

  /// DEPRECATED, please use Items.acacia_button
  @deprecated
  static const ItemType acacia_button = ItemType('minecraft:acacia_button');

  /// DEPRECATED, please use Items.dark_oak_button
  @deprecated
  static const ItemType dark_oak_button = ItemType('minecraft:dark_oak_button');

  /// DEPRECATED, please use Items.anvil
  @deprecated
  static const ItemType anvil = ItemType('minecraft:anvil');

  /// DEPRECATED, please use Items.chipped_anvil
  @deprecated
  static const ItemType chipped_anvil = ItemType('minecraft:chipped_anvil');

  /// DEPRECATED, please use Items.damaged_anvil
  @deprecated
  static const ItemType damaged_anvil = ItemType('minecraft:damaged_anvil');

  /// DEPRECATED, please use Items.trapped_chest
  @deprecated
  static const ItemType trapped_chest = ItemType('minecraft:trapped_chest');

  /// DEPRECATED, please use Items.light_weighted_pressure_plate
  @deprecated
  static const ItemType light_weighted_pressure_plate =
      ItemType('minecraft:light_weighted_pressure_plate');

  /// DEPRECATED, please use Items.heavy_weighted_pressure_plate
  @deprecated
  static const ItemType heavy_weighted_pressure_plate =
      ItemType('minecraft:heavy_weighted_pressure_plate');

  /// DEPRECATED, please use Items.daylight_detector
  @deprecated
  static const ItemType daylight_detector =
      ItemType('minecraft:daylight_detector');

  /// DEPRECATED, please use Items.redstone_block
  @deprecated
  static const ItemType redstone_block = ItemType('minecraft:redstone_block');

  /// DEPRECATED, please use Items.nether_quartz_ore
  @deprecated
  static const ItemType nether_quartz_ore =
      ItemType('minecraft:nether_quartz_ore');

  /// DEPRECATED, please use Items.hopper
  @deprecated
  static const ItemType hopper = ItemType('minecraft:hopper');

  /// DEPRECATED, please use Items.chiseled_quartz_block
  @deprecated
  static const ItemType chiseled_quartz_block =
      ItemType('minecraft:chiseled_quartz_block');

  /// DEPRECATED, please use Items.quartz_block
  @deprecated
  static const ItemType quartz_block = ItemType('minecraft:quartz_block');

  /// DEPRECATED, please use Items.quartz_pillar
  @deprecated
  static const ItemType quartz_pillar = ItemType('minecraft:quartz_pillar');

  /// DEPRECATED, please use Items.quartz_stairs
  @deprecated
  static const ItemType quartz_stairs = ItemType('minecraft:quartz_stairs');

  /// DEPRECATED, please use Items.activator_rail
  @deprecated
  static const ItemType activator_rail = ItemType('minecraft:activator_rail');

  /// DEPRECATED, please use Items.dropper
  @deprecated
  static const ItemType dropper = ItemType('minecraft:dropper');

  /// DEPRECATED, please use Items.white_terracotta
  @deprecated
  static const ItemType white_terracotta =
      ItemType('minecraft:white_terracotta');

  /// DEPRECATED, please use Items.orange_terracotta
  @deprecated
  static const ItemType orange_terracotta =
      ItemType('minecraft:orange_terracotta');

  /// DEPRECATED, please use Items.magenta_terracotta
  @deprecated
  static const ItemType magenta_terracotta =
      ItemType('minecraft:magenta_terracotta');

  /// DEPRECATED, please use Items.light_blue_terracotta
  @deprecated
  static const ItemType light_blue_terracotta =
      ItemType('minecraft:light_blue_terracotta');

  /// DEPRECATED, please use Items.yellow_terracotta
  @deprecated
  static const ItemType yellow_terracotta =
      ItemType('minecraft:yellow_terracotta');

  /// DEPRECATED, please use Items.lime_terracotta
  @deprecated
  static const ItemType lime_terracotta = ItemType('minecraft:lime_terracotta');

  /// DEPRECATED, please use Items.pink_terracotta
  @deprecated
  static const ItemType pink_terracotta = ItemType('minecraft:pink_terracotta');

  /// DEPRECATED, please use Items.gray_terracotta
  @deprecated
  static const ItemType gray_terracotta = ItemType('minecraft:gray_terracotta');

  /// DEPRECATED, please use Items.light_gray_terracotta
  @deprecated
  static const ItemType light_gray_terracotta =
      ItemType('minecraft:light_gray_terracotta');

  /// DEPRECATED, please use Items.cyan_terracotta
  @deprecated
  static const ItemType cyan_terracotta = ItemType('minecraft:cyan_terracotta');

  /// DEPRECATED, please use Items.purple_terracotta
  @deprecated
  static const ItemType purple_terracotta =
      ItemType('minecraft:purple_terracotta');

  /// DEPRECATED, please use Items.blue_terracotta
  @deprecated
  static const ItemType blue_terracotta = ItemType('minecraft:blue_terracotta');

  /// DEPRECATED, please use Items.brown_terracotta
  @deprecated
  static const ItemType brown_terracotta =
      ItemType('minecraft:brown_terracotta');

  /// DEPRECATED, please use Items.green_terracotta
  @deprecated
  static const ItemType green_terracotta =
      ItemType('minecraft:green_terracotta');

  /// DEPRECATED, please use Items.red_terracotta
  @deprecated
  static const ItemType red_terracotta = ItemType('minecraft:red_terracotta');

  /// DEPRECATED, please use Items.black_terracotta
  @deprecated
  static const ItemType black_terracotta =
      ItemType('minecraft:black_terracotta');

  /// DEPRECATED, please use Items.barrier
  @deprecated
  static const ItemType barrier = ItemType('minecraft:barrier');

  /// DEPRECATED, please use Items.iron_trapdoor
  @deprecated
  static const ItemType iron_trapdoor = ItemType('minecraft:iron_trapdoor');

  /// DEPRECATED, please use Items.hay_block
  @deprecated
  static const ItemType hay_block = ItemType('minecraft:hay_block');

  /// DEPRECATED, please use Items.white_carpet
  @deprecated
  static const ItemType white_carpet = ItemType('minecraft:white_carpet');

  /// DEPRECATED, please use Items.orange_carpet
  @deprecated
  static const ItemType orange_carpet = ItemType('minecraft:orange_carpet');

  /// DEPRECATED, please use Items.magenta_carpet
  @deprecated
  static const ItemType magenta_carpet = ItemType('minecraft:magenta_carpet');

  /// DEPRECATED, please use Items.light_blue_carpet
  @deprecated
  static const ItemType light_blue_carpet =
      ItemType('minecraft:light_blue_carpet');

  /// DEPRECATED, please use Items.yellow_carpet
  @deprecated
  static const ItemType yellow_carpet = ItemType('minecraft:yellow_carpet');

  /// DEPRECATED, please use Items.lime_carpet
  @deprecated
  static const ItemType lime_carpet = ItemType('minecraft:lime_carpet');

  /// DEPRECATED, please use Items.pink_carpet
  @deprecated
  static const ItemType pink_carpet = ItemType('minecraft:pink_carpet');

  /// DEPRECATED, please use Items.gray_carpet
  @deprecated
  static const ItemType gray_carpet = ItemType('minecraft:gray_carpet');

  /// DEPRECATED, please use Items.light_gray_carpet
  @deprecated
  static const ItemType light_gray_carpet =
      ItemType('minecraft:light_gray_carpet');

  /// DEPRECATED, please use Items.cyan_carpet
  @deprecated
  static const ItemType cyan_carpet = ItemType('minecraft:cyan_carpet');

  /// DEPRECATED, please use Items.purple_carpet
  @deprecated
  static const ItemType purple_carpet = ItemType('minecraft:purple_carpet');

  /// DEPRECATED, please use Items.blue_carpet
  @deprecated
  static const ItemType blue_carpet = ItemType('minecraft:blue_carpet');

  /// DEPRECATED, please use Items.brown_carpet
  @deprecated
  static const ItemType brown_carpet = ItemType('minecraft:brown_carpet');

  /// DEPRECATED, please use Items.green_carpet
  @deprecated
  static const ItemType green_carpet = ItemType('minecraft:green_carpet');

  /// DEPRECATED, please use Items.red_carpet
  @deprecated
  static const ItemType red_carpet = ItemType('minecraft:red_carpet');

  /// DEPRECATED, please use Items.black_carpet
  @deprecated
  static const ItemType black_carpet = ItemType('minecraft:black_carpet');

  /// DEPRECATED, please use Items.terracotta
  @deprecated
  static const ItemType terracotta = ItemType('minecraft:terracotta');

  /// DEPRECATED, please use Items.coal_block
  @deprecated
  static const ItemType coal_block = ItemType('minecraft:coal_block');

  /// DEPRECATED, please use Items.packed_ice
  @deprecated
  static const ItemType packed_ice = ItemType('minecraft:packed_ice');

  /// DEPRECATED, please use Items.acacia_stairs
  @deprecated
  static const ItemType acacia_stairs = ItemType('minecraft:acacia_stairs');

  /// DEPRECATED, please use Items.dark_oak_stairs
  @deprecated
  static const ItemType dark_oak_stairs = ItemType('minecraft:dark_oak_stairs');

  /// DEPRECATED, please use Items.slime_block
  @deprecated
  static const ItemType slime_block = ItemType('minecraft:slime_block');

  /// DEPRECATED, please use Items.grass_path
  @deprecated
  static const ItemType grass_path = ItemType('minecraft:grass_path');

  /// DEPRECATED, please use Items.sunflower
  @deprecated
  static const ItemType sunflower = ItemType('minecraft:sunflower');

  /// DEPRECATED, please use Items.lilac
  @deprecated
  static const ItemType lilac = ItemType('minecraft:lilac');

  /// DEPRECATED, please use Items.rose_bush
  @deprecated
  static const ItemType rose_bush = ItemType('minecraft:rose_bush');

  /// DEPRECATED, please use Items.peony
  @deprecated
  static const ItemType peony = ItemType('minecraft:peony');

  /// DEPRECATED, please use Items.tall_grass
  @deprecated
  static const ItemType tall_grass = ItemType('minecraft:tall_grass');

  /// DEPRECATED, please use Items.large_fern
  @deprecated
  static const ItemType large_fern = ItemType('minecraft:large_fern');

  /// DEPRECATED, please use Items.white_stained_glass
  @deprecated
  static const ItemType white_stained_glass =
      ItemType('minecraft:white_stained_glass');

  /// DEPRECATED, please use Items.orange_stained_glass
  @deprecated
  static const ItemType orange_stained_glass =
      ItemType('minecraft:orange_stained_glass');

  /// DEPRECATED, please use Items.magenta_stained_glass
  @deprecated
  static const ItemType magenta_stained_glass =
      ItemType('minecraft:magenta_stained_glass');

  /// DEPRECATED, please use Items.light_blue_stained_glass
  @deprecated
  static const ItemType light_blue_stained_glass =
      ItemType('minecraft:light_blue_stained_glass');

  /// DEPRECATED, please use Items.yellow_stained_glass
  @deprecated
  static const ItemType yellow_stained_glass =
      ItemType('minecraft:yellow_stained_glass');

  /// DEPRECATED, please use Items.lime_stained_glass
  @deprecated
  static const ItemType lime_stained_glass =
      ItemType('minecraft:lime_stained_glass');

  /// DEPRECATED, please use Items.pink_stained_glass
  @deprecated
  static const ItemType pink_stained_glass =
      ItemType('minecraft:pink_stained_glass');

  /// DEPRECATED, please use Items.gray_stained_glass
  @deprecated
  static const ItemType gray_stained_glass =
      ItemType('minecraft:gray_stained_glass');

  /// DEPRECATED, please use Items.light_gray_stained_glass
  @deprecated
  static const ItemType light_gray_stained_glass =
      ItemType('minecraft:light_gray_stained_glass');

  /// DEPRECATED, please use Items.cyan_stained_glass
  @deprecated
  static const ItemType cyan_stained_glass =
      ItemType('minecraft:cyan_stained_glass');

  /// DEPRECATED, please use Items.purple_stained_glass
  @deprecated
  static const ItemType purple_stained_glass =
      ItemType('minecraft:purple_stained_glass');

  /// DEPRECATED, please use Items.blue_stained_glass
  @deprecated
  static const ItemType blue_stained_glass =
      ItemType('minecraft:blue_stained_glass');

  /// DEPRECATED, please use Items.brown_stained_glass
  @deprecated
  static const ItemType brown_stained_glass =
      ItemType('minecraft:brown_stained_glass');

  /// DEPRECATED, please use Items.green_stained_glass
  @deprecated
  static const ItemType green_stained_glass =
      ItemType('minecraft:green_stained_glass');

  /// DEPRECATED, please use Items.red_stained_glass
  @deprecated
  static const ItemType red_stained_glass =
      ItemType('minecraft:red_stained_glass');

  /// DEPRECATED, please use Items.black_stained_glass
  @deprecated
  static const ItemType black_stained_glass =
      ItemType('minecraft:black_stained_glass');

  /// DEPRECATED, please use Items.white_stained_glass_pane
  @deprecated
  static const ItemType white_stained_glass_pane =
      ItemType('minecraft:white_stained_glass_pane');

  /// DEPRECATED, please use Items.orange_stained_glass_pane
  @deprecated
  static const ItemType orange_stained_glass_pane =
      ItemType('minecraft:orange_stained_glass_pane');

  /// DEPRECATED, please use Items.magenta_stained_glass_pane
  @deprecated
  static const ItemType magenta_stained_glass_pane =
      ItemType('minecraft:magenta_stained_glass_pane');

  /// DEPRECATED, please use Items.light_blue_stained_glass_pane
  @deprecated
  static const ItemType light_blue_stained_glass_pane =
      ItemType('minecraft:light_blue_stained_glass_pane');

  /// DEPRECATED, please use Items.yellow_stained_glass_pane
  @deprecated
  static const ItemType yellow_stained_glass_pane =
      ItemType('minecraft:yellow_stained_glass_pane');

  /// DEPRECATED, please use Items.lime_stained_glass_pane
  @deprecated
  static const ItemType lime_stained_glass_pane =
      ItemType('minecraft:lime_stained_glass_pane');

  /// DEPRECATED, please use Items.pink_stained_glass_pane
  @deprecated
  static const ItemType pink_stained_glass_pane =
      ItemType('minecraft:pink_stained_glass_pane');

  /// DEPRECATED, please use Items.gray_stained_glass_pane
  @deprecated
  static const ItemType gray_stained_glass_pane =
      ItemType('minecraft:gray_stained_glass_pane');

  /// DEPRECATED, please use Items.light_gray_stained_glass_pane
  @deprecated
  static const ItemType light_gray_stained_glass_pane =
      ItemType('minecraft:light_gray_stained_glass_pane');

  /// DEPRECATED, please use Items.cyan_stained_glass_pane
  @deprecated
  static const ItemType cyan_stained_glass_pane =
      ItemType('minecraft:cyan_stained_glass_pane');

  /// DEPRECATED, please use Items.purple_stained_glass_pane
  @deprecated
  static const ItemType purple_stained_glass_pane =
      ItemType('minecraft:purple_stained_glass_pane');

  /// DEPRECATED, please use Items.blue_stained_glass_pane
  @deprecated
  static const ItemType blue_stained_glass_pane =
      ItemType('minecraft:blue_stained_glass_pane');

  /// DEPRECATED, please use Items.brown_stained_glass_pane
  @deprecated
  static const ItemType brown_stained_glass_pane =
      ItemType('minecraft:brown_stained_glass_pane');

  /// DEPRECATED, please use Items.green_stained_glass_pane
  @deprecated
  static const ItemType green_stained_glass_pane =
      ItemType('minecraft:green_stained_glass_pane');

  /// DEPRECATED, please use Items.red_stained_glass_pane
  @deprecated
  static const ItemType red_stained_glass_pane =
      ItemType('minecraft:red_stained_glass_pane');

  /// DEPRECATED, please use Items.black_stained_glass_pane
  @deprecated
  static const ItemType black_stained_glass_pane =
      ItemType('minecraft:black_stained_glass_pane');

  /// DEPRECATED, please use Items.prismarine
  @deprecated
  static const ItemType prismarine = ItemType('minecraft:prismarine');

  /// DEPRECATED, please use Items.prismarine_bricks
  @deprecated
  static const ItemType prismarine_bricks =
      ItemType('minecraft:prismarine_bricks');

  /// DEPRECATED, please use Items.dark_prismarine
  @deprecated
  static const ItemType dark_prismarine = ItemType('minecraft:dark_prismarine');

  /// DEPRECATED, please use Items.prismarine_stairs
  @deprecated
  static const ItemType prismarine_stairs =
      ItemType('minecraft:prismarine_stairs');

  /// DEPRECATED, please use Items.prismarine_brick_stairs
  @deprecated
  static const ItemType prismarine_brick_stairs =
      ItemType('minecraft:prismarine_brick_stairs');

  /// DEPRECATED, please use Items.dark_prismarine_stairs
  @deprecated
  static const ItemType dark_prismarine_stairs =
      ItemType('minecraft:dark_prismarine_stairs');

  /// DEPRECATED, please use Items.sea_lantern
  @deprecated
  static const ItemType sea_lantern = ItemType('minecraft:sea_lantern');

  /// DEPRECATED, please use Items.red_sandstone
  @deprecated
  static const ItemType red_sandstone = ItemType('minecraft:red_sandstone');

  /// DEPRECATED, please use Items.chiseled_red_sandstone
  @deprecated
  static const ItemType chiseled_red_sandstone =
      ItemType('minecraft:chiseled_red_sandstone');

  /// DEPRECATED, please use Items.cut_red_sandstone
  @deprecated
  static const ItemType cut_red_sandstone =
      ItemType('minecraft:cut_red_sandstone');

  /// DEPRECATED, please use Items.red_sandstone_stairs
  @deprecated
  static const ItemType red_sandstone_stairs =
      ItemType('minecraft:red_sandstone_stairs');

  /// DEPRECATED, please use Items.repeating_command_block
  @deprecated
  static const ItemType repeating_command_block =
      ItemType('minecraft:repeating_command_block');

  /// DEPRECATED, please use Items.chain_command_block
  @deprecated
  static const ItemType chain_command_block =
      ItemType('minecraft:chain_command_block');

  /// DEPRECATED, please use Items.magma_block
  @deprecated
  static const ItemType magma_block = ItemType('minecraft:magma_block');

  /// DEPRECATED, please use Items.nether_wart_block
  @deprecated
  static const ItemType nether_wart_block =
      ItemType('minecraft:nether_wart_block');

  /// DEPRECATED, please use Items.red_nether_bricks
  @deprecated
  static const ItemType red_nether_bricks =
      ItemType('minecraft:red_nether_bricks');

  /// DEPRECATED, please use Items.bone_block
  @deprecated
  static const ItemType bone_block = ItemType('minecraft:bone_block');

  /// DEPRECATED, please use Items.structure_void
  @deprecated
  static const ItemType structure_void = ItemType('minecraft:structure_void');

  /// DEPRECATED, please use Items.observer
  @deprecated
  static const ItemType observer = ItemType('minecraft:observer');

  /// DEPRECATED, please use Items.shulker_box
  @deprecated
  static const ItemType shulker_box = ItemType('minecraft:shulker_box');

  /// DEPRECATED, please use Items.white_shulker_box
  @deprecated
  static const ItemType white_shulker_box =
      ItemType('minecraft:white_shulker_box');

  /// DEPRECATED, please use Items.orange_shulker_box
  @deprecated
  static const ItemType orange_shulker_box =
      ItemType('minecraft:orange_shulker_box');

  /// DEPRECATED, please use Items.magenta_shulker_box
  @deprecated
  static const ItemType magenta_shulker_box =
      ItemType('minecraft:magenta_shulker_box');

  /// DEPRECATED, please use Items.light_blue_shulker_box
  @deprecated
  static const ItemType light_blue_shulker_box =
      ItemType('minecraft:light_blue_shulker_box');

  /// DEPRECATED, please use Items.yellow_shulker_box
  @deprecated
  static const ItemType yellow_shulker_box =
      ItemType('minecraft:yellow_shulker_box');

  /// DEPRECATED, please use Items.lime_shulker_box
  @deprecated
  static const ItemType lime_shulker_box =
      ItemType('minecraft:lime_shulker_box');

  /// DEPRECATED, please use Items.pink_shulker_box
  @deprecated
  static const ItemType pink_shulker_box =
      ItemType('minecraft:pink_shulker_box');

  /// DEPRECATED, please use Items.gray_shulker_box
  @deprecated
  static const ItemType gray_shulker_box =
      ItemType('minecraft:gray_shulker_box');

  /// DEPRECATED, please use Items.light_gray_shulker_box
  @deprecated
  static const ItemType light_gray_shulker_box =
      ItemType('minecraft:light_gray_shulker_box');

  /// DEPRECATED, please use Items.cyan_shulker_box
  @deprecated
  static const ItemType cyan_shulker_box =
      ItemType('minecraft:cyan_shulker_box');

  /// DEPRECATED, please use Items.purple_shulker_box
  @deprecated
  static const ItemType purple_shulker_box =
      ItemType('minecraft:purple_shulker_box');

  /// DEPRECATED, please use Items.blue_shulker_box
  @deprecated
  static const ItemType blue_shulker_box =
      ItemType('minecraft:blue_shulker_box');

  /// DEPRECATED, please use Items.brown_shulker_box
  @deprecated
  static const ItemType brown_shulker_box =
      ItemType('minecraft:brown_shulker_box');

  /// DEPRECATED, please use Items.green_shulker_box
  @deprecated
  static const ItemType green_shulker_box =
      ItemType('minecraft:green_shulker_box');

  /// DEPRECATED, please use Items.red_shulker_box
  @deprecated
  static const ItemType red_shulker_box = ItemType('minecraft:red_shulker_box');

  /// DEPRECATED, please use Items.black_shulker_box
  @deprecated
  static const ItemType black_shulker_box =
      ItemType('minecraft:black_shulker_box');

  /// DEPRECATED, please use Items.white_glazed_terracotta
  @deprecated
  static const ItemType white_glazed_terracotta =
      ItemType('minecraft:white_glazed_terracotta');

  /// DEPRECATED, please use Items.orange_glazed_terracotta
  @deprecated
  static const ItemType orange_glazed_terracotta =
      ItemType('minecraft:orange_glazed_terracotta');

  /// DEPRECATED, please use Items.magenta_glazed_terracotta
  @deprecated
  static const ItemType magenta_glazed_terracotta =
      ItemType('minecraft:magenta_glazed_terracotta');

  /// DEPRECATED, please use Items.light_blue_glazed_terracotta
  @deprecated
  static const ItemType light_blue_glazed_terracotta =
      ItemType('minecraft:light_blue_glazed_terracotta');

  /// DEPRECATED, please use Items.yellow_glazed_terracotta
  @deprecated
  static const ItemType yellow_glazed_terracotta =
      ItemType('minecraft:yellow_glazed_terracotta');

  /// DEPRECATED, please use Items.lime_glazed_terracotta
  @deprecated
  static const ItemType lime_glazed_terracotta =
      ItemType('minecraft:lime_glazed_terracotta');

  /// DEPRECATED, please use Items.pink_glazed_terracotta
  @deprecated
  static const ItemType pink_glazed_terracotta =
      ItemType('minecraft:pink_glazed_terracotta');

  /// DEPRECATED, please use Items.gray_glazed_terracotta
  @deprecated
  static const ItemType gray_glazed_terracotta =
      ItemType('minecraft:gray_glazed_terracotta');

  /// DEPRECATED, please use Items.light_gray_glazed_terracotta
  @deprecated
  static const ItemType light_gray_glazed_terracotta =
      ItemType('minecraft:light_gray_glazed_terracotta');

  /// DEPRECATED, please use Items.cyan_glazed_terracotta
  @deprecated
  static const ItemType cyan_glazed_terracotta =
      ItemType('minecraft:cyan_glazed_terracotta');

  /// DEPRECATED, please use Items.purple_glazed_terracotta
  @deprecated
  static const ItemType purple_glazed_terracotta =
      ItemType('minecraft:purple_glazed_terracotta');

  /// DEPRECATED, please use Items.blue_glazed_terracotta
  @deprecated
  static const ItemType blue_glazed_terracotta =
      ItemType('minecraft:blue_glazed_terracotta');

  /// DEPRECATED, please use Items.brown_glazed_terracotta
  @deprecated
  static const ItemType brown_glazed_terracotta =
      ItemType('minecraft:brown_glazed_terracotta');

  /// DEPRECATED, please use Items.green_glazed_terracotta
  @deprecated
  static const ItemType green_glazed_terracotta =
      ItemType('minecraft:green_glazed_terracotta');

  /// DEPRECATED, please use Items.red_glazed_terracotta
  @deprecated
  static const ItemType red_glazed_terracotta =
      ItemType('minecraft:red_glazed_terracotta');

  /// DEPRECATED, please use Items.black_glazed_terracotta
  @deprecated
  static const ItemType black_glazed_terracotta =
      ItemType('minecraft:black_glazed_terracotta');

  /// DEPRECATED, please use Items.white_concrete
  @deprecated
  static const ItemType white_concrete = ItemType('minecraft:white_concrete');

  /// DEPRECATED, please use Items.orange_concrete
  @deprecated
  static const ItemType orange_concrete = ItemType('minecraft:orange_concrete');

  /// DEPRECATED, please use Items.magenta_concrete
  @deprecated
  static const ItemType magenta_concrete =
      ItemType('minecraft:magenta_concrete');

  /// DEPRECATED, please use Items.light_blue_concrete
  @deprecated
  static const ItemType light_blue_concrete =
      ItemType('minecraft:light_blue_concrete');

  /// DEPRECATED, please use Items.yellow_concrete
  @deprecated
  static const ItemType yellow_concrete = ItemType('minecraft:yellow_concrete');

  /// DEPRECATED, please use Items.lime_concrete
  @deprecated
  static const ItemType lime_concrete = ItemType('minecraft:lime_concrete');

  /// DEPRECATED, please use Items.pink_concrete
  @deprecated
  static const ItemType pink_concrete = ItemType('minecraft:pink_concrete');

  /// DEPRECATED, please use Items.gray_concrete
  @deprecated
  static const ItemType gray_concrete = ItemType('minecraft:gray_concrete');

  /// DEPRECATED, please use Items.light_gray_concrete
  @deprecated
  static const ItemType light_gray_concrete =
      ItemType('minecraft:light_gray_concrete');

  /// DEPRECATED, please use Items.cyan_concrete
  @deprecated
  static const ItemType cyan_concrete = ItemType('minecraft:cyan_concrete');

  /// DEPRECATED, please use Items.purple_concrete
  @deprecated
  static const ItemType purple_concrete = ItemType('minecraft:purple_concrete');

  /// DEPRECATED, please use Items.blue_concrete
  @deprecated
  static const ItemType blue_concrete = ItemType('minecraft:blue_concrete');

  /// DEPRECATED, please use Items.brown_concrete
  @deprecated
  static const ItemType brown_concrete = ItemType('minecraft:brown_concrete');

  /// DEPRECATED, please use Items.green_concrete
  @deprecated
  static const ItemType green_concrete = ItemType('minecraft:green_concrete');

  /// DEPRECATED, please use Items.red_concrete
  @deprecated
  static const ItemType red_concrete = ItemType('minecraft:red_concrete');

  /// DEPRECATED, please use Items.black_concrete
  @deprecated
  static const ItemType black_concrete = ItemType('minecraft:black_concrete');

  /// DEPRECATED, please use Items.white_concrete_powder
  @deprecated
  static const ItemType white_concrete_powder =
      ItemType('minecraft:white_concrete_powder');

  /// DEPRECATED, please use Items.orange_concrete_powder
  @deprecated
  static const ItemType orange_concrete_powder =
      ItemType('minecraft:orange_concrete_powder');

  /// DEPRECATED, please use Items.magenta_concrete_powder
  @deprecated
  static const ItemType magenta_concrete_powder =
      ItemType('minecraft:magenta_concrete_powder');

  /// DEPRECATED, please use Items.light_blue_concrete_powder
  @deprecated
  static const ItemType light_blue_concrete_powder =
      ItemType('minecraft:light_blue_concrete_powder');

  /// DEPRECATED, please use Items.yellow_concrete_powder
  @deprecated
  static const ItemType yellow_concrete_powder =
      ItemType('minecraft:yellow_concrete_powder');

  /// DEPRECATED, please use Items.lime_concrete_powder
  @deprecated
  static const ItemType lime_concrete_powder =
      ItemType('minecraft:lime_concrete_powder');

  /// DEPRECATED, please use Items.pink_concrete_powder
  @deprecated
  static const ItemType pink_concrete_powder =
      ItemType('minecraft:pink_concrete_powder');

  /// DEPRECATED, please use Items.gray_concrete_powder
  @deprecated
  static const ItemType gray_concrete_powder =
      ItemType('minecraft:gray_concrete_powder');

  /// DEPRECATED, please use Items.light_gray_concrete_powder
  @deprecated
  static const ItemType light_gray_concrete_powder =
      ItemType('minecraft:light_gray_concrete_powder');

  /// DEPRECATED, please use Items.cyan_concrete_powder
  @deprecated
  static const ItemType cyan_concrete_powder =
      ItemType('minecraft:cyan_concrete_powder');

  /// DEPRECATED, please use Items.purple_concrete_powder
  @deprecated
  static const ItemType purple_concrete_powder =
      ItemType('minecraft:purple_concrete_powder');

  /// DEPRECATED, please use Items.blue_concrete_powder
  @deprecated
  static const ItemType blue_concrete_powder =
      ItemType('minecraft:blue_concrete_powder');

  /// DEPRECATED, please use Items.brown_concrete_powder
  @deprecated
  static const ItemType brown_concrete_powder =
      ItemType('minecraft:brown_concrete_powder');

  /// DEPRECATED, please use Items.green_concrete_powder
  @deprecated
  static const ItemType green_concrete_powder =
      ItemType('minecraft:green_concrete_powder');

  /// DEPRECATED, please use Items.red_concrete_powder
  @deprecated
  static const ItemType red_concrete_powder =
      ItemType('minecraft:red_concrete_powder');

  /// DEPRECATED, please use Items.black_concrete_powder
  @deprecated
  static const ItemType black_concrete_powder =
      ItemType('minecraft:black_concrete_powder');

  /// DEPRECATED, please use Items.turtle_egg
  @deprecated
  static const ItemType turtle_egg = ItemType('minecraft:turtle_egg');

  /// DEPRECATED, please use Items.dead_tube_coral_block
  @deprecated
  static const ItemType dead_tube_coral_block =
      ItemType('minecraft:dead_tube_coral_block');

  /// DEPRECATED, please use Items.dead_brain_coral_block
  @deprecated
  static const ItemType dead_brain_coral_block =
      ItemType('minecraft:dead_brain_coral_block');

  /// DEPRECATED, please use Items.dead_bubble_coral_block
  @deprecated
  static const ItemType dead_bubble_coral_block =
      ItemType('minecraft:dead_bubble_coral_block');

  /// DEPRECATED, please use Items.dead_fire_coral_block
  @deprecated
  static const ItemType dead_fire_coral_block =
      ItemType('minecraft:dead_fire_coral_block');

  /// DEPRECATED, please use Items.dead_horn_coral_block
  @deprecated
  static const ItemType dead_horn_coral_block =
      ItemType('minecraft:dead_horn_coral_block');

  /// DEPRECATED, please use Items.tube_coral_block
  @deprecated
  static const ItemType tube_coral_block =
      ItemType('minecraft:tube_coral_block');

  /// DEPRECATED, please use Items.brain_coral_block
  @deprecated
  static const ItemType brain_coral_block =
      ItemType('minecraft:brain_coral_block');

  /// DEPRECATED, please use Items.bubble_coral_block
  @deprecated
  static const ItemType bubble_coral_block =
      ItemType('minecraft:bubble_coral_block');

  /// DEPRECATED, please use Items.fire_coral_block
  @deprecated
  static const ItemType fire_coral_block =
      ItemType('minecraft:fire_coral_block');

  /// DEPRECATED, please use Items.horn_coral_block
  @deprecated
  static const ItemType horn_coral_block =
      ItemType('minecraft:horn_coral_block');

  /// DEPRECATED, please use Items.tube_coral
  @deprecated
  static const ItemType tube_coral = ItemType('minecraft:tube_coral');

  /// DEPRECATED, please use Items.brain_coral
  @deprecated
  static const ItemType brain_coral = ItemType('minecraft:brain_coral');

  /// DEPRECATED, please use Items.bubble_coral
  @deprecated
  static const ItemType bubble_coral = ItemType('minecraft:bubble_coral');

  /// DEPRECATED, please use Items.fire_coral
  @deprecated
  static const ItemType fire_coral = ItemType('minecraft:fire_coral');

  /// DEPRECATED, please use Items.horn_coral
  @deprecated
  static const ItemType horn_coral = ItemType('minecraft:horn_coral');

  /// DEPRECATED, please use Items.dead_brain_coral
  @deprecated
  static const ItemType dead_brain_coral =
      ItemType('minecraft:dead_brain_coral');

  /// DEPRECATED, please use Items.dead_bubble_coral
  @deprecated
  static const ItemType dead_bubble_coral =
      ItemType('minecraft:dead_bubble_coral');

  /// DEPRECATED, please use Items.dead_fire_coral
  @deprecated
  static const ItemType dead_fire_coral = ItemType('minecraft:dead_fire_coral');

  /// DEPRECATED, please use Items.dead_horn_coral
  @deprecated
  static const ItemType dead_horn_coral = ItemType('minecraft:dead_horn_coral');

  /// DEPRECATED, please use Items.dead_tube_coral
  @deprecated
  static const ItemType dead_tube_coral = ItemType('minecraft:dead_tube_coral');

  /// DEPRECATED, please use Items.tube_coral_fan
  @deprecated
  static const ItemType tube_coral_fan = ItemType('minecraft:tube_coral_fan');

  /// DEPRECATED, please use Items.brain_coral_fan
  @deprecated
  static const ItemType brain_coral_fan = ItemType('minecraft:brain_coral_fan');

  /// DEPRECATED, please use Items.bubble_coral_fan
  @deprecated
  static const ItemType bubble_coral_fan =
      ItemType('minecraft:bubble_coral_fan');

  /// DEPRECATED, please use Items.fire_coral_fan
  @deprecated
  static const ItemType fire_coral_fan = ItemType('minecraft:fire_coral_fan');

  /// DEPRECATED, please use Items.horn_coral_fan
  @deprecated
  static const ItemType horn_coral_fan = ItemType('minecraft:horn_coral_fan');

  /// DEPRECATED, please use Items.dead_tube_coral_fan
  @deprecated
  static const ItemType dead_tube_coral_fan =
      ItemType('minecraft:dead_tube_coral_fan');

  /// DEPRECATED, please use Items.dead_brain_coral_fan
  @deprecated
  static const ItemType dead_brain_coral_fan =
      ItemType('minecraft:dead_brain_coral_fan');

  /// DEPRECATED, please use Items.dead_bubble_coral_fan
  @deprecated
  static const ItemType dead_bubble_coral_fan =
      ItemType('minecraft:dead_bubble_coral_fan');

  /// DEPRECATED, please use Items.dead_fire_coral_fan
  @deprecated
  static const ItemType dead_fire_coral_fan =
      ItemType('minecraft:dead_fire_coral_fan');

  /// DEPRECATED, please use Items.dead_horn_coral_fan
  @deprecated
  static const ItemType dead_horn_coral_fan =
      ItemType('minecraft:dead_horn_coral_fan');

  /// DEPRECATED, please use Items.blue_ice
  @deprecated
  static const ItemType blue_ice = ItemType('minecraft:blue_ice');

  /// DEPRECATED, please use Items.conduit
  @deprecated
  static const ItemType conduit = ItemType('minecraft:conduit');

  /// DEPRECATED, please use Items.polished_granite_stairs
  @deprecated
  static const ItemType polished_granite_stairs =
      ItemType('minecraft:polished_granite_stairs');

  /// DEPRECATED, please use Items.smooth_red_sandstone_stairs
  @deprecated
  static const ItemType smooth_red_sandstone_stairs =
      ItemType('minecraft:smooth_red_sandstone_stairs');

  /// DEPRECATED, please use Items.mossy_stone_brick_stairs
  @deprecated
  static const ItemType mossy_stone_brick_stairs =
      ItemType('minecraft:mossy_stone_brick_stairs');

  /// DEPRECATED, please use Items.polished_diorite_stairs
  @deprecated
  static const ItemType polished_diorite_stairs =
      ItemType('minecraft:polished_diorite_stairs');

  /// DEPRECATED, please use Items.mossy_cobblestone_stairs
  @deprecated
  static const ItemType mossy_cobblestone_stairs =
      ItemType('minecraft:mossy_cobblestone_stairs');

  /// DEPRECATED, please use Items.end_stone_brick_stairs
  @deprecated
  static const ItemType end_stone_brick_stairs =
      ItemType('minecraft:end_stone_brick_stairs');

  /// DEPRECATED, please use Items.stone_stairs
  @deprecated
  static const ItemType stone_stairs = ItemType('minecraft:stone_stairs');

  /// DEPRECATED, please use Items.smooth_sandstone_stairs
  @deprecated
  static const ItemType smooth_sandstone_stairs =
      ItemType('minecraft:smooth_sandstone_stairs');

  /// DEPRECATED, please use Items.smooth_quartz_stairs
  @deprecated
  static const ItemType smooth_quartz_stairs =
      ItemType('minecraft:smooth_quartz_stairs');

  /// DEPRECATED, please use Items.granite_stairs
  @deprecated
  static const ItemType granite_stairs = ItemType('minecraft:granite_stairs');

  /// DEPRECATED, please use Items.andesite_stairs
  @deprecated
  static const ItemType andesite_stairs = ItemType('minecraft:andesite_stairs');

  /// DEPRECATED, please use Items.red_nether_brick_stairs
  @deprecated
  static const ItemType red_nether_brick_stairs =
      ItemType('minecraft:red_nether_brick_stairs');

  /// DEPRECATED, please use Items.polished_andesite_stairs
  @deprecated
  static const ItemType polished_andesite_stairs =
      ItemType('minecraft:polished_andesite_stairs');

  /// DEPRECATED, please use Items.diorite_stairs
  @deprecated
  static const ItemType diorite_stairs = ItemType('minecraft:diorite_stairs');

  /// DEPRECATED, please use Items.polished_granite_slab
  @deprecated
  static const ItemType polished_granite_slab =
      ItemType('minecraft:polished_granite_slab');

  /// DEPRECATED, please use Items.smooth_red_sandstone_slab
  @deprecated
  static const ItemType smooth_red_sandstone_slab =
      ItemType('minecraft:smooth_red_sandstone_slab');

  /// DEPRECATED, please use Items.mossy_stone_brick_slab
  @deprecated
  static const ItemType mossy_stone_brick_slab =
      ItemType('minecraft:mossy_stone_brick_slab');

  /// DEPRECATED, please use Items.polished_diorite_slab
  @deprecated
  static const ItemType polished_diorite_slab =
      ItemType('minecraft:polished_diorite_slab');

  /// DEPRECATED, please use Items.mossy_cobblestone_slab
  @deprecated
  static const ItemType mossy_cobblestone_slab =
      ItemType('minecraft:mossy_cobblestone_slab');

  /// DEPRECATED, please use Items.end_stone_brick_slab
  @deprecated
  static const ItemType end_stone_brick_slab =
      ItemType('minecraft:end_stone_brick_slab');

  /// DEPRECATED, please use Items.smooth_sandstone_slab
  @deprecated
  static const ItemType smooth_sandstone_slab =
      ItemType('minecraft:smooth_sandstone_slab');

  /// DEPRECATED, please use Items.smooth_quartz_slab
  @deprecated
  static const ItemType smooth_quartz_slab =
      ItemType('minecraft:smooth_quartz_slab');

  /// DEPRECATED, please use Items.granite_slab
  @deprecated
  static const ItemType granite_slab = ItemType('minecraft:granite_slab');

  /// DEPRECATED, please use Items.andesite_slab
  @deprecated
  static const ItemType andesite_slab = ItemType('minecraft:andesite_slab');

  /// DEPRECATED, please use Items.red_nether_brick_slab
  @deprecated
  static const ItemType red_nether_brick_slab =
      ItemType('minecraft:red_nether_brick_slab');

  /// DEPRECATED, please use Items.polished_andesite_slab
  @deprecated
  static const ItemType polished_andesite_slab =
      ItemType('minecraft:polished_andesite_slab');

  /// DEPRECATED, please use Items.diorite_slab
  @deprecated
  static const ItemType diorite_slab = ItemType('minecraft:diorite_slab');

  /// DEPRECATED, please use Items.scaffolding
  @deprecated
  static const ItemType scaffolding = ItemType('minecraft:scaffolding');

  /// DEPRECATED, please use Items.iron_door
  @deprecated
  static const ItemType iron_door = ItemType('minecraft:iron_door');

  /// DEPRECATED, please use Items.oak_door
  @deprecated
  static const ItemType oak_door = ItemType('minecraft:oak_door');

  /// DEPRECATED, please use Items.spruce_door
  @deprecated
  static const ItemType spruce_door = ItemType('minecraft:spruce_door');

  /// DEPRECATED, please use Items.birch_door
  @deprecated
  static const ItemType birch_door = ItemType('minecraft:birch_door');

  /// DEPRECATED, please use Items.jungle_door
  @deprecated
  static const ItemType jungle_door = ItemType('minecraft:jungle_door');

  /// DEPRECATED, please use Items.acacia_door
  @deprecated
  static const ItemType acacia_door = ItemType('minecraft:acacia_door');

  /// DEPRECATED, please use Items.dark_oak_door
  @deprecated
  static const ItemType dark_oak_door = ItemType('minecraft:dark_oak_door');

  /// DEPRECATED, please use Items.repeater
  @deprecated
  static const ItemType repeater = ItemType('minecraft:repeater');

  /// DEPRECATED, please use Items.comparator
  @deprecated
  static const ItemType comparator = ItemType('minecraft:comparator');

  /// DEPRECATED, please use Items.structure_block
  @deprecated
  static const ItemType structure_block = ItemType('minecraft:structure_block');

  /// DEPRECATED, please use Items.jigsaw
  @deprecated
  static const ItemType jigsaw = ItemType('minecraft:jigsaw');

  /// DEPRECATED, please use Items.composter
  @deprecated
  static const ItemType composter = ItemType('minecraft:composter');

  /// DEPRECATED, please use Items.turtle_helmet
  @deprecated
  static const ItemType turtle_helmet = ItemType('minecraft:turtle_helmet');

  /// DEPRECATED, please use Items.scute
  @deprecated
  static const ItemType scute = ItemType('minecraft:scute');

  /// DEPRECATED, please use Items.iron_shovel
  @deprecated
  static const ItemType iron_shovel = ItemType('minecraft:iron_shovel');

  /// DEPRECATED, please use Items.iron_pickaxe
  @deprecated
  static const ItemType iron_pickaxe = ItemType('minecraft:iron_pickaxe');

  /// DEPRECATED, please use Items.iron_axe
  @deprecated
  static const ItemType iron_axe = ItemType('minecraft:iron_axe');

  /// DEPRECATED, please use Items.flint_and_steel
  @deprecated
  static const ItemType flint_and_steel = ItemType('minecraft:flint_and_steel');

  /// DEPRECATED, please use Items.apple
  @deprecated
  static const ItemType apple = ItemType('minecraft:apple');

  /// DEPRECATED, please use Items.bow
  @deprecated
  static const ItemType bow = ItemType('minecraft:bow');

  /// DEPRECATED, please use Items.arrow
  @deprecated
  static const ItemType arrow = ItemType('minecraft:arrow');

  /// DEPRECATED, please use Items.coal
  @deprecated
  static const ItemType coal = ItemType('minecraft:coal');

  /// DEPRECATED, please use Items.charcoal
  @deprecated
  static const ItemType charcoal = ItemType('minecraft:charcoal');

  /// DEPRECATED, please use Items.diamond
  @deprecated
  static const ItemType diamond = ItemType('minecraft:diamond');

  /// DEPRECATED, please use Items.iron_ingot
  @deprecated
  static const ItemType iron_ingot = ItemType('minecraft:iron_ingot');

  /// DEPRECATED, please use Items.gold_ingot
  @deprecated
  static const ItemType gold_ingot = ItemType('minecraft:gold_ingot');

  /// DEPRECATED, please use Items.iron_sword
  @deprecated
  static const ItemType iron_sword = ItemType('minecraft:iron_sword');

  /// DEPRECATED, please use Items.wooden_sword
  @deprecated
  static const ItemType wooden_sword = ItemType('minecraft:wooden_sword');

  /// DEPRECATED, please use Items.wooden_shovel
  @deprecated
  static const ItemType wooden_shovel = ItemType('minecraft:wooden_shovel');

  /// DEPRECATED, please use Items.wooden_pickaxe
  @deprecated
  static const ItemType wooden_pickaxe = ItemType('minecraft:wooden_pickaxe');

  /// DEPRECATED, please use Items.wooden_axe
  @deprecated
  static const ItemType wooden_axe = ItemType('minecraft:wooden_axe');

  /// DEPRECATED, please use Items.stone_sword
  @deprecated
  static const ItemType stone_sword = ItemType('minecraft:stone_sword');

  /// DEPRECATED, please use Items.stone_shovel
  @deprecated
  static const ItemType stone_shovel = ItemType('minecraft:stone_shovel');

  /// DEPRECATED, please use Items.stone_pickaxe
  @deprecated
  static const ItemType stone_pickaxe = ItemType('minecraft:stone_pickaxe');

  /// DEPRECATED, please use Items.stone_axe
  @deprecated
  static const ItemType stone_axe = ItemType('minecraft:stone_axe');

  /// DEPRECATED, please use Items.diamond_sword
  @deprecated
  static const ItemType diamond_sword = ItemType('minecraft:diamond_sword');

  /// DEPRECATED, please use Items.diamond_shovel
  @deprecated
  static const ItemType diamond_shovel = ItemType('minecraft:diamond_shovel');

  /// DEPRECATED, please use Items.diamond_pickaxe
  @deprecated
  static const ItemType diamond_pickaxe = ItemType('minecraft:diamond_pickaxe');

  /// DEPRECATED, please use Items.diamond_axe
  @deprecated
  static const ItemType diamond_axe = ItemType('minecraft:diamond_axe');

  /// DEPRECATED, please use Items.stick
  @deprecated
  static const ItemType stick = ItemType('minecraft:stick');

  /// DEPRECATED, please use Items.bowl
  @deprecated
  static const ItemType bowl = ItemType('minecraft:bowl');

  /// DEPRECATED, please use Items.mushroom_stew
  @deprecated
  static const ItemType mushroom_stew = ItemType('minecraft:mushroom_stew');

  /// DEPRECATED, please use Items.golden_sword
  @deprecated
  static const ItemType golden_sword = ItemType('minecraft:golden_sword');

  /// DEPRECATED, please use Items.golden_shovel
  @deprecated
  static const ItemType golden_shovel = ItemType('minecraft:golden_shovel');

  /// DEPRECATED, please use Items.golden_pickaxe
  @deprecated
  static const ItemType golden_pickaxe = ItemType('minecraft:golden_pickaxe');

  /// DEPRECATED, please use Items.golden_axe
  @deprecated
  static const ItemType golden_axe = ItemType('minecraft:golden_axe');

  /// DEPRECATED, please use Items.string
  @deprecated
  static const ItemType string = ItemType('minecraft:string');

  /// DEPRECATED, please use Items.feather
  @deprecated
  static const ItemType feather = ItemType('minecraft:feather');

  /// DEPRECATED, please use Items.gunpowder
  @deprecated
  static const ItemType gunpowder = ItemType('minecraft:gunpowder');

  /// DEPRECATED, please use Items.wooden_hoe
  @deprecated
  static const ItemType wooden_hoe = ItemType('minecraft:wooden_hoe');

  /// DEPRECATED, please use Items.stone_hoe
  @deprecated
  static const ItemType stone_hoe = ItemType('minecraft:stone_hoe');

  /// DEPRECATED, please use Items.iron_hoe
  @deprecated
  static const ItemType iron_hoe = ItemType('minecraft:iron_hoe');

  /// DEPRECATED, please use Items.diamond_hoe
  @deprecated
  static const ItemType diamond_hoe = ItemType('minecraft:diamond_hoe');

  /// DEPRECATED, please use Items.golden_hoe
  @deprecated
  static const ItemType golden_hoe = ItemType('minecraft:golden_hoe');

  /// DEPRECATED, please use Items.wheat_seeds
  @deprecated
  static const ItemType wheat_seeds = ItemType('minecraft:wheat_seeds');

  /// DEPRECATED, please use Items.wheat
  @deprecated
  static const ItemType wheat = ItemType('minecraft:wheat');

  /// DEPRECATED, please use Items.bread
  @deprecated
  static const ItemType bread = ItemType('minecraft:bread');

  /// DEPRECATED, please use Items.leather_helmet
  @deprecated
  static const ItemType leather_helmet = ItemType('minecraft:leather_helmet');

  /// DEPRECATED, please use Items.leather_chestplate
  @deprecated
  static const ItemType leather_chestplate =
      ItemType('minecraft:leather_chestplate');

  /// DEPRECATED, please use Items.leather_leggings
  @deprecated
  static const ItemType leather_leggings =
      ItemType('minecraft:leather_leggings');

  /// DEPRECATED, please use Items.leather_boots
  @deprecated
  static const ItemType leather_boots = ItemType('minecraft:leather_boots');

  /// DEPRECATED, please use Items.chainmail_helmet
  @deprecated
  static const ItemType chainmail_helmet =
      ItemType('minecraft:chainmail_helmet');

  /// DEPRECATED, please use Items.chainmail_chestplate
  @deprecated
  static const ItemType chainmail_chestplate =
      ItemType('minecraft:chainmail_chestplate');

  /// DEPRECATED, please use Items.chainmail_leggings
  @deprecated
  static const ItemType chainmail_leggings =
      ItemType('minecraft:chainmail_leggings');

  /// DEPRECATED, please use Items.chainmail_boots
  @deprecated
  static const ItemType chainmail_boots = ItemType('minecraft:chainmail_boots');

  /// DEPRECATED, please use Items.iron_helmet
  @deprecated
  static const ItemType iron_helmet = ItemType('minecraft:iron_helmet');

  /// DEPRECATED, please use Items.iron_chestplate
  @deprecated
  static const ItemType iron_chestplate = ItemType('minecraft:iron_chestplate');

  /// DEPRECATED, please use Items.iron_leggings
  @deprecated
  static const ItemType iron_leggings = ItemType('minecraft:iron_leggings');

  /// DEPRECATED, please use Items.iron_boots
  @deprecated
  static const ItemType iron_boots = ItemType('minecraft:iron_boots');

  /// DEPRECATED, please use Items.diamond_helmet
  @deprecated
  static const ItemType diamond_helmet = ItemType('minecraft:diamond_helmet');

  /// DEPRECATED, please use Items.diamond_chestplate
  @deprecated
  static const ItemType diamond_chestplate =
      ItemType('minecraft:diamond_chestplate');

  /// DEPRECATED, please use Items.diamond_leggings
  @deprecated
  static const ItemType diamond_leggings =
      ItemType('minecraft:diamond_leggings');

  /// DEPRECATED, please use Items.diamond_boots
  @deprecated
  static const ItemType diamond_boots = ItemType('minecraft:diamond_boots');

  /// DEPRECATED, please use Items.golden_helmet
  @deprecated
  static const ItemType golden_helmet = ItemType('minecraft:golden_helmet');

  /// DEPRECATED, please use Items.golden_chestplate
  @deprecated
  static const ItemType golden_chestplate =
      ItemType('minecraft:golden_chestplate');

  /// DEPRECATED, please use Items.golden_leggings
  @deprecated
  static const ItemType golden_leggings = ItemType('minecraft:golden_leggings');

  /// DEPRECATED, please use Items.golden_boots
  @deprecated
  static const ItemType golden_boots = ItemType('minecraft:golden_boots');

  /// DEPRECATED, please use Items.flint
  @deprecated
  static const ItemType flint = ItemType('minecraft:flint');

  /// DEPRECATED, please use Items.porkchop
  @deprecated
  static const ItemType porkchop = ItemType('minecraft:porkchop');

  /// DEPRECATED, please use Items.cooked_porkchop
  @deprecated
  static const ItemType cooked_porkchop = ItemType('minecraft:cooked_porkchop');

  /// DEPRECATED, please use Items.painting
  @deprecated
  static const ItemType painting = ItemType('minecraft:painting');

  /// DEPRECATED, please use Items.golden_apple
  @deprecated
  static const ItemType golden_apple = ItemType('minecraft:golden_apple');

  /// DEPRECATED, please use Items.enchanted_golden_apple
  @deprecated
  static const ItemType enchanted_golden_apple =
      ItemType('minecraft:enchanted_golden_apple');

  /// DEPRECATED, please use Items.oak_sign
  @deprecated
  static const ItemType oak_sign = ItemType('minecraft:oak_sign');

  /// DEPRECATED, please use Items.spruce_sign
  @deprecated
  static const ItemType spruce_sign = ItemType('minecraft:spruce_sign');

  /// DEPRECATED, please use Items.birch_sign
  @deprecated
  static const ItemType birch_sign = ItemType('minecraft:birch_sign');

  /// DEPRECATED, please use Items.jungle_sign
  @deprecated
  static const ItemType jungle_sign = ItemType('minecraft:jungle_sign');

  /// DEPRECATED, please use Items.acacia_sign
  @deprecated
  static const ItemType acacia_sign = ItemType('minecraft:acacia_sign');

  /// DEPRECATED, please use Items.dark_oak_sign
  @deprecated
  static const ItemType dark_oak_sign = ItemType('minecraft:dark_oak_sign');

  /// DEPRECATED, please use Items.bucket
  @deprecated
  static const ItemType bucket = ItemType('minecraft:bucket');

  /// DEPRECATED, please use Items.water_bucket
  @deprecated
  static const ItemType water_bucket = ItemType('minecraft:water_bucket');

  /// DEPRECATED, please use Items.lava_bucket
  @deprecated
  static const ItemType lava_bucket = ItemType('minecraft:lava_bucket');

  /// DEPRECATED, please use Items.minecart
  @deprecated
  static const ItemType minecart = ItemType('minecraft:minecart');

  /// DEPRECATED, please use Items.saddle
  @deprecated
  static const ItemType saddle = ItemType('minecraft:saddle');

  /// DEPRECATED, please use Items.redstone
  @deprecated
  static const ItemType redstone = ItemType('minecraft:redstone');

  /// DEPRECATED, please use Items.snowball
  @deprecated
  static const ItemType snowball = ItemType('minecraft:snowball');

  /// DEPRECATED, please use Items.oak_boat
  @deprecated
  static const ItemType oak_boat = ItemType('minecraft:oak_boat');

  /// DEPRECATED, please use Items.leather
  @deprecated
  static const ItemType leather = ItemType('minecraft:leather');

  /// DEPRECATED, please use Items.milk_bucket
  @deprecated
  static const ItemType milk_bucket = ItemType('minecraft:milk_bucket');

  /// DEPRECATED, please use Items.pufferfish_bucket
  @deprecated
  static const ItemType pufferfish_bucket =
      ItemType('minecraft:pufferfish_bucket');

  /// DEPRECATED, please use Items.salmon_bucket
  @deprecated
  static const ItemType salmon_bucket = ItemType('minecraft:salmon_bucket');

  /// DEPRECATED, please use Items.cod_bucket
  @deprecated
  static const ItemType cod_bucket = ItemType('minecraft:cod_bucket');

  /// DEPRECATED, please use Items.tropical_fish_bucket
  @deprecated
  static const ItemType tropical_fish_bucket =
      ItemType('minecraft:tropical_fish_bucket');

  /// DEPRECATED, please use Items.brick
  @deprecated
  static const ItemType brick = ItemType('minecraft:brick');

  /// DEPRECATED, please use Items.clay_ball
  @deprecated
  static const ItemType clay_ball = ItemType('minecraft:clay_ball');

  /// DEPRECATED, please use Items.sugar_cane
  @deprecated
  static const ItemType sugar_cane = ItemType('minecraft:sugar_cane');

  /// DEPRECATED, please use Items.kelp
  @deprecated
  static const ItemType kelp = ItemType('minecraft:kelp');

  /// DEPRECATED, please use Items.dried_kelp_block
  @deprecated
  static const ItemType dried_kelp_block =
      ItemType('minecraft:dried_kelp_block');

  /// DEPRECATED, please use Items.bamboo
  @deprecated
  static const ItemType bamboo = ItemType('minecraft:bamboo');

  /// DEPRECATED, please use Items.paper
  @deprecated
  static const ItemType paper = ItemType('minecraft:paper');

  /// DEPRECATED, please use Items.book
  @deprecated
  static const ItemType book = ItemType('minecraft:book');

  /// DEPRECATED, please use Items.slime_ball
  @deprecated
  static const ItemType slime_ball = ItemType('minecraft:slime_ball');

  /// DEPRECATED, please use Items.chest_minecart
  @deprecated
  static const ItemType chest_minecart = ItemType('minecraft:chest_minecart');

  /// DEPRECATED, please use Items.furnace_minecart
  @deprecated
  static const ItemType furnace_minecart =
      ItemType('minecraft:furnace_minecart');

  /// DEPRECATED, please use Items.egg
  @deprecated
  static const ItemType egg = ItemType('minecraft:egg');

  /// DEPRECATED, please use Items.compass
  @deprecated
  static const ItemType compass = ItemType('minecraft:compass');

  /// DEPRECATED, please use Items.fishing_rod
  @deprecated
  static const ItemType fishing_rod = ItemType('minecraft:fishing_rod');

  /// DEPRECATED, please use Items.clock
  @deprecated
  static const ItemType clock = ItemType('minecraft:clock');

  /// DEPRECATED, please use Items.glowstone_dust
  @deprecated
  static const ItemType glowstone_dust = ItemType('minecraft:glowstone_dust');

  /// DEPRECATED, please use Items.cod
  @deprecated
  static const ItemType cod = ItemType('minecraft:cod');

  /// DEPRECATED, please use Items.salmon
  @deprecated
  static const ItemType salmon = ItemType('minecraft:salmon');

  /// DEPRECATED, please use Items.tropical_fish
  @deprecated
  static const ItemType tropical_fish = ItemType('minecraft:tropical_fish');

  /// DEPRECATED, please use Items.pufferfish
  @deprecated
  static const ItemType pufferfish = ItemType('minecraft:pufferfish');

  /// DEPRECATED, please use Items.cooked_cod
  @deprecated
  static const ItemType cooked_cod = ItemType('minecraft:cooked_cod');

  /// DEPRECATED, please use Items.cooked_salmon
  @deprecated
  static const ItemType cooked_salmon = ItemType('minecraft:cooked_salmon');

  /// DEPRECATED, please use Items.ink_sac
  @deprecated
  static const ItemType ink_sac = ItemType('minecraft:ink_sac');

  /// DEPRECATED, please use Items.red_dye
  @deprecated
  static const ItemType red_dye = ItemType('minecraft:red_dye');

  /// DEPRECATED, please use Items.green_dye
  @deprecated
  static const ItemType green_dye = ItemType('minecraft:green_dye');

  /// DEPRECATED, please use Items.cocoa_beans
  @deprecated
  static const ItemType cocoa_beans = ItemType('minecraft:cocoa_beans');

  /// DEPRECATED, please use Items.lapis_lazuli
  @deprecated
  static const ItemType lapis_lazuli = ItemType('minecraft:lapis_lazuli');

  /// DEPRECATED, please use Items.purple_dye
  @deprecated
  static const ItemType purple_dye = ItemType('minecraft:purple_dye');

  /// DEPRECATED, please use Items.cyan_dye
  @deprecated
  static const ItemType cyan_dye = ItemType('minecraft:cyan_dye');

  /// DEPRECATED, please use Items.light_gray_dye
  @deprecated
  static const ItemType light_gray_dye = ItemType('minecraft:light_gray_dye');

  /// DEPRECATED, please use Items.gray_dye
  @deprecated
  static const ItemType gray_dye = ItemType('minecraft:gray_dye');

  /// DEPRECATED, please use Items.pink_dye
  @deprecated
  static const ItemType pink_dye = ItemType('minecraft:pink_dye');

  /// DEPRECATED, please use Items.lime_dye
  @deprecated
  static const ItemType lime_dye = ItemType('minecraft:lime_dye');

  /// DEPRECATED, please use Items.yellow_dye
  @deprecated
  static const ItemType yellow_dye = ItemType('minecraft:yellow_dye');

  /// DEPRECATED, please use Items.light_blue_dye
  @deprecated
  static const ItemType light_blue_dye = ItemType('minecraft:light_blue_dye');

  /// DEPRECATED, please use Items.magenta_dye
  @deprecated
  static const ItemType magenta_dye = ItemType('minecraft:magenta_dye');

  /// DEPRECATED, please use Items.orange_dye
  @deprecated
  static const ItemType orange_dye = ItemType('minecraft:orange_dye');

  /// DEPRECATED, please use Items.bone_meal
  @deprecated
  static const ItemType bone_meal = ItemType('minecraft:bone_meal');

  /// DEPRECATED, please use Items.blue_dye
  @deprecated
  static const ItemType blue_dye = ItemType('minecraft:blue_dye');

  /// DEPRECATED, please use Items.brown_dye
  @deprecated
  static const ItemType brown_dye = ItemType('minecraft:brown_dye');

  /// DEPRECATED, please use Items.black_dye
  @deprecated
  static const ItemType black_dye = ItemType('minecraft:black_dye');

  /// DEPRECATED, please use Items.white_dye
  @deprecated
  static const ItemType white_dye = ItemType('minecraft:white_dye');

  /// DEPRECATED, please use Items.bone
  @deprecated
  static const ItemType bone = ItemType('minecraft:bone');

  /// DEPRECATED, please use Items.sugar
  @deprecated
  static const ItemType sugar = ItemType('minecraft:sugar');

  /// DEPRECATED, please use Items.cake
  @deprecated
  static const ItemType cake = ItemType('minecraft:cake');

  /// DEPRECATED, please use Items.white_bed
  @deprecated
  static const ItemType white_bed = ItemType('minecraft:white_bed');

  /// DEPRECATED, please use Items.orange_bed
  @deprecated
  static const ItemType orange_bed = ItemType('minecraft:orange_bed');

  /// DEPRECATED, please use Items.magenta_bed
  @deprecated
  static const ItemType magenta_bed = ItemType('minecraft:magenta_bed');

  /// DEPRECATED, please use Items.light_blue_bed
  @deprecated
  static const ItemType light_blue_bed = ItemType('minecraft:light_blue_bed');

  /// DEPRECATED, please use Items.yellow_bed
  @deprecated
  static const ItemType yellow_bed = ItemType('minecraft:yellow_bed');

  /// DEPRECATED, please use Items.lime_bed
  @deprecated
  static const ItemType lime_bed = ItemType('minecraft:lime_bed');

  /// DEPRECATED, please use Items.pink_bed
  @deprecated
  static const ItemType pink_bed = ItemType('minecraft:pink_bed');

  /// DEPRECATED, please use Items.gray_bed
  @deprecated
  static const ItemType gray_bed = ItemType('minecraft:gray_bed');

  /// DEPRECATED, please use Items.light_gray_bed
  @deprecated
  static const ItemType light_gray_bed = ItemType('minecraft:light_gray_bed');

  /// DEPRECATED, please use Items.cyan_bed
  @deprecated
  static const ItemType cyan_bed = ItemType('minecraft:cyan_bed');

  /// DEPRECATED, please use Items.purple_bed
  @deprecated
  static const ItemType purple_bed = ItemType('minecraft:purple_bed');

  /// DEPRECATED, please use Items.blue_bed
  @deprecated
  static const ItemType blue_bed = ItemType('minecraft:blue_bed');

  /// DEPRECATED, please use Items.brown_bed
  @deprecated
  static const ItemType brown_bed = ItemType('minecraft:brown_bed');

  /// DEPRECATED, please use Items.green_bed
  @deprecated
  static const ItemType green_bed = ItemType('minecraft:green_bed');

  /// DEPRECATED, please use Items.red_bed
  @deprecated
  static const ItemType red_bed = ItemType('minecraft:red_bed');

  /// DEPRECATED, please use Items.black_bed
  @deprecated
  static const ItemType black_bed = ItemType('minecraft:black_bed');

  /// DEPRECATED, please use Items.cookie
  @deprecated
  static const ItemType cookie = ItemType('minecraft:cookie');

  /// DEPRECATED, please use Items.filled_map
  @deprecated
  static const ItemType filled_map = ItemType('minecraft:filled_map');

  /// DEPRECATED, please use Items.shears
  @deprecated
  static const ItemType shears = ItemType('minecraft:shears');

  /// DEPRECATED, please use Items.melon_slice
  @deprecated
  static const ItemType melon_slice = ItemType('minecraft:melon_slice');

  /// DEPRECATED, please use Items.dried_kelp
  @deprecated
  static const ItemType dried_kelp = ItemType('minecraft:dried_kelp');

  /// DEPRECATED, please use Items.pumpkin_seeds
  @deprecated
  static const ItemType pumpkin_seeds = ItemType('minecraft:pumpkin_seeds');

  /// DEPRECATED, please use Items.melon_seeds
  @deprecated
  static const ItemType melon_seeds = ItemType('minecraft:melon_seeds');

  /// DEPRECATED, please use Items.beef
  @deprecated
  static const ItemType beef = ItemType('minecraft:beef');

  /// DEPRECATED, please use Items.cooked_beef
  @deprecated
  static const ItemType cooked_beef = ItemType('minecraft:cooked_beef');

  /// DEPRECATED, please use Items.chicken
  @deprecated
  static const ItemType chicken = ItemType('minecraft:chicken');

  /// DEPRECATED, please use Items.cooked_chicken
  @deprecated
  static const ItemType cooked_chicken = ItemType('minecraft:cooked_chicken');

  /// DEPRECATED, please use Items.rotten_flesh
  @deprecated
  static const ItemType rotten_flesh = ItemType('minecraft:rotten_flesh');

  /// DEPRECATED, please use Items.ender_pearl
  @deprecated
  static const ItemType ender_pearl = ItemType('minecraft:ender_pearl');

  /// DEPRECATED, please use Items.blaze_rod
  @deprecated
  static const ItemType blaze_rod = ItemType('minecraft:blaze_rod');

  /// DEPRECATED, please use Items.ghast_tear
  @deprecated
  static const ItemType ghast_tear = ItemType('minecraft:ghast_tear');

  /// DEPRECATED, please use Items.gold_nugget
  @deprecated
  static const ItemType gold_nugget = ItemType('minecraft:gold_nugget');

  /// DEPRECATED, please use Items.nether_wart
  @deprecated
  static const ItemType nether_wart = ItemType('minecraft:nether_wart');

  /// DEPRECATED, please use Items.potion
  @deprecated
  static const ItemType potion = ItemType('minecraft:potion');

  /// DEPRECATED, please use Items.glass_bottle
  @deprecated
  static const ItemType glass_bottle = ItemType('minecraft:glass_bottle');

  /// DEPRECATED, please use Items.spider_eye
  @deprecated
  static const ItemType spider_eye = ItemType('minecraft:spider_eye');

  /// DEPRECATED, please use Items.fermented_spider_eye
  @deprecated
  static const ItemType fermented_spider_eye =
      ItemType('minecraft:fermented_spider_eye');

  /// DEPRECATED, please use Items.blaze_powder
  @deprecated
  static const ItemType blaze_powder = ItemType('minecraft:blaze_powder');

  /// DEPRECATED, please use Items.magma_cream
  @deprecated
  static const ItemType magma_cream = ItemType('minecraft:magma_cream');

  /// DEPRECATED, please use Items.brewing_stand
  @deprecated
  static const ItemType brewing_stand = ItemType('minecraft:brewing_stand');

  /// DEPRECATED, please use Items.cauldron
  @deprecated
  static const ItemType cauldron = ItemType('minecraft:cauldron');

  /// DEPRECATED, please use Items.ender_eye
  @deprecated
  static const ItemType ender_eye = ItemType('minecraft:ender_eye');

  /// DEPRECATED, please use Items.glistering_melon_slice
  @deprecated
  static const ItemType glistering_melon_slice =
      ItemType('minecraft:glistering_melon_slice');

  /// DEPRECATED, please use Items.bat_spawn_egg
  @deprecated
  static const ItemType bat_spawn_egg = ItemType('minecraft:bat_spawn_egg');

  /// DEPRECATED, please use Items.bee_spawn_egg
  @deprecated
  static const ItemType bee_spawn_egg = ItemType('minecraft:bee_spawn_egg');

  /// DEPRECATED, please use Items.blaze_spawn_egg
  @deprecated
  static const ItemType blaze_spawn_egg = ItemType('minecraft:blaze_spawn_egg');

  /// DEPRECATED, please use Items.cat_spawn_egg
  @deprecated
  static const ItemType cat_spawn_egg = ItemType('minecraft:cat_spawn_egg');

  /// DEPRECATED, please use Items.cave_spider_spawn_egg
  @deprecated
  static const ItemType cave_spider_spawn_egg =
      ItemType('minecraft:cave_spider_spawn_egg');

  /// DEPRECATED, please use Items.chicken_spawn_egg
  @deprecated
  static const ItemType chicken_spawn_egg =
      ItemType('minecraft:chicken_spawn_egg');

  /// DEPRECATED, please use Items.cod_spawn_egg
  @deprecated
  static const ItemType cod_spawn_egg = ItemType('minecraft:cod_spawn_egg');

  /// DEPRECATED, please use Items.cow_spawn_egg
  @deprecated
  static const ItemType cow_spawn_egg = ItemType('minecraft:cow_spawn_egg');

  /// DEPRECATED, please use Items.creeper_spawn_egg
  @deprecated
  static const ItemType creeper_spawn_egg =
      ItemType('minecraft:creeper_spawn_egg');

  /// DEPRECATED, please use Items.dolphin_spawn_egg
  @deprecated
  static const ItemType dolphin_spawn_egg =
      ItemType('minecraft:dolphin_spawn_egg');

  /// DEPRECATED, please use Items.donkey_spawn_egg
  @deprecated
  static const ItemType donkey_spawn_egg =
      ItemType('minecraft:donkey_spawn_egg');

  /// DEPRECATED, please use Items.drowned_spawn_egg
  @deprecated
  static const ItemType drowned_spawn_egg =
      ItemType('minecraft:drowned_spawn_egg');

  /// DEPRECATED, please use Items.elder_guardian_spawn_egg
  @deprecated
  static const ItemType elder_guardian_spawn_egg =
      ItemType('minecraft:elder_guardian_spawn_egg');

  /// DEPRECATED, please use Items.enderman_spawn_egg
  @deprecated
  static const ItemType enderman_spawn_egg =
      ItemType('minecraft:enderman_spawn_egg');

  /// DEPRECATED, please use Items.endermite_spawn_egg
  @deprecated
  static const ItemType endermite_spawn_egg =
      ItemType('minecraft:endermite_spawn_egg');

  /// DEPRECATED, please use Items.evoker_spawn_egg
  @deprecated
  static const ItemType evoker_spawn_egg =
      ItemType('minecraft:evoker_spawn_egg');

  /// DEPRECATED, please use Items.fox_spawn_egg
  @deprecated
  static const ItemType fox_spawn_egg = ItemType('minecraft:fox_spawn_egg');

  /// DEPRECATED, please use Items.ghast_spawn_egg
  @deprecated
  static const ItemType ghast_spawn_egg = ItemType('minecraft:ghast_spawn_egg');

  /// DEPRECATED, please use Items.guardian_spawn_egg
  @deprecated
  static const ItemType guardian_spawn_egg =
      ItemType('minecraft:guardian_spawn_egg');

  /// DEPRECATED, please use Items.horse_spawn_egg
  @deprecated
  static const ItemType horse_spawn_egg = ItemType('minecraft:horse_spawn_egg');

  /// DEPRECATED, please use Items.husk_spawn_egg
  @deprecated
  static const ItemType husk_spawn_egg = ItemType('minecraft:husk_spawn_egg');

  /// DEPRECATED, please use Items.llama_spawn_egg
  @deprecated
  static const ItemType llama_spawn_egg = ItemType('minecraft:llama_spawn_egg');

  /// DEPRECATED, please use Items.magma_cube_spawn_egg
  @deprecated
  static const ItemType magma_cube_spawn_egg =
      ItemType('minecraft:magma_cube_spawn_egg');

  /// DEPRECATED, please use Items.mooshroom_spawn_egg
  @deprecated
  static const ItemType mooshroom_spawn_egg =
      ItemType('minecraft:mooshroom_spawn_egg');

  /// DEPRECATED, please use Items.mule_spawn_egg
  @deprecated
  static const ItemType mule_spawn_egg = ItemType('minecraft:mule_spawn_egg');

  /// DEPRECATED, please use Items.ocelot_spawn_egg
  @deprecated
  static const ItemType ocelot_spawn_egg =
      ItemType('minecraft:ocelot_spawn_egg');

  /// DEPRECATED, please use Items.panda_spawn_egg
  @deprecated
  static const ItemType panda_spawn_egg = ItemType('minecraft:panda_spawn_egg');

  /// DEPRECATED, please use Items.parrot_spawn_egg
  @deprecated
  static const ItemType parrot_spawn_egg =
      ItemType('minecraft:parrot_spawn_egg');

  /// DEPRECATED, please use Items.phantom_spawn_egg
  @deprecated
  static const ItemType phantom_spawn_egg =
      ItemType('minecraft:phantom_spawn_egg');

  /// DEPRECATED, please use Items.pig_spawn_egg
  @deprecated
  static const ItemType pig_spawn_egg = ItemType('minecraft:pig_spawn_egg');

  /// DEPRECATED, please use Items.pillager_spawn_egg
  @deprecated
  static const ItemType pillager_spawn_egg =
      ItemType('minecraft:pillager_spawn_egg');

  /// DEPRECATED, please use Items.polar_bear_spawn_egg
  @deprecated
  static const ItemType polar_bear_spawn_egg =
      ItemType('minecraft:polar_bear_spawn_egg');

  /// DEPRECATED, please use Items.pufferfish_spawn_egg
  @deprecated
  static const ItemType pufferfish_spawn_egg =
      ItemType('minecraft:pufferfish_spawn_egg');

  /// DEPRECATED, please use Items.rabbit_spawn_egg
  @deprecated
  static const ItemType rabbit_spawn_egg =
      ItemType('minecraft:rabbit_spawn_egg');

  /// DEPRECATED, please use Items.ravager_spawn_egg
  @deprecated
  static const ItemType ravager_spawn_egg =
      ItemType('minecraft:ravager_spawn_egg');

  /// DEPRECATED, please use Items.salmon_spawn_egg
  @deprecated
  static const ItemType salmon_spawn_egg =
      ItemType('minecraft:salmon_spawn_egg');

  /// DEPRECATED, please use Items.sheep_spawn_egg
  @deprecated
  static const ItemType sheep_spawn_egg = ItemType('minecraft:sheep_spawn_egg');

  /// DEPRECATED, please use Items.shulker_spawn_egg
  @deprecated
  static const ItemType shulker_spawn_egg =
      ItemType('minecraft:shulker_spawn_egg');

  /// DEPRECATED, please use Items.silverfish_spawn_egg
  @deprecated
  static const ItemType silverfish_spawn_egg =
      ItemType('minecraft:silverfish_spawn_egg');

  /// DEPRECATED, please use Items.skeleton_spawn_egg
  @deprecated
  static const ItemType skeleton_spawn_egg =
      ItemType('minecraft:skeleton_spawn_egg');

  /// DEPRECATED, please use Items.skeleton_horse_spawn_egg
  @deprecated
  static const ItemType skeleton_horse_spawn_egg =
      ItemType('minecraft:skeleton_horse_spawn_egg');

  /// DEPRECATED, please use Items.slime_spawn_egg
  @deprecated
  static const ItemType slime_spawn_egg = ItemType('minecraft:slime_spawn_egg');

  /// DEPRECATED, please use Items.spider_spawn_egg
  @deprecated
  static const ItemType spider_spawn_egg =
      ItemType('minecraft:spider_spawn_egg');

  /// DEPRECATED, please use Items.squid_spawn_egg
  @deprecated
  static const ItemType squid_spawn_egg = ItemType('minecraft:squid_spawn_egg');

  /// DEPRECATED, please use Items.stray_spawn_egg
  @deprecated
  static const ItemType stray_spawn_egg = ItemType('minecraft:stray_spawn_egg');

  /// DEPRECATED, please use Items.trader_llama_spawn_egg
  @deprecated
  static const ItemType trader_llama_spawn_egg =
      ItemType('minecraft:trader_llama_spawn_egg');

  /// DEPRECATED, please use Items.tropical_fish_spawn_egg
  @deprecated
  static const ItemType tropical_fish_spawn_egg =
      ItemType('minecraft:tropical_fish_spawn_egg');

  /// DEPRECATED, please use Items.turtle_spawn_egg
  @deprecated
  static const ItemType turtle_spawn_egg =
      ItemType('minecraft:turtle_spawn_egg');

  /// DEPRECATED, please use Items.vex_spawn_egg
  @deprecated
  static const ItemType vex_spawn_egg = ItemType('minecraft:vex_spawn_egg');

  /// DEPRECATED, please use Items.villager_spawn_egg
  @deprecated
  static const ItemType villager_spawn_egg =
      ItemType('minecraft:villager_spawn_egg');

  /// DEPRECATED, please use Items.vindicator_spawn_egg
  @deprecated
  static const ItemType vindicator_spawn_egg =
      ItemType('minecraft:vindicator_spawn_egg');

  /// DEPRECATED, please use Items.wandering_trader_spawn_egg
  @deprecated
  static const ItemType wandering_trader_spawn_egg =
      ItemType('minecraft:wandering_trader_spawn_egg');

  /// DEPRECATED, please use Items.witch_spawn_egg
  @deprecated
  static const ItemType witch_spawn_egg = ItemType('minecraft:witch_spawn_egg');

  /// DEPRECATED, please use Items.wither_skeleton_spawn_egg
  @deprecated
  static const ItemType wither_skeleton_spawn_egg =
      ItemType('minecraft:wither_skeleton_spawn_egg');

  /// DEPRECATED, please use Items.wolf_spawn_egg
  @deprecated
  static const ItemType wolf_spawn_egg = ItemType('minecraft:wolf_spawn_egg');

  /// DEPRECATED, please use Items.zombie_spawn_egg
  @deprecated
  static const ItemType zombie_spawn_egg =
      ItemType('minecraft:zombie_spawn_egg');

  /// DEPRECATED, please use Items.zombie_horse_spawn_egg
  @deprecated
  static const ItemType zombie_horse_spawn_egg =
      ItemType('minecraft:zombie_horse_spawn_egg');

  /// DEPRECATED, please use Items.zombie_pigman_spawn_egg
  @deprecated
  static const ItemType zombie_pigman_spawn_egg =
      ItemType('minecraft:zombie_pigman_spawn_egg');

  /// DEPRECATED, please use Items.zombie_villager_spawn_egg
  @deprecated
  static const ItemType zombie_villager_spawn_egg =
      ItemType('minecraft:zombie_villager_spawn_egg');

  /// DEPRECATED, please use Items.experience_bottle
  @deprecated
  static const ItemType experience_bottle =
      ItemType('minecraft:experience_bottle');

  /// DEPRECATED, please use Items.fire_charge
  @deprecated
  static const ItemType fire_charge = ItemType('minecraft:fire_charge');

  /// DEPRECATED, please use Items.writable_book
  @deprecated
  static const ItemType writable_book = ItemType('minecraft:writable_book');

  /// DEPRECATED, please use Items.written_book
  @deprecated
  static const ItemType written_book = ItemType('minecraft:written_book');

  /// DEPRECATED, please use Items.emerald
  @deprecated
  static const ItemType emerald = ItemType('minecraft:emerald');

  /// DEPRECATED, please use Items.item_frame
  @deprecated
  static const ItemType item_frame = ItemType('minecraft:item_frame');

  /// DEPRECATED, please use Items.flower_pot
  @deprecated
  static const ItemType flower_pot = ItemType('minecraft:flower_pot');

  /// DEPRECATED, please use Items.carrot
  @deprecated
  static const ItemType carrot = ItemType('minecraft:carrot');

  /// DEPRECATED, please use Items.potato
  @deprecated
  static const ItemType potato = ItemType('minecraft:potato');

  /// DEPRECATED, please use Items.baked_potato
  @deprecated
  static const ItemType baked_potato = ItemType('minecraft:baked_potato');

  /// DEPRECATED, please use Items.poisonous_potato
  @deprecated
  static const ItemType poisonous_potato =
      ItemType('minecraft:poisonous_potato');

  /// DEPRECATED, please use Items.map
  @deprecated
  static const ItemType map = ItemType('minecraft:map');

  /// DEPRECATED, please use Items.golden_carrot
  @deprecated
  static const ItemType golden_carrot = ItemType('minecraft:golden_carrot');

  /// DEPRECATED, please use Items.skeleton_skull
  @deprecated
  static const ItemType skeleton_skull = ItemType('minecraft:skeleton_skull');

  /// DEPRECATED, please use Items.wither_skeleton_skull
  @deprecated
  static const ItemType wither_skeleton_skull =
      ItemType('minecraft:wither_skeleton_skull');

  /// DEPRECATED, please use Items.player_head
  @deprecated
  static const ItemType player_head = ItemType('minecraft:player_head');

  /// DEPRECATED, please use Items.zombie_head
  @deprecated
  static const ItemType zombie_head = ItemType('minecraft:zombie_head');

  /// DEPRECATED, please use Items.creeper_head
  @deprecated
  static const ItemType creeper_head = ItemType('minecraft:creeper_head');

  /// DEPRECATED, please use Items.dragon_head
  @deprecated
  static const ItemType dragon_head = ItemType('minecraft:dragon_head');

  /// DEPRECATED, please use Items.carrot_on_a_stick
  @deprecated
  static const ItemType carrot_on_a_stick =
      ItemType('minecraft:carrot_on_a_stick');

  /// DEPRECATED, please use Items.nether_star
  @deprecated
  static const ItemType nether_star = ItemType('minecraft:nether_star');

  /// DEPRECATED, please use Items.pumpkin_pie
  @deprecated
  static const ItemType pumpkin_pie = ItemType('minecraft:pumpkin_pie');

  /// DEPRECATED, please use Items.firework_rocket
  @deprecated
  static const ItemType firework_rocket = ItemType('minecraft:firework_rocket');

  /// DEPRECATED, please use Items.firework_star
  @deprecated
  static const ItemType firework_star = ItemType('minecraft:firework_star');

  /// DEPRECATED, please use Items.enchanted_book
  @deprecated
  static const ItemType enchanted_book = ItemType('minecraft:enchanted_book');

  /// DEPRECATED, please use Items.nether_brick
  @deprecated
  static const ItemType nether_brick = ItemType('minecraft:nether_brick');

  /// DEPRECATED, please use Items.quartz
  @deprecated
  static const ItemType quartz = ItemType('minecraft:quartz');

  /// DEPRECATED, please use Items.tnt_minecart
  @deprecated
  static const ItemType tnt_minecart = ItemType('minecraft:tnt_minecart');

  /// DEPRECATED, please use Items.hopper_minecart
  @deprecated
  static const ItemType hopper_minecart = ItemType('minecraft:hopper_minecart');

  /// DEPRECATED, please use Items.prismarine_shard
  @deprecated
  static const ItemType prismarine_shard =
      ItemType('minecraft:prismarine_shard');

  /// DEPRECATED, please use Items.prismarine_crystals
  @deprecated
  static const ItemType prismarine_crystals =
      ItemType('minecraft:prismarine_crystals');

  /// DEPRECATED, please use Items.rabbit
  @deprecated
  static const ItemType rabbit = ItemType('minecraft:rabbit');

  /// DEPRECATED, please use Items.cooked_rabbit
  @deprecated
  static const ItemType cooked_rabbit = ItemType('minecraft:cooked_rabbit');

  /// DEPRECATED, please use Items.rabbit_stew
  @deprecated
  static const ItemType rabbit_stew = ItemType('minecraft:rabbit_stew');

  /// DEPRECATED, please use Items.rabbit_foot
  @deprecated
  static const ItemType rabbit_foot = ItemType('minecraft:rabbit_foot');

  /// DEPRECATED, please use Items.rabbit_hide
  @deprecated
  static const ItemType rabbit_hide = ItemType('minecraft:rabbit_hide');

  /// DEPRECATED, please use Items.armor_stand
  @deprecated
  static const ItemType armor_stand = ItemType('minecraft:armor_stand');

  /// DEPRECATED, please use Items.iron_horse_armor
  @deprecated
  static const ItemType iron_horse_armor =
      ItemType('minecraft:iron_horse_armor');

  /// DEPRECATED, please use Items.golden_horse_armor
  @deprecated
  static const ItemType golden_horse_armor =
      ItemType('minecraft:golden_horse_armor');

  /// DEPRECATED, please use Items.diamond_horse_armor
  @deprecated
  static const ItemType diamond_horse_armor =
      ItemType('minecraft:diamond_horse_armor');

  /// DEPRECATED, please use Items.leather_horse_armor
  @deprecated
  static const ItemType leather_horse_armor =
      ItemType('minecraft:leather_horse_armor');

  /// DEPRECATED, please use Items.lead
  @deprecated
  static const ItemType lead = ItemType('minecraft:lead');

  /// DEPRECATED, please use Items.name_tag
  @deprecated
  static const ItemType name_tag = ItemType('minecraft:name_tag');

  /// DEPRECATED, please use Items.command_block_minecart
  @deprecated
  static const ItemType command_block_minecart =
      ItemType('minecraft:command_block_minecart');

  /// DEPRECATED, please use Items.mutton
  @deprecated
  static const ItemType mutton = ItemType('minecraft:mutton');

  /// DEPRECATED, please use Items.cooked_mutton
  @deprecated
  static const ItemType cooked_mutton = ItemType('minecraft:cooked_mutton');

  /// DEPRECATED, please use Items.white_banner
  @deprecated
  static const ItemType white_banner = ItemType('minecraft:white_banner');

  /// DEPRECATED, please use Items.orange_banner
  @deprecated
  static const ItemType orange_banner = ItemType('minecraft:orange_banner');

  /// DEPRECATED, please use Items.magenta_banner
  @deprecated
  static const ItemType magenta_banner = ItemType('minecraft:magenta_banner');

  /// DEPRECATED, please use Items.light_blue_banner
  @deprecated
  static const ItemType light_blue_banner =
      ItemType('minecraft:light_blue_banner');

  /// DEPRECATED, please use Items.yellow_banner
  @deprecated
  static const ItemType yellow_banner = ItemType('minecraft:yellow_banner');

  /// DEPRECATED, please use Items.lime_banner
  @deprecated
  static const ItemType lime_banner = ItemType('minecraft:lime_banner');

  /// DEPRECATED, please use Items.pink_banner
  @deprecated
  static const ItemType pink_banner = ItemType('minecraft:pink_banner');

  /// DEPRECATED, please use Items.gray_banner
  @deprecated
  static const ItemType gray_banner = ItemType('minecraft:gray_banner');

  /// DEPRECATED, please use Items.light_gray_banner
  @deprecated
  static const ItemType light_gray_banner =
      ItemType('minecraft:light_gray_banner');

  /// DEPRECATED, please use Items.cyan_banner
  @deprecated
  static const ItemType cyan_banner = ItemType('minecraft:cyan_banner');

  /// DEPRECATED, please use Items.purple_banner
  @deprecated
  static const ItemType purple_banner = ItemType('minecraft:purple_banner');

  /// DEPRECATED, please use Items.blue_banner
  @deprecated
  static const ItemType blue_banner = ItemType('minecraft:blue_banner');

  /// DEPRECATED, please use Items.brown_banner
  @deprecated
  static const ItemType brown_banner = ItemType('minecraft:brown_banner');

  /// DEPRECATED, please use Items.green_banner
  @deprecated
  static const ItemType green_banner = ItemType('minecraft:green_banner');

  /// DEPRECATED, please use Items.red_banner
  @deprecated
  static const ItemType red_banner = ItemType('minecraft:red_banner');

  /// DEPRECATED, please use Items.black_banner
  @deprecated
  static const ItemType black_banner = ItemType('minecraft:black_banner');

  /// DEPRECATED, please use Items.end_crystal
  @deprecated
  static const ItemType end_crystal = ItemType('minecraft:end_crystal');

  /// DEPRECATED, please use Items.chorus_fruit
  @deprecated
  static const ItemType chorus_fruit = ItemType('minecraft:chorus_fruit');

  /// DEPRECATED, please use Items.popped_chorus_fruit
  @deprecated
  static const ItemType popped_chorus_fruit =
      ItemType('minecraft:popped_chorus_fruit');

  /// DEPRECATED, please use Items.beetroot
  @deprecated
  static const ItemType beetroot = ItemType('minecraft:beetroot');

  /// DEPRECATED, please use Items.beetroot_seeds
  @deprecated
  static const ItemType beetroot_seeds = ItemType('minecraft:beetroot_seeds');

  /// DEPRECATED, please use Items.beetroot_soup
  @deprecated
  static const ItemType beetroot_soup = ItemType('minecraft:beetroot_soup');

  /// DEPRECATED, please use Items.dragon_breath
  @deprecated
  static const ItemType dragon_breath = ItemType('minecraft:dragon_breath');

  /// DEPRECATED, please use Items.splash_potion
  @deprecated
  static const ItemType splash_potion = ItemType('minecraft:splash_potion');

  /// DEPRECATED, please use Items.spectral_arrow
  @deprecated
  static const ItemType spectral_arrow = ItemType('minecraft:spectral_arrow');

  /// DEPRECATED, please use Items.tipped_arrow
  @deprecated
  static const ItemType tipped_arrow = ItemType('minecraft:tipped_arrow');

  /// DEPRECATED, please use Items.lingering_potion
  @deprecated
  static const ItemType lingering_potion =
      ItemType('minecraft:lingering_potion');

  /// DEPRECATED, please use Items.shield
  @deprecated
  static const ItemType shield = ItemType('minecraft:shield');

  /// DEPRECATED, please use Items.elytra
  @deprecated
  static const ItemType elytra = ItemType('minecraft:elytra');

  /// DEPRECATED, please use Items.spruce_boat
  @deprecated
  static const ItemType spruce_boat = ItemType('minecraft:spruce_boat');

  /// DEPRECATED, please use Items.birch_boat
  @deprecated
  static const ItemType birch_boat = ItemType('minecraft:birch_boat');

  /// DEPRECATED, please use Items.jungle_boat
  @deprecated
  static const ItemType jungle_boat = ItemType('minecraft:jungle_boat');

  /// DEPRECATED, please use Items.acacia_boat
  @deprecated
  static const ItemType acacia_boat = ItemType('minecraft:acacia_boat');

  /// DEPRECATED, please use Items.dark_oak_boat
  @deprecated
  static const ItemType dark_oak_boat = ItemType('minecraft:dark_oak_boat');

  /// DEPRECATED, please use Items.totem_of_undying
  @deprecated
  static const ItemType totem_of_undying =
      ItemType('minecraft:totem_of_undying');

  /// DEPRECATED, please use Items.shulker_shell
  @deprecated
  static const ItemType shulker_shell = ItemType('minecraft:shulker_shell');

  /// DEPRECATED, please use Items.iron_nugget
  @deprecated
  static const ItemType iron_nugget = ItemType('minecraft:iron_nugget');

  /// DEPRECATED, please use Items.knowledge_book
  @deprecated
  static const ItemType knowledge_book = ItemType('minecraft:knowledge_book');

  /// DEPRECATED, please use Items.debug_stick
  @deprecated
  static const ItemType debug_stick = ItemType('minecraft:debug_stick');

  /// DEPRECATED, please use Items.music_disc_13
  @deprecated
  static const ItemType music_disc_13 = ItemType('minecraft:music_disc_13');

  /// DEPRECATED, please use Items.music_disc_cat
  @deprecated
  static const ItemType music_disc_cat = ItemType('minecraft:music_disc_cat');

  /// DEPRECATED, please use Items.music_disc_blocks
  @deprecated
  static const ItemType music_disc_blocks =
      ItemType('minecraft:music_disc_blocks');

  /// DEPRECATED, please use Items.music_disc_chirp
  @deprecated
  static const ItemType music_disc_chirp =
      ItemType('minecraft:music_disc_chirp');

  /// DEPRECATED, please use Items.music_disc_far
  @deprecated
  static const ItemType music_disc_far = ItemType('minecraft:music_disc_far');

  /// DEPRECATED, please use Items.music_disc_mall
  @deprecated
  static const ItemType music_disc_mall = ItemType('minecraft:music_disc_mall');

  /// DEPRECATED, please use Items.music_disc_mellohi
  @deprecated
  static const ItemType music_disc_mellohi =
      ItemType('minecraft:music_disc_mellohi');

  /// DEPRECATED, please use Items.music_disc_stal
  @deprecated
  static const ItemType music_disc_stal = ItemType('minecraft:music_disc_stal');

  /// DEPRECATED, please use Items.music_disc_strad
  @deprecated
  static const ItemType music_disc_strad =
      ItemType('minecraft:music_disc_strad');

  /// DEPRECATED, please use Items.music_disc_ward
  @deprecated
  static const ItemType music_disc_ward = ItemType('minecraft:music_disc_ward');

  /// DEPRECATED, please use Items.music_disc_11
  @deprecated
  static const ItemType music_disc_11 = ItemType('minecraft:music_disc_11');

  /// DEPRECATED, please use Items.music_disc_wait
  @deprecated
  static const ItemType music_disc_wait = ItemType('minecraft:music_disc_wait');

  /// DEPRECATED, please use Items.trident
  @deprecated
  static const ItemType trident = ItemType('minecraft:trident');

  /// DEPRECATED, please use Items.phantom_membrane
  @deprecated
  static const ItemType phantom_membrane =
      ItemType('minecraft:phantom_membrane');

  /// DEPRECATED, please use Items.nautilus_shell
  @deprecated
  static const ItemType nautilus_shell = ItemType('minecraft:nautilus_shell');

  /// DEPRECATED, please use Items.heart_of_the_sea
  @deprecated
  static const ItemType heart_of_the_sea =
      ItemType('minecraft:heart_of_the_sea');

  /// DEPRECATED, please use Items.crossbow
  @deprecated
  static const ItemType crossbow = ItemType('minecraft:crossbow');

  /// DEPRECATED, please use Items.suspicious_stew
  @deprecated
  static const ItemType suspicious_stew = ItemType('minecraft:suspicious_stew');

  /// DEPRECATED, please use Items.loom
  @deprecated
  static const ItemType loom = ItemType('minecraft:loom');

  /// DEPRECATED, please use Items.flower_banner_pattern
  @deprecated
  static const ItemType flower_banner_pattern =
      ItemType('minecraft:flower_banner_pattern');

  /// DEPRECATED, please use Items.creeper_banner_pattern
  @deprecated
  static const ItemType creeper_banner_pattern =
      ItemType('minecraft:creeper_banner_pattern');

  /// DEPRECATED, please use Items.skull_banner_pattern
  @deprecated
  static const ItemType skull_banner_pattern =
      ItemType('minecraft:skull_banner_pattern');

  /// DEPRECATED, please use Items.mojang_banner_pattern
  @deprecated
  static const ItemType mojang_banner_pattern =
      ItemType('minecraft:mojang_banner_pattern');

  /// DEPRECATED, please use Items.globe_banner_pattern
  @deprecated
  static const ItemType globe_banner_pattern =
      ItemType('minecraft:globe_banner_pattern');

  /// DEPRECATED, please use Items.barrel
  @deprecated
  static const ItemType barrel = ItemType('minecraft:barrel');

  /// DEPRECATED, please use Items.smoker
  @deprecated
  static const ItemType smoker = ItemType('minecraft:smoker');

  /// DEPRECATED, please use Items.blast_furnace
  @deprecated
  static const ItemType blast_furnace = ItemType('minecraft:blast_furnace');

  /// DEPRECATED, please use Items.cartography_table
  @deprecated
  static const ItemType cartography_table =
      ItemType('minecraft:cartography_table');

  /// DEPRECATED, please use Items.fletching_table
  @deprecated
  static const ItemType fletching_table = ItemType('minecraft:fletching_table');

  /// DEPRECATED, please use Items.grindstone
  @deprecated
  static const ItemType grindstone = ItemType('minecraft:grindstone');

  /// DEPRECATED, please use Items.lectern
  @deprecated
  static const ItemType lectern = ItemType('minecraft:lectern');

  /// DEPRECATED, please use Items.smithing_table
  @deprecated
  static const ItemType smithing_table = ItemType('minecraft:smithing_table');

  /// DEPRECATED, please use Items.stonecutter
  @deprecated
  static const ItemType stonecutter = ItemType('minecraft:stonecutter');

  /// DEPRECATED, please use Items.bell
  @deprecated
  static const ItemType bell = ItemType('minecraft:bell');

  /// DEPRECATED, please use Items.lantern
  @deprecated
  static const ItemType lantern = ItemType('minecraft:lantern');

  /// DEPRECATED, please use Items.sweet_berries
  @deprecated
  static const ItemType sweet_berries = ItemType('minecraft:sweet_berries');

  /// DEPRECATED, please use Items.campfire
  @deprecated
  static const ItemType campfire = ItemType('minecraft:campfire');

  /// DEPRECATED, please use Items.honeycomb
  @deprecated
  static const ItemType honeycomb = ItemType('minecraft:honeycomb');

  /// DEPRECATED, please use Items.bee_nest
  @deprecated
  static const ItemType bee_nest = ItemType('minecraft:bee_nest');

  /// DEPRECATED, please use Items.beehive
  @deprecated
  static const ItemType beehive = ItemType('minecraft:beehive');

  /// DEPRECATED, please use Items.honey_bottle
  @deprecated
  static const ItemType honey_bottle = ItemType('minecraft:honey_bottle');

  /// DEPRECATED, please use Items.honey_block
  @deprecated
  static const ItemType honey_block = ItemType('minecraft:honey_block');

  /// DEPRECATED, please use Items.honeycomb_block
  @deprecated
  static const ItemType honeycomb_block = ItemType('minecraft:honeycomb_block');
}
