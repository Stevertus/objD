import 'package:gson/gson.dart';
import 'package:objd/basic/block.dart';
import 'package:objd/basic/slot.dart';
import 'dart:convert';

import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/widgets.dart';
class Item {
  ItemType type;
  int count;
  int damage;
  Slot slot;
  Map<String,dynamic> tag = {};
  /// The Item class represents an item in an inventory in Minecraft. It is used in the [Give] or Nbt Commands.
  Item(dynamic type,{this.count,this.slot,this.damage, int model,int hideFlags, TextComponent name, List<TextComponent> lore, Map<String,dynamic> nbt}){
    // check item type
    if(type is ItemType ) this.type = type;
    else if(type is Block ) this.type = new ItemType(type.toString());
    else if(type is String ) this.type = new ItemType(type);
    else throw("Please insert either an ItemType, a Block or a string representing an item type into Item");

    // check tags
    _checkTags(model,hideFlags,name,lore,nbt);
  }

  Item.Book(List<BookPage> pages, {String title = "", String author = "", this.count,this.slot,this.damage, int model,int hideFlags, TextComponent name, List<TextComponent> lore, Map<String,dynamic> nbt}){
    if(nbt == null) nbt = {};
    this.type = ItemType.written_book;
    nbt["title"] = title;
    nbt["author"] = author;
    nbt["pages"] = pages.map(
        (page) => json.encode(
          page.list.map(
            (item) => item.toMap()
          ).toList()
        )
      ).toList();

    _checkTags(model,hideFlags,name,lore,nbt);
  }
/// creates a new object based on a existing Item to modify properties.
  Item.clone(Item it){
    this.type = it.type.clone();
    if(it.count != null ) this.count = it.count;
    if(it.slot != null ) this.slot = it.slot.clone();
    if(it.tag != null) this.tag = new Map.from(it.tag);
  }
/// creates an Item based on nbt or json data.
  Item.fromJson(Map<String,dynamic> json){
    if(json["item"] != null) type = ItemType(json["item"]);
    if(json["id"] != null) type = ItemType(json["id"]);
    if(json["Slot"] != null) slot = Slot(id:json["Slot"]);
    if(json["Count"] != null && json["Count"] > 0) count = json["Count"];
    if(json["Damage"] != null && json["Damage"] > 0) damage = json["Damage"];
    int model;
    if(json["model"] != null) model = json["model"];
    if(json["tag"] != null) tag = json["tag"];
    _checkTags(model, null, null, null);
  }

  _checkTags(int model,[ int hideFlags, TextComponent name, List<TextComponent> lore, Map<String,dynamic> nbt]){
    if(nbt != null && nbt.length > 0) tag.addAll(nbt);
    if(damage != null) tag["Damage"] = damage;
    if(model != null) tag["CustomModelData"] = model;
    if(hideFlags != null) tag["HideFlags"] = hideFlags;
    if(name != null){
      tag["display"] = tag["display"] ?? {};
      tag["display"]['Name'] = name.toJson();
    }  
    if(lore != null){
      tag["display"] = tag["display"] ?? {};
      tag["display"]['Lore'] = lore.map((lor) => lor.toJson()).toList();
    }  
  }

  String getGiveNotation({bool withDamage = true}){
    String result = type.toString();
    if(tag != null && tag.length > 0){
      result += json.encode(tag);
    }
    result += " ";
    if(count != null) result += count.toString();
    if(damage != null && withDamage) result +=  " " + damage.toString();
    return result;
  }
  Map<String,dynamic> getMap(){
    Map<String,dynamic> map = {"id":"minecraft:" + type.toString().replaceFirst("minecraft:", "")};
    if(tag.isNotEmpty) map["tag"] = tag;
    if(count != null) map["Count"] = count;
    if(slot != null){
      if(slot.id == null) throw("An Item needs the Slot id!");
      if(slot.id < 0) print("Please note that you are using Item with a negative slot. This is reserved for a selecteditem and can't be accessed within the Inventory propery!");
      map["Slot"] = slot.id;
    } 
    return map;
  }
  String getNbt(){
    return gson.encode(this.getMap());
  }
}

class BookPage {
  List<TextComponent> list;
  BookPage(dynamic content){
    if(content is TextComponent) list = [content];
    if(content is String) list = [TextComponent(content)];
    if(content is List<TextComponent> ) list = content;
  }

  BookPage.customFont(String char){
    list = [TextComponent.customFont(char)];
  }
}

/// ItemType is like EntityType or Block a utility class to provide a list of all available items.
class ItemType {
  final String _type;
  const ItemType(this._type);

  clone(){
    return ItemType(this.toString());
  }

    @override
  String toString() {
    return _type;
  }

  /// [Acacia Boat](https://minecraft.gamepedia.com/acacia_boat)
  /// 
  /// _(minecraft:acacia_boat)_
  static const ItemType acacia_boat = const ItemType('minecraft:acacia_boat');
    

  /// [Acacia Button](https://minecraft.gamepedia.com/acacia_button)
  /// 
  /// _(minecraft:acacia_button)_
  static const ItemType acacia_button = const ItemType('minecraft:acacia_button');
    

  /// [Acacia Door](https://minecraft.gamepedia.com/acacia_door)
  /// 
  /// _(minecraft:acacia_door)_
  static const ItemType acacia_door = const ItemType('minecraft:acacia_door');
    

  /// [Acacia Fence](https://minecraft.gamepedia.com/acacia_fence)
  /// 
  /// _(minecraft:acacia_fence)_
  static const ItemType acacia_fence = const ItemType('minecraft:acacia_fence');
    

  /// [Acacia Fence Gate](https://minecraft.gamepedia.com/acacia_fence_gate)
  /// 
  /// _(minecraft:acacia_fence_gate)_
  static const ItemType acacia_fence_gate = const ItemType('minecraft:acacia_fence_gate');
    

  /// [Acacia Leaves](https://minecraft.gamepedia.com/acacia_leaves)
  /// 
  /// _(minecraft:acacia_leaves)_
  static const ItemType acacia_leaves = const ItemType('minecraft:acacia_leaves');
    

  /// [Acacia Log](https://minecraft.gamepedia.com/acacia_log)
  /// 
  /// _(minecraft:acacia_log)_
  static const ItemType acacia_log = const ItemType('minecraft:acacia_log');
    

  /// [Acacia Wood Plank](https://minecraft.gamepedia.com/acacia_planks)
  /// 
  /// _(minecraft:acacia_planks)_
  static const ItemType acacia_planks = const ItemType('minecraft:acacia_planks');
    

  /// [Acacia Pressure Plate](https://minecraft.gamepedia.com/acacia_pressure_plate)
  /// 
  /// _(minecraft:acacia_pressure_plate)_
  static const ItemType acacia_pressure_plate = const ItemType('minecraft:acacia_pressure_plate');
    

  /// [Acacia Sapling](https://minecraft.gamepedia.com/acacia_sapling)
  /// 
  /// _(minecraft:acacia_sapling)_
  static const ItemType acacia_sapling = const ItemType('minecraft:acacia_sapling');
    

  /// [Acacia Sign](https://minecraft.gamepedia.com/acacia_sign)
  /// 
  /// _(minecraft:acacia_sign)_
  static const ItemType acacia_sign = const ItemType('minecraft:acacia_sign');
    

  /// [Acacia Wood Slab](https://minecraft.gamepedia.com/acacia_slab)
  /// 
  /// _(minecraft:acacia_slab)_
  static const ItemType acacia_slab = const ItemType('minecraft:acacia_slab');
    

  /// [Acacia Wood Stairs](https://minecraft.gamepedia.com/acacia_stairs)
  /// 
  /// _(minecraft:acacia_stairs)_
  static const ItemType acacia_stairs = const ItemType('minecraft:acacia_stairs');
    

  /// [Acacia Trapdoor](https://minecraft.gamepedia.com/acacia_trapdoor)
  /// 
  /// _(minecraft:acacia_trapdoor)_
  static const ItemType acacia_trapdoor = const ItemType('minecraft:acacia_trapdoor');
    

  /// [Acacia Wood with Bark](https://minecraft.gamepedia.com/acacia_wood)
  /// 
  /// _(minecraft:acacia_wood)_
  static const ItemType acacia_wood = const ItemType('minecraft:acacia_wood');
    

  /// [Activator Rails](https://minecraft.gamepedia.com/activator_rail)
  /// 
  /// _(minecraft:activator_rail)_
  static const ItemType activator_rail = const ItemType('minecraft:activator_rail');
    

  /// [Air](https://minecraft.gamepedia.com/air)
  /// 
  /// _(minecraft:air)_
  static const ItemType air = const ItemType('minecraft:air');
    

  /// [Allium](https://minecraft.gamepedia.com/allium)
  /// 
  /// _(minecraft:allium)_
  static const ItemType allium = const ItemType('minecraft:allium');
    

  /// [Andesite](https://minecraft.gamepedia.com/andesite)
  /// 
  /// _(minecraft:andesite)_
  static const ItemType andesite = const ItemType('minecraft:andesite');
    

  /// [Andesite Slab](https://minecraft.gamepedia.com/andesite_slab)
  /// 
  /// _(minecraft:andesite_slab)_
  static const ItemType andesite_slab = const ItemType('minecraft:andesite_slab');
    

  /// [Andesite Stairs](https://minecraft.gamepedia.com/andesite_stairs)
  /// 
  /// _(minecraft:andesite_stairs)_
  static const ItemType andesite_stairs = const ItemType('minecraft:andesite_stairs');
    

  /// [Andesite Wall](https://minecraft.gamepedia.com/andesite_wall)
  /// 
  /// _(minecraft:andesite_wall)_
  static const ItemType andesite_wall = const ItemType('minecraft:andesite_wall');
    

  /// [Anvil](https://minecraft.gamepedia.com/anvil)
  /// 
  /// _(minecraft:anvil)_
  static const ItemType anvil = const ItemType('minecraft:anvil');
    

  /// [Apple](https://minecraft.gamepedia.com/apple)
  /// 
  /// _(minecraft:apple)_
  static const ItemType apple = const ItemType('minecraft:apple');
    

  /// [Armor Stand](https://minecraft.gamepedia.com/armor_stand)
  /// 
  /// _(minecraft:armor_stand)_
  static const ItemType armor_stand = const ItemType('minecraft:armor_stand');
    

  /// [Arrow](https://minecraft.gamepedia.com/arrow)
  /// 
  /// _(minecraft:arrow)_
  static const ItemType arrow = const ItemType('minecraft:arrow');
    

  /// [Azure Bluet](https://minecraft.gamepedia.com/azure_bluet)
  /// 
  /// _(minecraft:azure_bluet)_
  static const ItemType azure_bluet = const ItemType('minecraft:azure_bluet');
    

  /// [Baked Potato](https://minecraft.gamepedia.com/baked_potato)
  /// 
  /// _(minecraft:baked_potato)_
  static const ItemType baked_potato = const ItemType('minecraft:baked_potato');
    

  /// [Bamboo](https://minecraft.gamepedia.com/bamboo)
  /// 
  /// _(minecraft:bamboo)_
  static const ItemType bamboo = const ItemType('minecraft:bamboo');
    

  /// [Barrel](https://minecraft.gamepedia.com/barrel)
  /// 
  /// _(minecraft:barrel)_
  static const ItemType barrel = const ItemType('minecraft:barrel');
    

  /// [Barrier](https://minecraft.gamepedia.com/barrier)
  /// 
  /// _(minecraft:barrier)_
  static const ItemType barrier = const ItemType('minecraft:barrier');
    

  /// [Bat Spawn Egg](https://minecraft.gamepedia.com/bat_spawn_egg)
  /// 
  /// _(minecraft:bat_spawn_egg)_
  static const ItemType bat_spawn_egg = const ItemType('minecraft:bat_spawn_egg');
    

  /// [Beacon](https://minecraft.gamepedia.com/beacon)
  /// 
  /// _(minecraft:beacon)_
  static const ItemType beacon = const ItemType('minecraft:beacon');
    

  /// [Bedrock](https://minecraft.gamepedia.com/bedrock)
  /// 
  /// _(minecraft:bedrock)_
  static const ItemType bedrock = const ItemType('minecraft:bedrock');
    

  /// [Raw Beef](https://minecraft.gamepedia.com/beef)
  /// 
  /// _(minecraft:beef)_
  static const ItemType beef = const ItemType('minecraft:beef');
    

  /// [Beetroot](https://minecraft.gamepedia.com/beetroot)
  /// 
  /// _(minecraft:beetroot)_
  static const ItemType beetroot = const ItemType('minecraft:beetroot');
    

  /// [Beetroot Seeds](https://minecraft.gamepedia.com/beetroot_seeds)
  /// 
  /// _(minecraft:beetroot_seeds)_
  static const ItemType beetroot_seeds = const ItemType('minecraft:beetroot_seeds');
    

  /// [Beetroot Soup](https://minecraft.gamepedia.com/beetroot_soup)
  /// 
  /// _(minecraft:beetroot_soup)_
  static const ItemType beetroot_soup = const ItemType('minecraft:beetroot_soup');
    

  /// [Bell](https://minecraft.gamepedia.com/bell)
  /// 
  /// _(minecraft:bell)_
  static const ItemType bell = const ItemType('minecraft:bell');
    

  /// [Birch Boat](https://minecraft.gamepedia.com/birch_boat)
  /// 
  /// _(minecraft:birch_boat)_
  static const ItemType birch_boat = const ItemType('minecraft:birch_boat');
    

  /// [Birch Button](https://minecraft.gamepedia.com/birch_button)
  /// 
  /// _(minecraft:birch_button)_
  static const ItemType birch_button = const ItemType('minecraft:birch_button');
    

  /// [Birch Door](https://minecraft.gamepedia.com/birch_door)
  /// 
  /// _(minecraft:birch_door)_
  static const ItemType birch_door = const ItemType('minecraft:birch_door');
    

  /// [Birch Fence](https://minecraft.gamepedia.com/birch_fence)
  /// 
  /// _(minecraft:birch_fence)_
  static const ItemType birch_fence = const ItemType('minecraft:birch_fence');
    

  /// [Birch Fence Gate](https://minecraft.gamepedia.com/birch_fence_gate)
  /// 
  /// _(minecraft:birch_fence_gate)_
  static const ItemType birch_fence_gate = const ItemType('minecraft:birch_fence_gate');
    

  /// [Birch Leaves](https://minecraft.gamepedia.com/birch_leaves)
  /// 
  /// _(minecraft:birch_leaves)_
  static const ItemType birch_leaves = const ItemType('minecraft:birch_leaves');
    

  /// [Birch Log](https://minecraft.gamepedia.com/birch_log)
  /// 
  /// _(minecraft:birch_log)_
  static const ItemType birch_log = const ItemType('minecraft:birch_log');
    

  /// [Birch Wood Plank](https://minecraft.gamepedia.com/birch_planks)
  /// 
  /// _(minecraft:birch_planks)_
  static const ItemType birch_planks = const ItemType('minecraft:birch_planks');
    

  /// [Birch Pressure Plate](https://minecraft.gamepedia.com/birch_pressure_plate)
  /// 
  /// _(minecraft:birch_pressure_plate)_
  static const ItemType birch_pressure_plate = const ItemType('minecraft:birch_pressure_plate');
    

  /// [Birch Sapling](https://minecraft.gamepedia.com/birch_sapling)
  /// 
  /// _(minecraft:birch_sapling)_
  static const ItemType birch_sapling = const ItemType('minecraft:birch_sapling');
    

  /// [Birch Sign](https://minecraft.gamepedia.com/birch_sign)
  /// 
  /// _(minecraft:birch_sign)_
  static const ItemType birch_sign = const ItemType('minecraft:birch_sign');
    

  /// [Birch Wood Slab](https://minecraft.gamepedia.com/birch_slab)
  /// 
  /// _(minecraft:birch_slab)_
  static const ItemType birch_slab = const ItemType('minecraft:birch_slab');
    

  /// [Birch Wood Stairs](https://minecraft.gamepedia.com/birch_stairs)
  /// 
  /// _(minecraft:birch_stairs)_
  static const ItemType birch_stairs = const ItemType('minecraft:birch_stairs');
    

  /// [Birch Trapdoor](https://minecraft.gamepedia.com/birch_trapdoor)
  /// 
  /// _(minecraft:birch_trapdoor)_
  static const ItemType birch_trapdoor = const ItemType('minecraft:birch_trapdoor');
    

  /// [Birch Wood with Bark](https://minecraft.gamepedia.com/birch_wood)
  /// 
  /// _(minecraft:birch_wood)_
  static const ItemType birch_wood = const ItemType('minecraft:birch_wood');
    

  /// [Black Banner](https://minecraft.gamepedia.com/black_banner)
  /// 
  /// _(minecraft:black_banner)_
  static const ItemType black_banner = const ItemType('minecraft:black_banner');
    

  /// [Black Bed](https://minecraft.gamepedia.com/black_bed)
  /// 
  /// _(minecraft:black_bed)_
  static const ItemType black_bed = const ItemType('minecraft:black_bed');
    

  /// [Black Carpet](https://minecraft.gamepedia.com/black_carpet)
  /// 
  /// _(minecraft:black_carpet)_
  static const ItemType black_carpet = const ItemType('minecraft:black_carpet');
    

  /// [Black Concrete](https://minecraft.gamepedia.com/black_concrete)
  /// 
  /// _(minecraft:black_concrete)_
  static const ItemType black_concrete = const ItemType('minecraft:black_concrete');
    

  /// [Black Concrete Powder](https://minecraft.gamepedia.com/black_concrete_powder)
  /// 
  /// _(minecraft:black_concrete_powder)_
  static const ItemType black_concrete_powder = const ItemType('minecraft:black_concrete_powder');
    

  /// [Black Dye](https://minecraft.gamepedia.com/black_dye)
  /// 
  /// _(minecraft:black_dye)_
  static const ItemType black_dye = const ItemType('minecraft:black_dye');
    

  /// [Black Glazed Terracotta](https://minecraft.gamepedia.com/black_glazed_terracotta)
  /// 
  /// _(minecraft:black_glazed_terracotta)_
  static const ItemType black_glazed_terracotta = const ItemType('minecraft:black_glazed_terracotta');
    

  /// [Black Shulker Box](https://minecraft.gamepedia.com/black_shulker_box)
  /// 
  /// _(minecraft:black_shulker_box)_
  static const ItemType black_shulker_box = const ItemType('minecraft:black_shulker_box');
    

  /// [Black Stained Glass](https://minecraft.gamepedia.com/black_stained_glass)
  /// 
  /// _(minecraft:black_stained_glass)_
  static const ItemType black_stained_glass = const ItemType('minecraft:black_stained_glass');
    

  /// [Black Stained Glass Pane](https://minecraft.gamepedia.com/black_stained_glass_pane)
  /// 
  /// _(minecraft:black_stained_glass_pane)_
  static const ItemType black_stained_glass_pane = const ItemType('minecraft:black_stained_glass_pane');
    

  /// [Black Terracotta](https://minecraft.gamepedia.com/black_terracotta)
  /// 
  /// _(minecraft:black_terracotta)_
  static const ItemType black_terracotta = const ItemType('minecraft:black_terracotta');
    

  /// [Black Wool](https://minecraft.gamepedia.com/black_wool)
  /// 
  /// _(minecraft:black_wool)_
  static const ItemType black_wool = const ItemType('minecraft:black_wool');
    

  /// [Blast Furnace](https://minecraft.gamepedia.com/blast_furnace)
  /// 
  /// _(minecraft:blast_furnace)_
  static const ItemType blast_furnace = const ItemType('minecraft:blast_furnace');
    

  /// [Blaze Powder](https://minecraft.gamepedia.com/blaze_powder)
  /// 
  /// _(minecraft:blaze_powder)_
  static const ItemType blaze_powder = const ItemType('minecraft:blaze_powder');
    

  /// [Blaze Rod](https://minecraft.gamepedia.com/blaze_rod)
  /// 
  /// _(minecraft:blaze_rod)_
  static const ItemType blaze_rod = const ItemType('minecraft:blaze_rod');
    

  /// [Blaze Spawn Egg](https://minecraft.gamepedia.com/blaze_spawn_egg)
  /// 
  /// _(minecraft:blaze_spawn_egg)_
  static const ItemType blaze_spawn_egg = const ItemType('minecraft:blaze_spawn_egg');
    

  /// [Blue Banner](https://minecraft.gamepedia.com/blue_banner)
  /// 
  /// _(minecraft:blue_banner)_
  static const ItemType blue_banner = const ItemType('minecraft:blue_banner');
    

  /// [Blue Bed](https://minecraft.gamepedia.com/blue_bed)
  /// 
  /// _(minecraft:blue_bed)_
  static const ItemType blue_bed = const ItemType('minecraft:blue_bed');
    

  /// [Blue Carpet](https://minecraft.gamepedia.com/blue_carpet)
  /// 
  /// _(minecraft:blue_carpet)_
  static const ItemType blue_carpet = const ItemType('minecraft:blue_carpet');
    

  /// [Blue Concrete](https://minecraft.gamepedia.com/blue_concrete)
  /// 
  /// _(minecraft:blue_concrete)_
  static const ItemType blue_concrete = const ItemType('minecraft:blue_concrete');
    

  /// [Blue Concrete Powder](https://minecraft.gamepedia.com/blue_concrete_powder)
  /// 
  /// _(minecraft:blue_concrete_powder)_
  static const ItemType blue_concrete_powder = const ItemType('minecraft:blue_concrete_powder');
    

  /// [Blue Dye](https://minecraft.gamepedia.com/blue_dye)
  /// 
  /// _(minecraft:blue_dye)_
  static const ItemType blue_dye = const ItemType('minecraft:blue_dye');
    

  /// [Blue Glazed Terracotta](https://minecraft.gamepedia.com/blue_glazed_terracotta)
  /// 
  /// _(minecraft:blue_glazed_terracotta)_
  static const ItemType blue_glazed_terracotta = const ItemType('minecraft:blue_glazed_terracotta');
    

  /// [Blue Ice](https://minecraft.gamepedia.com/blue_ice)
  /// 
  /// _(minecraft:blue_ice)_
  static const ItemType blue_ice = const ItemType('minecraft:blue_ice');
    

  /// [Blue Orchid](https://minecraft.gamepedia.com/blue_orchid)
  /// 
  /// _(minecraft:blue_orchid)_
  static const ItemType blue_orchid = const ItemType('minecraft:blue_orchid');
    

  /// [Blue Shulker Box](https://minecraft.gamepedia.com/blue_shulker_box)
  /// 
  /// _(minecraft:blue_shulker_box)_
  static const ItemType blue_shulker_box = const ItemType('minecraft:blue_shulker_box');
    

  /// [Blue Stained Glass](https://minecraft.gamepedia.com/blue_stained_glass)
  /// 
  /// _(minecraft:blue_stained_glass)_
  static const ItemType blue_stained_glass = const ItemType('minecraft:blue_stained_glass');
    

  /// [Blue Stained Glass Pane](https://minecraft.gamepedia.com/blue_stained_glass_pane)
  /// 
  /// _(minecraft:blue_stained_glass_pane)_
  static const ItemType blue_stained_glass_pane = const ItemType('minecraft:blue_stained_glass_pane');
    

  /// [Blue Terracotta](https://minecraft.gamepedia.com/blue_terracotta)
  /// 
  /// _(minecraft:blue_terracotta)_
  static const ItemType blue_terracotta = const ItemType('minecraft:blue_terracotta');
    

  /// [Blue Wool](https://minecraft.gamepedia.com/blue_wool)
  /// 
  /// _(minecraft:blue_wool)_
  static const ItemType blue_wool = const ItemType('minecraft:blue_wool');
    

  /// [Bone](https://minecraft.gamepedia.com/bone)
  /// 
  /// _(minecraft:bone)_
  static const ItemType bone = const ItemType('minecraft:bone');
    

  /// [Bone Block](https://minecraft.gamepedia.com/bone_block)
  /// 
  /// _(minecraft:bone_block)_
  static const ItemType bone_block = const ItemType('minecraft:bone_block');
    

  /// [Bone Meal](https://minecraft.gamepedia.com/bone_meal)
  /// 
  /// _(minecraft:bone_meal)_
  static const ItemType bone_meal = const ItemType('minecraft:bone_meal');
    

  /// [Book](https://minecraft.gamepedia.com/book)
  /// 
  /// _(minecraft:book)_
  static const ItemType book = const ItemType('minecraft:book');
    

  /// [Bookshelf](https://minecraft.gamepedia.com/bookshelf)
  /// 
  /// _(minecraft:bookshelf)_
  static const ItemType bookshelf = const ItemType('minecraft:bookshelf');
    

  /// [Bow](https://minecraft.gamepedia.com/bow)
  /// 
  /// _(minecraft:bow)_
  static const ItemType bow = const ItemType('minecraft:bow');
    

  /// [Bowl](https://minecraft.gamepedia.com/bowl)
  /// 
  /// _(minecraft:bowl)_
  static const ItemType bowl = const ItemType('minecraft:bowl');
    

  /// [Brain Coral](https://minecraft.gamepedia.com/brain_coral)
  /// 
  /// _(minecraft:brain_coral)_
  static const ItemType brain_coral = const ItemType('minecraft:brain_coral');
    

  /// [Brain Coral Block](https://minecraft.gamepedia.com/brain_coral_block)
  /// 
  /// _(minecraft:brain_coral_block)_
  static const ItemType brain_coral_block = const ItemType('minecraft:brain_coral_block');
    

  /// [Brain Coral Fan](https://minecraft.gamepedia.com/brain_coral_fan)
  /// 
  /// _(minecraft:brain_coral_fan)_
  static const ItemType brain_coral_fan = const ItemType('minecraft:brain_coral_fan');
    

  /// [Bread](https://minecraft.gamepedia.com/bread)
  /// 
  /// _(minecraft:bread)_
  static const ItemType bread = const ItemType('minecraft:bread');
    

  /// [Brewing Stand](https://minecraft.gamepedia.com/brewing_stand)
  /// 
  /// _(minecraft:brewing_stand)_
  static const ItemType brewing_stand = const ItemType('minecraft:brewing_stand');
    

  /// [Brick](https://minecraft.gamepedia.com/brick)
  /// 
  /// _(minecraft:brick)_
  static const ItemType brick = const ItemType('minecraft:brick');
    

  /// [Brick Slab](https://minecraft.gamepedia.com/brick_slab)
  /// 
  /// _(minecraft:brick_slab)_
  static const ItemType brick_slab = const ItemType('minecraft:brick_slab');
    

