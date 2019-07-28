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
    return gsonEncode(this.getMap());
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

static const ItemType turtle_helmet = const ItemType('minecraft:turtle_helmet');
static const ItemType scute = const ItemType('minecraft:scute');
static const ItemType iron_shovel = const ItemType('minecraft:iron_shovel');
static const ItemType iron_pickaxe = const ItemType('minecraft:iron_pickaxe');
static const ItemType iron_axe = const ItemType('minecraft:iron_axe');
static const ItemType flint_and_steel = const ItemType('minecraft:flint_and_steel');
static const ItemType apple = const ItemType('minecraft:apple');
static const ItemType bow = const ItemType('minecraft:bow');
static const ItemType arrow = const ItemType('minecraft:arrow');
static const ItemType coal = const ItemType('minecraft:coal');
static const ItemType charcoal = const ItemType('minecraft:charcoal');
static const ItemType diamond = const ItemType('minecraft:diamond');
static const ItemType iron_ingot = const ItemType('minecraft:iron_ingot');
static const ItemType gold_ingot = const ItemType('minecraft:gold_ingot');
static const ItemType iron_sword = const ItemType('minecraft:iron_sword');
static const ItemType wooden_sword = const ItemType('minecraft:wooden_sword');
static const ItemType wooden_shovel = const ItemType('minecraft:wooden_shovel');
static const ItemType wooden_pickaxe = const ItemType('minecraft:wooden_pickaxe');
static const ItemType wooden_axe = const ItemType('minecraft:wooden_axe');
static const ItemType stone_sword = const ItemType('minecraft:stone_sword');
static const ItemType stone_shovel = const ItemType('minecraft:stone_shovel');
static const ItemType stone_pickaxe = const ItemType('minecraft:stone_pickaxe');
static const ItemType stone_axe = const ItemType('minecraft:stone_axe');
static const ItemType diamond_sword = const ItemType('minecraft:diamond_sword');
static const ItemType diamond_shovel = const ItemType('minecraft:diamond_shovel');
static const ItemType diamond_pickaxe = const ItemType('minecraft:diamond_pickaxe');
static const ItemType diamond_axe = const ItemType('minecraft:diamond_axe');
static const ItemType stick = const ItemType('minecraft:stick');
static const ItemType bowl = const ItemType('minecraft:bowl');
static const ItemType mushroom_stew = const ItemType('minecraft:mushroom_stew');
static const ItemType golden_sword = const ItemType('minecraft:golden_sword');
static const ItemType golden_shovel = const ItemType('minecraft:golden_shovel');
static const ItemType golden_pickaxe = const ItemType('minecraft:golden_pickaxe');
static const ItemType golden_axe = const ItemType('minecraft:golden_axe');
static const ItemType string = const ItemType('minecraft:string');
static const ItemType feather = const ItemType('minecraft:feather');
static const ItemType gunpowder = const ItemType('minecraft:gunpowder');
static const ItemType wooden_hoe = const ItemType('minecraft:wooden_hoe');
static const ItemType stone_hoe = const ItemType('minecraft:stone_hoe');
static const ItemType iron_hoe = const ItemType('minecraft:iron_hoe');
static const ItemType diamond_hoe = const ItemType('minecraft:diamond_hoe');
static const ItemType golden_hoe = const ItemType('minecraft:golden_hoe');
static const ItemType wheat_seeds = const ItemType('minecraft:wheat_seeds');
static const ItemType wheat = const ItemType('minecraft:wheat');
static const ItemType bread = const ItemType('minecraft:bread');
static const ItemType leather_helmet = const ItemType('minecraft:leather_helmet');
static const ItemType leather_chestplate = const ItemType('minecraft:leather_chestplate');
static const ItemType leather_leggings = const ItemType('minecraft:leather_leggings');
static const ItemType leather_boots = const ItemType('minecraft:leather_boots');
static const ItemType chainmail_helmet = const ItemType('minecraft:chainmail_helmet');
static const ItemType chainmail_chestplate = const ItemType('minecraft:chainmail_chestplate');
static const ItemType chainmail_leggings = const ItemType('minecraft:chainmail_leggings');
static const ItemType chainmail_boots = const ItemType('minecraft:chainmail_boots');
static const ItemType iron_helmet = const ItemType('minecraft:iron_helmet');
static const ItemType iron_chestplate = const ItemType('minecraft:iron_chestplate');
static const ItemType iron_leggings = const ItemType('minecraft:iron_leggings');
static const ItemType iron_boots = const ItemType('minecraft:iron_boots');
static const ItemType diamond_helmet = const ItemType('minecraft:diamond_helmet');
static const ItemType diamond_chestplate = const ItemType('minecraft:diamond_chestplate');
static const ItemType diamond_leggings = const ItemType('minecraft:diamond_leggings');
static const ItemType diamond_boots = const ItemType('minecraft:diamond_boots');
static const ItemType golden_helmet = const ItemType('minecraft:golden_helmet');
static const ItemType golden_chestplate = const ItemType('minecraft:golden_chestplate');
static const ItemType golden_leggings = const ItemType('minecraft:golden_leggings');
static const ItemType golden_boots = const ItemType('minecraft:golden_boots');
static const ItemType flint = const ItemType('minecraft:flint');
static const ItemType porkchop = const ItemType('minecraft:porkchop');
static const ItemType cooked_porkchop = const ItemType('minecraft:cooked_porkchop');
static const ItemType painting = const ItemType('minecraft:painting');
static const ItemType golden_apple = const ItemType('minecraft:golden_apple');
static const ItemType enchanted_golden_apple = const ItemType('minecraft:enchanted_golden_apple');
static const ItemType sign = const ItemType('minecraft:sign');
static const ItemType bucket = const ItemType('minecraft:bucket');
static const ItemType water_bucket = const ItemType('minecraft:water_bucket');
static const ItemType lava_bucket = const ItemType('minecraft:lava_bucket');
static const ItemType minecart = const ItemType('minecraft:minecart');
static const ItemType saddle = const ItemType('minecraft:saddle');
static const ItemType redstone = const ItemType('minecraft:redstone');
static const ItemType snowball = const ItemType('minecraft:snowball');
static const ItemType oak_boat = const ItemType('minecraft:oak_boat');
static const ItemType leather = const ItemType('minecraft:leather');
static const ItemType milk_bucket = const ItemType('minecraft:milk_bucket');
static const ItemType pufferfish_bucket = const ItemType('minecraft:pufferfish_bucket');
static const ItemType salmon_bucket = const ItemType('minecraft:salmon_bucket');
static const ItemType cod_bucket = const ItemType('minecraft:cod_bucket');
static const ItemType clownfish_bucket = const ItemType('minecraft:clownfish_bucket');
static const ItemType brick = const ItemType('minecraft:brick');
static const ItemType clay_ball = const ItemType('minecraft:clay_ball');
static const ItemType paper = const ItemType('minecraft:paper');
static const ItemType book = const ItemType('minecraft:book');
static const ItemType slime_ball = const ItemType('minecraft:slime_ball');
static const ItemType chest_minecart = const ItemType('minecraft:chest_minecart');
static const ItemType furnace_minecart = const ItemType('minecraft:furnace_minecart');
static const ItemType egg = const ItemType('minecraft:egg');
static const ItemType compass = const ItemType('minecraft:compass');
static const ItemType fishing_rod = const ItemType('minecraft:fishing_rod');
static const ItemType clock = const ItemType('minecraft:clock');
static const ItemType glowstone_dust = const ItemType('minecraft:glowstone_dust');
static const ItemType cod = const ItemType('minecraft:cod');
static const ItemType salmon = const ItemType('minecraft:salmon');
static const ItemType clownfish = const ItemType('minecraft:clownfish');
static const ItemType pufferfish = const ItemType('minecraft:pufferfish');
static const ItemType cooked_cod = const ItemType('minecraft:cooked_cod');
static const ItemType cooked_salmon = const ItemType('minecraft:cooked_salmon');
static const ItemType ink_sac = const ItemType('minecraft:ink_sac');
static const ItemType rose_red = const ItemType('minecraft:rose_red');
static const ItemType cactus_green = const ItemType('minecraft:cactus_green');
static const ItemType cocoa_beans = const ItemType('minecraft:cocoa_beans');
static const ItemType lapis_lazuli = const ItemType('minecraft:lapis_lazuli');
static const ItemType purple_dye = const ItemType('minecraft:purple_dye');
static const ItemType cyan_dye = const ItemType('minecraft:cyan_dye');
static const ItemType light_gray_dye = const ItemType('minecraft:light_gray_dye');
static const ItemType gray_dye = const ItemType('minecraft:gray_dye');
static const ItemType pink_dye = const ItemType('minecraft:pink_dye');
static const ItemType lime_dye = const ItemType('minecraft:lime_dye');
static const ItemType dandelion_yellow = const ItemType('minecraft:dandelion_yellow');
static const ItemType light_blue_dye = const ItemType('minecraft:light_blue_dye');
static const ItemType magenta_dye = const ItemType('minecraft:magenta_dye');
static const ItemType orange_dye = const ItemType('minecraft:orange_dye');
static const ItemType bone_meal = const ItemType('minecraft:bone_meal');
static const ItemType bone = const ItemType('minecraft:bone');
static const ItemType sugar = const ItemType('minecraft:sugar');
static const ItemType cookie = const ItemType('minecraft:cookie');
static const ItemType filled_map = const ItemType('minecraft:filled_map');
static const ItemType shears = const ItemType('minecraft:shears');
static const ItemType melon = const ItemType('minecraft:melon');
static const ItemType dried_kelp = const ItemType('minecraft:dried_kelp');
static const ItemType pumpkin_seeds = const ItemType('minecraft:pumpkin_seeds');
static const ItemType melon_seeds = const ItemType('minecraft:melon_seeds');
static const ItemType beef = const ItemType('minecraft:beef');
static const ItemType cooked_beef = const ItemType('minecraft:cooked_beef');
static const ItemType chicken = const ItemType('minecraft:chicken');
static const ItemType cooked_chicken = const ItemType('minecraft:cooked_chicken');
static const ItemType rotten_flesh = const ItemType('minecraft:rotten_flesh');
static const ItemType ender_pearl = const ItemType('minecraft:ender_pearl');
static const ItemType blaze_rod = const ItemType('minecraft:blaze_rod');
static const ItemType ghast_tear = const ItemType('minecraft:ghast_tear');
static const ItemType gold_nugget = const ItemType('minecraft:gold_nugget');
static const ItemType nether_wart = const ItemType('minecraft:nether_wart');
static const ItemType potion = const ItemType('minecraft:potion');
static const ItemType glass_bottle = const ItemType('minecraft:glass_bottle');
static const ItemType spider_eye = const ItemType('minecraft:spider_eye');
static const ItemType fermented_spider_eye = const ItemType('minecraft:fermented_spider_eye');
static const ItemType blaze_powder = const ItemType('minecraft:blaze_powder');
static const ItemType magma_cream = const ItemType('minecraft:magma_cream');
static const ItemType brewing_stand = const ItemType('minecraft:brewing_stand');
static const ItemType cauldron = const ItemType('minecraft:cauldron');
static const ItemType ender_eye = const ItemType('minecraft:ender_eye');
static const ItemType speckled_melon = const ItemType('minecraft:speckled_melon');
static const ItemType bat_spawn_egg = const ItemType('minecraft:bat_spawn_egg');
static const ItemType blaze_spawn_egg = const ItemType('minecraft:blaze_spawn_egg');
static const ItemType cave_spider_spawn_egg = const ItemType('minecraft:cave_spider_spawn_egg');
static const ItemType chicken_spawn_egg = const ItemType('minecraft:chicken_spawn_egg');
static const ItemType cow_spawn_egg = const ItemType('minecraft:cow_spawn_egg');
static const ItemType creeper_spawn_egg = const ItemType('minecraft:creeper_spawn_egg');
static const ItemType dolphin_spawn_egg = const ItemType('minecraft:dolphin_spawn_egg');
static const ItemType donkey_spawn_egg = const ItemType('minecraft:donkey_spawn_egg');
static const ItemType drowned_spawn_egg = const ItemType('minecraft:drowned_spawn_egg');
static const ItemType elder_guardian_spawn_egg = const ItemType('minecraft:elder_guardian_spawn_egg');
static const ItemType enderman_spawn_egg = const ItemType('minecraft:enderman_spawn_egg');
static const ItemType endermite_spawn_egg = const ItemType('minecraft:endermite_spawn_egg');
static const ItemType evocation_illager_spawn_egg = const ItemType('minecraft:evocation_illager_spawn_egg');
static const ItemType ghast_spawn_egg = const ItemType('minecraft:ghast_spawn_egg');
static const ItemType guardian_spawn_egg = const ItemType('minecraft:guardian_spawn_egg');
static const ItemType horse_spawn_egg = const ItemType('minecraft:horse_spawn_egg');
static const ItemType husk_spawn_egg = const ItemType('minecraft:husk_spawn_egg');
static const ItemType llama_spawn_egg = const ItemType('minecraft:llama_spawn_egg');
static const ItemType magma_cube_spawn_egg = const ItemType('minecraft:magma_cube_spawn_egg');
static const ItemType mooshroom_spawn_egg = const ItemType('minecraft:mooshroom_spawn_egg');
static const ItemType mule_spawn_egg = const ItemType('minecraft:mule_spawn_egg');
static const ItemType ocelot_spawn_egg = const ItemType('minecraft:ocelot_spawn_egg');
static const ItemType parrot_spawn_egg = const ItemType('minecraft:parrot_spawn_egg');
static const ItemType pig_spawn_egg = const ItemType('minecraft:pig_spawn_egg');
static const ItemType phantom_spawn_egg = const ItemType('minecraft:phantom_spawn_egg');
static const ItemType polar_bear_spawn_egg = const ItemType('minecraft:polar_bear_spawn_egg');
static const ItemType rabbit_spawn_egg = const ItemType('minecraft:rabbit_spawn_egg');
static const ItemType sheep_spawn_egg = const ItemType('minecraft:sheep_spawn_egg');
static const ItemType shulker_spawn_egg = const ItemType('minecraft:shulker_spawn_egg');
static const ItemType silverfish_spawn_egg = const ItemType('minecraft:silverfish_spawn_egg');
static const ItemType skeleton_spawn_egg = const ItemType('minecraft:skeleton_spawn_egg');
static const ItemType skeleton_horse_spawn_egg = const ItemType('minecraft:skeleton_horse_spawn_egg');
static const ItemType slime_spawn_egg = const ItemType('minecraft:slime_spawn_egg');
static const ItemType spider_spawn_egg = const ItemType('minecraft:spider_spawn_egg');
static const ItemType squid_spawn_egg = const ItemType('minecraft:squid_spawn_egg');
static const ItemType stray_spawn_egg = const ItemType('minecraft:stray_spawn_egg');
static const ItemType turtle_spawn_egg = const ItemType('minecraft:turtle_spawn_egg');
static const ItemType vex_spawn_egg = const ItemType('minecraft:vex_spawn_egg');
static const ItemType villager_spawn_egg = const ItemType('minecraft:villager_spawn_egg');
static const ItemType vindication_illager_spawn_egg = const ItemType('minecraft:vindication_illager_spawn_egg');
static const ItemType witch_spawn_egg = const ItemType('minecraft:witch_spawn_egg');
static const ItemType wither_skeleton_spawn_egg = const ItemType('minecraft:wither_skeleton_spawn_egg');
static const ItemType wolf_spawn_egg = const ItemType('minecraft:wolf_spawn_egg');
static const ItemType zombie_spawn_egg = const ItemType('minecraft:zombie_spawn_egg');
static const ItemType zombie_horse_spawn_egg = const ItemType('minecraft:zombie_horse_spawn_egg');
static const ItemType zombie_pigman_spawn_egg = const ItemType('minecraft:zombie_pigman_spawn_egg');
static const ItemType zombie_villager_spawn_egg = const ItemType('minecraft:zombie_villager_spawn_egg');
static const ItemType puffer_fish_spawn_egg = const ItemType('minecraft:puffer_fish_spawn_egg');
static const ItemType salmon_mob_spawn_egg = const ItemType('minecraft:salmon_mob_spawn_egg');
static const ItemType cod_mob_spawn_egg = const ItemType('minecraft:cod_mob_spawn_egg');
static const ItemType tropical_fish_spawn_egg = const ItemType('minecraft:tropical_fish_spawn_egg');
static const ItemType experience_bottle = const ItemType('minecraft:experience_bottle');
static const ItemType fire_charge = const ItemType('minecraft:fire_charge');
static const ItemType writable_book = const ItemType('minecraft:writable_book');
static const ItemType written_book = const ItemType('minecraft:written_book');
static const ItemType emerald = const ItemType('minecraft:emerald');
static const ItemType item_frame = const ItemType('minecraft:item_frame');
static const ItemType flower_pot = const ItemType('minecraft:flower_pot');
static const ItemType carrot = const ItemType('minecraft:carrot');
static const ItemType potato = const ItemType('minecraft:potato');
static const ItemType baked_potato = const ItemType('minecraft:baked_potato');
static const ItemType poisonous_potato = const ItemType('minecraft:poisonous_potato');
static const ItemType map = const ItemType('minecraft:map');
static const ItemType golden_carrot = const ItemType('minecraft:golden_carrot');
static const ItemType skeleton_skull = const ItemType('minecraft:skeleton_skull');
static const ItemType wither_skeleton_skull = const ItemType('minecraft:wither_skeleton_skull');
static const ItemType zombie_head = const ItemType('minecraft:zombie_head');
static const ItemType creeper_head = const ItemType('minecraft:creeper_head');
static const ItemType dragon_head = const ItemType('minecraft:dragon_head');
static const ItemType carrot_on_a_stick = const ItemType('minecraft:carrot_on_a_stick');
static const ItemType nether_star = const ItemType('minecraft:nether_star');
static const ItemType pumpkin_pie = const ItemType('minecraft:pumpkin_pie');
static const ItemType firework_rocket = const ItemType('minecraft:firework_rocket');
static const ItemType firework_star = const ItemType('minecraft:firework_star');
static const ItemType enchanted_book = const ItemType('minecraft:enchanted_book');
static const ItemType nether_brick = const ItemType('minecraft:nether_brick');
static const ItemType quartz = const ItemType('minecraft:quartz');
static const ItemType tnt_minecart = const ItemType('minecraft:tnt_minecart');
static const ItemType hopper_minecart = const ItemType('minecraft:hopper_minecart');
static const ItemType prismarine_shard = const ItemType('minecraft:prismarine_shard');
static const ItemType prismarine_crystals = const ItemType('minecraft:prismarine_crystals');
static const ItemType rabbit = const ItemType('minecraft:rabbit');
static const ItemType cooked_rabbit = const ItemType('minecraft:cooked_rabbit');
static const ItemType rabbit_stew = const ItemType('minecraft:rabbit_stew');
static const ItemType rabbit_foot = const ItemType('minecraft:rabbit_foot');
static const ItemType rabbit_hide = const ItemType('minecraft:rabbit_hide');
static const ItemType armor_stand = const ItemType('minecraft:armor_stand');
static const ItemType iron_horse_armor = const ItemType('minecraft:iron_horse_armor');
static const ItemType golden_horse_armor = const ItemType('minecraft:golden_horse_armor');
static const ItemType diamond_horse_armor = const ItemType('minecraft:diamond_horse_armor');
static const ItemType lead = const ItemType('minecraft:lead');
static const ItemType name_tag = const ItemType('minecraft:name_tag');
static const ItemType command_block_minecart = const ItemType('minecraft:command_block_minecart');
static const ItemType mutton = const ItemType('minecraft:mutton');
static const ItemType cooked_mutton = const ItemType('minecraft:cooked_mutton');
static const ItemType end_crystal = const ItemType('minecraft:end_crystal');
static const ItemType chorus_fruit = const ItemType('minecraft:chorus_fruit');
static const ItemType chorus_fruit_popped = const ItemType('minecraft:chorus_fruit_popped');
static const ItemType beetroot = const ItemType('minecraft:beetroot');
static const ItemType beetroot_seeds = const ItemType('minecraft:beetroot_seeds');
static const ItemType beetroot_soup = const ItemType('minecraft:beetroot_soup');
static const ItemType dragon_breath = const ItemType('minecraft:dragon_breath');
static const ItemType splash_potion = const ItemType('minecraft:splash_potion');
static const ItemType spectral_arrow = const ItemType('minecraft:spectral_arrow');
static const ItemType tipped_arrow = const ItemType('minecraft:tipped_arrow');
static const ItemType lingering_potion = const ItemType('minecraft:lingering_potion');
static const ItemType shield = const ItemType('minecraft:shield');
static const ItemType elytra = const ItemType('minecraft:elytra');
static const ItemType spruce_boat = const ItemType('minecraft:spruce_boat');
static const ItemType birch_boat = const ItemType('minecraft:birch_boat');
static const ItemType jungle_boat = const ItemType('minecraft:jungle_boat');
static const ItemType acacia_boat = const ItemType('minecraft:acacia_boat');
static const ItemType dark_oak_boat = const ItemType('minecraft:dark_oak_boat');
static const ItemType totem_of_undying = const ItemType('minecraft:totem_of_undying');
static const ItemType shulker_shell = const ItemType('minecraft:shulker_shell');
static const ItemType iron_nugget = const ItemType('minecraft:iron_nugget');
static const ItemType knowledge_book = const ItemType('minecraft:knowledge_book');
static const ItemType debug_stick = const ItemType('minecraft:debug_stick');
static const ItemType music_disc_13 = const ItemType('minecraft:music_disc_13');
static const ItemType music_disc_cat = const ItemType('minecraft:music_disc_cat');
static const ItemType music_disc_blocks = const ItemType('minecraft:music_disc_blocks');
static const ItemType music_disc_chirp = const ItemType('minecraft:music_disc_chirp');
static const ItemType music_disc_far = const ItemType('minecraft:music_disc_far');
static const ItemType music_disc_mall = const ItemType('minecraft:music_disc_mall');
static const ItemType music_disc_mellohi = const ItemType('minecraft:music_disc_mellohi');
static const ItemType music_disc_stal = const ItemType('minecraft:music_disc_stal');
static const ItemType music_disc_strad = const ItemType('minecraft:music_disc_strad');
static const ItemType music_disc_ward = const ItemType('minecraft:music_disc_ward');
static const ItemType music_disc_11 = const ItemType('minecraft:music_disc_11');
static const ItemType music_disc_wait = const ItemType('minecraft:music_disc_wait');
static const ItemType trident = const ItemType('minecraft:trident');
static const ItemType phantom_membrane = const ItemType('minecraft:phantom_membrane');
static const ItemType nautilus_shell = const ItemType('minecraft:nautilus_shell');
static const ItemType heart_of_the_sea = const ItemType('minecraft:heart_of_the_sea');

}