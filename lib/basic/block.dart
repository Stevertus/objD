import 'package:gson/gson.dart';

/// This is an util class which provides a wrapper for all available blocks in Minecraft.
/// ```dart
/// Block([minecraft_block_id]) // as string or
/// Block.[minecraft_block_id]
/// ```
class Block {
  final String _block;
  @override
  String toString() {
    return _block;
  }

  /// **Usage:**
  /// ```dart
  /// Block([minecraft_block_id]) // as string or
  /// Block.[minecraft_block_id]
  /// ```
  const Block(this._block);

  static Block nbt(
    dynamic block, {
    Map<String, dynamic> states,
    Map<String, dynamic> nbt,
    String strNbt = "",
  }) {
    String id;
    if (block is String) {
      id = block;
    } else if (block is Block) {
      id = block.toString();
    } else {
      throw ("Please insert a block or string into Block.nbt!");
    }

    String strState = "";
    if (states != null) {
      List<String> liState = [];
      states.forEach((String key, val) {
        liState.add("$key=$val");
      });
      strState = "[${liState.join(',')}]";
    }
    if (nbt != null) strNbt = gson.encode(nbt);
    return Block(id + strState + strNbt);
  }

  static const Block air = Block('minecraft:air');
  static const Block stone = Block('minecraft:stone');
  static const Block granite = Block('minecraft:granite');
  static const Block polished_granite = Block('minecraft:polished_granite');
  static const Block diorite = Block('minecraft:diorite');
  static const Block polished_diorite = Block('minecraft:polished_diorite');
  static const Block andesite = Block('minecraft:andesite');
  static const Block polished_andesite = Block('minecraft:polished_andesite');
  static const Block grass_block = Block('minecraft:grass_block');
  static const Block dirt = Block('minecraft:dirt');
  static const Block coarse_dirt = Block('minecraft:coarse_dirt');
  static const Block podzol = Block('minecraft:podzol');
  static const Block cobblestone = Block('minecraft:cobblestone');
  static const Block oak_planks = Block('minecraft:oak_planks');
  static const Block spruce_planks = Block('minecraft:spruce_planks');
  static const Block birch_planks = Block('minecraft:birch_planks');
  static const Block jungle_planks = Block('minecraft:jungle_planks');
  static const Block acacia_planks = Block('minecraft:acacia_planks');
  static const Block dark_oak_planks = Block('minecraft:dark_oak_planks');
  static const Block oak_sapling = Block('minecraft:oak_sapling');
  static const Block spruce_sapling = Block('minecraft:spruce_sapling');
  static const Block birch_sapling = Block('minecraft:birch_sapling');
  static const Block jungle_sapling = Block('minecraft:jungle_sapling');
  static const Block acacia_sapling = Block('minecraft:acacia_sapling');
  static const Block dark_oak_sapling = Block('minecraft:dark_oak_sapling');
  static const Block bedrock = Block('minecraft:bedrock');
  static const Block water = Block('minecraft:water');
  static const Block lava = Block('minecraft:lava');
  static const Block sand = Block('minecraft:sand');
  static const Block red_sand = Block('minecraft:red_sand');
  static const Block gravel = Block('minecraft:gravel');
  static const Block gold_ore = Block('minecraft:gold_ore');
  static const Block iron_ore = Block('minecraft:iron_ore');
  static const Block coal_ore = Block('minecraft:coal_ore');
  static const Block oak_log = Block('minecraft:oak_log');
  static const Block spruce_log = Block('minecraft:spruce_log');
  static const Block birch_log = Block('minecraft:birch_log');
  static const Block jungle_log = Block('minecraft:jungle_log');
  static const Block acacia_log = Block('minecraft:acacia_log');
  static const Block dark_oak_log = Block('minecraft:dark_oak_log');
  static const Block stripped_spruce_log = Block('minecraft:stripped_spruce_log');
  static const Block stripped_birch_log = Block('minecraft:stripped_birch_log');
  static const Block stripped_jungle_log = Block('minecraft:stripped_jungle_log');
  static const Block stripped_acacia_log = Block('minecraft:stripped_acacia_log');
  static const Block stripped_dark_oak_log = Block('minecraft:stripped_dark_oak_log');
  static const Block stripped_oak_log = Block('minecraft:stripped_oak_log');
  static const Block oak_wood = Block('minecraft:oak_wood');
  static const Block spruce_wood = Block('minecraft:spruce_wood');
  static const Block birch_wood = Block('minecraft:birch_wood');
  static const Block jungle_wood = Block('minecraft:jungle_wood');
  static const Block acacia_wood = Block('minecraft:acacia_wood');
  static const Block dark_oak_wood = Block('minecraft:dark_oak_wood');
  static const Block stripped_oak_wood = Block('minecraft:stripped_oak_wood');
  static const Block stripped_spruce_wood = Block('minecraft:stripped_spruce_wood');
  static const Block stripped_birch_wood = Block('minecraft:stripped_birch_wood');
  static const Block stripped_jungle_wood = Block('minecraft:stripped_jungle_wood');
  static const Block stripped_acacia_wood = Block('minecraft:stripped_acacia_wood');
  static const Block stripped_dark_oak_wood =
      Block('minecraft:stripped_dark_oak_wood');
  static const Block oak_leaves = Block('minecraft:oak_leaves');
  static const Block spruce_leaves = Block('minecraft:spruce_leaves');
  static const Block birch_leaves = Block('minecraft:birch_leaves');
  static const Block jungle_leaves = Block('minecraft:jungle_leaves');
  static const Block acacia_leaves = Block('minecraft:acacia_leaves');
  static const Block dark_oak_leaves = Block('minecraft:dark_oak_leaves');
  static const Block sponge = Block('minecraft:sponge');
  static const Block wet_sponge = Block('minecraft:wet_sponge');
  static const Block glass = Block('minecraft:glass');
  static const Block lapis_ore = Block('minecraft:lapis_ore');
  static const Block lapis_block = Block('minecraft:lapis_block');
  static const Block dispenser = Block('minecraft:dispenser');
  static const Block sandstone = Block('minecraft:sandstone');
  static const Block chiseled_sandstone = Block('minecraft:chiseled_sandstone');
  static const Block cut_sandstone = Block('minecraft:cut_sandstone');
  static const Block note_block = Block('minecraft:note_block');
  static const Block white_bed = Block('minecraft:white_bed');
  static const Block orange_bed = Block('minecraft:orange_bed');
  static const Block magenta_bed = Block('minecraft:magenta_bed');
  static const Block light_blue_bed = Block('minecraft:light_blue_bed');
  static const Block yellow_bed = Block('minecraft:yellow_bed');
  static const Block lime_bed = Block('minecraft:lime_bed');
  static const Block pink_bed = Block('minecraft:pink_bed');
  static const Block gray_bed = Block('minecraft:gray_bed');
  static const Block light_gray_bed = Block('minecraft:light_gray_bed');
  static const Block cyan_bed = Block('minecraft:cyan_bed');
  static const Block purple_bed = Block('minecraft:purple_bed');
  static const Block blue_bed = Block('minecraft:blue_bed');
  static const Block brown_bed = Block('minecraft:brown_bed');
  static const Block green_bed = Block('minecraft:green_bed');
  static const Block red_bed = Block('minecraft:red_bed');
  static const Block black_bed = Block('minecraft:black_bed');
  static const Block powered_rail = Block('minecraft:powered_rail');
  static const Block detector_rail = Block('minecraft:detector_rail');
  static const Block sticky_piston = Block('minecraft:sticky_piston');
  static const Block cobweb = Block('minecraft:cobweb');
  static const Block grass = Block('minecraft:grass');
  static const Block fern = Block('minecraft:fern');
  static const Block dead_bush = Block('minecraft:dead_bush');
  static const Block seagrass = Block('minecraft:seagrass');
  static const Block tall_seagrass = Block('minecraft:tall_seagrass');
  static const Block piston = Block('minecraft:piston');
  static const Block piston_head = Block('minecraft:piston_head');
  static const Block white_wool = Block('minecraft:white_wool');
  static const Block orange_wool = Block('minecraft:orange_wool');
  static const Block magenta_wool = Block('minecraft:magenta_wool');
  static const Block light_blue_wool = Block('minecraft:light_blue_wool');
  static const Block yellow_wool = Block('minecraft:yellow_wool');
  static const Block lime_wool = Block('minecraft:lime_wool');
  static const Block pink_wool = Block('minecraft:pink_wool');
  static const Block gray_wool = Block('minecraft:gray_wool');
  static const Block light_gray_wool = Block('minecraft:light_gray_wool');
  static const Block cyan_wool = Block('minecraft:cyan_wool');
  static const Block purple_wool = Block('minecraft:purple_wool');
  static const Block blue_wool = Block('minecraft:blue_wool');
  static const Block brown_wool = Block('minecraft:brown_wool');
  static const Block green_wool = Block('minecraft:green_wool');
  static const Block red_wool = Block('minecraft:red_wool');
  static const Block black_wool = Block('minecraft:black_wool');
  static const Block moving_piston = Block('minecraft:moving_piston');
  static const Block dandelion = Block('minecraft:dandelion');
  static const Block poppy = Block('minecraft:poppy');
  static const Block blue_orchid = Block('minecraft:blue_orchid');
  static const Block allium = Block('minecraft:allium');
  static const Block azure_bluet = Block('minecraft:azure_bluet');
  static const Block red_tulip = Block('minecraft:red_tulip');
  static const Block orange_tulip = Block('minecraft:orange_tulip');
  static const Block white_tulip = Block('minecraft:white_tulip');
  static const Block pink_tulip = Block('minecraft:pink_tulip');
  static const Block oxeye_daisy = Block('minecraft:oxeye_daisy');
  static const Block cornflower = Block('minecraft:cornflower');
  static const Block wither_rose = Block('minecraft:wither_rose');
  static const Block lily_of_the_valley = Block('minecraft:lily_of_the_valley');
  static const Block brown_mushroom = Block('minecraft:brown_mushroom');
  static const Block red_mushroom = Block('minecraft:red_mushroom');
  static const Block gold_block = Block('minecraft:gold_block');
  static const Block iron_block = Block('minecraft:iron_block');
  static const Block bricks = Block('minecraft:bricks');
  static const Block tnt = Block('minecraft:tnt');
  static const Block bookshelf = Block('minecraft:bookshelf');
  static const Block mossy_cobblestone = Block('minecraft:mossy_cobblestone');
  static const Block obsidian = Block('minecraft:obsidian');
  static const Block torch = Block('minecraft:torch');
  static const Block wall_torch = Block('minecraft:wall_torch');
  static const Block fire = Block('minecraft:fire');
  static const Block spawner = Block('minecraft:spawner');
  static const Block oak_stairs = Block('minecraft:oak_stairs');
  static const Block chest = Block('minecraft:chest');
  static const Block redstone_wire = Block('minecraft:redstone_wire');
  static const Block diamond_ore = Block('minecraft:diamond_ore');
  static const Block diamond_block = Block('minecraft:diamond_block');
  static const Block crafting_table = Block('minecraft:crafting_table');
  static const Block wheat = Block('minecraft:wheat');
  static const Block farmland = Block('minecraft:farmland');
  static const Block furnace = Block('minecraft:furnace');
  static const Block oak_sign = Block('minecraft:oak_sign');
  static const Block spruce_sign = Block('minecraft:spruce_sign');
  static const Block birch_sign = Block('minecraft:birch_sign');
  static const Block acacia_sign = Block('minecraft:acacia_sign');
  static const Block jungle_sign = Block('minecraft:jungle_sign');
  static const Block dark_oak_sign = Block('minecraft:dark_oak_sign');
  static const Block oak_door = Block('minecraft:oak_door');
  static const Block ladder = Block('minecraft:ladder');
  static const Block rail = Block('minecraft:rail');
  static const Block cobblestone_stairs = Block('minecraft:cobblestone_stairs');
  static const Block oak_wall_sign = Block('minecraft:oak_wall_sign');
  static const Block spruce_wall_sign = Block('minecraft:spruce_wall_sign');
  static const Block birch_wall_sign = Block('minecraft:birch_wall_sign');
  static const Block acacia_wall_sign = Block('minecraft:acacia_wall_sign');
  static const Block jungle_wall_sign = Block('minecraft:jungle_wall_sign');
  static const Block dark_oak_wall_sign = Block('minecraft:dark_oak_wall_sign');
  static const Block lever = Block('minecraft:lever');
  static const Block stone_pressure_plate = Block('minecraft:stone_pressure_plate');
  static const Block iron_door = Block('minecraft:iron_door');
  static const Block oak_pressure_plate = Block('minecraft:oak_pressure_plate');
  static const Block spruce_pressure_plate = Block('minecraft:spruce_pressure_plate');
  static const Block birch_pressure_plate = Block('minecraft:birch_pressure_plate');
  static const Block jungle_pressure_plate = Block('minecraft:jungle_pressure_plate');
  static const Block acacia_pressure_plate = Block('minecraft:acacia_pressure_plate');
  static const Block dark_oak_pressure_plate =
      Block('minecraft:dark_oak_pressure_plate');
  static const Block redstone_ore = Block('minecraft:redstone_ore');
  static const Block redstone_torch = Block('minecraft:redstone_torch');
  static const Block redstone_wall_torch = Block('minecraft:redstone_wall_torch');
  static const Block stone_button = Block('minecraft:stone_button');
  static const Block snow = Block('minecraft:snow');
  static const Block ice = Block('minecraft:ice');
  static const Block snow_block = Block('minecraft:snow_block');
  static const Block cactus = Block('minecraft:cactus');
  static const Block clay = Block('minecraft:clay');
  static const Block sugar_cane = Block('minecraft:sugar_cane');
  static const Block jukebox = Block('minecraft:jukebox');
  static const Block oak_fence = Block('minecraft:oak_fence');
  static const Block pumpkin = Block('minecraft:pumpkin');
  static const Block netherrack = Block('minecraft:netherrack');
  static const Block soul_sand = Block('minecraft:soul_sand');
  static const Block glowstone = Block('minecraft:glowstone');
  static const Block nether_portal = Block('minecraft:nether_portal');
  static const Block carved_pumpkin = Block('minecraft:carved_pumpkin');
  static const Block jack_o_lantern = Block('minecraft:jack_o_lantern');
  static const Block cake = Block('minecraft:cake');
  static const Block repeater = Block('minecraft:repeater');
  static const Block white_stained_glass = Block('minecraft:white_stained_glass');
  static const Block orange_stained_glass = Block('minecraft:orange_stained_glass');
  static const Block magenta_stained_glass = Block('minecraft:magenta_stained_glass');
  static const Block light_blue_stained_glass =
      Block('minecraft:light_blue_stained_glass');
  static const Block yellow_stained_glass = Block('minecraft:yellow_stained_glass');
  static const Block lime_stained_glass = Block('minecraft:lime_stained_glass');
  static const Block pink_stained_glass = Block('minecraft:pink_stained_glass');
  static const Block gray_stained_glass = Block('minecraft:gray_stained_glass');
  static const Block light_gray_stained_glass =
      Block('minecraft:light_gray_stained_glass');
  static const Block cyan_stained_glass = Block('minecraft:cyan_stained_glass');
  static const Block purple_stained_glass = Block('minecraft:purple_stained_glass');
  static const Block blue_stained_glass = Block('minecraft:blue_stained_glass');
  static const Block brown_stained_glass = Block('minecraft:brown_stained_glass');
  static const Block green_stained_glass = Block('minecraft:green_stained_glass');
  static const Block red_stained_glass = Block('minecraft:red_stained_glass');
  static const Block black_stained_glass = Block('minecraft:black_stained_glass');
  static const Block oak_trapdoor = Block('minecraft:oak_trapdoor');
  static const Block spruce_trapdoor = Block('minecraft:spruce_trapdoor');
  static const Block birch_trapdoor = Block('minecraft:birch_trapdoor');
  static const Block jungle_trapdoor = Block('minecraft:jungle_trapdoor');
  static const Block acacia_trapdoor = Block('minecraft:acacia_trapdoor');
  static const Block dark_oak_trapdoor = Block('minecraft:dark_oak_trapdoor');
  static const Block stone_bricks = Block('minecraft:stone_bricks');
  static const Block mossy_stone_bricks = Block('minecraft:mossy_stone_bricks');
  static const Block cracked_stone_bricks = Block('minecraft:cracked_stone_bricks');
  static const Block chiseled_stone_bricks = Block('minecraft:chiseled_stone_bricks');
  static const Block infested_stone = Block('minecraft:infested_stone');
  static const Block infested_cobblestone = Block('minecraft:infested_cobblestone');
  static const Block infested_stone_bricks = Block('minecraft:infested_stone_bricks');
  static const Block infested_mossy_stone_bricks =
      Block('minecraft:infested_mossy_stone_bricks');
  static const Block infested_cracked_stone_bricks =
      Block('minecraft:infested_cracked_stone_bricks');
  static const Block infested_chiseled_stone_bricks =
      Block('minecraft:infested_chiseled_stone_bricks');
  static const Block brown_mushroom_block = Block('minecraft:brown_mushroom_block');
  static const Block red_mushroom_block = Block('minecraft:red_mushroom_block');
  static const Block mushroom_stem = Block('minecraft:mushroom_stem');
  static const Block iron_bars = Block('minecraft:iron_bars');
  static const Block glass_pane = Block('minecraft:glass_pane');
  static const Block melon = Block('minecraft:melon');
  static const Block attached_pumpkin_stem = Block('minecraft:attached_pumpkin_stem');
  static const Block attached_melon_stem = Block('minecraft:attached_melon_stem');
  static const Block pumpkin_stem = Block('minecraft:pumpkin_stem');
  static const Block melon_stem = Block('minecraft:melon_stem');
  static const Block vine = Block('minecraft:vine');
  static const Block oak_fence_gate = Block('minecraft:oak_fence_gate');
  static const Block brick_stairs = Block('minecraft:brick_stairs');
  static const Block stone_brick_stairs = Block('minecraft:stone_brick_stairs');
  static const Block mycelium = Block('minecraft:mycelium');
  static const Block lily_pad = Block('minecraft:lily_pad');
  static const Block nether_bricks = Block('minecraft:nether_bricks');
  static const Block nether_brick_fence = Block('minecraft:nether_brick_fence');
  static const Block nether_brick_stairs = Block('minecraft:nether_brick_stairs');
  static const Block nether_wart = Block('minecraft:nether_wart');
  static const Block enchanting_table = Block('minecraft:enchanting_table');
  static const Block brewing_stand = Block('minecraft:brewing_stand');
  static const Block cauldron = Block('minecraft:cauldron');
  static const Block end_portal = Block('minecraft:end_portal');
  static const Block end_portal_frame = Block('minecraft:end_portal_frame');
  static const Block end_stone = Block('minecraft:end_stone');
  static const Block dragon_egg = Block('minecraft:dragon_egg');
  static const Block redstone_lamp = Block('minecraft:redstone_lamp');
  static const Block cocoa = Block('minecraft:cocoa');
  static const Block sandstone_stairs = Block('minecraft:sandstone_stairs');
  static const Block emerald_ore = Block('minecraft:emerald_ore');
  static const Block ender_chest = Block('minecraft:ender_chest');
  static const Block tripwire_hook = Block('minecraft:tripwire_hook');
  static const Block tripwire = Block('minecraft:tripwire');
  static const Block emerald_block = Block('minecraft:emerald_block');
  static const Block spruce_stairs = Block('minecraft:spruce_stairs');
  static const Block birch_stairs = Block('minecraft:birch_stairs');
  static const Block jungle_stairs = Block('minecraft:jungle_stairs');
  static const Block command_block = Block('minecraft:command_block');
  static const Block beacon = Block('minecraft:beacon');
  static const Block cobblestone_wall = Block('minecraft:cobblestone_wall');
  static const Block mossy_cobblestone_wall =
      Block('minecraft:mossy_cobblestone_wall');
  static const Block flower_pot = Block('minecraft:flower_pot');
  static const Block potted_oak_sapling = Block('minecraft:potted_oak_sapling');
  static const Block potted_spruce_sapling = Block('minecraft:potted_spruce_sapling');
  static const Block potted_birch_sapling = Block('minecraft:potted_birch_sapling');
  static const Block potted_jungle_sapling = Block('minecraft:potted_jungle_sapling');
  static const Block potted_acacia_sapling = Block('minecraft:potted_acacia_sapling');
  static const Block potted_dark_oak_sapling =
      Block('minecraft:potted_dark_oak_sapling');
  static const Block potted_fern = Block('minecraft:potted_fern');
  static const Block potted_dandelion = Block('minecraft:potted_dandelion');
  static const Block potted_poppy = Block('minecraft:potted_poppy');
  static const Block potted_blue_orchid = Block('minecraft:potted_blue_orchid');
  static const Block potted_allium = Block('minecraft:potted_allium');
  static const Block potted_azure_bluet = Block('minecraft:potted_azure_bluet');
  static const Block potted_red_tulip = Block('minecraft:potted_red_tulip');
  static const Block potted_orange_tulip = Block('minecraft:potted_orange_tulip');
  static const Block potted_white_tulip = Block('minecraft:potted_white_tulip');
  static const Block potted_pink_tulip = Block('minecraft:potted_pink_tulip');
  static const Block potted_oxeye_daisy = Block('minecraft:potted_oxeye_daisy');
  static const Block potted_cornflower = Block('minecraft:potted_cornflower');
  static const Block potted_lily_of_the_valley =
      Block('minecraft:potted_lily_of_the_valley');
  static const Block potted_wither_rose = Block('minecraft:potted_wither_rose');
  static const Block potted_red_mushroom = Block('minecraft:potted_red_mushroom');
  static const Block potted_brown_mushroom = Block('minecraft:potted_brown_mushroom');
  static const Block potted_dead_bush = Block('minecraft:potted_dead_bush');
  static const Block potted_cactus = Block('minecraft:potted_cactus');
  static const Block carrots = Block('minecraft:carrots');
  static const Block potatoes = Block('minecraft:potatoes');
  static const Block oak_button = Block('minecraft:oak_button');
  static const Block spruce_button = Block('minecraft:spruce_button');
  static const Block birch_button = Block('minecraft:birch_button');
  static const Block jungle_button = Block('minecraft:jungle_button');
  static const Block acacia_button = Block('minecraft:acacia_button');
  static const Block dark_oak_button = Block('minecraft:dark_oak_button');
  static const Block skeleton_skull = Block('minecraft:skeleton_skull');
  static const Block skeleton_wall_skull = Block('minecraft:skeleton_wall_skull');
  static const Block wither_skeleton_skull = Block('minecraft:wither_skeleton_skull');
  static const Block wither_skeleton_wall_skull =
      Block('minecraft:wither_skeleton_wall_skull');
  static const Block zombie_head = Block('minecraft:zombie_head');
  static const Block zombie_wall_head = Block('minecraft:zombie_wall_head');
  static const Block player_head = Block('minecraft:player_head');
  static const Block player_wall_head = Block('minecraft:player_wall_head');
  static const Block creeper_head = Block('minecraft:creeper_head');
  static const Block creeper_wall_head = Block('minecraft:creeper_wall_head');
  static const Block dragon_head = Block('minecraft:dragon_head');
  static const Block dragon_wall_head = Block('minecraft:dragon_wall_head');
  static const Block anvil = Block('minecraft:anvil');
  static const Block chipped_anvil = Block('minecraft:chipped_anvil');
  static const Block damaged_anvil = Block('minecraft:damaged_anvil');
  static const Block trapped_chest = Block('minecraft:trapped_chest');
  static const Block light_weighted_pressure_plate =
      Block('minecraft:light_weighted_pressure_plate');
  static const Block heavy_weighted_pressure_plate =
      Block('minecraft:heavy_weighted_pressure_plate');
  static const Block comparator = Block('minecraft:comparator');
  static const Block daylight_detector = Block('minecraft:daylight_detector');
  static const Block redstone_block = Block('minecraft:redstone_block');
  static const Block nether_quartz_ore = Block('minecraft:nether_quartz_ore');
  static const Block hopper = Block('minecraft:hopper');
  static const Block quartz_block = Block('minecraft:quartz_block');
  static const Block chiseled_quartz_block = Block('minecraft:chiseled_quartz_block');
  static const Block quartz_pillar = Block('minecraft:quartz_pillar');
  static const Block quartz_stairs = Block('minecraft:quartz_stairs');
  static const Block activator_rail = Block('minecraft:activator_rail');
  static const Block dropper = Block('minecraft:dropper');
  static const Block white_terracotta = Block('minecraft:white_terracotta');
  static const Block orange_terracotta = Block('minecraft:orange_terracotta');
  static const Block magenta_terracotta = Block('minecraft:magenta_terracotta');
  static const Block light_blue_terracotta = Block('minecraft:light_blue_terracotta');
  static const Block yellow_terracotta = Block('minecraft:yellow_terracotta');
  static const Block lime_terracotta = Block('minecraft:lime_terracotta');
  static const Block pink_terracotta = Block('minecraft:pink_terracotta');
  static const Block gray_terracotta = Block('minecraft:gray_terracotta');
  static const Block light_gray_terracotta = Block('minecraft:light_gray_terracotta');
  static const Block cyan_terracotta = Block('minecraft:cyan_terracotta');
  static const Block purple_terracotta = Block('minecraft:purple_terracotta');
  static const Block blue_terracotta = Block('minecraft:blue_terracotta');
  static const Block brown_terracotta = Block('minecraft:brown_terracotta');
  static const Block green_terracotta = Block('minecraft:green_terracotta');
  static const Block red_terracotta = Block('minecraft:red_terracotta');
  static const Block black_terracotta = Block('minecraft:black_terracotta');
  static const Block white_stained_glass_pane =
      Block('minecraft:white_stained_glass_pane');
  static const Block orange_stained_glass_pane =
      Block('minecraft:orange_stained_glass_pane');
  static const Block magenta_stained_glass_pane =
      Block('minecraft:magenta_stained_glass_pane');
  static const Block light_blue_stained_glass_pane =
      Block('minecraft:light_blue_stained_glass_pane');
  static const Block yellow_stained_glass_pane =
      Block('minecraft:yellow_stained_glass_pane');
  static const Block lime_stained_glass_pane =
      Block('minecraft:lime_stained_glass_pane');
  static const Block pink_stained_glass_pane =
      Block('minecraft:pink_stained_glass_pane');
  static const Block gray_stained_glass_pane =
      Block('minecraft:gray_stained_glass_pane');
  static const Block light_gray_stained_glass_pane =
      Block('minecraft:light_gray_stained_glass_pane');
  static const Block cyan_stained_glass_pane =
      Block('minecraft:cyan_stained_glass_pane');
  static const Block purple_stained_glass_pane =
      Block('minecraft:purple_stained_glass_pane');
  static const Block blue_stained_glass_pane =
      Block('minecraft:blue_stained_glass_pane');
  static const Block brown_stained_glass_pane =
      Block('minecraft:brown_stained_glass_pane');
  static const Block green_stained_glass_pane =
      Block('minecraft:green_stained_glass_pane');
  static const Block red_stained_glass_pane =
      Block('minecraft:red_stained_glass_pane');
  static const Block black_stained_glass_pane =
      Block('minecraft:black_stained_glass_pane');
  static const Block acacia_stairs = Block('minecraft:acacia_stairs');
  static const Block dark_oak_stairs = Block('minecraft:dark_oak_stairs');
  static const Block slime_block = Block('minecraft:slime_block');
  static const Block barrier = Block('minecraft:barrier');
  static const Block iron_trapdoor = Block('minecraft:iron_trapdoor');
  static const Block prismarine = Block('minecraft:prismarine');
  static const Block prismarine_bricks = Block('minecraft:prismarine_bricks');
  static const Block dark_prismarine = Block('minecraft:dark_prismarine');
  static const Block prismarine_stairs = Block('minecraft:prismarine_stairs');
  static const Block prismarine_brick_stairs =
      Block('minecraft:prismarine_brick_stairs');
  static const Block dark_prismarine_stairs =
      Block('minecraft:dark_prismarine_stairs');
  static const Block prismarine_slab = Block('minecraft:prismarine_slab');
  static const Block prismarine_brick_slab = Block('minecraft:prismarine_brick_slab');
  static const Block dark_prismarine_slab = Block('minecraft:dark_prismarine_slab');
  static const Block sea_lantern = Block('minecraft:sea_lantern');
  static const Block hay_block = Block('minecraft:hay_block');
  static const Block white_carpet = Block('minecraft:white_carpet');
  static const Block orange_carpet = Block('minecraft:orange_carpet');
  static const Block magenta_carpet = Block('minecraft:magenta_carpet');
  static const Block light_blue_carpet = Block('minecraft:light_blue_carpet');
  static const Block yellow_carpet = Block('minecraft:yellow_carpet');
  static const Block lime_carpet = Block('minecraft:lime_carpet');
  static const Block pink_carpet = Block('minecraft:pink_carpet');
  static const Block gray_carpet = Block('minecraft:gray_carpet');
  static const Block light_gray_carpet = Block('minecraft:light_gray_carpet');
  static const Block cyan_carpet = Block('minecraft:cyan_carpet');
  static const Block purple_carpet = Block('minecraft:purple_carpet');
  static const Block blue_carpet = Block('minecraft:blue_carpet');
  static const Block brown_carpet = Block('minecraft:brown_carpet');
  static const Block green_carpet = Block('minecraft:green_carpet');
  static const Block red_carpet = Block('minecraft:red_carpet');
  static const Block black_carpet = Block('minecraft:black_carpet');
  static const Block terracotta = Block('minecraft:terracotta');
  static const Block coal_block = Block('minecraft:coal_block');
  static const Block packed_ice = Block('minecraft:packed_ice');
  static const Block sunflower = Block('minecraft:sunflower');
  static const Block lilac = Block('minecraft:lilac');
  static const Block rose_bush = Block('minecraft:rose_bush');
  static const Block peony = Block('minecraft:peony');
  static const Block tall_grass = Block('minecraft:tall_grass');
  static const Block large_fern = Block('minecraft:large_fern');
  static const Block white_banner = Block('minecraft:white_banner');
  static const Block orange_banner = Block('minecraft:orange_banner');
  static const Block magenta_banner = Block('minecraft:magenta_banner');
  static const Block light_blue_banner = Block('minecraft:light_blue_banner');
  static const Block yellow_banner = Block('minecraft:yellow_banner');
  static const Block lime_banner = Block('minecraft:lime_banner');
  static const Block pink_banner = Block('minecraft:pink_banner');
  static const Block gray_banner = Block('minecraft:gray_banner');
  static const Block light_gray_banner = Block('minecraft:light_gray_banner');
  static const Block cyan_banner = Block('minecraft:cyan_banner');
  static const Block purple_banner = Block('minecraft:purple_banner');
  static const Block blue_banner = Block('minecraft:blue_banner');
  static const Block brown_banner = Block('minecraft:brown_banner');
  static const Block green_banner = Block('minecraft:green_banner');
  static const Block red_banner = Block('minecraft:red_banner');
  static const Block black_banner = Block('minecraft:black_banner');
  static const Block white_wall_banner = Block('minecraft:white_wall_banner');
  static const Block orange_wall_banner = Block('minecraft:orange_wall_banner');
  static const Block magenta_wall_banner = Block('minecraft:magenta_wall_banner');
  static const Block light_blue_wall_banner =
      Block('minecraft:light_blue_wall_banner');
  static const Block yellow_wall_banner = Block('minecraft:yellow_wall_banner');
  static const Block lime_wall_banner = Block('minecraft:lime_wall_banner');
  static const Block pink_wall_banner = Block('minecraft:pink_wall_banner');
  static const Block gray_wall_banner = Block('minecraft:gray_wall_banner');
  static const Block light_gray_wall_banner =
      Block('minecraft:light_gray_wall_banner');
  static const Block cyan_wall_banner = Block('minecraft:cyan_wall_banner');
  static const Block purple_wall_banner = Block('minecraft:purple_wall_banner');
  static const Block blue_wall_banner = Block('minecraft:blue_wall_banner');
  static const Block brown_wall_banner = Block('minecraft:brown_wall_banner');
  static const Block green_wall_banner = Block('minecraft:green_wall_banner');
  static const Block red_wall_banner = Block('minecraft:red_wall_banner');
  static const Block black_wall_banner = Block('minecraft:black_wall_banner');
  static const Block red_sandstone = Block('minecraft:red_sandstone');
  static const Block chiseled_red_sandstone =
      Block('minecraft:chiseled_red_sandstone');
  static const Block cut_red_sandstone = Block('minecraft:cut_red_sandstone');
  static const Block red_sandstone_stairs = Block('minecraft:red_sandstone_stairs');
  static const Block oak_slab = Block('minecraft:oak_slab');
  static const Block spruce_slab = Block('minecraft:spruce_slab');
  static const Block birch_slab = Block('minecraft:birch_slab');
  static const Block jungle_slab = Block('minecraft:jungle_slab');
  static const Block acacia_slab = Block('minecraft:acacia_slab');
  static const Block dark_oak_slab = Block('minecraft:dark_oak_slab');
  static const Block stone_slab = Block('minecraft:stone_slab');
  static const Block smooth_stone_slab = Block('minecraft:smooth_stone_slab');
  static const Block sandstone_slab = Block('minecraft:sandstone_slab');
  static const Block petrified_oak_slab = Block('minecraft:petrified_oak_slab');
  static const Block cobblestone_slab = Block('minecraft:cobblestone_slab');
  static const Block brick_slab = Block('minecraft:brick_slab');
  static const Block stone_brick_slab = Block('minecraft:stone_brick_slab');
  static const Block nether_brick_slab = Block('minecraft:nether_brick_slab');
  static const Block quartz_slab = Block('minecraft:quartz_slab');
  static const Block red_sandstone_slab = Block('minecraft:red_sandstone_slab');
  static const Block purpur_slab = Block('minecraft:purpur_slab');
  static const Block smooth_stone = Block('minecraft:smooth_stone');
  static const Block smooth_sandstone = Block('minecraft:smooth_sandstone');
  static const Block smooth_quartz = Block('minecraft:smooth_quartz');
  static const Block smooth_red_sandstone = Block('minecraft:smooth_red_sandstone');
  static const Block spruce_fence_gate = Block('minecraft:spruce_fence_gate');
  static const Block birch_fence_gate = Block('minecraft:birch_fence_gate');
  static const Block jungle_fence_gate = Block('minecraft:jungle_fence_gate');
  static const Block acacia_fence_gate = Block('minecraft:acacia_fence_gate');
  static const Block dark_oak_fence_gate = Block('minecraft:dark_oak_fence_gate');
  static const Block spruce_fence = Block('minecraft:spruce_fence');
  static const Block birch_fence = Block('minecraft:birch_fence');
  static const Block jungle_fence = Block('minecraft:jungle_fence');
  static const Block acacia_fence = Block('minecraft:acacia_fence');
  static const Block dark_oak_fence = Block('minecraft:dark_oak_fence');
  static const Block spruce_door = Block('minecraft:spruce_door');
  static const Block birch_door = Block('minecraft:birch_door');
  static const Block jungle_door = Block('minecraft:jungle_door');
  static const Block acacia_door = Block('minecraft:acacia_door');
  static const Block dark_oak_door = Block('minecraft:dark_oak_door');
  static const Block end_rod = Block('minecraft:end_rod');
  static const Block chorus_plant = Block('minecraft:chorus_plant');
  static const Block chorus_flower = Block('minecraft:chorus_flower');
  static const Block purpur_block = Block('minecraft:purpur_block');
  static const Block purpur_pillar = Block('minecraft:purpur_pillar');
  static const Block purpur_stairs = Block('minecraft:purpur_stairs');
  static const Block end_stone_bricks = Block('minecraft:end_stone_bricks');
  static const Block beetroots = Block('minecraft:beetroots');
  static const Block grass_path = Block('minecraft:grass_path');
  static const Block end_gateway = Block('minecraft:end_gateway');
  static const Block repeating_command_block =
      Block('minecraft:repeating_command_block');
  static const Block chain_command_block = Block('minecraft:chain_command_block');
  static const Block frosted_ice = Block('minecraft:frosted_ice');
  static const Block magma_block = Block('minecraft:magma_block');
  static const Block nether_wart_block = Block('minecraft:nether_wart_block');
  static const Block red_nether_bricks = Block('minecraft:red_nether_bricks');
  static const Block bone_block = Block('minecraft:bone_block');
  static const Block structure_void = Block('minecraft:structure_void');
  static const Block observer = Block('minecraft:observer');
  static const Block shulker_box = Block('minecraft:shulker_box');
  static const Block white_shulker_box = Block('minecraft:white_shulker_box');
  static const Block orange_shulker_box = Block('minecraft:orange_shulker_box');
  static const Block magenta_shulker_box = Block('minecraft:magenta_shulker_box');
  static const Block light_blue_shulker_box =
      Block('minecraft:light_blue_shulker_box');
  static const Block yellow_shulker_box = Block('minecraft:yellow_shulker_box');
  static const Block lime_shulker_box = Block('minecraft:lime_shulker_box');
  static const Block pink_shulker_box = Block('minecraft:pink_shulker_box');
  static const Block gray_shulker_box = Block('minecraft:gray_shulker_box');
  static const Block light_gray_shulker_box =
      Block('minecraft:light_gray_shulker_box');
  static const Block cyan_shulker_box = Block('minecraft:cyan_shulker_box');
  static const Block purple_shulker_box = Block('minecraft:purple_shulker_box');
  static const Block blue_shulker_box = Block('minecraft:blue_shulker_box');
  static const Block brown_shulker_box = Block('minecraft:brown_shulker_box');
  static const Block green_shulker_box = Block('minecraft:green_shulker_box');
  static const Block red_shulker_box = Block('minecraft:red_shulker_box');
  static const Block black_shulker_box = Block('minecraft:black_shulker_box');
  static const Block white_glazed_terracotta =
      Block('minecraft:white_glazed_terracotta');
  static const Block orange_glazed_terracotta =
      Block('minecraft:orange_glazed_terracotta');
  static const Block magenta_glazed_terracotta =
      Block('minecraft:magenta_glazed_terracotta');
  static const Block light_blue_glazed_terracotta =
      Block('minecraft:light_blue_glazed_terracotta');
  static const Block yellow_glazed_terracotta =
      Block('minecraft:yellow_glazed_terracotta');
  static const Block lime_glazed_terracotta =
      Block('minecraft:lime_glazed_terracotta');
  static const Block pink_glazed_terracotta =
      Block('minecraft:pink_glazed_terracotta');
  static const Block gray_glazed_terracotta =
      Block('minecraft:gray_glazed_terracotta');
  static const Block light_gray_glazed_terracotta =
      Block('minecraft:light_gray_glazed_terracotta');
  static const Block cyan_glazed_terracotta =
      Block('minecraft:cyan_glazed_terracotta');
  static const Block purple_glazed_terracotta =
      Block('minecraft:purple_glazed_terracotta');
  static const Block blue_glazed_terracotta =
      Block('minecraft:blue_glazed_terracotta');
  static const Block brown_glazed_terracotta =
      Block('minecraft:brown_glazed_terracotta');
  static const Block green_glazed_terracotta =
      Block('minecraft:green_glazed_terracotta');
  static const Block red_glazed_terracotta = Block('minecraft:red_glazed_terracotta');
  static const Block black_glazed_terracotta =
      Block('minecraft:black_glazed_terracotta');
  static const Block white_concrete = Block('minecraft:white_concrete');
  static const Block orange_concrete = Block('minecraft:orange_concrete');
  static const Block magenta_concrete = Block('minecraft:magenta_concrete');
  static const Block light_blue_concrete = Block('minecraft:light_blue_concrete');
  static const Block yellow_concrete = Block('minecraft:yellow_concrete');
  static const Block lime_concrete = Block('minecraft:lime_concrete');
  static const Block pink_concrete = Block('minecraft:pink_concrete');
  static const Block gray_concrete = Block('minecraft:gray_concrete');
  static const Block light_gray_concrete = Block('minecraft:light_gray_concrete');
  static const Block cyan_concrete = Block('minecraft:cyan_concrete');
  static const Block purple_concrete = Block('minecraft:purple_concrete');
  static const Block blue_concrete = Block('minecraft:blue_concrete');
  static const Block brown_concrete = Block('minecraft:brown_concrete');
  static const Block green_concrete = Block('minecraft:green_concrete');
  static const Block red_concrete = Block('minecraft:red_concrete');
  static const Block black_concrete = Block('minecraft:black_concrete');
  static const Block white_concrete_powder = Block('minecraft:white_concrete_powder');
  static const Block orange_concrete_powder =
      Block('minecraft:orange_concrete_powder');
  static const Block magenta_concrete_powder =
      Block('minecraft:magenta_concrete_powder');
  static const Block light_blue_concrete_powder =
      Block('minecraft:light_blue_concrete_powder');
  static const Block yellow_concrete_powder =
      Block('minecraft:yellow_concrete_powder');
  static const Block lime_concrete_powder = Block('minecraft:lime_concrete_powder');
  static const Block pink_concrete_powder = Block('minecraft:pink_concrete_powder');
  static const Block gray_concrete_powder = Block('minecraft:gray_concrete_powder');
  static const Block light_gray_concrete_powder =
      Block('minecraft:light_gray_concrete_powder');
  static const Block cyan_concrete_powder = Block('minecraft:cyan_concrete_powder');
  static const Block purple_concrete_powder =
      Block('minecraft:purple_concrete_powder');
  static const Block blue_concrete_powder = Block('minecraft:blue_concrete_powder');
  static const Block brown_concrete_powder = Block('minecraft:brown_concrete_powder');
  static const Block green_concrete_powder = Block('minecraft:green_concrete_powder');
  static const Block red_concrete_powder = Block('minecraft:red_concrete_powder');
  static const Block black_concrete_powder = Block('minecraft:black_concrete_powder');
  static const Block kelp = Block('minecraft:kelp');
  static const Block kelp_plant = Block('minecraft:kelp_plant');
  static const Block dried_kelp_block = Block('minecraft:dried_kelp_block');
  static const Block turtle_egg = Block('minecraft:turtle_egg');
  static const Block dead_tube_coral_block = Block('minecraft:dead_tube_coral_block');
  static const Block dead_brain_coral_block =
      Block('minecraft:dead_brain_coral_block');
  static const Block dead_bubble_coral_block =
      Block('minecraft:dead_bubble_coral_block');
  static const Block dead_fire_coral_block = Block('minecraft:dead_fire_coral_block');
  static const Block dead_horn_coral_block = Block('minecraft:dead_horn_coral_block');
  static const Block tube_coral_block = Block('minecraft:tube_coral_block');
  static const Block brain_coral_block = Block('minecraft:brain_coral_block');
  static const Block bubble_coral_block = Block('minecraft:bubble_coral_block');
  static const Block fire_coral_block = Block('minecraft:fire_coral_block');
  static const Block horn_coral_block = Block('minecraft:horn_coral_block');
  static const Block dead_tube_coral = Block('minecraft:dead_tube_coral');
  static const Block dead_brain_coral = Block('minecraft:dead_brain_coral');
  static const Block dead_bubble_coral = Block('minecraft:dead_bubble_coral');
  static const Block dead_fire_coral = Block('minecraft:dead_fire_coral');
  static const Block dead_horn_coral = Block('minecraft:dead_horn_coral');
  static const Block tube_coral = Block('minecraft:tube_coral');
  static const Block brain_coral = Block('minecraft:brain_coral');
  static const Block bubble_coral = Block('minecraft:bubble_coral');
  static const Block fire_coral = Block('minecraft:fire_coral');
  static const Block horn_coral = Block('minecraft:horn_coral');
  static const Block dead_tube_coral_fan = Block('minecraft:dead_tube_coral_fan');
  static const Block dead_brain_coral_fan = Block('minecraft:dead_brain_coral_fan');
  static const Block dead_bubble_coral_fan = Block('minecraft:dead_bubble_coral_fan');
  static const Block dead_fire_coral_fan = Block('minecraft:dead_fire_coral_fan');
  static const Block dead_horn_coral_fan = Block('minecraft:dead_horn_coral_fan');
  static const Block tube_coral_fan = Block('minecraft:tube_coral_fan');
  static const Block brain_coral_fan = Block('minecraft:brain_coral_fan');
  static const Block bubble_coral_fan = Block('minecraft:bubble_coral_fan');
  static const Block fire_coral_fan = Block('minecraft:fire_coral_fan');
  static const Block horn_coral_fan = Block('minecraft:horn_coral_fan');
  static const Block dead_tube_coral_wall_fan =
      Block('minecraft:dead_tube_coral_wall_fan');
  static const Block dead_brain_coral_wall_fan =
      Block('minecraft:dead_brain_coral_wall_fan');
  static const Block dead_bubble_coral_wall_fan =
      Block('minecraft:dead_bubble_coral_wall_fan');
  static const Block dead_fire_coral_wall_fan =
      Block('minecraft:dead_fire_coral_wall_fan');
  static const Block dead_horn_coral_wall_fan =
      Block('minecraft:dead_horn_coral_wall_fan');
  static const Block tube_coral_wall_fan = Block('minecraft:tube_coral_wall_fan');
  static const Block brain_coral_wall_fan = Block('minecraft:brain_coral_wall_fan');
  static const Block bubble_coral_wall_fan = Block('minecraft:bubble_coral_wall_fan');
  static const Block fire_coral_wall_fan = Block('minecraft:fire_coral_wall_fan');
  static const Block horn_coral_wall_fan = Block('minecraft:horn_coral_wall_fan');
  static const Block sea_pickle = Block('minecraft:sea_pickle');
  static const Block blue_ice = Block('minecraft:blue_ice');
  static const Block conduit = Block('minecraft:conduit');
  static const Block bamboo_sapling = Block('minecraft:bamboo_sapling');
  static const Block bamboo = Block('minecraft:bamboo');
  static const Block potted_bamboo = Block('minecraft:potted_bamboo');
  static const Block void_air = Block('minecraft:void_air');
  static const Block cave_air = Block('minecraft:cave_air');
  static const Block bubble_column = Block('minecraft:bubble_column');
  static const Block polished_granite_stairs =
      Block('minecraft:polished_granite_stairs');
  static const Block smooth_red_sandstone_stairs =
      Block('minecraft:smooth_red_sandstone_stairs');
  static const Block mossy_stone_brick_stairs =
      Block('minecraft:mossy_stone_brick_stairs');
  static const Block polished_diorite_stairs =
      Block('minecraft:polished_diorite_stairs');
  static const Block mossy_cobblestone_stairs =
      Block('minecraft:mossy_cobblestone_stairs');
  static const Block end_stone_brick_stairs =
      Block('minecraft:end_stone_brick_stairs');
  static const Block stone_stairs = Block('minecraft:stone_stairs');
  static const Block smooth_sandstone_stairs =
      Block('minecraft:smooth_sandstone_stairs');
  static const Block smooth_quartz_stairs = Block('minecraft:smooth_quartz_stairs');
  static const Block granite_stairs = Block('minecraft:granite_stairs');
  static const Block andesite_stairs = Block('minecraft:andesite_stairs');
  static const Block red_nether_brick_stairs =
      Block('minecraft:red_nether_brick_stairs');
  static const Block polished_andesite_stairs =
      Block('minecraft:polished_andesite_stairs');
  static const Block diorite_stairs = Block('minecraft:diorite_stairs');
  static const Block polished_granite_slab = Block('minecraft:polished_granite_slab');
  static const Block smooth_red_sandstone_slab =
      Block('minecraft:smooth_red_sandstone_slab');
  static const Block mossy_stone_brick_slab =
      Block('minecraft:mossy_stone_brick_slab');
  static const Block polished_diorite_slab = Block('minecraft:polished_diorite_slab');
  static const Block mossy_cobblestone_slab =
      Block('minecraft:mossy_cobblestone_slab');
  static const Block end_stone_brick_slab = Block('minecraft:end_stone_brick_slab');
  static const Block smooth_sandstone_slab = Block('minecraft:smooth_sandstone_slab');
  static const Block smooth_quartz_slab = Block('minecraft:smooth_quartz_slab');
  static const Block granite_slab = Block('minecraft:granite_slab');
  static const Block andesite_slab = Block('minecraft:andesite_slab');
  static const Block red_nether_brick_slab = Block('minecraft:red_nether_brick_slab');
  static const Block polished_andesite_slab =
      Block('minecraft:polished_andesite_slab');
  static const Block diorite_slab = Block('minecraft:diorite_slab');
  static const Block brick_wall = Block('minecraft:brick_wall');
  static const Block prismarine_wall = Block('minecraft:prismarine_wall');
  static const Block red_sandstone_wall = Block('minecraft:red_sandstone_wall');
  static const Block mossy_stone_brick_wall =
      Block('minecraft:mossy_stone_brick_wall');
  static const Block granite_wall = Block('minecraft:granite_wall');
  static const Block stone_brick_wall = Block('minecraft:stone_brick_wall');
  static const Block nether_brick_wall = Block('minecraft:nether_brick_wall');
  static const Block andesite_wall = Block('minecraft:andesite_wall');
  static const Block red_nether_brick_wall = Block('minecraft:red_nether_brick_wall');
  static const Block sandstone_wall = Block('minecraft:sandstone_wall');
  static const Block end_stone_brick_wall = Block('minecraft:end_stone_brick_wall');
  static const Block diorite_wall = Block('minecraft:diorite_wall');
  static const Block scaffolding = Block('minecraft:scaffolding');
  static const Block loom = Block('minecraft:loom');
  static const Block barrel = Block('minecraft:barrel');
  static const Block smoker = Block('minecraft:smoker');
  static const Block blast_furnace = Block('minecraft:blast_furnace');
  static const Block cartography_table = Block('minecraft:cartography_table');
  static const Block fletching_table = Block('minecraft:fletching_table');
  static const Block grindstone = Block('minecraft:grindstone');
  static const Block lectern = Block('minecraft:lectern');
  static const Block smithing_table = Block('minecraft:smithing_table');
  static const Block stonecutter = Block('minecraft:stonecutter');
  static const Block bell = Block('minecraft:bell');
  static const Block lantern = Block('minecraft:lantern');
  static const Block campfire = Block('minecraft:campfire');
  static const Block sweet_berry_bush = Block('minecraft:sweet_berry_bush');
  static const Block structure_block = Block('minecraft:structure_block');
  static const Block jigsaw = Block('minecraft:jigsaw');
  static const Block composter = Block('minecraft:composter');
  static const Block kelp_top = Block('minecraft:kelp_top');

  static const Block oak_bark = Block('minecraft:oak_bark');
  static const Block spruce_bark = Block('minecraft:spruce_bark');
  static const Block birch_bark = Block('minecraft:birch_bark');
  static const Block jungle_bark = Block('minecraft:jungle_bark');
  static const Block acacia_bark = Block('minecraft:acacia_bark');
  static const Block dark_oak_bark = Block('minecraft:dark_oak_bark');

  static const Block sea_grass = Block('minecraft:sea_grass');
  static const Block prismarine_bricks_slab =
      Block('minecraft:prismarine_bricks_slab');
  static const Block mob_spawner = Block('minecraft:mob_spawner');
  static const Block melon_block = Block('minecraft:melon_block');
}