  /// [Brick Stairs](https://minecraft.gamepedia.com/brick_stairs)
  /// 
  /// _(minecraft:brick_stairs)_
  static const ItemType brick_stairs = const ItemType('minecraft:brick_stairs');
    

  /// [Brick Wall](https://minecraft.gamepedia.com/brick_wall)
  /// 
  /// _(minecraft:brick_wall)_
  static const ItemType brick_wall = const ItemType('minecraft:brick_wall');
    

  /// [Bricks](https://minecraft.gamepedia.com/bricks)
  /// 
  /// _(minecraft:bricks)_
  static const ItemType bricks = const ItemType('minecraft:bricks');
    

  /// [Brown Banner](https://minecraft.gamepedia.com/brown_banner)
  /// 
  /// _(minecraft:brown_banner)_
  static const ItemType brown_banner = const ItemType('minecraft:brown_banner');
    

  /// [Brown Bed](https://minecraft.gamepedia.com/brown_bed)
  /// 
  /// _(minecraft:brown_bed)_
  static const ItemType brown_bed = const ItemType('minecraft:brown_bed');
    

  /// [Brown Carpet](https://minecraft.gamepedia.com/brown_carpet)
  /// 
  /// _(minecraft:brown_carpet)_
  static const ItemType brown_carpet = const ItemType('minecraft:brown_carpet');
    

  /// [Brown Concrete](https://minecraft.gamepedia.com/brown_concrete)
  /// 
  /// _(minecraft:brown_concrete)_
  static const ItemType brown_concrete = const ItemType('minecraft:brown_concrete');
    

  /// [Brown Concrete Powder](https://minecraft.gamepedia.com/brown_concrete_powder)
  /// 
  /// _(minecraft:brown_concrete_powder)_
  static const ItemType brown_concrete_powder = const ItemType('minecraft:brown_concrete_powder');
    

  /// [Brown Dye](https://minecraft.gamepedia.com/brown_dye)
  /// 
  /// _(minecraft:brown_dye)_
  static const ItemType brown_dye = const ItemType('minecraft:brown_dye');
    

  /// [Brown Glazed Terracotta](https://minecraft.gamepedia.com/brown_glazed_terracotta)
  /// 
  /// _(minecraft:brown_glazed_terracotta)_
  static const ItemType brown_glazed_terracotta = const ItemType('minecraft:brown_glazed_terracotta');
    

  /// [Mushroom (brown)](https://minecraft.gamepedia.com/brown_mushroom)
  /// 
  /// _(minecraft:brown_mushroom)_
  static const ItemType brown_mushroom = const ItemType('minecraft:brown_mushroom');
    

  /// [Brown Mushroom Block](https://minecraft.gamepedia.com/brown_mushroom_block)
  /// 
  /// _(minecraft:brown_mushroom_block)_
  static const ItemType brown_mushroom_block = const ItemType('minecraft:brown_mushroom_block');
    

  /// [Brown Shulker Box](https://minecraft.gamepedia.com/brown_shulker_box)
  /// 
  /// _(minecraft:brown_shulker_box)_
  static const ItemType brown_shulker_box = const ItemType('minecraft:brown_shulker_box');
    

  /// [Brown Stained Glass](https://minecraft.gamepedia.com/brown_stained_glass)
  /// 
  /// _(minecraft:brown_stained_glass)_
  static const ItemType brown_stained_glass = const ItemType('minecraft:brown_stained_glass');
    

  /// [Brown Stained Glass Pane](https://minecraft.gamepedia.com/brown_stained_glass_pane)
  /// 
  /// _(minecraft:brown_stained_glass_pane)_
  static const ItemType brown_stained_glass_pane = const ItemType('minecraft:brown_stained_glass_pane');
    

  /// [Brown Terracotta](https://minecraft.gamepedia.com/brown_terracotta)
  /// 
  /// _(minecraft:brown_terracotta)_
  static const ItemType brown_terracotta = const ItemType('minecraft:brown_terracotta');
    

  /// [Brown Wool](https://minecraft.gamepedia.com/brown_wool)
  /// 
  /// _(minecraft:brown_wool)_
  static const ItemType brown_wool = const ItemType('minecraft:brown_wool');
    

  /// [Bubble Coral](https://minecraft.gamepedia.com/bubble_coral)
  /// 
  /// _(minecraft:bubble_coral)_
  static const ItemType bubble_coral = const ItemType('minecraft:bubble_coral');
    

  /// [Bubble Coral Block](https://minecraft.gamepedia.com/bubble_coral_block)
  /// 
  /// _(minecraft:bubble_coral_block)_
  static const ItemType bubble_coral_block = const ItemType('minecraft:bubble_coral_block');
    

  /// [Bubble Coral Fan](https://minecraft.gamepedia.com/bubble_coral_fan)
  /// 
  /// _(minecraft:bubble_coral_fan)_
  static const ItemType bubble_coral_fan = const ItemType('minecraft:bubble_coral_fan');
    

  /// [Bucket](https://minecraft.gamepedia.com/bucket)
  /// 
  /// _(minecraft:bucket)_
  static const ItemType bucket = const ItemType('minecraft:bucket');
    

  /// [Cactus](https://minecraft.gamepedia.com/cactus)
  /// 
  /// _(minecraft:cactus)_
  static const ItemType cactus = const ItemType('minecraft:cactus');
    

  /// [Cake](https://minecraft.gamepedia.com/cake)
  /// 
  /// _(minecraft:cake)_
  static const ItemType cake = const ItemType('minecraft:cake');
    

  /// [Campire](https://minecraft.gamepedia.com/campfire)
  /// 
  /// _(minecraft:campfire)_
  static const ItemType campfire = const ItemType('minecraft:campfire');
    

  /// [Carrot](https://minecraft.gamepedia.com/carrot)
  /// 
  /// _(minecraft:carrot)_
  static const ItemType carrot = const ItemType('minecraft:carrot');
    

  /// [Carrot on a Stick](https://minecraft.gamepedia.com/carrot_on_a_stick)
  /// 
  /// _(minecraft:carrot_on_a_stick)_
  static const ItemType carrot_on_a_stick = const ItemType('minecraft:carrot_on_a_stick');
    

  /// [Cartography Table](https://minecraft.gamepedia.com/cartography_table)
  /// 
  /// _(minecraft:cartography_table)_
  static const ItemType cartography_table = const ItemType('minecraft:cartography_table');
    

  /// [Carved Pumpkin](https://minecraft.gamepedia.com/carved_pumpkin)
  /// 
  /// _(minecraft:carved_pumpkin)_
  static const ItemType carved_pumpkin = const ItemType('minecraft:carved_pumpkin');
    

  /// [Cat Spawn Egg](https://minecraft.gamepedia.com/cat_spawn_egg)
  /// 
  /// _(minecraft:cat_spawn_egg)_
  static const ItemType cat_spawn_egg = const ItemType('minecraft:cat_spawn_egg');
    

  /// [Cauldron](https://minecraft.gamepedia.com/cauldron)
  /// 
  /// _(minecraft:cauldron)_
  static const ItemType cauldron = const ItemType('minecraft:cauldron');
    

  /// [Cave Spider Spawn Egg](https://minecraft.gamepedia.com/cave_spider_spawn_egg)
  /// 
  /// _(minecraft:cave_spider_spawn_egg)_
  static const ItemType cave_spider_spawn_egg = const ItemType('minecraft:cave_spider_spawn_egg');
    

  /// [Chain Command Block](https://minecraft.gamepedia.com/chain_command_block)
  /// 
  /// _(minecraft:chain_command_block)_
  static const ItemType chain_command_block = const ItemType('minecraft:chain_command_block');
    

  /// [Chain Boots](https://minecraft.gamepedia.com/chainmail_boots)
  /// 
  /// _(minecraft:chainmail_boots)_
  static const ItemType chainmail_boots = const ItemType('minecraft:chainmail_boots');
    

  /// [Chain Chestplate](https://minecraft.gamepedia.com/chainmail_chestplate)
  /// 
  /// _(minecraft:chainmail_chestplate)_
  static const ItemType chainmail_chestplate = const ItemType('minecraft:chainmail_chestplate');
    

  /// [Chain Helmet](https://minecraft.gamepedia.com/chainmail_helmet)
  /// 
  /// _(minecraft:chainmail_helmet)_
  static const ItemType chainmail_helmet = const ItemType('minecraft:chainmail_helmet');
    

  /// [Chain Leggings](https://minecraft.gamepedia.com/chainmail_leggings)
  /// 
  /// _(minecraft:chainmail_leggings)_
  static const ItemType chainmail_leggings = const ItemType('minecraft:chainmail_leggings');
    

  /// [Charcoal](https://minecraft.gamepedia.com/charcoal)
  /// 
  /// _(minecraft:charcoal)_
  static const ItemType charcoal = const ItemType('minecraft:charcoal');
    

  /// [Chest](https://minecraft.gamepedia.com/chest)
  /// 
  /// _(minecraft:chest)_
  static const ItemType chest = const ItemType('minecraft:chest');
    

  /// [Minecart with Chest](https://minecraft.gamepedia.com/chest_minecart)
  /// 
  /// _(minecraft:chest_minecart)_
  static const ItemType chest_minecart = const ItemType('minecraft:chest_minecart');
    

  /// [Raw Chicken](https://minecraft.gamepedia.com/chicken)
  /// 
  /// _(minecraft:chicken)_
  static const ItemType chicken = const ItemType('minecraft:chicken');
    

  /// [Chicken Spawn Egg](https://minecraft.gamepedia.com/chicken_spawn_egg)
  /// 
  /// _(minecraft:chicken_spawn_egg)_
  static const ItemType chicken_spawn_egg = const ItemType('minecraft:chicken_spawn_egg');
    

  /// [Slightly Damaged Anvil](https://minecraft.gamepedia.com/chipped_anvil)
  /// 
  /// _(minecraft:chipped_anvil)_
  static const ItemType chipped_anvil = const ItemType('minecraft:chipped_anvil');
    

  /// [Chiseled Quartz Block](https://minecraft.gamepedia.com/chiseled_quartz_block)
  /// 
  /// _(minecraft:chiseled_quartz_block)_
  static const ItemType chiseled_quartz_block = const ItemType('minecraft:chiseled_quartz_block');
    

  /// [Chiseled Red Sandstone](https://minecraft.gamepedia.com/chiseled_red_sandstone)
  /// 
  /// _(minecraft:chiseled_red_sandstone)_
  static const ItemType chiseled_red_sandstone = const ItemType('minecraft:chiseled_red_sandstone');
    

  /// [Chiseled Sandstone](https://minecraft.gamepedia.com/chiseled_sandstone)
  /// 
  /// _(minecraft:chiseled_sandstone)_
  static const ItemType chiseled_sandstone = const ItemType('minecraft:chiseled_sandstone');
    

  /// [Chiseled Stone Bricks](https://minecraft.gamepedia.com/chiseled_stone_bricks)
  /// 
  /// _(minecraft:chiseled_stone_bricks)_
  static const ItemType chiseled_stone_bricks = const ItemType('minecraft:chiseled_stone_bricks');
    

  /// [Chorus Flower](https://minecraft.gamepedia.com/chorus_flower)
  /// 
  /// _(minecraft:chorus_flower)_
  static const ItemType chorus_flower = const ItemType('minecraft:chorus_flower');
    

  /// [Chorus Fruit](https://minecraft.gamepedia.com/chorus_fruit)
  /// 
  /// _(minecraft:chorus_fruit)_
  static const ItemType chorus_fruit = const ItemType('minecraft:chorus_fruit');
    

  /// [Chorus Plant](https://minecraft.gamepedia.com/chorus_plant)
  /// 
  /// _(minecraft:chorus_plant)_
  static const ItemType chorus_plant = const ItemType('minecraft:chorus_plant');
    

  /// [Clay Block](https://minecraft.gamepedia.com/clay)
  /// 
  /// _(minecraft:clay)_
  static const ItemType clay = const ItemType('minecraft:clay');
    

  /// [Clay](https://minecraft.gamepedia.com/clay_ball)
  /// 
  /// _(minecraft:clay_ball)_
  static const ItemType clay_ball = const ItemType('minecraft:clay_ball');
    

  /// [Clock](https://minecraft.gamepedia.com/clock)
  /// 
  /// _(minecraft:clock)_
  static const ItemType clock = const ItemType('minecraft:clock');
    

  /// [Coal](https://minecraft.gamepedia.com/coal)
  /// 
  /// _(minecraft:coal)_
  static const ItemType coal = const ItemType('minecraft:coal');
    

  /// [Coal Block](https://minecraft.gamepedia.com/coal_block)
  /// 
  /// _(minecraft:coal_block)_
  static const ItemType coal_block = const ItemType('minecraft:coal_block');
    

  /// [Coal Ore](https://minecraft.gamepedia.com/coal_ore)
  /// 
  /// _(minecraft:coal_ore)_
  static const ItemType coal_ore = const ItemType('minecraft:coal_ore');
    

  /// [Coarse Dirt](https://minecraft.gamepedia.com/coarse_dirt)
  /// 
  /// _(minecraft:coarse_dirt)_
  static const ItemType coarse_dirt = const ItemType('minecraft:coarse_dirt');
    

  /// [Cobblestone](https://minecraft.gamepedia.com/cobblestone)
  /// 
  /// _(minecraft:cobblestone)_
  static const ItemType cobblestone = const ItemType('minecraft:cobblestone');
    

  /// [Cobblestone Slab](https://minecraft.gamepedia.com/cobblestone_slab)
  /// 
  /// _(minecraft:cobblestone_slab)_
  static const ItemType cobblestone_slab = const ItemType('minecraft:cobblestone_slab');
    

  /// [Cobblestone Stairs](https://minecraft.gamepedia.com/cobblestone_stairs)
  /// 
  /// _(minecraft:cobblestone_stairs)_
  static const ItemType cobblestone_stairs = const ItemType('minecraft:cobblestone_stairs');
    

  /// [Cobblestone Wall](https://minecraft.gamepedia.com/cobblestone_wall)
  /// 
  /// _(minecraft:cobblestone_wall)_
  static const ItemType cobblestone_wall = const ItemType('minecraft:cobblestone_wall');
    

  /// [Cobweb](https://minecraft.gamepedia.com/cobweb)
  /// 
  /// _(minecraft:cobweb)_
  static const ItemType cobweb = const ItemType('minecraft:cobweb');
    

  /// [Cocoa Beans](https://minecraft.gamepedia.com/cocoa_beans)
  /// 
  /// _(minecraft:cocoa_beans)_
  static const ItemType cocoa_beans = const ItemType('minecraft:cocoa_beans');
    

  /// [Raw Cod](https://minecraft.gamepedia.com/cod)
  /// 
  /// _(minecraft:cod)_
  static const ItemType cod = const ItemType('minecraft:cod');
    

  /// [Bucket of Cod](https://minecraft.gamepedia.com/cod_bucket)
  /// 
  /// _(minecraft:cod_bucket)_
  static const ItemType cod_bucket = const ItemType('minecraft:cod_bucket');
    

  /// [Cod Spawn Egg](https://minecraft.gamepedia.com/cod_spawn_egg)
  /// 
  /// _(minecraft:cod_spawn_egg)_
  static const ItemType cod_spawn_egg = const ItemType('minecraft:cod_spawn_egg');
    

  /// [Command Block](https://minecraft.gamepedia.com/command_block)
  /// 
  /// _(minecraft:command_block)_
  static const ItemType command_block = const ItemType('minecraft:command_block');
    

  /// [Minecart with Command Block](https://minecraft.gamepedia.com/command_block_minecart)
  /// 
  /// _(minecraft:command_block_minecart)_
  static const ItemType command_block_minecart = const ItemType('minecraft:command_block_minecart');
    

  /// [Redstone Comparator](https://minecraft.gamepedia.com/comparator)
  /// 
  /// _(minecraft:comparator)_
  static const ItemType comparator = const ItemType('minecraft:comparator');
    

  /// [Compass](https://minecraft.gamepedia.com/compass)
  /// 
  /// _(minecraft:compass)_
  static const ItemType compass = const ItemType('minecraft:compass');
    

  /// [Composter](https://minecraft.gamepedia.com/composter)
  /// 
  /// _(minecraft:composter)_
  static const ItemType composter = const ItemType('minecraft:composter');
    

  /// [Conduit](https://minecraft.gamepedia.com/conduit)
  /// 
  /// _(minecraft:conduit)_
  static const ItemType conduit = const ItemType('minecraft:conduit');
    

  /// [Steak](https://minecraft.gamepedia.com/cooked_beef)
  /// 
  /// _(minecraft:cooked_beef)_
  static const ItemType cooked_beef = const ItemType('minecraft:cooked_beef');
    

  /// [Cooked Chicken](https://minecraft.gamepedia.com/cooked_chicken)
  /// 
  /// _(minecraft:cooked_chicken)_
  static const ItemType cooked_chicken = const ItemType('minecraft:cooked_chicken');
    

  /// [Cooked Cod](https://minecraft.gamepedia.com/cooked_cod)
  /// 
  /// _(minecraft:cooked_cod)_
  static const ItemType cooked_cod = const ItemType('minecraft:cooked_cod');
    

  /// [Cooked Mutton](https://minecraft.gamepedia.com/cooked_mutton)
  /// 
  /// _(minecraft:cooked_mutton)_
  static const ItemType cooked_mutton = const ItemType('minecraft:cooked_mutton');
    

  /// [Cooked Porkchop](https://minecraft.gamepedia.com/cooked_porkchop)
  /// 
  /// _(minecraft:cooked_porkchop)_
  static const ItemType cooked_porkchop = const ItemType('minecraft:cooked_porkchop');
    

  /// [Cooked Rabbit](https://minecraft.gamepedia.com/cooked_rabbit)
  /// 
  /// _(minecraft:cooked_rabbit)_
  static const ItemType cooked_rabbit = const ItemType('minecraft:cooked_rabbit');
    

  /// [Cooked Salmon](https://minecraft.gamepedia.com/cooked_salmon)
  /// 
  /// _(minecraft:cooked_salmon)_
  static const ItemType cooked_salmon = const ItemType('minecraft:cooked_salmon');
    

  /// [Cookie](https://minecraft.gamepedia.com/cookie)
  /// 
  /// _(minecraft:cookie)_
  static const ItemType cookie = const ItemType('minecraft:cookie');
    

  /// [Cornflower](https://minecraft.gamepedia.com/cornflower)
  /// 
  /// _(minecraft:cornflower)_
  static const ItemType cornflower = const ItemType('minecraft:cornflower');
    

  /// [Cow Spawn Egg](https://minecraft.gamepedia.com/cow_spawn_egg)
  /// 
  /// _(minecraft:cow_spawn_egg)_
  static const ItemType cow_spawn_egg = const ItemType('minecraft:cow_spawn_egg');
    

  /// [Cracked Stone Bricks](https://minecraft.gamepedia.com/cracked_stone_bricks)
  /// 
  /// _(minecraft:cracked_stone_bricks)_
  static const ItemType cracked_stone_bricks = const ItemType('minecraft:cracked_stone_bricks');
    

  /// [Crafting Table](https://minecraft.gamepedia.com/crafting_table)
  /// 
  /// _(minecraft:crafting_table)_
  static const ItemType crafting_table = const ItemType('minecraft:crafting_table');
    

  /// [Creeper Charge Banner Pattern](https://minecraft.gamepedia.com/creeper_banner_pattern)
  /// 
  /// _(minecraft:creeper_banner_pattern)_
  static const ItemType creeper_banner_pattern = const ItemType('minecraft:creeper_banner_pattern');
    

  /// [Creeper Head](https://minecraft.gamepedia.com/creeper_head)
  /// 
  /// _(minecraft:creeper_head)_
  static const ItemType creeper_head = const ItemType('minecraft:creeper_head');
    

  /// [Creeper Spawn Egg](https://minecraft.gamepedia.com/creeper_spawn_egg)
  /// 
  /// _(minecraft:creeper_spawn_egg)_
  static const ItemType creeper_spawn_egg = const ItemType('minecraft:creeper_spawn_egg');
    

  /// [Crossbow](https://minecraft.gamepedia.com/crossbow)
  /// 
  /// _(minecraft:crossbow)_
  static const ItemType crossbow = const ItemType('minecraft:crossbow');
    

  /// [Cut Red Sandstone](https://minecraft.gamepedia.com/cut_red_sandstone)
  /// 
  /// _(minecraft:cut_red_sandstone)_
  static const ItemType cut_red_sandstone = const ItemType('minecraft:cut_red_sandstone');
    

  /// [Cut Red Sandstone Slab](https://minecraft.gamepedia.com/cut_red_sandstone_slab)
  /// 
  /// _(minecraft:cut_red_sandstone_slab)_
  static const ItemType cut_red_sandstone_slab = const ItemType('minecraft:cut_red_sandstone_slab');
    

  /// [Cut Sandstone](https://minecraft.gamepedia.com/cut_sandstone)
  /// 
  /// _(minecraft:cut_sandstone)_
  static const ItemType cut_sandstone = const ItemType('minecraft:cut_sandstone');
    

  /// [Cut Sandstone Slab](https://minecraft.gamepedia.com/cut_sandstone_slab)
  /// 
  /// _(minecraft:cut_sandstone_slab)_
  static const ItemType cut_sandstone_slab = const ItemType('minecraft:cut_sandstone_slab');
    

  /// [Cyan Banner](https://minecraft.gamepedia.com/cyan_banner)
  /// 
  /// _(minecraft:cyan_banner)_
  static const ItemType cyan_banner = const ItemType('minecraft:cyan_banner');
    

  /// [Cyan Bed](https://minecraft.gamepedia.com/cyan_bed)
  /// 
  /// _(minecraft:cyan_bed)_
  static const ItemType cyan_bed = const ItemType('minecraft:cyan_bed');
    

  /// [Cyan Carpet](https://minecraft.gamepedia.com/cyan_carpet)
  /// 
  /// _(minecraft:cyan_carpet)_
  static const ItemType cyan_carpet = const ItemType('minecraft:cyan_carpet');
    

  /// [Cyan Concrete](https://minecraft.gamepedia.com/cyan_concrete)
  /// 
  /// _(minecraft:cyan_concrete)_
  static const ItemType cyan_concrete = const ItemType('minecraft:cyan_concrete');
    

  /// [Cyan Concrete Powder](https://minecraft.gamepedia.com/cyan_concrete_powder)
  /// 
  /// _(minecraft:cyan_concrete_powder)_
  static const ItemType cyan_concrete_powder = const ItemType('minecraft:cyan_concrete_powder');
    

  /// [Cyan Dye](https://minecraft.gamepedia.com/cyan_dye)
  /// 
  /// _(minecraft:cyan_dye)_
  static const ItemType cyan_dye = const ItemType('minecraft:cyan_dye');
    

  /// [Cyan Glazed Terracotta](https://minecraft.gamepedia.com/cyan_glazed_terracotta)
  /// 
  /// _(minecraft:cyan_glazed_terracotta)_
  static const ItemType cyan_glazed_terracotta = const ItemType('minecraft:cyan_glazed_terracotta');
    

  /// [Cyan Shulker Box](https://minecraft.gamepedia.com/cyan_shulker_box)
  /// 
  /// _(minecraft:cyan_shulker_box)_
  static const ItemType cyan_shulker_box = const ItemType('minecraft:cyan_shulker_box');
    

  /// [Cyan Stained Glass](https://minecraft.gamepedia.com/cyan_stained_glass)
  /// 
  /// _(minecraft:cyan_stained_glass)_
  static const ItemType cyan_stained_glass = const ItemType('minecraft:cyan_stained_glass');
    

  /// [Cyan Stained Glass Pane](https://minecraft.gamepedia.com/cyan_stained_glass_pane)
  /// 
  /// _(minecraft:cyan_stained_glass_pane)_
  static const ItemType cyan_stained_glass_pane = const ItemType('minecraft:cyan_stained_glass_pane');
    

  /// [Cyan Terracotta](https://minecraft.gamepedia.com/cyan_terracotta)
  /// 
  /// _(minecraft:cyan_terracotta)_
  static const ItemType cyan_terracotta = const ItemType('minecraft:cyan_terracotta');
    

  /// [Cyan Wool](https://minecraft.gamepedia.com/cyan_wool)
  /// 
  /// _(minecraft:cyan_wool)_
  static const ItemType cyan_wool = const ItemType('minecraft:cyan_wool');
    

  /// [Very Damaged Anvil](https://minecraft.gamepedia.com/damaged_anvil)
  /// 
  /// _(minecraft:damaged_anvil)_
  static const ItemType damaged_anvil = const ItemType('minecraft:damaged_anvil');
    

  /// [Dandelion](https://minecraft.gamepedia.com/dandelion)
  /// 
  /// _(minecraft:dandelion)_
  static const ItemType dandelion = const ItemType('minecraft:dandelion');
    

  /// [Dark Oak Boat](https://minecraft.gamepedia.com/dark_oak_boat)
  /// 
  /// _(minecraft:dark_oak_boat)_
  static const ItemType dark_oak_boat = const ItemType('minecraft:dark_oak_boat');
    

  /// [Dark Oak Button](https://minecraft.gamepedia.com/dark_oak_button)
  /// 
  /// _(minecraft:dark_oak_button)_
  static const ItemType dark_oak_button = const ItemType('minecraft:dark_oak_button');
    

  /// [Dark Oak Door](https://minecraft.gamepedia.com/dark_oak_door)
  /// 
  /// _(minecraft:dark_oak_door)_
  static const ItemType dark_oak_door = const ItemType('minecraft:dark_oak_door');
    

  /// [Dark Oak Fence](https://minecraft.gamepedia.com/dark_oak_fence)
  /// 
  /// _(minecraft:dark_oak_fence)_
  static const ItemType dark_oak_fence = const ItemType('minecraft:dark_oak_fence');
    

  /// [Dark Oak Fence Gate](https://minecraft.gamepedia.com/dark_oak_fence_gate)
  /// 
  /// _(minecraft:dark_oak_fence_gate)_
  static const ItemType dark_oak_fence_gate = const ItemType('minecraft:dark_oak_fence_gate');
    

  /// [Dark Oak Leaves](https://minecraft.gamepedia.com/dark_oak_leaves)
  /// 
  /// _(minecraft:dark_oak_leaves)_
  static const ItemType dark_oak_leaves = const ItemType('minecraft:dark_oak_leaves');
    

  /// [Dark Oak Log](https://minecraft.gamepedia.com/dark_oak_log)
  /// 
  /// _(minecraft:dark_oak_log)_
  static const ItemType dark_oak_log = const ItemType('minecraft:dark_oak_log');
    

  /// [Dark Oak Wood Plank](https://minecraft.gamepedia.com/dark_oak_planks)
  /// 
  /// _(minecraft:dark_oak_planks)_
  static const ItemType dark_oak_planks = const ItemType('minecraft:dark_oak_planks');
    

  /// [Dark Oak Pressure Plate](https://minecraft.gamepedia.com/dark_oak_pressure_plate)
  /// 
  /// _(minecraft:dark_oak_pressure_plate)_
  static const ItemType dark_oak_pressure_plate = const ItemType('minecraft:dark_oak_pressure_plate');
    

  /// [Dark Oak Sapling](https://minecraft.gamepedia.com/dark_oak_sapling)
  /// 
  /// _(minecraft:dark_oak_sapling)_
  static const ItemType dark_oak_sapling = const ItemType('minecraft:dark_oak_sapling');
    

  /// [Dark Oak Sign](https://minecraft.gamepedia.com/dark_oak_sign)
  /// 
  /// _(minecraft:dark_oak_sign)_
  static const ItemType dark_oak_sign = const ItemType('minecraft:dark_oak_sign');
    

  /// [Dark Oak Wood Slab](https://minecraft.gamepedia.com/dark_oak_slab)
  /// 
  /// _(minecraft:dark_oak_slab)_
  static const ItemType dark_oak_slab = const ItemType('minecraft:dark_oak_slab');
    

  /// [Dark Oak Wood Stairs](https://minecraft.gamepedia.com/dark_oak_stairs)
  /// 
  /// _(minecraft:dark_oak_stairs)_
  static const ItemType dark_oak_stairs = const ItemType('minecraft:dark_oak_stairs');
    

  /// [Dark Oak Trapdoor](https://minecraft.gamepedia.com/dark_oak_trapdoor)
  /// 
  /// _(minecraft:dark_oak_trapdoor)_
  static const ItemType dark_oak_trapdoor = const ItemType('minecraft:dark_oak_trapdoor');
    

  /// [Dark Oak Wood with Bark](https://minecraft.gamepedia.com/dark_oak_wood)
  /// 
  /// _(minecraft:dark_oak_wood)_
  static const ItemType dark_oak_wood = const ItemType('minecraft:dark_oak_wood');
    

  /// [Dark Prismarine](https://minecraft.gamepedia.com/dark_prismarine)
  /// 
  /// _(minecraft:dark_prismarine)_
  static const ItemType dark_prismarine = const ItemType('minecraft:dark_prismarine');
    

  /// [Dark Prismarine Slab](https://minecraft.gamepedia.com/dark_prismarine_slab)
  /// 
  /// _(minecraft:dark_prismarine_slab)_
  static const ItemType dark_prismarine_slab = const ItemType('minecraft:dark_prismarine_slab');
    

  /// [Dark Prismarine Stairs](https://minecraft.gamepedia.com/dark_prismarine_stairs)
  /// 
  /// _(minecraft:dark_prismarine_stairs)_
  static const ItemType dark_prismarine_stairs = const ItemType('minecraft:dark_prismarine_stairs');
    

  /// [Daylight Sensor](https://minecraft.gamepedia.com/daylight_detector)
  /// 
  /// _(minecraft:daylight_detector)_
  static const ItemType daylight_detector = const ItemType('minecraft:daylight_detector');
    

  /// [](https://minecraft.gamepedia.com/dead_brain_coral)
  /// 
  /// _(minecraft:dead_brain_coral)_
  static const ItemType dead_brain_coral = const ItemType('minecraft:dead_brain_coral');
    

  /// [Dead Brain Coral Block](https://minecraft.gamepedia.com/dead_brain_coral_block)
  /// 
  /// _(minecraft:dead_brain_coral_block)_
  static const ItemType dead_brain_coral_block = const ItemType('minecraft:dead_brain_coral_block');
    

  /// [](https://minecraft.gamepedia.com/dead_brain_coral_fan)
  /// 
  /// _(minecraft:dead_brain_coral_fan)_
  static const ItemType dead_brain_coral_fan = const ItemType('minecraft:dead_brain_coral_fan');
    

  /// [](https://minecraft.gamepedia.com/dead_bubble_coral)
  /// 
  /// _(minecraft:dead_bubble_coral)_
  static const ItemType dead_bubble_coral = const ItemType('minecraft:dead_bubble_coral');
    

  /// [Dead Bubble Coral Block](https://minecraft.gamepedia.com/dead_bubble_coral_block)
  /// 
  /// _(minecraft:dead_bubble_coral_block)_
  static const ItemType dead_bubble_coral_block = const ItemType('minecraft:dead_bubble_coral_block');
    

  /// [](https://minecraft.gamepedia.com/dead_bubble_coral_fan)
  /// 
  /// _(minecraft:dead_bubble_coral_fan)_
  static const ItemType dead_bubble_coral_fan = const ItemType('minecraft:dead_bubble_coral_fan');
    

  /// [Dead Bush](https://minecraft.gamepedia.com/dead_bush)
  /// 
  /// _(minecraft:dead_bush)_
  static const ItemType dead_bush = const ItemType('minecraft:dead_bush');
    

  /// [](https://minecraft.gamepedia.com/dead_fire_coral)
  /// 
  /// _(minecraft:dead_fire_coral)_
  static const ItemType dead_fire_coral = const ItemType('minecraft:dead_fire_coral');
    

  /// [Dead Fire Coral Block](https://minecraft.gamepedia.com/dead_fire_coral_block)
  /// 
  /// _(minecraft:dead_fire_coral_block)_
  static const ItemType dead_fire_coral_block = const ItemType('minecraft:dead_fire_coral_block');
    

  /// [](https://minecraft.gamepedia.com/dead_fire_coral_fan)
  /// 
  /// _(minecraft:dead_fire_coral_fan)_
  static const ItemType dead_fire_coral_fan = const ItemType('minecraft:dead_fire_coral_fan');
    

  /// [](https://minecraft.gamepedia.com/dead_horn_coral)
  /// 
  /// _(minecraft:dead_horn_coral)_
  static const ItemType dead_horn_coral = const ItemType('minecraft:dead_horn_coral');
    

  /// [Dead Horn Coral Block](https://minecraft.gamepedia.com/dead_horn_coral_block)
  /// 
  /// _(minecraft:dead_horn_coral_block)_
  static const ItemType dead_horn_coral_block = const ItemType('minecraft:dead_horn_coral_block');
    

  /// [](https://minecraft.gamepedia.com/dead_horn_coral_fan)
  /// 
  /// _(minecraft:dead_horn_coral_fan)_
  static const ItemType dead_horn_coral_fan = const ItemType('minecraft:dead_horn_coral_fan');
    

  /// [](https://minecraft.gamepedia.com/dead_tube_coral)
  /// 
  /// _(minecraft:dead_tube_coral)_
  static const ItemType dead_tube_coral = const ItemType('minecraft:dead_tube_coral');
    

  /// [Dead Tube Coral Block](https://minecraft.gamepedia.com/dead_tube_coral_block)
  /// 
  /// _(minecraft:dead_tube_coral_block)_
  static const ItemType dead_tube_coral_block = const ItemType('minecraft:dead_tube_coral_block');
    

  /// [](https://minecraft.gamepedia.com/dead_tube_coral_fan)
  /// 
  /// _(minecraft:dead_tube_coral_fan)_
  static const ItemType dead_tube_coral_fan = const ItemType('minecraft:dead_tube_coral_fan');
    

  /// [Detector Rails](https://minecraft.gamepedia.com/detector_rail)
  /// 
  /// _(minecraft:detector_rail)_
  static const ItemType detector_rail = const ItemType('minecraft:detector_rail');
    

  /// [Diamond](https://minecraft.gamepedia.com/diamond)
  /// 
  /// _(minecraft:diamond)_
  static const ItemType diamond = const ItemType('minecraft:diamond');
    

  /// [Diamond Axe](https://minecraft.gamepedia.com/diamond_axe)
  /// 
  /// _(minecraft:diamond_axe)_
  static const ItemType diamond_axe = const ItemType('minecraft:diamond_axe');
    

  /// [Block of Diamond](https://minecraft.gamepedia.com/diamond_block)
  /// 
  /// _(minecraft:diamond_block)_
  static const ItemType diamond_block = const ItemType('minecraft:diamond_block');
    

  /// [Diamond Boots](https://minecraft.gamepedia.com/diamond_boots)
  /// 
  /// _(minecraft:diamond_boots)_
  static const ItemType diamond_boots = const ItemType('minecraft:diamond_boots');
    

  /// [Diamond Chestplate](https://minecraft.gamepedia.com/diamond_chestplate)
  /// 
  /// _(minecraft:diamond_chestplate)_
  static const ItemType diamond_chestplate = const ItemType('minecraft:diamond_chestplate');
    

  /// [Diamond Helmet](https://minecraft.gamepedia.com/diamond_helmet)
  /// 
  /// _(minecraft:diamond_helmet)_
  static const ItemType diamond_helmet = const ItemType('minecraft:diamond_helmet');
    

  /// [Diamond Hoe](https://minecraft.gamepedia.com/diamond_hoe)
  /// 
  /// _(minecraft:diamond_hoe)_
  static const ItemType diamond_hoe = const ItemType('minecraft:diamond_hoe');
    

  /// [Diamond Horse Armor](https://minecraft.gamepedia.com/diamond_horse_armor)
  /// 
  /// _(minecraft:diamond_horse_armor)_
  static const ItemType diamond_horse_armor = const ItemType('minecraft:diamond_horse_armor');
    

  /// [Diamond Leggings](https://minecraft.gamepedia.com/diamond_leggings)
  /// 
  /// _(minecraft:diamond_leggings)_
  static const ItemType diamond_leggings = const ItemType('minecraft:diamond_leggings');
    

  /// [Diamond Ore](https://minecraft.gamepedia.com/diamond_ore)
  /// 
  /// _(minecraft:diamond_ore)_
  static const ItemType diamond_ore = const ItemType('minecraft:diamond_ore');
    

  /// [Diamond Pickaxe](https://minecraft.gamepedia.com/diamond_pickaxe)
  /// 
  /// _(minecraft:diamond_pickaxe)_
  static const ItemType diamond_pickaxe = const ItemType('minecraft:diamond_pickaxe');
    

  /// [Diamond Shovel](https://minecraft.gamepedia.com/diamond_shovel)
  /// 
  /// _(minecraft:diamond_shovel)_
  static const ItemType diamond_shovel = const ItemType('minecraft:diamond_shovel');
    

  /// [Diamond Sword](https://minecraft.gamepedia.com/diamond_sword)
  /// 
  /// _(minecraft:diamond_sword)_
  static const ItemType diamond_sword = const ItemType('minecraft:diamond_sword');
    

  /// [Diorite](https://minecraft.gamepedia.com/diorite)
  /// 
  /// _(minecraft:diorite)_
  static const ItemType diorite = const ItemType('minecraft:diorite');
    

  /// [Diorite Slab](https://minecraft.gamepedia.com/diorite_slab)
  /// 
  /// _(minecraft:diorite_slab)_
  static const ItemType diorite_slab = const ItemType('minecraft:diorite_slab');
    

  /// [Diorite Stairs](https://minecraft.gamepedia.com/diorite_stairs)
  /// 
  /// _(minecraft:diorite_stairs)_
  static const ItemType diorite_stairs = const ItemType('minecraft:diorite_stairs');
    

  /// [Diorite Wall](https://minecraft.gamepedia.com/diorite_wall)
  /// 
  /// _(minecraft:diorite_wall)_
  static const ItemType diorite_wall = const ItemType('minecraft:diorite_wall');
    

  /// [Dirt](https://minecraft.gamepedia.com/dirt)
  /// 
  /// _(minecraft:dirt)_
  static const ItemType dirt = const ItemType('minecraft:dirt');
    

  /// [Dispenser](https://minecraft.gamepedia.com/dispenser)
  /// 
  /// _(minecraft:dispenser)_
  static const ItemType dispenser = const ItemType('minecraft:dispenser');
    

  /// [Dolphin Spawn Egg](https://minecraft.gamepedia.com/dolphin_spawn_egg)
  /// 
  /// _(minecraft:dolphin_spawn_egg)_
  static const ItemType dolphin_spawn_egg = const ItemType('minecraft:dolphin_spawn_egg');
    

  /// [Donkey Spawn Egg](https://minecraft.gamepedia.com/donkey_spawn_egg)
  /// 
  /// _(minecraft:donkey_spawn_egg)_
  static const ItemType donkey_spawn_egg = const ItemType('minecraft:donkey_spawn_egg');
    

  /// [Dragon's Breath](https://minecraft.gamepedia.com/dragon_breath)
  /// 
  /// _(minecraft:dragon_breath)_
  static const ItemType dragon_breath = const ItemType('minecraft:dragon_breath');
    

  /// [Dragon Egg](https://minecraft.gamepedia.com/dragon_egg)
  /// 
  /// _(minecraft:dragon_egg)_
  static const ItemType dragon_egg = const ItemType('minecraft:dragon_egg');
    

  /// [Dragon Head](https://minecraft.gamepedia.com/dragon_head)
  /// 
  /// _(minecraft:dragon_head)_
  static const ItemType dragon_head = const ItemType('minecraft:dragon_head');
    

  /// [Dried Kelp](https://minecraft.gamepedia.com/dried_kelp)
  /// 
  /// _(minecraft:dried_kelp)_
  static const ItemType dried_kelp = const ItemType('minecraft:dried_kelp');
    

  /// [Dried Kelp Block](https://minecraft.gamepedia.com/dried_kelp_block)
  /// 
  /// _(minecraft:dried_kelp_block)_
  static const ItemType dried_kelp_block = const ItemType('minecraft:dried_kelp_block');
    

  /// [Dropper](https://minecraft.gamepedia.com/dropper)
  /// 
  /// _(minecraft:dropper)_
  static const ItemType dropper = const ItemType('minecraft:dropper');
    

  /// [Drowned Spawn Egg](https://minecraft.gamepedia.com/drowned_spawn_egg)
  /// 
  /// _(minecraft:drowned_spawn_egg)_
  static const ItemType drowned_spawn_egg = const ItemType('minecraft:drowned_spawn_egg');
    

  /// [Egg](https://minecraft.gamepedia.com/egg)
  /// 
  /// _(minecraft:egg)_
  static const ItemType egg = const ItemType('minecraft:egg');
    

  /// [Elder Guardian Spawn Egg](https://minecraft.gamepedia.com/elder_guardian_spawn_egg)
  /// 
  /// _(minecraft:elder_guardian_spawn_egg)_
  static const ItemType elder_guardian_spawn_egg = const ItemType('minecraft:elder_guardian_spawn_egg');
    

  /// [Elytra](https://minecraft.gamepedia.com/elytra)
  /// 
  /// _(minecraft:elytra)_
  static const ItemType elytra = const ItemType('minecraft:elytra');
    

  /// [Emerald](https://minecraft.gamepedia.com/emerald)
  /// 
  /// _(minecraft:emerald)_
  static const ItemType emerald = const ItemType('minecraft:emerald');
    

  /// [Block of Emerald](https://minecraft.gamepedia.com/emerald_block)
  /// 
  /// _(minecraft:emerald_block)_
  static const ItemType emerald_block = const ItemType('minecraft:emerald_block');
    

  /// [Emerald Ore](https://minecraft.gamepedia.com/emerald_ore)
  /// 
  /// _(minecraft:emerald_ore)_
  static const ItemType emerald_ore = const ItemType('minecraft:emerald_ore');
    

  /// [Enchanted Book](https://minecraft.gamepedia.com/enchanted_book)
  /// 
  /// _(minecraft:enchanted_book)_
  static const ItemType enchanted_book = const ItemType('minecraft:enchanted_book');
    

  /// [Enchanted Golden Apple](https://minecraft.gamepedia.com/enchanted_golden_apple)
  /// 
  /// _(minecraft:enchanted_golden_apple)_
  static const ItemType enchanted_golden_apple = const ItemType('minecraft:enchanted_golden_apple');
    

  /// [Enchanting Table](https://minecraft.gamepedia.com/enchanting_table)
  /// 
  /// _(minecraft:enchanting_table)_
  static const ItemType enchanting_table = const ItemType('minecraft:enchanting_table');
    

  /// [End Crystal](https://minecraft.gamepedia.com/end_crystal)
  /// 
  /// _(minecraft:end_crystal)_
  static const ItemType end_crystal = const ItemType('minecraft:end_crystal');
    

  /// [End Portal Frame](https://minecraft.gamepedia.com/end_portal_frame)
  /// 
  /// _(minecraft:end_portal_frame)_
  static const ItemType end_portal_frame = const ItemType('minecraft:end_portal_frame');
    

  /// [End Rod](https://minecraft.gamepedia.com/end_rod)
  /// 
  /// _(minecraft:end_rod)_
  static const ItemType end_rod = const ItemType('minecraft:end_rod');
    

  /// [End Stone](https://minecraft.gamepedia.com/end_stone)
  /// 
  /// _(minecraft:end_stone)_
  static const ItemType end_stone = const ItemType('minecraft:end_stone');
    

  /// [End Stone Brick Slab](https://minecraft.gamepedia.com/end_stone_brick_slab)
  /// 
  /// _(minecraft:end_stone_brick_slab)_
  static const ItemType end_stone_brick_slab = const ItemType('minecraft:end_stone_brick_slab');
    

  /// [End Stone Brick Stairs](https://minecraft.gamepedia.com/end_stone_brick_stairs)
  /// 
  /// _(minecraft:end_stone_brick_stairs)_
  static const ItemType end_stone_brick_stairs = const ItemType('minecraft:end_stone_brick_stairs');
    

  /// [End Stone Brick Wall](https://minecraft.gamepedia.com/end_stone_brick_wall)
  /// 
  /// _(minecraft:end_stone_brick_wall)_
  static const ItemType end_stone_brick_wall = const ItemType('minecraft:end_stone_brick_wall');
    

  /// [End Stone Bricks](https://minecraft.gamepedia.com/end_stone_bricks)
  /// 
  /// _(minecraft:end_stone_bricks)_
  static const ItemType end_stone_bricks = const ItemType('minecraft:end_stone_bricks');
    

  /// [Ender Chest](https://minecraft.gamepedia.com/ender_chest)
  /// 
  /// _(minecraft:ender_chest)_
  static const ItemType ender_chest = const ItemType('minecraft:ender_chest');
    

  /// [Eye of Ender](https://minecraft.gamepedia.com/ender_eye)
  /// 
  /// _(minecraft:ender_eye)_
  static const ItemType ender_eye = const ItemType('minecraft:ender_eye');
    

  /// [Ender Pearl](https://minecraft.gamepedia.com/ender_pearl)
  /// 
  /// _(minecraft:ender_pearl)_
  static const ItemType ender_pearl = const ItemType('minecraft:ender_pearl');
    

  /// [Enderman Spawn Egg](https://minecraft.gamepedia.com/enderman_spawn_egg)
  /// 
  /// _(minecraft:enderman_spawn_egg)_
  static const ItemType enderman_spawn_egg = const ItemType('minecraft:enderman_spawn_egg');
    

  /// [Endermite Spawn Egg](https://minecraft.gamepedia.com/endermite_spawn_egg)
  /// 
  /// _(minecraft:endermite_spawn_egg)_
  static const ItemType endermite_spawn_egg = const ItemType('minecraft:endermite_spawn_egg');
    

  /// [Evoker Spawn Egg](https://minecraft.gamepedia.com/evoker_spawn_egg)
  /// 
  /// _(minecraft:evoker_spawn_egg)_
  static const ItemType evoker_spawn_egg = const ItemType('minecraft:evoker_spawn_egg');
    

  /// [Bottle o'Enchanting](https://minecraft.gamepedia.com/experience_bottle)
  /// 
  /// _(minecraft:experience_bottle)_
  static const ItemType experience_bottle = const ItemType('minecraft:experience_bottle');
    

  /// [Farmland](https://minecraft.gamepedia.com/farmland)
  /// 
  /// _(minecraft:farmland)_
  static const ItemType farmland = const ItemType('minecraft:farmland');
    

  /// [Feather](https://minecraft.gamepedia.com/feather)
  /// 
  /// _(minecraft:feather)_
  static const ItemType feather = const ItemType('minecraft:feather');
    

  /// [Fermented Spider Eye](https://minecraft.gamepedia.com/fermented_spider_eye)
  /// 
  /// _(minecraft:fermented_spider_eye)_
  static const ItemType fermented_spider_eye = const ItemType('minecraft:fermented_spider_eye');
    

  /// [Fern](https://minecraft.gamepedia.com/fern)
  /// 
  /// _(minecraft:fern)_
  static const ItemType fern = const ItemType('minecraft:fern');
    

  /// [](https://minecraft.gamepedia.com/filled_map)
  /// 
  /// _(minecraft:filled_map)_
  static const ItemType filled_map = const ItemType('minecraft:filled_map');
    

  /// [Fire Charge](https://minecraft.gamepedia.com/fire_charge)
  /// 
  /// _(minecraft:fire_charge)_
  static const ItemType fire_charge = const ItemType('minecraft:fire_charge');
    

  /// [Fire Coral](https://minecraft.gamepedia.com/fire_coral)
  /// 
  /// _(minecraft:fire_coral)_
  static const ItemType fire_coral = const ItemType('minecraft:fire_coral');
    

  /// [Fire Coral Block](https://minecraft.gamepedia.com/fire_coral_block)
  /// 
  /// _(minecraft:fire_coral_block)_
  static const ItemType fire_coral_block = const ItemType('minecraft:fire_coral_block');
    

  /// [Fire Coral Fan](https://minecraft.gamepedia.com/fire_coral_fan)
  /// 
  /// _(minecraft:fire_coral_fan)_
  static const ItemType fire_coral_fan = const ItemType('minecraft:fire_coral_fan');
    

  /// [Firework Rocket](https://minecraft.gamepedia.com/firework_rocket)
  /// 
  /// _(minecraft:firework_rocket)_
  static const ItemType firework_rocket = const ItemType('minecraft:firework_rocket');
    

  /// [](https://minecraft.gamepedia.com/firework_star)
  /// 
  /// _(minecraft:firework_star)_
  static const ItemType firework_star = const ItemType('minecraft:firework_star');
    

  /// [Fishing Rod](https://minecraft.gamepedia.com/fishing_rod)
  /// 
  /// _(minecraft:fishing_rod)_
  static const ItemType fishing_rod = const ItemType('minecraft:fishing_rod');
    

  /// [Fletching Table](https://minecraft.gamepedia.com/fletching_table)
  /// 
  /// _(minecraft:fletching_table)_
  static const ItemType fletching_table = const ItemType('minecraft:fletching_table');
    

  /// [Flint](https://minecraft.gamepedia.com/flint)
  /// 
  /// _(minecraft:flint)_
  static const ItemType flint = const ItemType('minecraft:flint');
    

  /// [Flint and Steel](https://minecraft.gamepedia.com/flint_and_steel)
  /// 
  /// _(minecraft:flint_and_steel)_
  static const ItemType flint_and_steel = const ItemType('minecraft:flint_and_steel');
    

  /// [Flower Charge Banner Pattern](https://minecraft.gamepedia.com/flower_banner_pattern)
  /// 
  /// _(minecraft:flower_banner_pattern)_
  static const ItemType flower_banner_pattern = const ItemType('minecraft:flower_banner_pattern');
    

  /// [Flower Pot](https://minecraft.gamepedia.com/flower_pot)
  /// 
  /// _(minecraft:flower_pot)_
  static const ItemType flower_pot = const ItemType('minecraft:flower_pot');
    

  /// [Fox Spawn Egg](https://minecraft.gamepedia.com/fox_spawn_egg)
  /// 
  /// _(minecraft:fox_spawn_egg)_
  static const ItemType fox_spawn_egg = const ItemType('minecraft:fox_spawn_egg');
    

  /// [Furnace](https://minecraft.gamepedia.com/furnace)
  /// 
  /// _(minecraft:furnace)_
  static const ItemType furnace = const ItemType('minecraft:furnace');
    

  /// [Minecart with Furnace](https://minecraft.gamepedia.com/furnace_minecart)
  /// 
  /// _(minecraft:furnace_minecart)_
  static const ItemType furnace_minecart = const ItemType('minecraft:furnace_minecart');
    

  /// [Ghast Spawn Egg](https://minecraft.gamepedia.com/ghast_spawn_egg)
  /// 
  /// _(minecraft:ghast_spawn_egg)_
  static const ItemType ghast_spawn_egg = const ItemType('minecraft:ghast_spawn_egg');
    

  /// [Ghast Tear](https://minecraft.gamepedia.com/ghast_tear)
  /// 
  /// _(minecraft:ghast_tear)_
  static const ItemType ghast_tear = const ItemType('minecraft:ghast_tear');
    

  /// [Glass](https://minecraft.gamepedia.com/glass)
  /// 
  /// _(minecraft:glass)_
  static const ItemType glass = const ItemType('minecraft:glass');
    

  /// [Glass Bottle](https://minecraft.gamepedia.com/glass_bottle)
  /// 
  /// _(minecraft:glass_bottle)_
  static const ItemType glass_bottle = const ItemType('minecraft:glass_bottle');
    

  /// [Glass Pane](https://minecraft.gamepedia.com/glass_pane)
  /// 
  /// _(minecraft:glass_pane)_
  static const ItemType glass_pane = const ItemType('minecraft:glass_pane');
    

  /// [Glistering Melon](https://minecraft.gamepedia.com/glistering_melon_slice)
  /// 
  /// _(minecraft:glistering_melon_slice)_
  static const ItemType glistering_melon_slice = const ItemType('minecraft:glistering_melon_slice');
    

  /// [Globe Banner Pattern](https://minecraft.gamepedia.com/globe_banner_pattern)
  /// 
  /// _(minecraft:globe_banner_pattern)_
  static const ItemType globe_banner_pattern = const ItemType('minecraft:globe_banner_pattern');
    

  /// [Glowstone](https://minecraft.gamepedia.com/glowstone)
  /// 
  /// _(minecraft:glowstone)_
  static const ItemType glowstone = const ItemType('minecraft:glowstone');
    

  /// [Glowstone Dust](https://minecraft.gamepedia.com/glowstone_dust)
  /// 
  /// _(minecraft:glowstone_dust)_
  static const ItemType glowstone_dust = const ItemType('minecraft:glowstone_dust');
    

  /// [Block of Gold](https://minecraft.gamepedia.com/gold_block)
  /// 
  /// _(minecraft:gold_block)_
  static const ItemType gold_block = const ItemType('minecraft:gold_block');
    

  /// [Gold Ingot](https://minecraft.gamepedia.com/gold_ingot)
  /// 
  /// _(minecraft:gold_ingot)_
  static const ItemType gold_ingot = const ItemType('minecraft:gold_ingot');
    

  /// [Gold Nugget](https://minecraft.gamepedia.com/gold_nugget)
  /// 
  /// _(minecraft:gold_nugget)_
  static const ItemType gold_nugget = const ItemType('minecraft:gold_nugget');
    

  /// [Gold Ore](https://minecraft.gamepedia.com/gold_ore)
  /// 
  /// _(minecraft:gold_ore)_
  static const ItemType gold_ore = const ItemType('minecraft:gold_ore');
    

  /// [Golden Apple](https://minecraft.gamepedia.com/golden_apple)
  /// 
  /// _(minecraft:golden_apple)_
  static const ItemType golden_apple = const ItemType('minecraft:golden_apple');
    

  /// [Golden Axe](https://minecraft.gamepedia.com/golden_axe)
  /// 
  /// _(minecraft:golden_axe)_
  static const ItemType golden_axe = const ItemType('minecraft:golden_axe');
    

  /// [Golden Boots](https://minecraft.gamepedia.com/golden_boots)
  /// 
  /// _(minecraft:golden_boots)_
  static const ItemType golden_boots = const ItemType('minecraft:golden_boots');
    

  /// [Golden Carrot](https://minecraft.gamepedia.com/golden_carrot)
  /// 
  /// _(minecraft:golden_carrot)_
  static const ItemType golden_carrot = const ItemType('minecraft:golden_carrot');
    

  /// [Golden Chestplate](https://minecraft.gamepedia.com/golden_chestplate)
  /// 
  /// _(minecraft:golden_chestplate)_
  static const ItemType golden_chestplate = const ItemType('minecraft:golden_chestplate');
    

  /// [Golden Helmet](https://minecraft.gamepedia.com/golden_helmet)
  /// 
  /// _(minecraft:golden_helmet)_
  static const ItemType golden_helmet = const ItemType('minecraft:golden_helmet');
    

  /// [Golden Hoe](https://minecraft.gamepedia.com/golden_hoe)
  /// 
  /// _(minecraft:golden_hoe)_
  static const ItemType golden_hoe = const ItemType('minecraft:golden_hoe');
    

  /// [Gold Horse Armor](https://minecraft.gamepedia.com/golden_horse_armor)
  /// 
  /// _(minecraft:golden_horse_armor)_
  static const ItemType golden_horse_armor = const ItemType('minecraft:golden_horse_armor');
    

  /// [Golden Leggings](https://minecraft.gamepedia.com/golden_leggings)
  /// 
  /// _(minecraft:golden_leggings)_
  static const ItemType golden_leggings = const ItemType('minecraft:golden_leggings');
    

  /// [Golden Pickaxe](https://minecraft.gamepedia.com/golden_pickaxe)
  /// 
  /// _(minecraft:golden_pickaxe)_
  static const ItemType golden_pickaxe = const ItemType('minecraft:golden_pickaxe');
    

  /// [Golden Shovel](https://minecraft.gamepedia.com/golden_shovel)
  /// 
  /// _(minecraft:golden_shovel)_
  static const ItemType golden_shovel = const ItemType('minecraft:golden_shovel');
    

  /// [Golden Sword](https://minecraft.gamepedia.com/golden_sword)
  /// 
  /// _(minecraft:golden_sword)_
  static const ItemType golden_sword = const ItemType('minecraft:golden_sword');
    

  /// [Granite](https://minecraft.gamepedia.com/granite)
  /// 
  /// _(minecraft:granite)_
  static const ItemType granite = const ItemType('minecraft:granite');
    

  /// [Granite Slab](https://minecraft.gamepedia.com/granite_slab)
  /// 
  /// _(minecraft:granite_slab)_
  static const ItemType granite_slab = const ItemType('minecraft:granite_slab');
    

  /// [Granite Stairs](https://minecraft.gamepedia.com/granite_stairs)
  /// 
  /// _(minecraft:granite_stairs)_
  static const ItemType granite_stairs = const ItemType('minecraft:granite_stairs');
    

  /// [Granite Wall](https://minecraft.gamepedia.com/granite_wall)
  /// 
  /// _(minecraft:granite_wall)_
  static const ItemType granite_wall = const ItemType('minecraft:granite_wall');
    

  /// [Grass](https://minecraft.gamepedia.com/grass)
  /// 
  /// _(minecraft:grass)_
  static const ItemType grass = const ItemType('minecraft:grass');
    

  /// [Grass Block](https://minecraft.gamepedia.com/grass_block)
  /// 
  /// _(minecraft:grass_block)_
  static const ItemType grass_block = const ItemType('minecraft:grass_block');
    

  /// [Grass Path](https://minecraft.gamepedia.com/grass_path)
  /// 
  /// _(minecraft:grass_path)_
  static const ItemType grass_path = const ItemType('minecraft:grass_path');
    

  /// [Gravel](https://minecraft.gamepedia.com/gravel)
  /// 
  /// _(minecraft:gravel)_
  static const ItemType gravel = const ItemType('minecraft:gravel');
    

  /// [Gray Banner](https://minecraft.gamepedia.com/gray_banner)
  /// 
  /// _(minecraft:gray_banner)_
  static const ItemType gray_banner = const ItemType('minecraft:gray_banner');
    

  /// [Gray Bed](https://minecraft.gamepedia.com/gray_bed)
  /// 
  /// _(minecraft:gray_bed)_
  static const ItemType gray_bed = const ItemType('minecraft:gray_bed');
    

  /// [Gray Carpet](https://minecraft.gamepedia.com/gray_carpet)
  /// 
  /// _(minecraft:gray_carpet)_
  static const ItemType gray_carpet = const ItemType('minecraft:gray_carpet');
    

  /// [Gray Concrete](https://minecraft.gamepedia.com/gray_concrete)
  /// 
  /// _(minecraft:gray_concrete)_
  static const ItemType gray_concrete = const ItemType('minecraft:gray_concrete');
    

  /// [Gray Concrete Powder](https://minecraft.gamepedia.com/gray_concrete_powder)
  /// 
  /// _(minecraft:gray_concrete_powder)_
  static const ItemType gray_concrete_powder = const ItemType('minecraft:gray_concrete_powder');
    

  /// [Gray Dye](https://minecraft.gamepedia.com/gray_dye)
  /// 
  /// _(minecraft:gray_dye)_
  static const ItemType gray_dye = const ItemType('minecraft:gray_dye');
    

  /// [Gray Glazed Terracotta](https://minecraft.gamepedia.com/gray_glazed_terracotta)
  /// 
  /// _(minecraft:gray_glazed_terracotta)_
  static const ItemType gray_glazed_terracotta = const ItemType('minecraft:gray_glazed_terracotta');
    

  /// [Gray Shulker Box](https://minecraft.gamepedia.com/gray_shulker_box)
  /// 
  /// _(minecraft:gray_shulker_box)_
  static const ItemType gray_shulker_box = const ItemType('minecraft:gray_shulker_box');
    

  /// [Gray Stained Glass](https://minecraft.gamepedia.com/gray_stained_glass)
  /// 
  /// _(minecraft:gray_stained_glass)_
  static const ItemType gray_stained_glass = const ItemType('minecraft:gray_stained_glass');
    

  /// [Gray Stained Glass Pane](https://minecraft.gamepedia.com/gray_stained_glass_pane)
  /// 
  /// _(minecraft:gray_stained_glass_pane)_
  static const ItemType gray_stained_glass_pane = const ItemType('minecraft:gray_stained_glass_pane');
    

  /// [Gray Terracotta](https://minecraft.gamepedia.com/gray_terracotta)
  /// 
  /// _(minecraft:gray_terracotta)_
  static const ItemType gray_terracotta = const ItemType('minecraft:gray_terracotta');
    

  /// [Gray Wool](https://minecraft.gamepedia.com/gray_wool)
  /// 
  /// _(minecraft:gray_wool)_
  static const ItemType gray_wool = const ItemType('minecraft:gray_wool');
    

  /// [Green Banner](https://minecraft.gamepedia.com/green_banner)
  /// 
  /// _(minecraft:green_banner)_
  static const ItemType green_banner = const ItemType('minecraft:green_banner');
    

  /// [Green Bed](https://minecraft.gamepedia.com/green_bed)
  /// 
  /// _(minecraft:green_bed)_
  static const ItemType green_bed = const ItemType('minecraft:green_bed');
    

  /// [Green Carpet](https://minecraft.gamepedia.com/green_carpet)
  /// 
  /// _(minecraft:green_carpet)_
  static const ItemType green_carpet = const ItemType('minecraft:green_carpet');
    

  /// [Green Concrete](https://minecraft.gamepedia.com/green_concrete)
  /// 
  /// _(minecraft:green_concrete)_
  static const ItemType green_concrete = const ItemType('minecraft:green_concrete');
    

  /// [Green Concrete Powder](https://minecraft.gamepedia.com/green_concrete_powder)
  /// 
  /// _(minecraft:green_concrete_powder)_
  static const ItemType green_concrete_powder = const ItemType('minecraft:green_concrete_powder');
    

  /// [Green Dye](https://minecraft.gamepedia.com/green_dye)
  /// 
  /// _(minecraft:green_dye)_
  static const ItemType green_dye = const ItemType('minecraft:green_dye');
    

  /// [Green Glazed Terracotta](https://minecraft.gamepedia.com/green_glazed_terracotta)
  /// 
  /// _(minecraft:green_glazed_terracotta)_
  static const ItemType green_glazed_terracotta = const ItemType('minecraft:green_glazed_terracotta');
    

  /// [Green Shulker Box](https://minecraft.gamepedia.com/green_shulker_box)
  /// 
  /// _(minecraft:green_shulker_box)_
  static const ItemType green_shulker_box = const ItemType('minecraft:green_shulker_box');
    

  /// [Green Stained Glass](https://minecraft.gamepedia.com/green_stained_glass)
  /// 
  /// _(minecraft:green_stained_glass)_
  static const ItemType green_stained_glass = const ItemType('minecraft:green_stained_glass');
    

  /// [Green Stained Glass Pane](https://minecraft.gamepedia.com/green_stained_glass_pane)
  /// 
  /// _(minecraft:green_stained_glass_pane)_
  static const ItemType green_stained_glass_pane = const ItemType('minecraft:green_stained_glass_pane');
    

  /// [Green Terracotta](https://minecraft.gamepedia.com/green_terracotta)
  /// 
  /// _(minecraft:green_terracotta)_
  static const ItemType green_terracotta = const ItemType('minecraft:green_terracotta');
    

  /// [Green Wool](https://minecraft.gamepedia.com/green_wool)
  /// 
  /// _(minecraft:green_wool)_
  static const ItemType green_wool = const ItemType('minecraft:green_wool');
    

  /// [Grindstone](https://minecraft.gamepedia.com/grindstone)
  /// 
  /// _(minecraft:grindstone)_
  static const ItemType grindstone = const ItemType('minecraft:grindstone');
    

  /// [Guardian Spawn Egg](https://minecraft.gamepedia.com/guardian_spawn_egg)
  /// 
  /// _(minecraft:guardian_spawn_egg)_
  static const ItemType guardian_spawn_egg = const ItemType('minecraft:guardian_spawn_egg');
    

  /// [Gunpowder](https://minecraft.gamepedia.com/gunpowder)
  /// 
  /// _(minecraft:gunpowder)_
  static const ItemType gunpowder = const ItemType('minecraft:gunpowder');
    

  /// [Hay Bale](https://minecraft.gamepedia.com/hay_block)
  /// 
  /// _(minecraft:hay_block)_
  static const ItemType hay_block = const ItemType('minecraft:hay_block');
    

  /// [Heart of the Sea](https://minecraft.gamepedia.com/heart_of_the_sea)
  /// 
  /// _(minecraft:heart_of_the_sea)_
  static const ItemType heart_of_the_sea = const ItemType('minecraft:heart_of_the_sea');
    

  /// [Heavy Weighted Pressure Plate](https://minecraft.gamepedia.com/heavy_weighted_pressure_plate)
  /// 
  /// _(minecraft:heavy_weighted_pressure_plate)_
  static const ItemType heavy_weighted_pressure_plate = const ItemType('minecraft:heavy_weighted_pressure_plate');
    

  /// [Hopper](https://minecraft.gamepedia.com/hopper)
  /// 
  /// _(minecraft:hopper)_
  static const ItemType hopper = const ItemType('minecraft:hopper');
    

  /// [Minecart with Hopper](https://minecraft.gamepedia.com/hopper_minecart)
  /// 
  /// _(minecraft:hopper_minecart)_
  static const ItemType hopper_minecart = const ItemType('minecraft:hopper_minecart');
    

  /// [Horn Coral](https://minecraft.gamepedia.com/horn_coral)
  /// 
  /// _(minecraft:horn_coral)_
  static const ItemType horn_coral = const ItemType('minecraft:horn_coral');
    

  /// [Horn Coral Block](https://minecraft.gamepedia.com/horn_coral_block)
  /// 
  /// _(minecraft:horn_coral_block)_
  static const ItemType horn_coral_block = const ItemType('minecraft:horn_coral_block');
    

  /// [Horn Coral Fan](https://minecraft.gamepedia.com/horn_coral_fan)
  /// 
  /// _(minecraft:horn_coral_fan)_
  static const ItemType horn_coral_fan = const ItemType('minecraft:horn_coral_fan');
    

  /// [Horse Spawn Egg](https://minecraft.gamepedia.com/horse_spawn_egg)
  /// 
  /// _(minecraft:horse_spawn_egg)_
  static const ItemType horse_spawn_egg = const ItemType('minecraft:horse_spawn_egg');
    

  /// [Husk Spawn Egg](https://minecraft.gamepedia.com/husk_spawn_egg)
  /// 
  /// _(minecraft:husk_spawn_egg)_
  static const ItemType husk_spawn_egg = const ItemType('minecraft:husk_spawn_egg');
    

  /// [Ice](https://minecraft.gamepedia.com/ice)
  /// 
  /// _(minecraft:ice)_
  static const ItemType ice = const ItemType('minecraft:ice');
    

  /// [Chiseled Stone Brick Monster Egg (Silverfish Chiseled Stone Brick)](https://minecraft.gamepedia.com/infested_chiseled_stone_bricks)
  /// 
  /// _(minecraft:infested_chiseled_stone_bricks)_
  static const ItemType infested_chiseled_stone_bricks = const ItemType('minecraft:infested_chiseled_stone_bricks');
    

  /// [Cobblestone Monster Egg (Silverfish Cobblestone)](https://minecraft.gamepedia.com/infested_cobblestone)
  /// 
  /// _(minecraft:infested_cobblestone)_
  static const ItemType infested_cobblestone = const ItemType('minecraft:infested_cobblestone');
    

  /// [Cracked Stone Brick Monster Egg (Silverfish Cracked Stone Brick)](https://minecraft.gamepedia.com/infested_cracked_stone_bricks)
  /// 
  /// _(minecraft:infested_cracked_stone_bricks)_
  static const ItemType infested_cracked_stone_bricks = const ItemType('minecraft:infested_cracked_stone_bricks');
    

  /// [Mossy Stone Brick Monster Egg (Silverfish Mossy Stone Brick)](https://minecraft.gamepedia.com/infested_mossy_stone_bricks)
  /// 
  /// _(minecraft:infested_mossy_stone_bricks)_
  static const ItemType infested_mossy_stone_bricks = const ItemType('minecraft:infested_mossy_stone_bricks');
    

  /// [Stone Monster Egg (Silverfish Stone)](https://minecraft.gamepedia.com/infested_stone)
  /// 
  /// _(minecraft:infested_stone)_
  static const ItemType infested_stone = const ItemType('minecraft:infested_stone');
    

  /// [Stone Brick Monster Egg (Silverfish Stone Brick)](https://minecraft.gamepedia.com/infested_stone_bricks)
  /// 
  /// _(minecraft:infested_stone_bricks)_
  static const ItemType infested_stone_bricks = const ItemType('minecraft:infested_stone_bricks');
    

  /// [Ink Sac](https://minecraft.gamepedia.com/ink_sac)
  /// 
  /// _(minecraft:ink_sac)_
  static const ItemType ink_sac = const ItemType('minecraft:ink_sac');
    

  /// [Iron Axe](https://minecraft.gamepedia.com/iron_axe)
  /// 
  /// _(minecraft:iron_axe)_
  static const ItemType iron_axe = const ItemType('minecraft:iron_axe');
    

  /// [Iron Bars](https://minecraft.gamepedia.com/iron_bars)
  /// 
  /// _(minecraft:iron_bars)_
  static const ItemType iron_bars = const ItemType('minecraft:iron_bars');
    

  /// [Block of Iron](https://minecraft.gamepedia.com/iron_block)
  /// 
  /// _(minecraft:iron_block)_
  static const ItemType iron_block = const ItemType('minecraft:iron_block');
    

  /// [Iron Boots](https://minecraft.gamepedia.com/iron_boots)
  /// 
  /// _(minecraft:iron_boots)_
  static const ItemType iron_boots = const ItemType('minecraft:iron_boots');
    

  /// [Iron Chestplate](https://minecraft.gamepedia.com/iron_chestplate)
  /// 
  /// _(minecraft:iron_chestplate)_
  static const ItemType iron_chestplate = const ItemType('minecraft:iron_chestplate');
    

  /// [Iron Door](https://minecraft.gamepedia.com/iron_door)
  /// 
  /// _(minecraft:iron_door)_
  static const ItemType iron_door = const ItemType('minecraft:iron_door');
    

  /// [Iron Helmet](https://minecraft.gamepedia.com/iron_helmet)
  /// 
  /// _(minecraft:iron_helmet)_
  static const ItemType iron_helmet = const ItemType('minecraft:iron_helmet');
    

  /// [Iron Hoe](https://minecraft.gamepedia.com/iron_hoe)
  /// 
  /// _(minecraft:iron_hoe)_
  static const ItemType iron_hoe = const ItemType('minecraft:iron_hoe');
    

  /// [Iron Horse Armor](https://minecraft.gamepedia.com/iron_horse_armor)
  /// 
  /// _(minecraft:iron_horse_armor)_
  static const ItemType iron_horse_armor = const ItemType('minecraft:iron_horse_armor');
    

  /// [Iron Ingot](https://minecraft.gamepedia.com/iron_ingot)
  /// 
  /// _(minecraft:iron_ingot)_
  static const ItemType iron_ingot = const ItemType('minecraft:iron_ingot');
    

  /// [Iron Leggings](https://minecraft.gamepedia.com/iron_leggings)
  /// 
  /// _(minecraft:iron_leggings)_
  static const ItemType iron_leggings = const ItemType('minecraft:iron_leggings');
    

  /// [Iron Nugget](https://minecraft.gamepedia.com/iron_nugget)
  /// 
  /// _(minecraft:iron_nugget)_
  static const ItemType iron_nugget = const ItemType('minecraft:iron_nugget');
    

  /// [Iron Ore](https://minecraft.gamepedia.com/iron_ore)
  /// 
  /// _(minecraft:iron_ore)_
  static const ItemType iron_ore = const ItemType('minecraft:iron_ore');
    

  /// [Iron Pickaxe](https://minecraft.gamepedia.com/iron_pickaxe)
  /// 
  /// _(minecraft:iron_pickaxe)_
  static const ItemType iron_pickaxe = const ItemType('minecraft:iron_pickaxe');
    

  /// [Iron Shovel](https://minecraft.gamepedia.com/iron_shovel)
  /// 
  /// _(minecraft:iron_shovel)_
  static const ItemType iron_shovel = const ItemType('minecraft:iron_shovel');
    

  /// [Iron Sword](https://minecraft.gamepedia.com/iron_sword)
  /// 
  /// _(minecraft:iron_sword)_
  static const ItemType iron_sword = const ItemType('minecraft:iron_sword');
    

  /// [Iron Trapdoor](https://minecraft.gamepedia.com/iron_trapdoor)
  /// 
  /// _(minecraft:iron_trapdoor)_
  static const ItemType iron_trapdoor = const ItemType('minecraft:iron_trapdoor');
    

  /// [Item Frame](https://minecraft.gamepedia.com/item_frame)
  /// 
  /// _(minecraft:item_frame)_
  static const ItemType item_frame = const ItemType('minecraft:item_frame');
    

  /// [Jack o'Lantern](https://minecraft.gamepedia.com/jack_o_lantern)
  /// 
  /// _(minecraft:jack_o_lantern)_
  static const ItemType jack_o_lantern = const ItemType('minecraft:jack_o_lantern');
    

  /// [Jukebox](https://minecraft.gamepedia.com/jukebox)
  /// 
  /// _(minecraft:jukebox)_
  static const ItemType jukebox = const ItemType('minecraft:jukebox');
    

  /// [Jungle Boat](https://minecraft.gamepedia.com/jungle_boat)
  /// 
  /// _(minecraft:jungle_boat)_
  static const ItemType jungle_boat = const ItemType('minecraft:jungle_boat');
    

  /// [Jungle Button](https://minecraft.gamepedia.com/jungle_button)
  /// 
  /// _(minecraft:jungle_button)_
  static const ItemType jungle_button = const ItemType('minecraft:jungle_button');
    

  /// [Jungle Door](https://minecraft.gamepedia.com/jungle_door)
  /// 
  /// _(minecraft:jungle_door)_
  static const ItemType jungle_door = const ItemType('minecraft:jungle_door');
    

  /// [Jungle Fence](https://minecraft.gamepedia.com/jungle_fence)
  /// 
  /// _(minecraft:jungle_fence)_
  static const ItemType jungle_fence = const ItemType('minecraft:jungle_fence');
    

  /// [Jungle Fence Gate](https://minecraft.gamepedia.com/jungle_fence_gate)
  /// 
  /// _(minecraft:jungle_fence_gate)_
  static const ItemType jungle_fence_gate = const ItemType('minecraft:jungle_fence_gate');
    

  /// [Jungle Leaves](https://minecraft.gamepedia.com/jungle_leaves)
  /// 
  /// _(minecraft:jungle_leaves)_
  static const ItemType jungle_leaves = const ItemType('minecraft:jungle_leaves');
    

  /// [Jungle Log](https://minecraft.gamepedia.com/jungle_log)
  /// 
  /// _(minecraft:jungle_log)_
  static const ItemType jungle_log = const ItemType('minecraft:jungle_log');
    

  /// [Jungle Wood Plank](https://minecraft.gamepedia.com/jungle_planks)
  /// 
  /// _(minecraft:jungle_planks)_
  static const ItemType jungle_planks = const ItemType('minecraft:jungle_planks');
    

  /// [Jungle Pressure Plate](https://minecraft.gamepedia.com/jungle_pressure_plate)
  /// 
  /// _(minecraft:jungle_pressure_plate)_
  static const ItemType jungle_pressure_plate = const ItemType('minecraft:jungle_pressure_plate');
    

  /// [Jungle Sapling](https://minecraft.gamepedia.com/jungle_sapling)
  /// 
  /// _(minecraft:jungle_sapling)_
  static const ItemType jungle_sapling = const ItemType('minecraft:jungle_sapling');
    

  /// [Jungle Sign](https://minecraft.gamepedia.com/jungle_sign)
  /// 
  /// _(minecraft:jungle_sign)_
  static const ItemType jungle_sign = const ItemType('minecraft:jungle_sign');
    

  /// [Jungle Wood Slab](https://minecraft.gamepedia.com/jungle_slab)
  /// 
  /// _(minecraft:jungle_slab)_
  static const ItemType jungle_slab = const ItemType('minecraft:jungle_slab');
    

  /// [Jungle Wood Stairs](https://minecraft.gamepedia.com/jungle_stairs)
  /// 
  /// _(minecraft:jungle_stairs)_
  static const ItemType jungle_stairs = const ItemType('minecraft:jungle_stairs');
    

  /// [Jungle Trapdoor](https://minecraft.gamepedia.com/jungle_trapdoor)
  /// 
  /// _(minecraft:jungle_trapdoor)_
  static const ItemType jungle_trapdoor = const ItemType('minecraft:jungle_trapdoor');
    

  /// [Jungle Wood with Bark](https://minecraft.gamepedia.com/jungle_wood)
  /// 
  /// _(minecraft:jungle_wood)_
  static const ItemType jungle_wood = const ItemType('minecraft:jungle_wood');
    

  /// [Kelp](https://minecraft.gamepedia.com/kelp)
  /// 
  /// _(minecraft:kelp)_
  static const ItemType kelp = const ItemType('minecraft:kelp');
    

  /// [Ladder](https://minecraft.gamepedia.com/ladder)
  /// 
  /// _(minecraft:ladder)_
  static const ItemType ladder = const ItemType('minecraft:ladder');
    

  /// [Lantern](https://minecraft.gamepedia.com/lantern)
  /// 
  /// _(minecraft:lantern)_
  static const ItemType lantern = const ItemType('minecraft:lantern');
    

  /// [Lapis Lazuli Block](https://minecraft.gamepedia.com/lapis_block)
  /// 
  /// _(minecraft:lapis_block)_
  static const ItemType lapis_block = const ItemType('minecraft:lapis_block');
    

  /// [Lapis Lazuli](https://minecraft.gamepedia.com/lapis_lazuli)
  /// 
  /// _(minecraft:lapis_lazuli)_
  static const ItemType lapis_lazuli = const ItemType('minecraft:lapis_lazuli');
    

  /// [Lapis Lazuli Ore](https://minecraft.gamepedia.com/lapis_ore)
  /// 
  /// _(minecraft:lapis_ore)_
  static const ItemType lapis_ore = const ItemType('minecraft:lapis_ore');
    

  /// [Large Fern](https://minecraft.gamepedia.com/large_fern)
  /// 
  /// _(minecraft:large_fern)_
  static const ItemType large_fern = const ItemType('minecraft:large_fern');
    

  /// [Lava Bucket](https://minecraft.gamepedia.com/lava_bucket)
  /// 
  /// _(minecraft:lava_bucket)_
  static const ItemType lava_bucket = const ItemType('minecraft:lava_bucket');
    

  /// [Lead](https://minecraft.gamepedia.com/lead)
  /// 
  /// _(minecraft:lead)_
  static const ItemType lead = const ItemType('minecraft:lead');
    

  /// [Leather](https://minecraft.gamepedia.com/leather)
  /// 
  /// _(minecraft:leather)_
  static const ItemType leather = const ItemType('minecraft:leather');
    

  /// [Leather Boots](https://minecraft.gamepedia.com/leather_boots)
  /// 
  /// _(minecraft:leather_boots)_
  static const ItemType leather_boots = const ItemType('minecraft:leather_boots');
    

  /// [Leather Tunic](https://minecraft.gamepedia.com/leather_chestplate)
  /// 
  /// _(minecraft:leather_chestplate)_
  static const ItemType leather_chestplate = const ItemType('minecraft:leather_chestplate');
    

  /// [Leather Cap](https://minecraft.gamepedia.com/leather_helmet)
  /// 
  /// _(minecraft:leather_helmet)_
  static const ItemType leather_helmet = const ItemType('minecraft:leather_helmet');
    

  /// [Leather Horse Armor](https://minecraft.gamepedia.com/leather_horse_armor)
  /// 
  /// _(minecraft:leather_horse_armor)_
  static const ItemType leather_horse_armor = const ItemType('minecraft:leather_horse_armor');
    

  /// [Leather Pants](https://minecraft.gamepedia.com/leather_leggings)
  /// 
  /// _(minecraft:leather_leggings)_
  static const ItemType leather_leggings = const ItemType('minecraft:leather_leggings');
    

  /// [Lecturn](https://minecraft.gamepedia.com/lectern)
  /// 
  /// _(minecraft:lectern)_
  static const ItemType lectern = const ItemType('minecraft:lectern');
    

  /// [Lever](https://minecraft.gamepedia.com/lever)
  /// 
  /// _(minecraft:lever)_
  static const ItemType lever = const ItemType('minecraft:lever');
    

  /// [Light Blue Banner](https://minecraft.gamepedia.com/light_blue_banner)
  /// 
  /// _(minecraft:light_blue_banner)_
  static const ItemType light_blue_banner = const ItemType('minecraft:light_blue_banner');
    

  /// [Light Blue Bed](https://minecraft.gamepedia.com/light_blue_bed)
  /// 
  /// _(minecraft:light_blue_bed)_
  static const ItemType light_blue_bed = const ItemType('minecraft:light_blue_bed');
    

  /// [Light Blue Carpet](https://minecraft.gamepedia.com/light_blue_carpet)
  /// 
  /// _(minecraft:light_blue_carpet)_
  static const ItemType light_blue_carpet = const ItemType('minecraft:light_blue_carpet');
    

  /// [Light Blue Concrete](https://minecraft.gamepedia.com/light_blue_concrete)
  /// 
  /// _(minecraft:light_blue_concrete)_
  static const ItemType light_blue_concrete = const ItemType('minecraft:light_blue_concrete');
    

  /// [Light Blue Concrete Powder](https://minecraft.gamepedia.com/light_blue_concrete_powder)
  /// 
  /// _(minecraft:light_blue_concrete_powder)_
  static const ItemType light_blue_concrete_powder = const ItemType('minecraft:light_blue_concrete_powder');
    

  /// [Light Blue Dye](https://minecraft.gamepedia.com/light_blue_dye)
  /// 
  /// _(minecraft:light_blue_dye)_
  static const ItemType light_blue_dye = const ItemType('minecraft:light_blue_dye');
    

  /// [Light Blue Glazed Terracotta](https://minecraft.gamepedia.com/light_blue_glazed_terracotta)
  /// 
  /// _(minecraft:light_blue_glazed_terracotta)_
  static const ItemType light_blue_glazed_terracotta = const ItemType('minecraft:light_blue_glazed_terracotta');
    

  /// [Light Blue Shulker Box](https://minecraft.gamepedia.com/light_blue_shulker_box)
  /// 
  /// _(minecraft:light_blue_shulker_box)_
  static const ItemType light_blue_shulker_box = const ItemType('minecraft:light_blue_shulker_box');
    

  /// [Light Blue Stained Glass](https://minecraft.gamepedia.com/light_blue_stained_glass)
  /// 
  /// _(minecraft:light_blue_stained_glass)_
  static const ItemType light_blue_stained_glass = const ItemType('minecraft:light_blue_stained_glass');
    

  /// [Light Blue Stained Glass Pane](https://minecraft.gamepedia.com/light_blue_stained_glass_pane)
  /// 
  /// _(minecraft:light_blue_stained_glass_pane)_
  static const ItemType light_blue_stained_glass_pane = const ItemType('minecraft:light_blue_stained_glass_pane');
    

  /// [Light Blue Terracotta](https://minecraft.gamepedia.com/light_blue_terracotta)
  /// 
  /// _(minecraft:light_blue_terracotta)_
  static const ItemType light_blue_terracotta = const ItemType('minecraft:light_blue_terracotta');
    

  /// [Light Blue Wool](https://minecraft.gamepedia.com/light_blue_wool)
  /// 
  /// _(minecraft:light_blue_wool)_
  static const ItemType light_blue_wool = const ItemType('minecraft:light_blue_wool');
    

  /// [Light Gray Banner](https://minecraft.gamepedia.com/light_gray_banner)
  /// 
  /// _(minecraft:light_gray_banner)_
  static const ItemType light_gray_banner = const ItemType('minecraft:light_gray_banner');
    

  /// [Light Gray Bed](https://minecraft.gamepedia.com/light_gray_bed)
  /// 
  /// _(minecraft:light_gray_bed)_
  static const ItemType light_gray_bed = const ItemType('minecraft:light_gray_bed');
    

  /// [Light Gray Carpet](https://minecraft.gamepedia.com/light_gray_carpet)
  /// 
  /// _(minecraft:light_gray_carpet)_
  static const ItemType light_gray_carpet = const ItemType('minecraft:light_gray_carpet');
    

  /// [Light Gray Concrete](https://minecraft.gamepedia.com/light_gray_concrete)
  /// 
  /// _(minecraft:light_gray_concrete)_
  static const ItemType light_gray_concrete = const ItemType('minecraft:light_gray_concrete');
    

  /// [Light Gray Concrete Powder](https://minecraft.gamepedia.com/light_gray_concrete_powder)
  /// 
  /// _(minecraft:light_gray_concrete_powder)_
  static const ItemType light_gray_concrete_powder = const ItemType('minecraft:light_gray_concrete_powder');
    

  /// [Light Gray Dye](https://minecraft.gamepedia.com/light_gray_dye)
  /// 
  /// _(minecraft:light_gray_dye)_
  static const ItemType light_gray_dye = const ItemType('minecraft:light_gray_dye');
    

  /// [Light Gray Glazed Terracotta](https://minecraft.gamepedia.com/light_gray_glazed_terracotta)
  /// 
  /// _(minecraft:light_gray_glazed_terracotta)_
  static const ItemType light_gray_glazed_terracotta = const ItemType('minecraft:light_gray_glazed_terracotta');
    

  /// [Light Gray Shulker Box](https://minecraft.gamepedia.com/light_gray_shulker_box)
  /// 
  /// _(minecraft:light_gray_shulker_box)_
  static const ItemType light_gray_shulker_box = const ItemType('minecraft:light_gray_shulker_box');
    

  /// [Light Gray Stained Glass](https://minecraft.gamepedia.com/light_gray_stained_glass)
  /// 
  /// _(minecraft:light_gray_stained_glass)_
  static const ItemType light_gray_stained_glass = const ItemType('minecraft:light_gray_stained_glass');
    

  /// [Light Gray Stained Glass Pane](https://minecraft.gamepedia.com/light_gray_stained_glass_pane)
  /// 
  /// _(minecraft:light_gray_stained_glass_pane)_
  static const ItemType light_gray_stained_glass_pane = const ItemType('minecraft:light_gray_stained_glass_pane');
    

  /// [Light Gray Terracotta](https://minecraft.gamepedia.com/light_gray_terracotta)
  /// 
  /// _(minecraft:light_gray_terracotta)_
  static const ItemType light_gray_terracotta = const ItemType('minecraft:light_gray_terracotta');
    

  /// [Light Gray Wool](https://minecraft.gamepedia.com/light_gray_wool)
  /// 
  /// _(minecraft:light_gray_wool)_
  static const ItemType light_gray_wool = const ItemType('minecraft:light_gray_wool');
    

  /// [Light Weighted Pressure Plate](https://minecraft.gamepedia.com/light_weighted_pressure_plate)
  /// 
  /// _(minecraft:light_weighted_pressure_plate)_
  static const ItemType light_weighted_pressure_plate = const ItemType('minecraft:light_weighted_pressure_plate');
    

  /// [Lilac](https://minecraft.gamepedia.com/lilac)
  /// 
  /// _(minecraft:lilac)_
  static const ItemType lilac = const ItemType('minecraft:lilac');
    

  /// [Lily of the Valley](https://minecraft.gamepedia.com/lily_of_the_valley)
  /// 
  /// _(minecraft:lily_of_the_valley)_
  static const ItemType lily_of_the_valley = const ItemType('minecraft:lily_of_the_valley');
    

  /// [Lily Pad](https://minecraft.gamepedia.com/lily_pad)
  /// 
  /// _(minecraft:lily_pad)_
  static const ItemType lily_pad = const ItemType('minecraft:lily_pad');
    

  /// [Lime Banner](https://minecraft.gamepedia.com/lime_banner)
  /// 
  /// _(minecraft:lime_banner)_
  static const ItemType lime_banner = const ItemType('minecraft:lime_banner');
    

  /// [Lime Bed](https://minecraft.gamepedia.com/lime_bed)
  /// 
  /// _(minecraft:lime_bed)_
  static const ItemType lime_bed = const ItemType('minecraft:lime_bed');
    

  /// [Lime Carpet](https://minecraft.gamepedia.com/lime_carpet)
  /// 
  /// _(minecraft:lime_carpet)_
  static const ItemType lime_carpet = const ItemType('minecraft:lime_carpet');
    

  /// [Lime Concrete](https://minecraft.gamepedia.com/lime_concrete)
  /// 
  /// _(minecraft:lime_concrete)_
  static const ItemType lime_concrete = const ItemType('minecraft:lime_concrete');
    

  /// [Lime Concrete Powder](https://minecraft.gamepedia.com/lime_concrete_powder)
  /// 
  /// _(minecraft:lime_concrete_powder)_
  static const ItemType lime_concrete_powder = const ItemType('minecraft:lime_concrete_powder');
    

  /// [Lime Dye](https://minecraft.gamepedia.com/lime_dye)
  /// 
  /// _(minecraft:lime_dye)_
  static const ItemType lime_dye = const ItemType('minecraft:lime_dye');
    

  /// [Lime Glazed Terracotta](https://minecraft.gamepedia.com/lime_glazed_terracotta)
  /// 
  /// _(minecraft:lime_glazed_terracotta)_
  static const ItemType lime_glazed_terracotta = const ItemType('minecraft:lime_glazed_terracotta');
    

  /// [Lime Shulker Box](https://minecraft.gamepedia.com/lime_shulker_box)
  /// 
  /// _(minecraft:lime_shulker_box)_
  static const ItemType lime_shulker_box = const ItemType('minecraft:lime_shulker_box');
    

  /// [Lime Stained Glass](https://minecraft.gamepedia.com/lime_stained_glass)
  /// 
  /// _(minecraft:lime_stained_glass)_
  static const ItemType lime_stained_glass = const ItemType('minecraft:lime_stained_glass');
    

  /// [Lime Stained Glass Pane](https://minecraft.gamepedia.com/lime_stained_glass_pane)
  /// 
  /// _(minecraft:lime_stained_glass_pane)_
  static const ItemType lime_stained_glass_pane = const ItemType('minecraft:lime_stained_glass_pane');
    

  /// [Lime Terracotta](https://minecraft.gamepedia.com/lime_terracotta)
  /// 
  /// _(minecraft:lime_terracotta)_
  static const ItemType lime_terracotta = const ItemType('minecraft:lime_terracotta');
    

  /// [Lime Wool](https://minecraft.gamepedia.com/lime_wool)
  /// 
  /// _(minecraft:lime_wool)_
  static const ItemType lime_wool = const ItemType('minecraft:lime_wool');
    

  /// [Lingering Potion of Fire Resistance (0:45)](https://minecraft.gamepedia.com/lingering_potion)
  /// 
  /// _(minecraft:lingering_potion)_
  static const ItemType lingering_potion = const ItemType('minecraft:lingering_potion');
    

  /// [Llama Spawn Egg](https://minecraft.gamepedia.com/llama_spawn_egg)
  /// 
  /// _(minecraft:llama_spawn_egg)_
  static const ItemType llama_spawn_egg = const ItemType('minecraft:llama_spawn_egg');
    

  /// [Loom](https://minecraft.gamepedia.com/loom)
  /// 
  /// _(minecraft:loom)_
  static const ItemType loom = const ItemType('minecraft:loom');
    

  /// [Magenta Banner](https://minecraft.gamepedia.com/magenta_banner)
  /// 
  /// _(minecraft:magenta_banner)_
  static const ItemType magenta_banner = const ItemType('minecraft:magenta_banner');
    

  /// [Magenta Bed](https://minecraft.gamepedia.com/magenta_bed)
  /// 
  /// _(minecraft:magenta_bed)_
  static const ItemType magenta_bed = const ItemType('minecraft:magenta_bed');
    

  /// [Magenta Carpet](https://minecraft.gamepedia.com/magenta_carpet)
  /// 
  /// _(minecraft:magenta_carpet)_
  static const ItemType magenta_carpet = const ItemType('minecraft:magenta_carpet');
    

  /// [Magenta Concrete](https://minecraft.gamepedia.com/magenta_concrete)
  /// 
  /// _(minecraft:magenta_concrete)_
  static const ItemType magenta_concrete = const ItemType('minecraft:magenta_concrete');
    

  /// [Magenta Concrete Powder](https://minecraft.gamepedia.com/magenta_concrete_powder)
  /// 
  /// _(minecraft:magenta_concrete_powder)_
  static const ItemType magenta_concrete_powder = const ItemType('minecraft:magenta_concrete_powder');
    

  /// [Magenta Dye](https://minecraft.gamepedia.com/magenta_dye)
  /// 
  /// _(minecraft:magenta_dye)_
  static const ItemType magenta_dye = const ItemType('minecraft:magenta_dye');
    

  /// [Magenta Glazed Terracotta](https://minecraft.gamepedia.com/magenta_glazed_terracotta)
  /// 
  /// _(minecraft:magenta_glazed_terracotta)_
  static const ItemType magenta_glazed_terracotta = const ItemType('minecraft:magenta_glazed_terracotta');
    

  /// [Magenta Shulker Box](https://minecraft.gamepedia.com/magenta_shulker_box)
  /// 
  /// _(minecraft:magenta_shulker_box)_
  static const ItemType magenta_shulker_box = const ItemType('minecraft:magenta_shulker_box');
    

  /// [Magenta Stained Glass](https://minecraft.gamepedia.com/magenta_stained_glass)
  /// 
  /// _(minecraft:magenta_stained_glass)_
  static const ItemType magenta_stained_glass = const ItemType('minecraft:magenta_stained_glass');
    

  /// [Magenta Stained Glass Pane](https://minecraft.gamepedia.com/magenta_stained_glass_pane)
  /// 
  /// _(minecraft:magenta_stained_glass_pane)_
  static const ItemType magenta_stained_glass_pane = const ItemType('minecraft:magenta_stained_glass_pane');
    

  /// [Magenta Terracotta](https://minecraft.gamepedia.com/magenta_terracotta)
  /// 
  /// _(minecraft:magenta_terracotta)_
  static const ItemType magenta_terracotta = const ItemType('minecraft:magenta_terracotta');
    

  /// [Magenta Wool](https://minecraft.gamepedia.com/magenta_wool)
  /// 
  /// _(minecraft:magenta_wool)_
  static const ItemType magenta_wool = const ItemType('minecraft:magenta_wool');
    

  /// [Magma Block](https://minecraft.gamepedia.com/magma_block)
  /// 
  /// _(minecraft:magma_block)_
  static const ItemType magma_block = const ItemType('minecraft:magma_block');
    

  /// [Magma Cream](https://minecraft.gamepedia.com/magma_cream)
  /// 
  /// _(minecraft:magma_cream)_
  static const ItemType magma_cream = const ItemType('minecraft:magma_cream');
    

  /// [Magma Cube Spawn Egg](https://minecraft.gamepedia.com/magma_cube_spawn_egg)
  /// 
  /// _(minecraft:magma_cube_spawn_egg)_
  static const ItemType magma_cube_spawn_egg = const ItemType('minecraft:magma_cube_spawn_egg');
    

  /// [Map](https://minecraft.gamepedia.com/map)
  /// 
  /// _(minecraft:map)_
  static const ItemType map = const ItemType('minecraft:map');
    

  /// [Block of Melon](https://minecraft.gamepedia.com/melon)
  /// 
  /// _(minecraft:melon)_
  static const ItemType melon = const ItemType('minecraft:melon');
    

  /// [Melon Seeds](https://minecraft.gamepedia.com/melon_seeds)
  /// 
  /// _(minecraft:melon_seeds)_
  static const ItemType melon_seeds = const ItemType('minecraft:melon_seeds');
    

  /// [Melon Slice](https://minecraft.gamepedia.com/melon_slice)
  /// 
  /// _(minecraft:melon_slice)_
  static const ItemType melon_slice = const ItemType('minecraft:melon_slice');
    

  /// [Milk](https://minecraft.gamepedia.com/milk_bucket)
  /// 
  /// _(minecraft:milk_bucket)_
  static const ItemType milk_bucket = const ItemType('minecraft:milk_bucket');
    

  /// [Minecart](https://minecraft.gamepedia.com/minecart)
  /// 
  /// _(minecraft:minecart)_
  static const ItemType minecart = const ItemType('minecraft:minecart');
    

  /// [Thing Banner Pattern](https://minecraft.gamepedia.com/mojang_banner_pattern)
  /// 
  /// _(minecraft:mojang_banner_pattern)_
  static const ItemType mojang_banner_pattern = const ItemType('minecraft:mojang_banner_pattern');
    

  /// [Mooshroom Spawn Egg](https://minecraft.gamepedia.com/mooshroom_spawn_egg)
  /// 
  /// _(minecraft:mooshroom_spawn_egg)_
  static const ItemType mooshroom_spawn_egg = const ItemType('minecraft:mooshroom_spawn_egg');
    

  /// [Mossy Cobblestone](https://minecraft.gamepedia.com/mossy_cobblestone)
  /// 
  /// _(minecraft:mossy_cobblestone)_
  static const ItemType mossy_cobblestone = const ItemType('minecraft:mossy_cobblestone');
    

  /// [Mossy Cobblestone Slab](https://minecraft.gamepedia.com/mossy_cobblestone_slab)
  /// 
  /// _(minecraft:mossy_cobblestone_slab)_
  static const ItemType mossy_cobblestone_slab = const ItemType('minecraft:mossy_cobblestone_slab');
    

  /// [Mossy Cobblestone Stairs](https://minecraft.gamepedia.com/mossy_cobblestone_stairs)
  /// 
  /// _(minecraft:mossy_cobblestone_stairs)_
  static const ItemType mossy_cobblestone_stairs = const ItemType('minecraft:mossy_cobblestone_stairs');
    

  /// [Mossy Cobblestone Wall](https://minecraft.gamepedia.com/mossy_cobblestone_wall)
  /// 
  /// _(minecraft:mossy_cobblestone_wall)_
  static const ItemType mossy_cobblestone_wall = const ItemType('minecraft:mossy_cobblestone_wall');
    

  /// [Mossy Stone Brick Slab](https://minecraft.gamepedia.com/mossy_stone_brick_slab)
  /// 
  /// _(minecraft:mossy_stone_brick_slab)_
  static const ItemType mossy_stone_brick_slab = const ItemType('minecraft:mossy_stone_brick_slab');
    

  /// [Mossy Stone Brick Stairs](https://minecraft.gamepedia.com/mossy_stone_brick_stairs)
  /// 
  /// _(minecraft:mossy_stone_brick_stairs)_
  static const ItemType mossy_stone_brick_stairs = const ItemType('minecraft:mossy_stone_brick_stairs');
    

  /// [Mossy Stone Brick Wall](https://minecraft.gamepedia.com/mossy_stone_brick_wall)
  /// 
  /// _(minecraft:mossy_stone_brick_wall)_
  static const ItemType mossy_stone_brick_wall = const ItemType('minecraft:mossy_stone_brick_wall');
    

  /// [Mossy Stone Bricks](https://minecraft.gamepedia.com/mossy_stone_bricks)
  /// 
  /// _(minecraft:mossy_stone_bricks)_
  static const ItemType mossy_stone_bricks = const ItemType('minecraft:mossy_stone_bricks');
    

  /// [Mule Spawn Egg](https://minecraft.gamepedia.com/mule_spawn_egg)
  /// 
  /// _(minecraft:mule_spawn_egg)_
  static const ItemType mule_spawn_egg = const ItemType('minecraft:mule_spawn_egg');
    

  /// [Mushroom Stem](https://minecraft.gamepedia.com/mushroom_stem)
  /// 
  /// _(minecraft:mushroom_stem)_
  static const ItemType mushroom_stem = const ItemType('minecraft:mushroom_stem');
    

  /// [Mushroom Stew](https://minecraft.gamepedia.com/mushroom_stew)
  /// 
  /// _(minecraft:mushroom_stew)_
  static const ItemType mushroom_stew = const ItemType('minecraft:mushroom_stew');
    

  /// [Music Disc (C418 - 11)](https://minecraft.gamepedia.com/music_disc_11)
  /// 
  /// _(minecraft:music_disc_11)_
  static const ItemType music_disc_11 = const ItemType('minecraft:music_disc_11');
    

  /// [Music Disc (C418 - 13)](https://minecraft.gamepedia.com/music_disc_13)
  /// 
  /// _(minecraft:music_disc_13)_
  static const ItemType music_disc_13 = const ItemType('minecraft:music_disc_13');
    

  /// [Music Disc (C418 - blocks)](https://minecraft.gamepedia.com/music_disc_blocks)
  /// 
  /// _(minecraft:music_disc_blocks)_
  static const ItemType music_disc_blocks = const ItemType('minecraft:music_disc_blocks');
    

  /// [Music Disc (C418 - cat)](https://minecraft.gamepedia.com/music_disc_cat)
  /// 
  /// _(minecraft:music_disc_cat)_
  static const ItemType music_disc_cat = const ItemType('minecraft:music_disc_cat');
    

  /// [Music Disc (C418 - chirp)](https://minecraft.gamepedia.com/music_disc_chirp)
  /// 
  /// _(minecraft:music_disc_chirp)_
  static const ItemType music_disc_chirp = const ItemType('minecraft:music_disc_chirp');
    

  /// [Music Disc (C418 - far)](https://minecraft.gamepedia.com/music_disc_far)
  /// 
  /// _(minecraft:music_disc_far)_
  static const ItemType music_disc_far = const ItemType('minecraft:music_disc_far');
    

  /// [Music Disc (C418 - mall)](https://minecraft.gamepedia.com/music_disc_mall)
  /// 
  /// _(minecraft:music_disc_mall)_
  static const ItemType music_disc_mall = const ItemType('minecraft:music_disc_mall');
    

  /// [Music Disc (C418 - mellohi)](https://minecraft.gamepedia.com/music_disc_mellohi)
  /// 
  /// _(minecraft:music_disc_mellohi)_
  static const ItemType music_disc_mellohi = const ItemType('minecraft:music_disc_mellohi');
    

  /// [Music Disc (C418 - stal)](https://minecraft.gamepedia.com/music_disc_stal)
  /// 
  /// _(minecraft:music_disc_stal)_
  static const ItemType music_disc_stal = const ItemType('minecraft:music_disc_stal');
    

  /// [Music Disc (C418 - strad)](https://minecraft.gamepedia.com/music_disc_strad)
  /// 
  /// _(minecraft:music_disc_strad)_
  static const ItemType music_disc_strad = const ItemType('minecraft:music_disc_strad');
    

  /// [Music Disc (C418 - wait)](https://minecraft.gamepedia.com/music_disc_wait)
  /// 
  /// _(minecraft:music_disc_wait)_
  static const ItemType music_disc_wait = const ItemType('minecraft:music_disc_wait');
    

  /// [Music Disc (C418 - ward)](https://minecraft.gamepedia.com/music_disc_ward)
  /// 
  /// _(minecraft:music_disc_ward)_
  static const ItemType music_disc_ward = const ItemType('minecraft:music_disc_ward');
    

  /// [Raw Mutton](https://minecraft.gamepedia.com/mutton)
  /// 
  /// _(minecraft:mutton)_
  static const ItemType mutton = const ItemType('minecraft:mutton');
    

  /// [Mycelium](https://minecraft.gamepedia.com/mycelium)
  /// 
  /// _(minecraft:mycelium)_
  static const ItemType mycelium = const ItemType('minecraft:mycelium');
    

  /// [Name Tag](https://minecraft.gamepedia.com/name_tag)
  /// 
  /// _(minecraft:name_tag)_
  static const ItemType name_tag = const ItemType('minecraft:name_tag');
    

  /// [Nautilus Shell](https://minecraft.gamepedia.com/nautilus_shell)
  /// 
  /// _(minecraft:nautilus_shell)_
  static const ItemType nautilus_shell = const ItemType('minecraft:nautilus_shell');
    

  /// [Nether Brick](https://minecraft.gamepedia.com/nether_brick)
  /// 
  /// _(minecraft:nether_brick)_
  static const ItemType nether_brick = const ItemType('minecraft:nether_brick');
    

  /// [Nether Brick Fence](https://minecraft.gamepedia.com/nether_brick_fence)
  /// 
  /// _(minecraft:nether_brick_fence)_
  static const ItemType nether_brick_fence = const ItemType('minecraft:nether_brick_fence');
    

  /// [Nether Brick Slab](https://minecraft.gamepedia.com/nether_brick_slab)
  /// 
  /// _(minecraft:nether_brick_slab)_
  static const ItemType nether_brick_slab = const ItemType('minecraft:nether_brick_slab');
    

  /// [Nether Brick Stairs](https://minecraft.gamepedia.com/nether_brick_stairs)
  /// 
  /// _(minecraft:nether_brick_stairs)_
  static const ItemType nether_brick_stairs = const ItemType('minecraft:nether_brick_stairs');
    

  /// [Nether Brick Wall](https://minecraft.gamepedia.com/nether_brick_wall)
  /// 
  /// _(minecraft:nether_brick_wall)_
  static const ItemType nether_brick_wall = const ItemType('minecraft:nether_brick_wall');
    

  /// [Block of Nether Brick](https://minecraft.gamepedia.com/nether_bricks)
  /// 
  /// _(minecraft:nether_bricks)_
  static const ItemType nether_bricks = const ItemType('minecraft:nether_bricks');
    

  /// [Nether Quartz Ore](https://minecraft.gamepedia.com/nether_quartz_ore)
  /// 
  /// _(minecraft:nether_quartz_ore)_
  static const ItemType nether_quartz_ore = const ItemType('minecraft:nether_quartz_ore');
    

  /// [Nether Star](https://minecraft.gamepedia.com/nether_star)
  /// 
  /// _(minecraft:nether_star)_
  static const ItemType nether_star = const ItemType('minecraft:nether_star');
    

  /// [Nether Wart](https://minecraft.gamepedia.com/nether_wart)
  /// 
  /// _(minecraft:nether_wart)_
  static const ItemType nether_wart = const ItemType('minecraft:nether_wart');
    

  /// [Nether Wart Block](https://minecraft.gamepedia.com/nether_wart_block)
  /// 
  /// _(minecraft:nether_wart_block)_
  static const ItemType nether_wart_block = const ItemType('minecraft:nether_wart_block');
    

  /// [Netherrack](https://minecraft.gamepedia.com/netherrack)
  /// 
  /// _(minecraft:netherrack)_
  static const ItemType netherrack = const ItemType('minecraft:netherrack');
    

  /// [Note Block](https://minecraft.gamepedia.com/note_block)
  /// 
  /// _(minecraft:note_block)_
  static const ItemType note_block = const ItemType('minecraft:note_block');
    

  /// [Oak Boat](https://minecraft.gamepedia.com/oak_boat)
  /// 
  /// _(minecraft:oak_boat)_
  static const ItemType oak_boat = const ItemType('minecraft:oak_boat');
    

  /// [Oak Button](https://minecraft.gamepedia.com/oak_button)
  /// 
  /// _(minecraft:oak_button)_
  static const ItemType oak_button = const ItemType('minecraft:oak_button');
    

  /// [Oak Door](https://minecraft.gamepedia.com/oak_door)
  /// 
  /// _(minecraft:oak_door)_
  static const ItemType oak_door = const ItemType('minecraft:oak_door');
    

  /// [Oak Fence](https://minecraft.gamepedia.com/oak_fence)
  /// 
  /// _(minecraft:oak_fence)_
  static const ItemType oak_fence = const ItemType('minecraft:oak_fence');
    

  /// [Oak Fence Gate](https://minecraft.gamepedia.com/oak_fence_gate)
  /// 
  /// _(minecraft:oak_fence_gate)_
  static const ItemType oak_fence_gate = const ItemType('minecraft:oak_fence_gate');
    

  /// [Oak Leaves](https://minecraft.gamepedia.com/oak_leaves)
  /// 
  /// _(minecraft:oak_leaves)_
  static const ItemType oak_leaves = const ItemType('minecraft:oak_leaves');
    

  /// [Oak Log](https://minecraft.gamepedia.com/oak_log)
  /// 
  /// _(minecraft:oak_log)_
  static const ItemType oak_log = const ItemType('minecraft:oak_log');
    

  /// [Oak Wood Plank](https://minecraft.gamepedia.com/oak_planks)
  /// 
  /// _(minecraft:oak_planks)_
  static const ItemType oak_planks = const ItemType('minecraft:oak_planks');
    

  /// [Oak Pressure Plate](https://minecraft.gamepedia.com/oak_pressure_plate)
  /// 
  /// _(minecraft:oak_pressure_plate)_
  static const ItemType oak_pressure_plate = const ItemType('minecraft:oak_pressure_plate');
    

  /// [Oak Sapling](https://minecraft.gamepedia.com/oak_sapling)
  /// 
  /// _(minecraft:oak_sapling)_
  static const ItemType oak_sapling = const ItemType('minecraft:oak_sapling');
    

  /// [Oak Sign](https://minecraft.gamepedia.com/oak_sign)
  /// 
  /// _(minecraft:oak_sign)_
  static const ItemType oak_sign = const ItemType('minecraft:oak_sign');
    

  /// [Oak Wood Slab](https://minecraft.gamepedia.com/oak_slab)
  /// 
  /// _(minecraft:oak_slab)_
  static const ItemType oak_slab = const ItemType('minecraft:oak_slab');
    

  /// [Oak Wood Stairs](https://minecraft.gamepedia.com/oak_stairs)
  /// 
  /// _(minecraft:oak_stairs)_
  static const ItemType oak_stairs = const ItemType('minecraft:oak_stairs');
    

  /// [Oak Trapdoor](https://minecraft.gamepedia.com/oak_trapdoor)
  /// 
  /// _(minecraft:oak_trapdoor)_
  static const ItemType oak_trapdoor = const ItemType('minecraft:oak_trapdoor');
    

  /// [Oak Wood with Bark](https://minecraft.gamepedia.com/oak_wood)
  /// 
  /// _(minecraft:oak_wood)_
  static const ItemType oak_wood = const ItemType('minecraft:oak_wood');
    

  /// [Observer](https://minecraft.gamepedia.com/observer)
  /// 
  /// _(minecraft:observer)_
  static const ItemType observer = const ItemType('minecraft:observer');
    

  /// [Obsidian](https://minecraft.gamepedia.com/obsidian)
  /// 
  /// _(minecraft:obsidian)_
  static const ItemType obsidian = const ItemType('minecraft:obsidian');
    

  /// [Ocelot Spawn Egg](https://minecraft.gamepedia.com/ocelot_spawn_egg)
  /// 
  /// _(minecraft:ocelot_spawn_egg)_
  static const ItemType ocelot_spawn_egg = const ItemType('minecraft:ocelot_spawn_egg');
    

  /// [Orange Banner](https://minecraft.gamepedia.com/orange_banner)
  /// 
  /// _(minecraft:orange_banner)_
  static const ItemType orange_banner = const ItemType('minecraft:orange_banner');
    

  /// [Orange Bed](https://minecraft.gamepedia.com/orange_bed)
  /// 
  /// _(minecraft:orange_bed)_
  static const ItemType orange_bed = const ItemType('minecraft:orange_bed');
    

  /// [Orange Carpet](https://minecraft.gamepedia.com/orange_carpet)
  /// 
  /// _(minecraft:orange_carpet)_
  static const ItemType orange_carpet = const ItemType('minecraft:orange_carpet');
    

  /// [Orange Concrete](https://minecraft.gamepedia.com/orange_concrete)
  /// 
  /// _(minecraft:orange_concrete)_
  static const ItemType orange_concrete = const ItemType('minecraft:orange_concrete');
    

  /// [Orange Concrete Powder](https://minecraft.gamepedia.com/orange_concrete_powder)
  /// 
  /// _(minecraft:orange_concrete_powder)_
  static const ItemType orange_concrete_powder = const ItemType('minecraft:orange_concrete_powder');
    

  /// [Orange Dye](https://minecraft.gamepedia.com/orange_dye)
  /// 
  /// _(minecraft:orange_dye)_
  static const ItemType orange_dye = const ItemType('minecraft:orange_dye');
    

  /// [Orange Glazed Terracotta](https://minecraft.gamepedia.com/orange_glazed_terracotta)
  /// 
  /// _(minecraft:orange_glazed_terracotta)_
  static const ItemType orange_glazed_terracotta = const ItemType('minecraft:orange_glazed_terracotta');
    

  /// [Orange Shulker Box](https://minecraft.gamepedia.com/orange_shulker_box)
  /// 
  /// _(minecraft:orange_shulker_box)_
  static const ItemType orange_shulker_box = const ItemType('minecraft:orange_shulker_box');
    

  /// [Orange Stained Glass](https://minecraft.gamepedia.com/orange_stained_glass)
  /// 
  /// _(minecraft:orange_stained_glass)_
  static const ItemType orange_stained_glass = const ItemType('minecraft:orange_stained_glass');
    

  /// [Orange Stained Glass Pane](https://minecraft.gamepedia.com/orange_stained_glass_pane)
  /// 
  /// _(minecraft:orange_stained_glass_pane)_
  static const ItemType orange_stained_glass_pane = const ItemType('minecraft:orange_stained_glass_pane');
    

  /// [Orange Terracotta](https://minecraft.gamepedia.com/orange_terracotta)
  /// 
  /// _(minecraft:orange_terracotta)_
  static const ItemType orange_terracotta = const ItemType('minecraft:orange_terracotta');
    

  /// [Orange Tulip](https://minecraft.gamepedia.com/orange_tulip)
  /// 
  /// _(minecraft:orange_tulip)_
  static const ItemType orange_tulip = const ItemType('minecraft:orange_tulip');
    

  /// [Orange Wool](https://minecraft.gamepedia.com/orange_wool)
  /// 
  /// _(minecraft:orange_wool)_
  static const ItemType orange_wool = const ItemType('minecraft:orange_wool');
    

  /// [Oxeye Daisy](https://minecraft.gamepedia.com/oxeye_daisy)
  /// 
  /// _(minecraft:oxeye_daisy)_
  static const ItemType oxeye_daisy = const ItemType('minecraft:oxeye_daisy');
    

  /// [Packed Ice](https://minecraft.gamepedia.com/packed_ice)
  /// 
  /// _(minecraft:packed_ice)_
  static const ItemType packed_ice = const ItemType('minecraft:packed_ice');
    

  /// [Painting](https://minecraft.gamepedia.com/painting)
  /// 
  /// _(minecraft:painting)_
  static const ItemType painting = const ItemType('minecraft:painting');
    

  /// [Panda Spawn Egg](https://minecraft.gamepedia.com/panda_spawn_egg)
  /// 
  /// _(minecraft:panda_spawn_egg)_
  static const ItemType panda_spawn_egg = const ItemType('minecraft:panda_spawn_egg');
    

  /// [Paper](https://minecraft.gamepedia.com/paper)
  /// 
  /// _(minecraft:paper)_
  static const ItemType paper = const ItemType('minecraft:paper');
    

  /// [Parrot Spawn Egg](https://minecraft.gamepedia.com/parrot_spawn_egg)
  /// 
  /// _(minecraft:parrot_spawn_egg)_
  static const ItemType parrot_spawn_egg = const ItemType('minecraft:parrot_spawn_egg');
    

  /// [Peony](https://minecraft.gamepedia.com/peony)
  /// 
  /// _(minecraft:peony)_
  static const ItemType peony = const ItemType('minecraft:peony');
    

  /// [Petrified Oak Slab](https://minecraft.gamepedia.com/petrified_oak_slab)
  /// 
  /// _(minecraft:petrified_oak_slab)_
  static const ItemType petrified_oak_slab = const ItemType('minecraft:petrified_oak_slab');
    

  /// [Phantom Membrane](https://minecraft.gamepedia.com/phantom_membrane)
  /// 
  /// _(minecraft:phantom_membrane)_
  static const ItemType phantom_membrane = const ItemType('minecraft:phantom_membrane');
    

  /// [Phantom Spawn Egg](https://minecraft.gamepedia.com/phantom_spawn_egg)
  /// 
  /// _(minecraft:phantom_spawn_egg)_
  static const ItemType phantom_spawn_egg = const ItemType('minecraft:phantom_spawn_egg');
    

  /// [Pig Spawn Egg](https://minecraft.gamepedia.com/pig_spawn_egg)
  /// 
  /// _(minecraft:pig_spawn_egg)_
  static const ItemType pig_spawn_egg = const ItemType('minecraft:pig_spawn_egg');
    

  /// [Pillager Spawn Egg](https://minecraft.gamepedia.com/pillager_spawn_egg)
  /// 
  /// _(minecraft:pillager_spawn_egg)_
  static const ItemType pillager_spawn_egg = const ItemType('minecraft:pillager_spawn_egg');
    

  /// [Pink Banner](https://minecraft.gamepedia.com/pink_banner)
  /// 
  /// _(minecraft:pink_banner)_
  static const ItemType pink_banner = const ItemType('minecraft:pink_banner');
    

  /// [Pink Bed](https://minecraft.gamepedia.com/pink_bed)
  /// 
  /// _(minecraft:pink_bed)_
  static const ItemType pink_bed = const ItemType('minecraft:pink_bed');
    

  /// [Pink Carpet](https://minecraft.gamepedia.com/pink_carpet)
  /// 
  /// _(minecraft:pink_carpet)_
  static const ItemType pink_carpet = const ItemType('minecraft:pink_carpet');
    

  /// [Pink Concrete](https://minecraft.gamepedia.com/pink_concrete)
  /// 
  /// _(minecraft:pink_concrete)_
  static const ItemType pink_concrete = const ItemType('minecraft:pink_concrete');
    

  /// [Pink Concrete Powder](https://minecraft.gamepedia.com/pink_concrete_powder)
  /// 
  /// _(minecraft:pink_concrete_powder)_
  static const ItemType pink_concrete_powder = const ItemType('minecraft:pink_concrete_powder');
    

  /// [Pink Dye](https://minecraft.gamepedia.com/pink_dye)
  /// 
  /// _(minecraft:pink_dye)_
  static const ItemType pink_dye = const ItemType('minecraft:pink_dye');
    

  /// [Pink Glazed Terracotta](https://minecraft.gamepedia.com/pink_glazed_terracotta)
  /// 
  /// _(minecraft:pink_glazed_terracotta)_
  static const ItemType pink_glazed_terracotta = const ItemType('minecraft:pink_glazed_terracotta');
    

  /// [Pink Shulker Box](https://minecraft.gamepedia.com/pink_shulker_box)
  /// 
  /// _(minecraft:pink_shulker_box)_
  static const ItemType pink_shulker_box = const ItemType('minecraft:pink_shulker_box');
    

  /// [Pink Stained Glass](https://minecraft.gamepedia.com/pink_stained_glass)
  /// 
  /// _(minecraft:pink_stained_glass)_
  static const ItemType pink_stained_glass = const ItemType('minecraft:pink_stained_glass');
    

  /// [Pink Stained Glass Pane](https://minecraft.gamepedia.com/pink_stained_glass_pane)
  /// 
  /// _(minecraft:pink_stained_glass_pane)_
  static const ItemType pink_stained_glass_pane = const ItemType('minecraft:pink_stained_glass_pane');
    

  /// [Pink Terracotta](https://minecraft.gamepedia.com/pink_terracotta)
  /// 
  /// _(minecraft:pink_terracotta)_
  static const ItemType pink_terracotta = const ItemType('minecraft:pink_terracotta');
    

  /// [Pink Tulip](https://minecraft.gamepedia.com/pink_tulip)
  /// 
  /// _(minecraft:pink_tulip)_
  static const ItemType pink_tulip = const ItemType('minecraft:pink_tulip');
    

  /// [Pink Wool](https://minecraft.gamepedia.com/pink_wool)
  /// 
  /// _(minecraft:pink_wool)_
  static const ItemType pink_wool = const ItemType('minecraft:pink_wool');
    

  /// [Piston](https://minecraft.gamepedia.com/piston)
  /// 
  /// _(minecraft:piston)_
  static const ItemType piston = const ItemType('minecraft:piston');
    

  /// [Steve Head](https://minecraft.gamepedia.com/player_head)
  /// 
  /// _(minecraft:player_head)_
  static const ItemType player_head = const ItemType('minecraft:player_head');
    

  /// [Podzol](https://minecraft.gamepedia.com/podzol)
  /// 
  /// _(minecraft:podzol)_
  static const ItemType podzol = const ItemType('minecraft:podzol');
    

  /// [Poisonous Potato](https://minecraft.gamepedia.com/poisonous_potato)
  /// 
  /// _(minecraft:poisonous_potato)_
  static const ItemType poisonous_potato = const ItemType('minecraft:poisonous_potato');
    

  /// [Polar Bear Spawn Egg](https://minecraft.gamepedia.com/polar_bear_spawn_egg)
  /// 
  /// _(minecraft:polar_bear_spawn_egg)_
  static const ItemType polar_bear_spawn_egg = const ItemType('minecraft:polar_bear_spawn_egg');
    

  /// [Polished Andesite](https://minecraft.gamepedia.com/polished_andesite)
  /// 
  /// _(minecraft:polished_andesite)_
  static const ItemType polished_andesite = const ItemType('minecraft:polished_andesite');
    

  /// [Polished Andesite Slab](https://minecraft.gamepedia.com/polished_andesite_slab)
  /// 
  /// _(minecraft:polished_andesite_slab)_
  static const ItemType polished_andesite_slab = const ItemType('minecraft:polished_andesite_slab');
    

  /// [Polished Andesite Stairs](https://minecraft.gamepedia.com/polished_andesite_stairs)
  /// 
  /// _(minecraft:polished_andesite_stairs)_
  static const ItemType polished_andesite_stairs = const ItemType('minecraft:polished_andesite_stairs');
    

  /// [Polished Diorite](https://minecraft.gamepedia.com/polished_diorite)
  /// 
  /// _(minecraft:polished_diorite)_
  static const ItemType polished_diorite = const ItemType('minecraft:polished_diorite');
    

  /// [Polished Diorite Slab](https://minecraft.gamepedia.com/polished_diorite_slab)
  /// 
  /// _(minecraft:polished_diorite_slab)_
  static const ItemType polished_diorite_slab = const ItemType('minecraft:polished_diorite_slab');
    

  /// [Polished Diorite Stairs](https://minecraft.gamepedia.com/polished_diorite_stairs)
  /// 
  /// _(minecraft:polished_diorite_stairs)_
  static const ItemType polished_diorite_stairs = const ItemType('minecraft:polished_diorite_stairs');
    

  /// [Polished Granite](https://minecraft.gamepedia.com/polished_granite)
  /// 
  /// _(minecraft:polished_granite)_
  static const ItemType polished_granite = const ItemType('minecraft:polished_granite');
    

  /// [Polished Granite Slab](https://minecraft.gamepedia.com/polished_granite_slab)
  /// 
  /// _(minecraft:polished_granite_slab)_
  static const ItemType polished_granite_slab = const ItemType('minecraft:polished_granite_slab');
    

  /// [Polished Granite Stairs](https://minecraft.gamepedia.com/polished_granite_stairs)
  /// 
  /// _(minecraft:polished_granite_stairs)_
  static const ItemType polished_granite_stairs = const ItemType('minecraft:polished_granite_stairs');
    

  /// [Popped Chorus Fruit](https://minecraft.gamepedia.com/popped_chorus_fruit)
  /// 
  /// _(minecraft:popped_chorus_fruit)_
  static const ItemType popped_chorus_fruit = const ItemType('minecraft:popped_chorus_fruit');
    

  /// [Poppy](https://minecraft.gamepedia.com/poppy)
  /// 
  /// _(minecraft:poppy)_
  static const ItemType poppy = const ItemType('minecraft:poppy');
    

  /// [Raw Porkchop](https://minecraft.gamepedia.com/porkchop)
  /// 
  /// _(minecraft:porkchop)_
  static const ItemType porkchop = const ItemType('minecraft:porkchop');
    

  /// [Potato](https://minecraft.gamepedia.com/potato)
  /// 
  /// _(minecraft:potato)_
  static const ItemType potato = const ItemType('minecraft:potato');
    

  /// [Potion of Fire Resistance (3:00)](https://minecraft.gamepedia.com/potion)
  /// 
  /// _(minecraft:potion)_
  static const ItemType potion = const ItemType('minecraft:potion');
    

  /// [Powered Rails](https://minecraft.gamepedia.com/powered_rail)
  /// 
  /// _(minecraft:powered_rail)_
  static const ItemType powered_rail = const ItemType('minecraft:powered_rail');
    

  /// [Prismarine](https://minecraft.gamepedia.com/prismarine)
  /// 
  /// _(minecraft:prismarine)_
  static const ItemType prismarine = const ItemType('minecraft:prismarine');
    

  /// [Prismarine Brick Slab](https://minecraft.gamepedia.com/prismarine_brick_slab)
  /// 
  /// _(minecraft:prismarine_brick_slab)_
  static const ItemType prismarine_brick_slab = const ItemType('minecraft:prismarine_brick_slab');
    

  /// [Prismarine Bricks Stairs](https://minecraft.gamepedia.com/prismarine_brick_stairs)
  /// 
  /// _(minecraft:prismarine_brick_stairs)_
  static const ItemType prismarine_brick_stairs = const ItemType('minecraft:prismarine_brick_stairs');
    

  /// [Prismarine Bricks](https://minecraft.gamepedia.com/prismarine_bricks)
  /// 
  /// _(minecraft:prismarine_bricks)_
  static const ItemType prismarine_bricks = const ItemType('minecraft:prismarine_bricks');
    

  /// [Prismarine Crystals](https://minecraft.gamepedia.com/prismarine_crystals)
  /// 
  /// _(minecraft:prismarine_crystals)_
  static const ItemType prismarine_crystals = const ItemType('minecraft:prismarine_crystals');
    

  /// [Prismarine Shard](https://minecraft.gamepedia.com/prismarine_shard)
  /// 
  /// _(minecraft:prismarine_shard)_
  static const ItemType prismarine_shard = const ItemType('minecraft:prismarine_shard');
    

  /// [Prismarine Slab](https://minecraft.gamepedia.com/prismarine_slab)
  /// 
  /// _(minecraft:prismarine_slab)_
  static const ItemType prismarine_slab = const ItemType('minecraft:prismarine_slab');
    

  /// [Prismarine Stairs](https://minecraft.gamepedia.com/prismarine_stairs)
  /// 
  /// _(minecraft:prismarine_stairs)_
  static const ItemType prismarine_stairs = const ItemType('minecraft:prismarine_stairs');
    

  /// [Prismarine Wall](https://minecraft.gamepedia.com/prismarine_wall)
  /// 
  /// _(minecraft:prismarine_wall)_
  static const ItemType prismarine_wall = const ItemType('minecraft:prismarine_wall');
    

  /// [Pufferfish](https://minecraft.gamepedia.com/pufferfish)
  /// 
  /// _(minecraft:pufferfish)_
  static const ItemType pufferfish = const ItemType('minecraft:pufferfish');
    

  /// [Bucket of Pufferfish](https://minecraft.gamepedia.com/pufferfish_bucket)
  /// 
  /// _(minecraft:pufferfish_bucket)_
  static const ItemType pufferfish_bucket = const ItemType('minecraft:pufferfish_bucket');
    

  /// [Pufferfish Spawn Egg](https://minecraft.gamepedia.com/pufferfish_spawn_egg)
  /// 
  /// _(minecraft:pufferfish_spawn_egg)_
  static const ItemType pufferfish_spawn_egg = const ItemType('minecraft:pufferfish_spawn_egg');
    

  /// [Pumpkin](https://minecraft.gamepedia.com/pumpkin)
  /// 
  /// _(minecraft:pumpkin)_
  static const ItemType pumpkin = const ItemType('minecraft:pumpkin');
    

  /// [Pumpkin Pie](https://minecraft.gamepedia.com/pumpkin_pie)
  /// 
  /// _(minecraft:pumpkin_pie)_
  static const ItemType pumpkin_pie = const ItemType('minecraft:pumpkin_pie');
    

  /// [Pumpkin Seeds](https://minecraft.gamepedia.com/pumpkin_seeds)
  /// 
  /// _(minecraft:pumpkin_seeds)_
  static const ItemType pumpkin_seeds = const ItemType('minecraft:pumpkin_seeds');
    

  /// [Purple Banner](https://minecraft.gamepedia.com/purple_banner)
  /// 
  /// _(minecraft:purple_banner)_
  static const ItemType purple_banner = const ItemType('minecraft:purple_banner');
    

  /// [Purple Bed](https://minecraft.gamepedia.com/purple_bed)
  /// 
  /// _(minecraft:purple_bed)_
  static const ItemType purple_bed = const ItemType('minecraft:purple_bed');
    

  /// [Purple Carpet](https://minecraft.gamepedia.com/purple_carpet)
  /// 
  /// _(minecraft:purple_carpet)_
  static const ItemType purple_carpet = const ItemType('minecraft:purple_carpet');
    

  /// [Purple Concrete](https://minecraft.gamepedia.com/purple_concrete)
  /// 
  /// _(minecraft:purple_concrete)_
  static const ItemType purple_concrete = const ItemType('minecraft:purple_concrete');
    

  /// [Purple Concrete Powder](https://minecraft.gamepedia.com/purple_concrete_powder)
  /// 
  /// _(minecraft:purple_concrete_powder)_
  static const ItemType purple_concrete_powder = const ItemType('minecraft:purple_concrete_powder');
    

  /// [Purple Dye](https://minecraft.gamepedia.com/purple_dye)
  /// 
  /// _(minecraft:purple_dye)_
  static const ItemType purple_dye = const ItemType('minecraft:purple_dye');
    

  /// [Purple Glazed Terracotta](https://minecraft.gamepedia.com/purple_glazed_terracotta)
  /// 
  /// _(minecraft:purple_glazed_terracotta)_
  static const ItemType purple_glazed_terracotta = const ItemType('minecraft:purple_glazed_terracotta');
    

  /// [Purple Shulker Box](https://minecraft.gamepedia.com/purple_shulker_box)
  /// 
  /// _(minecraft:purple_shulker_box)_
  static const ItemType purple_shulker_box = const ItemType('minecraft:purple_shulker_box');
    

  /// [Purple Stained Glass](https://minecraft.gamepedia.com/purple_stained_glass)
  /// 
  /// _(minecraft:purple_stained_glass)_
  static const ItemType purple_stained_glass = const ItemType('minecraft:purple_stained_glass');
    

  /// [Purple Stained Glass Pane](https://minecraft.gamepedia.com/purple_stained_glass_pane)
  /// 
  /// _(minecraft:purple_stained_glass_pane)_
  static const ItemType purple_stained_glass_pane = const ItemType('minecraft:purple_stained_glass_pane');
    

  /// [Purple Terracotta](https://minecraft.gamepedia.com/purple_terracotta)
  /// 
  /// _(minecraft:purple_terracotta)_
  static const ItemType purple_terracotta = const ItemType('minecraft:purple_terracotta');
    

  /// [Purple Wool](https://minecraft.gamepedia.com/purple_wool)
  /// 
  /// _(minecraft:purple_wool)_
  static const ItemType purple_wool = const ItemType('minecraft:purple_wool');
    

  /// [Purpur Block](https://minecraft.gamepedia.com/purpur_block)
  /// 
  /// _(minecraft:purpur_block)_
  static const ItemType purpur_block = const ItemType('minecraft:purpur_block');
    

  /// [Purpur Pillar](https://minecraft.gamepedia.com/purpur_pillar)
  /// 
  /// _(minecraft:purpur_pillar)_
  static const ItemType purpur_pillar = const ItemType('minecraft:purpur_pillar');
    

  /// [Purpur Slab](https://minecraft.gamepedia.com/purpur_slab)
  /// 
  /// _(minecraft:purpur_slab)_
  static const ItemType purpur_slab = const ItemType('minecraft:purpur_slab');
    

  /// [Purpur Stairs](https://minecraft.gamepedia.com/purpur_stairs)
  /// 
  /// _(minecraft:purpur_stairs)_
  static const ItemType purpur_stairs = const ItemType('minecraft:purpur_stairs');
    

  /// [Nether Quartz](https://minecraft.gamepedia.com/quartz)
  /// 
  /// _(minecraft:quartz)_
  static const ItemType quartz = const ItemType('minecraft:quartz');
    

  /// [Block of Quartz](https://minecraft.gamepedia.com/quartz_block)
  /// 
  /// _(minecraft:quartz_block)_
  static const ItemType quartz_block = const ItemType('minecraft:quartz_block');
    

  /// [Pillar Quartz Block](https://minecraft.gamepedia.com/quartz_pillar)
  /// 
  /// _(minecraft:quartz_pillar)_
  static const ItemType quartz_pillar = const ItemType('minecraft:quartz_pillar');
    

  /// [Quartz Slab](https://minecraft.gamepedia.com/quartz_slab)
  /// 
  /// _(minecraft:quartz_slab)_
  static const ItemType quartz_slab = const ItemType('minecraft:quartz_slab');
    

  /// [Quartz Stairs](https://minecraft.gamepedia.com/quartz_stairs)
  /// 
  /// _(minecraft:quartz_stairs)_
  static const ItemType quartz_stairs = const ItemType('minecraft:quartz_stairs');
    

  /// [Raw Rabbit](https://minecraft.gamepedia.com/rabbit)
  /// 
  /// _(minecraft:rabbit)_
  static const ItemType rabbit = const ItemType('minecraft:rabbit');
    

  /// [Rabbit's Foot](https://minecraft.gamepedia.com/rabbit_foot)
  /// 
  /// _(minecraft:rabbit_foot)_
  static const ItemType rabbit_foot = const ItemType('minecraft:rabbit_foot');
    

  /// [Rabbit Hide](https://minecraft.gamepedia.com/rabbit_hide)
  /// 
  /// _(minecraft:rabbit_hide)_
  static const ItemType rabbit_hide = const ItemType('minecraft:rabbit_hide');
    

  /// [Rabbit Spawn Egg](https://minecraft.gamepedia.com/rabbit_spawn_egg)
  /// 
  /// _(minecraft:rabbit_spawn_egg)_
  static const ItemType rabbit_spawn_egg = const ItemType('minecraft:rabbit_spawn_egg');
    

  /// [Rabbit Stew](https://minecraft.gamepedia.com/rabbit_stew)
  /// 
  /// _(minecraft:rabbit_stew)_
  static const ItemType rabbit_stew = const ItemType('minecraft:rabbit_stew');
    

  /// [Rails](https://minecraft.gamepedia.com/rail)
  /// 
  /// _(minecraft:rail)_
  static const ItemType rail = const ItemType('minecraft:rail');
    

  /// [Ravager Spawn Egg](https://minecraft.gamepedia.com/ravager_spawn_egg)
  /// 
  /// _(minecraft:ravager_spawn_egg)_
  static const ItemType ravager_spawn_egg = const ItemType('minecraft:ravager_spawn_egg');
    

  /// [Red Banner](https://minecraft.gamepedia.com/red_banner)
  /// 
  /// _(minecraft:red_banner)_
  static const ItemType red_banner = const ItemType('minecraft:red_banner');
    

  /// [Red Bed](https://minecraft.gamepedia.com/red_bed)
  /// 
  /// _(minecraft:red_bed)_
  static const ItemType red_bed = const ItemType('minecraft:red_bed');
    

  /// [Red Carpet](https://minecraft.gamepedia.com/red_carpet)
  /// 
  /// _(minecraft:red_carpet)_
  static const ItemType red_carpet = const ItemType('minecraft:red_carpet');
    

  /// [Red Concrete](https://minecraft.gamepedia.com/red_concrete)
  /// 
  /// _(minecraft:red_concrete)_
  static const ItemType red_concrete = const ItemType('minecraft:red_concrete');
    

  /// [Red Concrete Powder](https://minecraft.gamepedia.com/red_concrete_powder)
  /// 
  /// _(minecraft:red_concrete_powder)_
  static const ItemType red_concrete_powder = const ItemType('minecraft:red_concrete_powder');
    

  /// [Red Dye](https://minecraft.gamepedia.com/red_dye)
  /// 
  /// _(minecraft:red_dye)_
  static const ItemType red_dye = const ItemType('minecraft:red_dye');
    

  /// [Red Glazed Terracotta](https://minecraft.gamepedia.com/red_glazed_terracotta)
  /// 
  /// _(minecraft:red_glazed_terracotta)_
  static const ItemType red_glazed_terracotta = const ItemType('minecraft:red_glazed_terracotta');
    

  /// [Mushroom (red with white spots)](https://minecraft.gamepedia.com/red_mushroom)
  /// 
  /// _(minecraft:red_mushroom)_
  static const ItemType red_mushroom = const ItemType('minecraft:red_mushroom');
    

  /// [Red Mushroom Block](https://minecraft.gamepedia.com/red_mushroom_block)
  /// 
  /// _(minecraft:red_mushroom_block)_
  static const ItemType red_mushroom_block = const ItemType('minecraft:red_mushroom_block');
    

  /// [Red Nether Brick Slab](https://minecraft.gamepedia.com/red_nether_brick_slab)
  /// 
  /// _(minecraft:red_nether_brick_slab)_
  static const ItemType red_nether_brick_slab = const ItemType('minecraft:red_nether_brick_slab');
    

  /// [Red Nether Brick Stairs](https://minecraft.gamepedia.com/red_nether_brick_stairs)
  /// 
  /// _(minecraft:red_nether_brick_stairs)_
  static const ItemType red_nether_brick_stairs = const ItemType('minecraft:red_nether_brick_stairs');
    

  /// [Red Nether Brick Wall](https://minecraft.gamepedia.com/red_nether_brick_wall)
  /// 
  /// _(minecraft:red_nether_brick_wall)_
  static const ItemType red_nether_brick_wall = const ItemType('minecraft:red_nether_brick_wall');
    

  /// [Red Nether Brick](https://minecraft.gamepedia.com/red_nether_bricks)
  /// 
  /// _(minecraft:red_nether_bricks)_
  static const ItemType red_nether_bricks = const ItemType('minecraft:red_nether_bricks');
    

  /// [Red Sand](https://minecraft.gamepedia.com/red_sand)
  /// 
  /// _(minecraft:red_sand)_
  static const ItemType red_sand = const ItemType('minecraft:red_sand');
    

  /// [Red Sandstone](https://minecraft.gamepedia.com/red_sandstone)
  /// 
  /// _(minecraft:red_sandstone)_
  static const ItemType red_sandstone = const ItemType('minecraft:red_sandstone');
    

  /// [Red Sandstone Slab](https://minecraft.gamepedia.com/red_sandstone_slab)
  /// 
  /// _(minecraft:red_sandstone_slab)_
  static const ItemType red_sandstone_slab = const ItemType('minecraft:red_sandstone_slab');
    

  /// [Red Sandstone Stairs](https://minecraft.gamepedia.com/red_sandstone_stairs)
  /// 
  /// _(minecraft:red_sandstone_stairs)_
  static const ItemType red_sandstone_stairs = const ItemType('minecraft:red_sandstone_stairs');
    

  /// [Red Sandstone Wall](https://minecraft.gamepedia.com/red_sandstone_wall)
  /// 
  /// _(minecraft:red_sandstone_wall)_
  static const ItemType red_sandstone_wall = const ItemType('minecraft:red_sandstone_wall');
    

  /// [Red Shulker Box](https://minecraft.gamepedia.com/red_shulker_box)
  /// 
  /// _(minecraft:red_shulker_box)_
  static const ItemType red_shulker_box = const ItemType('minecraft:red_shulker_box');
    

  /// [Red Stained Glass](https://minecraft.gamepedia.com/red_stained_glass)
  /// 
  /// _(minecraft:red_stained_glass)_
  static const ItemType red_stained_glass = const ItemType('minecraft:red_stained_glass');
    

  /// [Red Stained Glass Pane](https://minecraft.gamepedia.com/red_stained_glass_pane)
  /// 
  /// _(minecraft:red_stained_glass_pane)_
  static const ItemType red_stained_glass_pane = const ItemType('minecraft:red_stained_glass_pane');
    

  /// [Red Terracotta](https://minecraft.gamepedia.com/red_terracotta)
  /// 
  /// _(minecraft:red_terracotta)_
  static const ItemType red_terracotta = const ItemType('minecraft:red_terracotta');
    

  /// [Red Tulip](https://minecraft.gamepedia.com/red_tulip)
  /// 
  /// _(minecraft:red_tulip)_
  static const ItemType red_tulip = const ItemType('minecraft:red_tulip');
    

  /// [Red Wool](https://minecraft.gamepedia.com/red_wool)
  /// 
  /// _(minecraft:red_wool)_
  static const ItemType red_wool = const ItemType('minecraft:red_wool');
    

  /// [Redstone](https://minecraft.gamepedia.com/redstone)
  /// 
  /// _(minecraft:redstone)_
  static const ItemType redstone = const ItemType('minecraft:redstone');
    

  /// [Block of Redstone](https://minecraft.gamepedia.com/redstone_block)
  /// 
  /// _(minecraft:redstone_block)_
  static const ItemType redstone_block = const ItemType('minecraft:redstone_block');
    

  /// [Redstone Lamp](https://minecraft.gamepedia.com/redstone_lamp)
  /// 
  /// _(minecraft:redstone_lamp)_
  static const ItemType redstone_lamp = const ItemType('minecraft:redstone_lamp');
    

  /// [Redstone Ore](https://minecraft.gamepedia.com/redstone_ore)
  /// 
  /// _(minecraft:redstone_ore)_
  static const ItemType redstone_ore = const ItemType('minecraft:redstone_ore');
    

  /// [Redstone Torch](https://minecraft.gamepedia.com/redstone_torch)
  /// 
  /// _(minecraft:redstone_torch)_
  static const ItemType redstone_torch = const ItemType('minecraft:redstone_torch');
    

  /// [Redstone Repeater](https://minecraft.gamepedia.com/repeater)
  /// 
  /// _(minecraft:repeater)_
  static const ItemType repeater = const ItemType('minecraft:repeater');
    

  /// [Repeating Command Block](https://minecraft.gamepedia.com/repeating_command_block)
  /// 
  /// _(minecraft:repeating_command_block)_
  static const ItemType repeating_command_block = const ItemType('minecraft:repeating_command_block');
    

  /// [Rose Bush](https://minecraft.gamepedia.com/rose_bush)
  /// 
  /// _(minecraft:rose_bush)_
  static const ItemType rose_bush = const ItemType('minecraft:rose_bush');
    

  /// [Rotten Flesh](https://minecraft.gamepedia.com/rotten_flesh)
  /// 
  /// _(minecraft:rotten_flesh)_
  static const ItemType rotten_flesh = const ItemType('minecraft:rotten_flesh');
    

  /// [Saddle](https://minecraft.gamepedia.com/saddle)
  /// 
  /// _(minecraft:saddle)_
  static const ItemType saddle = const ItemType('minecraft:saddle');
    

  /// [Raw Salmon](https://minecraft.gamepedia.com/salmon)
  /// 
  /// _(minecraft:salmon)_
  static const ItemType salmon = const ItemType('minecraft:salmon');
    

  /// [Bucket of Salmon](https://minecraft.gamepedia.com/salmon_bucket)
  /// 
  /// _(minecraft:salmon_bucket)_
  static const ItemType salmon_bucket = const ItemType('minecraft:salmon_bucket');
    

  /// [Salmon Spawn Egg](https://minecraft.gamepedia.com/salmon_spawn_egg)
  /// 
  /// _(minecraft:salmon_spawn_egg)_
  static const ItemType salmon_spawn_egg = const ItemType('minecraft:salmon_spawn_egg');
    

  /// [Sand](https://minecraft.gamepedia.com/sand)
  /// 
  /// _(minecraft:sand)_
  static const ItemType sand = const ItemType('minecraft:sand');
    

  /// [Sandstone](https://minecraft.gamepedia.com/sandstone)
  /// 
  /// _(minecraft:sandstone)_
  static const ItemType sandstone = const ItemType('minecraft:sandstone');
    

  /// [Sandstone Slab](https://minecraft.gamepedia.com/sandstone_slab)
  /// 
  /// _(minecraft:sandstone_slab)_
  static const ItemType sandstone_slab = const ItemType('minecraft:sandstone_slab');
    

  /// [Sandstone Stairs](https://minecraft.gamepedia.com/sandstone_stairs)
  /// 
  /// _(minecraft:sandstone_stairs)_
  static const ItemType sandstone_stairs = const ItemType('minecraft:sandstone_stairs');
    

  /// [Sandstone Wall](https://minecraft.gamepedia.com/sandstone_wall)
  /// 
  /// _(minecraft:sandstone_wall)_
  static const ItemType sandstone_wall = const ItemType('minecraft:sandstone_wall');
    

  /// [Scaffolding](https://minecraft.gamepedia.com/scaffolding)
  /// 
  /// _(minecraft:scaffolding)_
  static const ItemType scaffolding = const ItemType('minecraft:scaffolding');
    

  /// [Scute](https://minecraft.gamepedia.com/scute)
  /// 
  /// _(minecraft:scute)_
  static const ItemType scute = const ItemType('minecraft:scute');
    

  /// [Sea Lantern](https://minecraft.gamepedia.com/sea_lantern)
  /// 
  /// _(minecraft:sea_lantern)_
  static const ItemType sea_lantern = const ItemType('minecraft:sea_lantern');
    

  /// [Sea Pickle](https://minecraft.gamepedia.com/sea_pickle)
  /// 
  /// _(minecraft:sea_pickle)_
  static const ItemType sea_pickle = const ItemType('minecraft:sea_pickle');
    

  /// [Sea Grass](https://minecraft.gamepedia.com/seagrass)
  /// 
  /// _(minecraft:seagrass)_
  static const ItemType seagrass = const ItemType('minecraft:seagrass');
    

  /// [Shears](https://minecraft.gamepedia.com/shears)
  /// 
  /// _(minecraft:shears)_
  static const ItemType shears = const ItemType('minecraft:shears');
    

  /// [Sheep Spawn Egg](https://minecraft.gamepedia.com/sheep_spawn_egg)
  /// 
  /// _(minecraft:sheep_spawn_egg)_
  static const ItemType sheep_spawn_egg = const ItemType('minecraft:sheep_spawn_egg');
    

  /// [Shield](https://minecraft.gamepedia.com/shield)
  /// 
  /// _(minecraft:shield)_
  static const ItemType shield = const ItemType('minecraft:shield');
    

  /// [Shulker Box](https://minecraft.gamepedia.com/shulker_box)
  /// 
  /// _(minecraft:shulker_box)_
  static const ItemType shulker_box = const ItemType('minecraft:shulker_box');
    

  /// [Shulker Shell](https://minecraft.gamepedia.com/shulker_shell)
  /// 
  /// _(minecraft:shulker_shell)_
  static const ItemType shulker_shell = const ItemType('minecraft:shulker_shell');
    

  /// [Shulker Spawn Egg](https://minecraft.gamepedia.com/shulker_spawn_egg)
  /// 
  /// _(minecraft:shulker_spawn_egg)_
  static const ItemType shulker_spawn_egg = const ItemType('minecraft:shulker_spawn_egg');
    

  /// [Silverfish Spawn Egg](https://minecraft.gamepedia.com/silverfish_spawn_egg)
  /// 
  /// _(minecraft:silverfish_spawn_egg)_
  static const ItemType silverfish_spawn_egg = const ItemType('minecraft:silverfish_spawn_egg');
    

  /// [Skeleton Horse Spawn Egg](https://minecraft.gamepedia.com/skeleton_horse_spawn_egg)
  /// 
  /// _(minecraft:skeleton_horse_spawn_egg)_
  static const ItemType skeleton_horse_spawn_egg = const ItemType('minecraft:skeleton_horse_spawn_egg');
    

  /// [Skeleton Skull](https://minecraft.gamepedia.com/skeleton_skull)
  /// 
  /// _(minecraft:skeleton_skull)_
  static const ItemType skeleton_skull = const ItemType('minecraft:skeleton_skull');
    

  /// [Skeleton Spawn Egg](https://minecraft.gamepedia.com/skeleton_spawn_egg)
  /// 
  /// _(minecraft:skeleton_spawn_egg)_
  static const ItemType skeleton_spawn_egg = const ItemType('minecraft:skeleton_spawn_egg');
    

  /// [Skull Charge Banner Pattern](https://minecraft.gamepedia.com/skull_banner_pattern)
  /// 
  /// _(minecraft:skull_banner_pattern)_
  static const ItemType skull_banner_pattern = const ItemType('minecraft:skull_banner_pattern');
    

  /// [Slimeball](https://minecraft.gamepedia.com/slime_ball)
  /// 
  /// _(minecraft:slime_ball)_
  static const ItemType slime_ball = const ItemType('minecraft:slime_ball');
    

  /// [Slime Block](https://minecraft.gamepedia.com/slime_block)
  /// 
  /// _(minecraft:slime_block)_
  static const ItemType slime_block = const ItemType('minecraft:slime_block');
    

  /// [Slime Spawn Egg](https://minecraft.gamepedia.com/slime_spawn_egg)
  /// 
  /// _(minecraft:slime_spawn_egg)_
  static const ItemType slime_spawn_egg = const ItemType('minecraft:slime_spawn_egg');
    

  /// [Smithing Table](https://minecraft.gamepedia.com/smithing_table)
  /// 
  /// _(minecraft:smithing_table)_
  static const ItemType smithing_table = const ItemType('minecraft:smithing_table');
    

  /// [Smoker](https://minecraft.gamepedia.com/smoker)
  /// 
  /// _(minecraft:smoker)_
  static const ItemType smoker = const ItemType('minecraft:smoker');
    

  /// [Smooth Quartz](https://minecraft.gamepedia.com/smooth_quartz)
  /// 
  /// _(minecraft:smooth_quartz)_
  static const ItemType smooth_quartz = const ItemType('minecraft:smooth_quartz');
    

  /// [Smooth Quartz Slab](https://minecraft.gamepedia.com/smooth_quartz_slab)
  /// 
  /// _(minecraft:smooth_quartz_slab)_
  static const ItemType smooth_quartz_slab = const ItemType('minecraft:smooth_quartz_slab');
    

  /// [Smooth Quartz Stairs](https://minecraft.gamepedia.com/smooth_quartz_stairs)
  /// 
  /// _(minecraft:smooth_quartz_stairs)_
  static const ItemType smooth_quartz_stairs = const ItemType('minecraft:smooth_quartz_stairs');
    

  /// [Smooth Red Sandstone](https://minecraft.gamepedia.com/smooth_red_sandstone)
  /// 
  /// _(minecraft:smooth_red_sandstone)_
  static const ItemType smooth_red_sandstone = const ItemType('minecraft:smooth_red_sandstone');
    

  /// [Smooth Red Sandstone Slab](https://minecraft.gamepedia.com/smooth_red_sandstone_slab)
  /// 
  /// _(minecraft:smooth_red_sandstone_slab)_
  static const ItemType smooth_red_sandstone_slab = const ItemType('minecraft:smooth_red_sandstone_slab');
    

  /// [Smooth Red Sandstone Stairs](https://minecraft.gamepedia.com/smooth_red_sandstone_stairs)
  /// 
  /// _(minecraft:smooth_red_sandstone_stairs)_
  static const ItemType smooth_red_sandstone_stairs = const ItemType('minecraft:smooth_red_sandstone_stairs');
    

  /// [Smooth Sandstone](https://minecraft.gamepedia.com/smooth_sandstone)
  /// 
  /// _(minecraft:smooth_sandstone)_
  static const ItemType smooth_sandstone = const ItemType('minecraft:smooth_sandstone');
    

  /// [Smooth Sandstone Slab](https://minecraft.gamepedia.com/smooth_sandstone_slab)
  /// 
  /// _(minecraft:smooth_sandstone_slab)_
  static const ItemType smooth_sandstone_slab = const ItemType('minecraft:smooth_sandstone_slab');
    

  /// [Smooth Sandstone Stairs](https://minecraft.gamepedia.com/smooth_sandstone_stairs)
  /// 
  /// _(minecraft:smooth_sandstone_stairs)_
  static const ItemType smooth_sandstone_stairs = const ItemType('minecraft:smooth_sandstone_stairs');
    

  /// [Smooth Stone](https://minecraft.gamepedia.com/smooth_stone)
  /// 
  /// _(minecraft:smooth_stone)_
  static const ItemType smooth_stone = const ItemType('minecraft:smooth_stone');
    

  /// [Smooth Stone Slab](https://minecraft.gamepedia.com/smooth_stone_slab)
  /// 
  /// _(minecraft:smooth_stone_slab)_
  static const ItemType smooth_stone_slab = const ItemType('minecraft:smooth_stone_slab');
    

  /// [Snow](https://minecraft.gamepedia.com/snow)
  /// 
  /// _(minecraft:snow)_
  static const ItemType snow = const ItemType('minecraft:snow');
    

  /// [Snow Block](https://minecraft.gamepedia.com/snow_block)
  /// 
  /// _(minecraft:snow_block)_
  static const ItemType snow_block = const ItemType('minecraft:snow_block');
    

  /// [Snowball](https://minecraft.gamepedia.com/snowball)
  /// 
  /// _(minecraft:snowball)_
  static const ItemType snowball = const ItemType('minecraft:snowball');
    

  /// [Soul Sand](https://minecraft.gamepedia.com/soul_sand)
  /// 
  /// _(minecraft:soul_sand)_
  static const ItemType soul_sand = const ItemType('minecraft:soul_sand');
    

  /// [Monster Spawner](https://minecraft.gamepedia.com/spawner)
  /// 
  /// _(minecraft:spawner)_
  static const ItemType spawner = const ItemType('minecraft:spawner');
    

  /// [Spectral Arrow](https://minecraft.gamepedia.com/spectral_arrow)
  /// 
  /// _(minecraft:spectral_arrow)_
  static const ItemType spectral_arrow = const ItemType('minecraft:spectral_arrow');
    

  /// [Spider Eye](https://minecraft.gamepedia.com/spider_eye)
  /// 
  /// _(minecraft:spider_eye)_
  static const ItemType spider_eye = const ItemType('minecraft:spider_eye');
    

  /// [Spider Spawn Egg](https://minecraft.gamepedia.com/spider_spawn_egg)
  /// 
  /// _(minecraft:spider_spawn_egg)_
  static const ItemType spider_spawn_egg = const ItemType('minecraft:spider_spawn_egg');
    

  /// [Splash Potion of Fire Resistance (3:00/2:15)](https://minecraft.gamepedia.com/splash_potion)
  /// 
  /// _(minecraft:splash_potion)_
  static const ItemType splash_potion = const ItemType('minecraft:splash_potion');
    

  /// [Sponge](https://minecraft.gamepedia.com/sponge)
  /// 
  /// _(minecraft:sponge)_
  static const ItemType sponge = const ItemType('minecraft:sponge');
    

  /// [Spruce Boat](https://minecraft.gamepedia.com/spruce_boat)
  /// 
  /// _(minecraft:spruce_boat)_
  static const ItemType spruce_boat = const ItemType('minecraft:spruce_boat');
    

  /// [Spruce Button](https://minecraft.gamepedia.com/spruce_button)
  /// 
  /// _(minecraft:spruce_button)_
  static const ItemType spruce_button = const ItemType('minecraft:spruce_button');
    

  /// [Spruce Door](https://minecraft.gamepedia.com/spruce_door)
  /// 
  /// _(minecraft:spruce_door)_
  static const ItemType spruce_door = const ItemType('minecraft:spruce_door');
    

  /// [Spruce Fence](https://minecraft.gamepedia.com/spruce_fence)
  /// 
  /// _(minecraft:spruce_fence)_
  static const ItemType spruce_fence = const ItemType('minecraft:spruce_fence');
    

  /// [Spruce Fence Gate](https://minecraft.gamepedia.com/spruce_fence_gate)
  /// 
  /// _(minecraft:spruce_fence_gate)_
  static const ItemType spruce_fence_gate = const ItemType('minecraft:spruce_fence_gate');
    

  /// [Spruce Leaves](https://minecraft.gamepedia.com/spruce_leaves)
  /// 
  /// _(minecraft:spruce_leaves)_
  static const ItemType spruce_leaves = const ItemType('minecraft:spruce_leaves');
    

  /// [Spruce Log](https://minecraft.gamepedia.com/spruce_log)
  /// 
  /// _(minecraft:spruce_log)_
  static const ItemType spruce_log = const ItemType('minecraft:spruce_log');
    

  /// [Spruce Wood Plank](https://minecraft.gamepedia.com/spruce_planks)
  /// 
  /// _(minecraft:spruce_planks)_
  static const ItemType spruce_planks = const ItemType('minecraft:spruce_planks');
    

  /// [Spruce Pressure Plate](https://minecraft.gamepedia.com/spruce_pressure_plate)
  /// 
  /// _(minecraft:spruce_pressure_plate)_
  static const ItemType spruce_pressure_plate = const ItemType('minecraft:spruce_pressure_plate');
    

  /// [Spruce Sapling](https://minecraft.gamepedia.com/spruce_sapling)
  /// 
  /// _(minecraft:spruce_sapling)_
  static const ItemType spruce_sapling = const ItemType('minecraft:spruce_sapling');
    

  /// [Spruce Sign](https://minecraft.gamepedia.com/spruce_sign)
  /// 
  /// _(minecraft:spruce_sign)_
  static const ItemType spruce_sign = const ItemType('minecraft:spruce_sign');
    

  /// [Spruce Wood Slab](https://minecraft.gamepedia.com/spruce_slab)
  /// 
  /// _(minecraft:spruce_slab)_
  static const ItemType spruce_slab = const ItemType('minecraft:spruce_slab');
    

  /// [Spruce Wood Stairs](https://minecraft.gamepedia.com/spruce_stairs)
  /// 
  /// _(minecraft:spruce_stairs)_
  static const ItemType spruce_stairs = const ItemType('minecraft:spruce_stairs');
    

  /// [Spruce Trapdoor](https://minecraft.gamepedia.com/spruce_trapdoor)
  /// 
  /// _(minecraft:spruce_trapdoor)_
  static const ItemType spruce_trapdoor = const ItemType('minecraft:spruce_trapdoor');
    

  /// [Spruce Wood with Bark](https://minecraft.gamepedia.com/spruce_wood)
  /// 
  /// _(minecraft:spruce_wood)_
  static const ItemType spruce_wood = const ItemType('minecraft:spruce_wood');
    

  /// [Squid Spawn Egg](https://minecraft.gamepedia.com/squid_spawn_egg)
  /// 
  /// _(minecraft:squid_spawn_egg)_
  static const ItemType squid_spawn_egg = const ItemType('minecraft:squid_spawn_egg');
    

  /// [Stick](https://minecraft.gamepedia.com/stick)
  /// 
  /// _(minecraft:stick)_
  static const ItemType stick = const ItemType('minecraft:stick');
    

  /// [Sticky Piston](https://minecraft.gamepedia.com/sticky_piston)
  /// 
  /// _(minecraft:sticky_piston)_
  static const ItemType sticky_piston = const ItemType('minecraft:sticky_piston');
    

  /// [Stone](https://minecraft.gamepedia.com/stone)
  /// 
  /// _(minecraft:stone)_
  static const ItemType stone = const ItemType('minecraft:stone');
    

  /// [Stone Axe](https://minecraft.gamepedia.com/stone_axe)
  /// 
  /// _(minecraft:stone_axe)_
  static const ItemType stone_axe = const ItemType('minecraft:stone_axe');
    

  /// [Stone Brick Slab](https://minecraft.gamepedia.com/stone_brick_slab)
  /// 
  /// _(minecraft:stone_brick_slab)_
  static const ItemType stone_brick_slab = const ItemType('minecraft:stone_brick_slab');
    

  /// [Stone Brick Stairs](https://minecraft.gamepedia.com/stone_brick_stairs)
  /// 
  /// _(minecraft:stone_brick_stairs)_
  static const ItemType stone_brick_stairs = const ItemType('minecraft:stone_brick_stairs');
    

  /// [Stone Brick Wall](https://minecraft.gamepedia.com/stone_brick_wall)
  /// 
  /// _(minecraft:stone_brick_wall)_
  static const ItemType stone_brick_wall = const ItemType('minecraft:stone_brick_wall');
    

  /// [Stone Bricks](https://minecraft.gamepedia.com/stone_bricks)
  /// 
  /// _(minecraft:stone_bricks)_
  static const ItemType stone_bricks = const ItemType('minecraft:stone_bricks');
    

  /// [Stone Button](https://minecraft.gamepedia.com/stone_button)
  /// 
  /// _(minecraft:stone_button)_
  static const ItemType stone_button = const ItemType('minecraft:stone_button');
    

  /// [Stone Hoe](https://minecraft.gamepedia.com/stone_hoe)
  /// 
  /// _(minecraft:stone_hoe)_
  static const ItemType stone_hoe = const ItemType('minecraft:stone_hoe');
    

  /// [Stone Pickaxe](https://minecraft.gamepedia.com/stone_pickaxe)
  /// 
  /// _(minecraft:stone_pickaxe)_
  static const ItemType stone_pickaxe = const ItemType('minecraft:stone_pickaxe');
    

  /// [Stone Pressure Plate](https://minecraft.gamepedia.com/stone_pressure_plate)
  /// 
  /// _(minecraft:stone_pressure_plate)_
  static const ItemType stone_pressure_plate = const ItemType('minecraft:stone_pressure_plate');
    

  /// [Stone Shovel](https://minecraft.gamepedia.com/stone_shovel)
  /// 
  /// _(minecraft:stone_shovel)_
  static const ItemType stone_shovel = const ItemType('minecraft:stone_shovel');
    

  /// [Stone Slab](https://minecraft.gamepedia.com/stone_slab)
  /// 
  /// _(minecraft:stone_slab)_
  static const ItemType stone_slab = const ItemType('minecraft:stone_slab');
    

  /// [Stone Stairs](https://minecraft.gamepedia.com/stone_stairs)
  /// 
  /// _(minecraft:stone_stairs)_
  static const ItemType stone_stairs = const ItemType('minecraft:stone_stairs');
    

  /// [Stone Sword](https://minecraft.gamepedia.com/stone_sword)
  /// 
  /// _(minecraft:stone_sword)_
  static const ItemType stone_sword = const ItemType('minecraft:stone_sword');
    

  /// [Stray Spawn Egg](https://minecraft.gamepedia.com/stray_spawn_egg)
  /// 
  /// _(minecraft:stray_spawn_egg)_
  static const ItemType stray_spawn_egg = const ItemType('minecraft:stray_spawn_egg');
    

  /// [String](https://minecraft.gamepedia.com/string)
  /// 
  /// _(minecraft:string)_
  static const ItemType string = const ItemType('minecraft:string');
    

  /// [Stripped Acacia Log](https://minecraft.gamepedia.com/stripped_acacia_log)
  /// 
  /// _(minecraft:stripped_acacia_log)_
  static const ItemType stripped_acacia_log = const ItemType('minecraft:stripped_acacia_log');
    

  /// [Stripped Acacia Wood](https://minecraft.gamepedia.com/stripped_acacia_wood)
  /// 
  /// _(minecraft:stripped_acacia_wood)_
  static const ItemType stripped_acacia_wood = const ItemType('minecraft:stripped_acacia_wood');
    

  /// [Stripped Birch Log](https://minecraft.gamepedia.com/stripped_birch_log)
  /// 
  /// _(minecraft:stripped_birch_log)_
  static const ItemType stripped_birch_log = const ItemType('minecraft:stripped_birch_log');
    

  /// [Stripped Birch Wood](https://minecraft.gamepedia.com/stripped_birch_wood)
  /// 
  /// _(minecraft:stripped_birch_wood)_
  static const ItemType stripped_birch_wood = const ItemType('minecraft:stripped_birch_wood');
    

  /// [Stripped Dark Oak Log](https://minecraft.gamepedia.com/stripped_dark_oak_log)
  /// 
  /// _(minecraft:stripped_dark_oak_log)_
  static const ItemType stripped_dark_oak_log = const ItemType('minecraft:stripped_dark_oak_log');
    

  /// [Stripped Dark Oak Wood](https://minecraft.gamepedia.com/stripped_dark_oak_wood)
  /// 
  /// _(minecraft:stripped_dark_oak_wood)_
  static const ItemType stripped_dark_oak_wood = const ItemType('minecraft:stripped_dark_oak_wood');
    

  /// [Stripped Jungle Log](https://minecraft.gamepedia.com/stripped_jungle_log)
  /// 
  /// _(minecraft:stripped_jungle_log)_
  static const ItemType stripped_jungle_log = const ItemType('minecraft:stripped_jungle_log');
    

  /// [Stripped Jungle Wood](https://minecraft.gamepedia.com/stripped_jungle_wood)
  /// 
  /// _(minecraft:stripped_jungle_wood)_
  static const ItemType stripped_jungle_wood = const ItemType('minecraft:stripped_jungle_wood');
    

  /// [Stripped Oak Log](https://minecraft.gamepedia.com/stripped_oak_log)
  /// 
  /// _(minecraft:stripped_oak_log)_
  static const ItemType stripped_oak_log = const ItemType('minecraft:stripped_oak_log');
    

  /// [Stripped Oak Wood](https://minecraft.gamepedia.com/stripped_oak_wood)
  /// 
  /// _(minecraft:stripped_oak_wood)_
  static const ItemType stripped_oak_wood = const ItemType('minecraft:stripped_oak_wood');
    

  /// [Stripped Spruce Log](https://minecraft.gamepedia.com/stripped_spruce_log)
  /// 
  /// _(minecraft:stripped_spruce_log)_
  static const ItemType stripped_spruce_log = const ItemType('minecraft:stripped_spruce_log');
    

  /// [Stripped Spruce Wood](https://minecraft.gamepedia.com/stripped_spruce_wood)
  /// 
  /// _(minecraft:stripped_spruce_wood)_
  static const ItemType stripped_spruce_wood = const ItemType('minecraft:stripped_spruce_wood');
    

  /// [Structure Block](https://minecraft.gamepedia.com/structure_block)
  /// 
  /// _(minecraft:structure_block)_
  static const ItemType structure_block = const ItemType('minecraft:structure_block');
    

  /// [Structure Void](https://minecraft.gamepedia.com/structure_void)
  /// 
  /// _(minecraft:structure_void)_
  static const ItemType structure_void = const ItemType('minecraft:structure_void');
    

  /// [Sugar](https://minecraft.gamepedia.com/sugar)
  /// 
  /// _(minecraft:sugar)_
  static const ItemType sugar = const ItemType('minecraft:sugar');
    

  /// [Sugar Canes](https://minecraft.gamepedia.com/sugar_cane)
  /// 
  /// _(minecraft:sugar_cane)_
  static const ItemType sugar_cane = const ItemType('minecraft:sugar_cane');
    

  /// [Sunflower](https://minecraft.gamepedia.com/sunflower)
  /// 
  /// _(minecraft:sunflower)_
  static const ItemType sunflower = const ItemType('minecraft:sunflower');
    

  /// [Suspicious Stew](https://minecraft.gamepedia.com/suspicious_stew)
  /// 
  /// _(minecraft:suspicious_stew)_
  static const ItemType suspicious_stew = const ItemType('minecraft:suspicious_stew');
    

  /// [Sweet Berries](https://minecraft.gamepedia.com/sweet_berries)
  /// 
  /// _(minecraft:sweet_berries)_
  static const ItemType sweet_berries = const ItemType('minecraft:sweet_berries');
    

  /// [Double Tallgrass](https://minecraft.gamepedia.com/tall_grass)
  /// 
  /// _(minecraft:tall_grass)_
  static const ItemType tall_grass = const ItemType('minecraft:tall_grass');
    

  /// [Terracotta](https://minecraft.gamepedia.com/terracotta)
  /// 
  /// _(minecraft:terracotta)_
  static const ItemType terracotta = const ItemType('minecraft:terracotta');
    

  /// [Arrow of Fire Resistance (0:22)](https://minecraft.gamepedia.com/tipped_arrow)
  /// 
  /// _(minecraft:tipped_arrow)_
  static const ItemType tipped_arrow = const ItemType('minecraft:tipped_arrow');
    

  /// [TNT](https://minecraft.gamepedia.com/tnt)
  /// 
  /// _(minecraft:tnt)_
  static const ItemType tnt = const ItemType('minecraft:tnt');
    

  /// [Minecart with TNT](https://minecraft.gamepedia.com/tnt_minecart)
  /// 
  /// _(minecraft:tnt_minecart)_
  static const ItemType tnt_minecart = const ItemType('minecraft:tnt_minecart');
    

  /// [Torch](https://minecraft.gamepedia.com/torch)
  /// 
  /// _(minecraft:torch)_
  static const ItemType torch = const ItemType('minecraft:torch');
    

  /// [Totem of Undying](https://minecraft.gamepedia.com/totem_of_undying)
  /// 
  /// _(minecraft:totem_of_undying)_
  static const ItemType totem_of_undying = const ItemType('minecraft:totem_of_undying');
    

  /// [Trader Llama Spawn Egg](https://minecraft.gamepedia.com/trader_llama_spawn_egg)
  /// 
  /// _(minecraft:trader_llama_spawn_egg)_
  static const ItemType trader_llama_spawn_egg = const ItemType('minecraft:trader_llama_spawn_egg');
    

  /// [Trapped Chest](https://minecraft.gamepedia.com/trapped_chest)
  /// 
  /// _(minecraft:trapped_chest)_
  static const ItemType trapped_chest = const ItemType('minecraft:trapped_chest');
    

  /// [Trident](https://minecraft.gamepedia.com/trident)
  /// 
  /// _(minecraft:trident)_
  static const ItemType trident = const ItemType('minecraft:trident');
    

  /// [Tripwire Hook](https://minecraft.gamepedia.com/tripwire_hook)
  /// 
  /// _(minecraft:tripwire_hook)_
  static const ItemType tripwire_hook = const ItemType('minecraft:tripwire_hook');
    

  /// [Tropical Fish (Clownfish)](https://minecraft.gamepedia.com/tropical_fish)
  /// 
  /// _(minecraft:tropical_fish)_
  static const ItemType tropical_fish = const ItemType('minecraft:tropical_fish');
    

  /// [Bucket of Tropical Fish](https://minecraft.gamepedia.com/tropical_fish_bucket)
  /// 
  /// _(minecraft:tropical_fish_bucket)_
  static const ItemType tropical_fish_bucket = const ItemType('minecraft:tropical_fish_bucket');
    

  /// [Tropical Fish Spawn Egg](https://minecraft.gamepedia.com/tropical_fish_spawn_egg)
  /// 
  /// _(minecraft:tropical_fish_spawn_egg)_
  static const ItemType tropical_fish_spawn_egg = const ItemType('minecraft:tropical_fish_spawn_egg');
    

  /// [Tube Coral](https://minecraft.gamepedia.com/tube_coral)
  /// 
  /// _(minecraft:tube_coral)_
  static const ItemType tube_coral = const ItemType('minecraft:tube_coral');
    

  /// [Tube Coral Block](https://minecraft.gamepedia.com/tube_coral_block)
  /// 
  /// _(minecraft:tube_coral_block)_
  static const ItemType tube_coral_block = const ItemType('minecraft:tube_coral_block');
    

  /// [Tube Coral Fan](https://minecraft.gamepedia.com/tube_coral_fan)
  /// 
  /// _(minecraft:tube_coral_fan)_
  static const ItemType tube_coral_fan = const ItemType('minecraft:tube_coral_fan');
    

  /// [Turtle Egg](https://minecraft.gamepedia.com/turtle_egg)
  /// 
  /// _(minecraft:turtle_egg)_
  static const ItemType turtle_egg = const ItemType('minecraft:turtle_egg');
    

  /// [Turtle Shell](https://minecraft.gamepedia.com/turtle_helmet)
  /// 
  /// _(minecraft:turtle_helmet)_
  static const ItemType turtle_helmet = const ItemType('minecraft:turtle_helmet');
    

  /// [Turtle Spawn Egg](https://minecraft.gamepedia.com/turtle_spawn_egg)
  /// 
  /// _(minecraft:turtle_spawn_egg)_
  static const ItemType turtle_spawn_egg = const ItemType('minecraft:turtle_spawn_egg');
    

  /// [Vex Spawn Egg](https://minecraft.gamepedia.com/vex_spawn_egg)
  /// 
  /// _(minecraft:vex_spawn_egg)_
  static const ItemType vex_spawn_egg = const ItemType('minecraft:vex_spawn_egg');
    

  /// [Villager Spawn Egg](https://minecraft.gamepedia.com/villager_spawn_egg)
  /// 
  /// _(minecraft:villager_spawn_egg)_
  static const ItemType villager_spawn_egg = const ItemType('minecraft:villager_spawn_egg');
    

  /// [Vindicator Spawn Egg](https://minecraft.gamepedia.com/vindicator_spawn_egg)
  /// 
  /// _(minecraft:vindicator_spawn_egg)_
  static const ItemType vindicator_spawn_egg = const ItemType('minecraft:vindicator_spawn_egg');
    

  /// [Vines](https://minecraft.gamepedia.com/vine)
  /// 
  /// _(minecraft:vine)_
  static const ItemType vine = const ItemType('minecraft:vine');
    

  /// [Wandering Trader Spawn Egg](https://minecraft.gamepedia.com/wandering_trader_spawn_egg)
  /// 
  /// _(minecraft:wandering_trader_spawn_egg)_
  static const ItemType wandering_trader_spawn_egg = const ItemType('minecraft:wandering_trader_spawn_egg');
    

  /// [Water Bucket](https://minecraft.gamepedia.com/water_bucket)
  /// 
  /// _(minecraft:water_bucket)_
  static const ItemType water_bucket = const ItemType('minecraft:water_bucket');
    

  /// [Wet Sponge](https://minecraft.gamepedia.com/wet_sponge)
  /// 
  /// _(minecraft:wet_sponge)_
  static const ItemType wet_sponge = const ItemType('minecraft:wet_sponge');
    

  /// [Wheat](https://minecraft.gamepedia.com/wheat)
  /// 
  /// _(minecraft:wheat)_
  static const ItemType wheat = const ItemType('minecraft:wheat');
    

  /// [Seeds](https://minecraft.gamepedia.com/wheat_seeds)
  /// 
  /// _(minecraft:wheat_seeds)_
  static const ItemType wheat_seeds = const ItemType('minecraft:wheat_seeds');
    

  /// [White Banner](https://minecraft.gamepedia.com/white_banner)
  /// 
  /// _(minecraft:white_banner)_
  static const ItemType white_banner = const ItemType('minecraft:white_banner');
    

  /// [White Bed](https://minecraft.gamepedia.com/white_bed)
  /// 
  /// _(minecraft:white_bed)_
  static const ItemType white_bed = const ItemType('minecraft:white_bed');
    

  /// [White Carpet](https://minecraft.gamepedia.com/white_carpet)
  /// 
  /// _(minecraft:white_carpet)_
  static const ItemType white_carpet = const ItemType('minecraft:white_carpet');
    

  /// [White Concrete](https://minecraft.gamepedia.com/white_concrete)
  /// 
  /// _(minecraft:white_concrete)_
  static const ItemType white_concrete = const ItemType('minecraft:white_concrete');
    

  /// [White Concrete Powder](https://minecraft.gamepedia.com/white_concrete_powder)
  /// 
  /// _(minecraft:white_concrete_powder)_
  static const ItemType white_concrete_powder = const ItemType('minecraft:white_concrete_powder');
    

  /// [White Dye](https://minecraft.gamepedia.com/white_dye)
  /// 
  /// _(minecraft:white_dye)_
  static const ItemType white_dye = const ItemType('minecraft:white_dye');
    

  /// [White Glazed Terracotta](https://minecraft.gamepedia.com/white_glazed_terracotta)
  /// 
  /// _(minecraft:white_glazed_terracotta)_
  static const ItemType white_glazed_terracotta = const ItemType('minecraft:white_glazed_terracotta');
    

  /// [White Shulker Box](https://minecraft.gamepedia.com/white_shulker_box)
  /// 
  /// _(minecraft:white_shulker_box)_
  static const ItemType white_shulker_box = const ItemType('minecraft:white_shulker_box');
    

  /// [White Stained Glass](https://minecraft.gamepedia.com/white_stained_glass)
  /// 
  /// _(minecraft:white_stained_glass)_
  static const ItemType white_stained_glass = const ItemType('minecraft:white_stained_glass');
    

  /// [White Stained Glass Pane](https://minecraft.gamepedia.com/white_stained_glass_pane)
  /// 
  /// _(minecraft:white_stained_glass_pane)_
  static const ItemType white_stained_glass_pane = const ItemType('minecraft:white_stained_glass_pane');
    

  /// [White Terracotta](https://minecraft.gamepedia.com/white_terracotta)
  /// 
  /// _(minecraft:white_terracotta)_
  static const ItemType white_terracotta = const ItemType('minecraft:white_terracotta');
    

  /// [White Tulip](https://minecraft.gamepedia.com/white_tulip)
  /// 
  /// _(minecraft:white_tulip)_
  static const ItemType white_tulip = const ItemType('minecraft:white_tulip');
    

  /// [White Wool](https://minecraft.gamepedia.com/white_wool)
  /// 
  /// _(minecraft:white_wool)_
  static const ItemType white_wool = const ItemType('minecraft:white_wool');
    

  /// [Witch Spawn Egg](https://minecraft.gamepedia.com/witch_spawn_egg)
  /// 
  /// _(minecraft:witch_spawn_egg)_
  static const ItemType witch_spawn_egg = const ItemType('minecraft:witch_spawn_egg');
    

  /// [Wither Rose](https://minecraft.gamepedia.com/wither_rose)
  /// 
  /// _(minecraft:wither_rose)_
  static const ItemType wither_rose = const ItemType('minecraft:wither_rose');
    

  /// [Wither Skeleton Skull](https://minecraft.gamepedia.com/wither_skeleton_skull)
  /// 
  /// _(minecraft:wither_skeleton_skull)_
  static const ItemType wither_skeleton_skull = const ItemType('minecraft:wither_skeleton_skull');
    

  /// [Wither Skeleton Spawn Egg](https://minecraft.gamepedia.com/wither_skeleton_spawn_egg)
  /// 
  /// _(minecraft:wither_skeleton_spawn_egg)_
  static const ItemType wither_skeleton_spawn_egg = const ItemType('minecraft:wither_skeleton_spawn_egg');
    

  /// [Wolf Spawn Egg](https://minecraft.gamepedia.com/wolf_spawn_egg)
  /// 
  /// _(minecraft:wolf_spawn_egg)_
  static const ItemType wolf_spawn_egg = const ItemType('minecraft:wolf_spawn_egg');
    

  /// [Wooden Axe](https://minecraft.gamepedia.com/wooden_axe)
  /// 
  /// _(minecraft:wooden_axe)_
  static const ItemType wooden_axe = const ItemType('minecraft:wooden_axe');
    

  /// [Wooden Hoe](https://minecraft.gamepedia.com/wooden_hoe)
  /// 
  /// _(minecraft:wooden_hoe)_
  static const ItemType wooden_hoe = const ItemType('minecraft:wooden_hoe');
    

  /// [Wooden Pickaxe](https://minecraft.gamepedia.com/wooden_pickaxe)
  /// 
  /// _(minecraft:wooden_pickaxe)_
  static const ItemType wooden_pickaxe = const ItemType('minecraft:wooden_pickaxe');
    

  /// [Wooden Shovel](https://minecraft.gamepedia.com/wooden_shovel)
  /// 
  /// _(minecraft:wooden_shovel)_
  static const ItemType wooden_shovel = const ItemType('minecraft:wooden_shovel');
    

  /// [Wooden Sword](https://minecraft.gamepedia.com/wooden_sword)
  /// 
  /// _(minecraft:wooden_sword)_
  static const ItemType wooden_sword = const ItemType('minecraft:wooden_sword');
    

  /// [Book and Quill](https://minecraft.gamepedia.com/writable_book)
  /// 
  /// _(minecraft:writable_book)_
  static const ItemType writable_book = const ItemType('minecraft:writable_book');
    

  /// [Written Book](https://minecraft.gamepedia.com/written_book)
  /// 
  /// _(minecraft:written_book)_
  static const ItemType written_book = const ItemType('minecraft:written_book');
    

  /// [Yellow Banner](https://minecraft.gamepedia.com/yellow_banner)
  /// 
  /// _(minecraft:yellow_banner)_
  static const ItemType yellow_banner = const ItemType('minecraft:yellow_banner');
    

  /// [Yellow Bed](https://minecraft.gamepedia.com/yellow_bed)
  /// 
  /// _(minecraft:yellow_bed)_
  static const ItemType yellow_bed = const ItemType('minecraft:yellow_bed');
    

  /// [Yellow Carpet](https://minecraft.gamepedia.com/yellow_carpet)
  /// 
  /// _(minecraft:yellow_carpet)_
  static const ItemType yellow_carpet = const ItemType('minecraft:yellow_carpet');
    

  /// [Yellow Concrete](https://minecraft.gamepedia.com/yellow_concrete)
  /// 
  /// _(minecraft:yellow_concrete)_
  static const ItemType yellow_concrete = const ItemType('minecraft:yellow_concrete');
    

  /// [Yellow Concrete Powder](https://minecraft.gamepedia.com/yellow_concrete_powder)
  /// 
  /// _(minecraft:yellow_concrete_powder)_
  static const ItemType yellow_concrete_powder = const ItemType('minecraft:yellow_concrete_powder');
    

  /// [Yellow Dye](https://minecraft.gamepedia.com/yellow_dye)
  /// 
  /// _(minecraft:yellow_dye)_
  static const ItemType yellow_dye = const ItemType('minecraft:yellow_dye');
    

  /// [Yellow Glazed Terracotta](https://minecraft.gamepedia.com/yellow_glazed_terracotta)
  /// 
  /// _(minecraft:yellow_glazed_terracotta)_
  static const ItemType yellow_glazed_terracotta = const ItemType('minecraft:yellow_glazed_terracotta');
    

  /// [Yellow Shulker Box](https://minecraft.gamepedia.com/yellow_shulker_box)
  /// 
  /// _(minecraft:yellow_shulker_box)_
  static const ItemType yellow_shulker_box = const ItemType('minecraft:yellow_shulker_box');
    

  /// [Yellow Stained Glass](https://minecraft.gamepedia.com/yellow_stained_glass)
  /// 
  /// _(minecraft:yellow_stained_glass)_
  static const ItemType yellow_stained_glass = const ItemType('minecraft:yellow_stained_glass');
    

  /// [Yellow Stained Glass Pane](https://minecraft.gamepedia.com/yellow_stained_glass_pane)
  /// 
  /// _(minecraft:yellow_stained_glass_pane)_
  static const ItemType yellow_stained_glass_pane = const ItemType('minecraft:yellow_stained_glass_pane');
    

  /// [Yellow Terracotta](https://minecraft.gamepedia.com/yellow_terracotta)
  /// 
  /// _(minecraft:yellow_terracotta)_
  static const ItemType yellow_terracotta = const ItemType('minecraft:yellow_terracotta');
    

  /// [Yellow Wool](https://minecraft.gamepedia.com/yellow_wool)
  /// 
  /// _(minecraft:yellow_wool)_
  static const ItemType yellow_wool = const ItemType('minecraft:yellow_wool');
    

  /// [Zombie Head](https://minecraft.gamepedia.com/zombie_head)
  /// 
  /// _(minecraft:zombie_head)_
  static const ItemType zombie_head = const ItemType('minecraft:zombie_head');
    

  /// [Zombie Horse Spawn Egg](https://minecraft.gamepedia.com/zombie_horse_spawn_egg)
  /// 
  /// _(minecraft:zombie_horse_spawn_egg)_
  static const ItemType zombie_horse_spawn_egg = const ItemType('minecraft:zombie_horse_spawn_egg');
    

  /// [Zombie Pigman Spawn Egg](https://minecraft.gamepedia.com/zombie_pigman_spawn_egg)
  /// 
  /// _(minecraft:zombie_pigman_spawn_egg)_
  static const ItemType zombie_pigman_spawn_egg = const ItemType('minecraft:zombie_pigman_spawn_egg');
    

  /// [Zombie Spawn Egg](https://minecraft.gamepedia.com/zombie_spawn_egg)
  /// 
  /// _(minecraft:zombie_spawn_egg)_
  static const ItemType zombie_spawn_egg = const ItemType('minecraft:zombie_spawn_egg');
    

  /// [Zombie Villager Spawn Egg](https://minecraft.gamepedia.com/zombie_villager_spawn_egg)
  /// 
  /// _(minecraft:zombie_villager_spawn_egg)_
  static const ItemType zombie_villager_spawn_egg = const ItemType('minecraft:zombie_villager_spawn_egg');
}