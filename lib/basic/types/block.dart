import 'package:gson/gson.dart';
export 'blocks.dart';

/// This is an util class which provides a wrapper for all available blocks in Minecraft.
/// ```dart
/// Block([minecraft_block_id]) // as string or
/// Block.[minecraft_block_id]
/// ```

String _getId(val) => (val is Block) ? val.toString() : (val as String);

class Block {
  final String _id;
  String get id => _id;
  final String tag;
  final Map<String, dynamic> states;
  final Map<String, dynamic> nbt;
  @override
  String toString() {
    var strState = '';
    var strNbt = '';
    var id = tag ?? _id;
    if (states != null) {
      var liState = <String>[];
      states.forEach((String key, dynamic val) {
        liState.add('$key=$val');
      });
      strState = '[${liState.join(',')}]';
    }
    if (nbt != null) strNbt = gson.encode(nbt);
    return id + strState + strNbt;
  }

  /// **Usage:**
  /// ```dart
  /// Block([minecraft_block_id]) // as string or
  /// Block.[minecraft_block_id]
  /// ```
  const Block(this._id)
      : nbt = null,
        states = null,
        tag = null;

  Block.nbt(
    dynamic block, {
    this.states,
    this.tag,
    this.nbt,
    String strNbt = '',
  })  : assert(block is String || block is Block,
            'Please insert a block or string into Block.nbt!'),
        _id = _getId(block);

  /// DEPRECATED, please use Blocks.air
  @deprecated
  static const Block air = Block('minecraft:air');

  /// DEPRECATED, please use Blocks.stone
  @deprecated
  static const Block stone = Block('minecraft:stone');

  /// DEPRECATED, please use Blocks.granite
  @deprecated
  static const Block granite = Block('minecraft:granite');

  /// DEPRECATED, please use Blocks.polished_granite
  @deprecated
  static const Block polished_granite = Block('minecraft:polished_granite');

  /// DEPRECATED, please use Blocks.diorite
  @deprecated
  static const Block diorite = Block('minecraft:diorite');

  /// DEPRECATED, please use Blocks.polished_diorite
  @deprecated
  static const Block polished_diorite = Block('minecraft:polished_diorite');

  /// DEPRECATED, please use Blocks.andesite
  @deprecated
  static const Block andesite = Block('minecraft:andesite');

  /// DEPRECATED, please use Blocks.polished_andesite
  @deprecated
  static const Block polished_andesite = Block('minecraft:polished_andesite');

  /// DEPRECATED, please use Blocks.grass_block
  @deprecated
  static const Block grass_block = Block('minecraft:grass_block');

  /// DEPRECATED, please use Blocks.dirt
  @deprecated
  static const Block dirt = Block('minecraft:dirt');

  /// DEPRECATED, please use Blocks.coarse_dirt
  @deprecated
  static const Block coarse_dirt = Block('minecraft:coarse_dirt');

  /// DEPRECATED, please use Blocks.podzol
  @deprecated
  static const Block podzol = Block('minecraft:podzol');

  /// DEPRECATED, please use Blocks.cobblestone
  @deprecated
  static const Block cobblestone = Block('minecraft:cobblestone');

  /// DEPRECATED, please use Blocks.oak_planks
  @deprecated
  static const Block oak_planks = Block('minecraft:oak_planks');

  /// DEPRECATED, please use Blocks.spruce_planks
  @deprecated
  static const Block spruce_planks = Block('minecraft:spruce_planks');

  /// DEPRECATED, please use Blocks.birch_planks
  @deprecated
  static const Block birch_planks = Block('minecraft:birch_planks');

  /// DEPRECATED, please use Blocks.jungle_planks
  @deprecated
  static const Block jungle_planks = Block('minecraft:jungle_planks');

  /// DEPRECATED, please use Blocks.acacia_planks
  @deprecated
  static const Block acacia_planks = Block('minecraft:acacia_planks');

  /// DEPRECATED, please use Blocks.dark_oak_planks
  @deprecated
  static const Block dark_oak_planks = Block('minecraft:dark_oak_planks');

  /// DEPRECATED, please use Blocks.oak_sapling
  @deprecated
  static const Block oak_sapling = Block('minecraft:oak_sapling');

  /// DEPRECATED, please use Blocks.spruce_sapling
  @deprecated
  static const Block spruce_sapling = Block('minecraft:spruce_sapling');

  /// DEPRECATED, please use Blocks.birch_sapling
  @deprecated
  static const Block birch_sapling = Block('minecraft:birch_sapling');

  /// DEPRECATED, please use Blocks.jungle_sapling
  @deprecated
  static const Block jungle_sapling = Block('minecraft:jungle_sapling');

  /// DEPRECATED, please use Blocks.acacia_sapling
  @deprecated
  static const Block acacia_sapling = Block('minecraft:acacia_sapling');

  /// DEPRECATED, please use Blocks.dark_oak_sapling
  @deprecated
  static const Block dark_oak_sapling = Block('minecraft:dark_oak_sapling');

  /// DEPRECATED, please use Blocks.bedrock
  @deprecated
  static const Block bedrock = Block('minecraft:bedrock');

  /// DEPRECATED, please use Blocks.water
  @deprecated
  static const Block water = Block('minecraft:water');

  /// DEPRECATED, please use Blocks.lava
  @deprecated
  static const Block lava = Block('minecraft:lava');

  /// DEPRECATED, please use Blocks.sand
  @deprecated
  static const Block sand = Block('minecraft:sand');

  /// DEPRECATED, please use Blocks.red_sand
  @deprecated
  static const Block red_sand = Block('minecraft:red_sand');

  /// DEPRECATED, please use Blocks.gravel
  @deprecated
  static const Block gravel = Block('minecraft:gravel');

  /// DEPRECATED, please use Blocks.gold_ore
  @deprecated
  static const Block gold_ore = Block('minecraft:gold_ore');

  /// DEPRECATED, please use Blocks.iron_ore
  @deprecated
  static const Block iron_ore = Block('minecraft:iron_ore');

  /// DEPRECATED, please use Blocks.coal_ore
  @deprecated
  static const Block coal_ore = Block('minecraft:coal_ore');

  /// DEPRECATED, please use Blocks.oak_log
  @deprecated
  static const Block oak_log = Block('minecraft:oak_log');

  /// DEPRECATED, please use Blocks.spruce_log
  @deprecated
  static const Block spruce_log = Block('minecraft:spruce_log');

  /// DEPRECATED, please use Blocks.birch_log
  @deprecated
  static const Block birch_log = Block('minecraft:birch_log');

  /// DEPRECATED, please use Blocks.jungle_log
  @deprecated
  static const Block jungle_log = Block('minecraft:jungle_log');

  /// DEPRECATED, please use Blocks.acacia_log
  @deprecated
  static const Block acacia_log = Block('minecraft:acacia_log');

  /// DEPRECATED, please use Blocks.dark_oak_log
  @deprecated
  static const Block dark_oak_log = Block('minecraft:dark_oak_log');

  /// DEPRECATED, please use Blocks.stripped_spruce_log
  @deprecated
  static const Block stripped_spruce_log =
      Block('minecraft:stripped_spruce_log');

  /// DEPRECATED, please use Blocks.stripped_birch_log
  @deprecated
  static const Block stripped_birch_log = Block('minecraft:stripped_birch_log');

  /// DEPRECATED, please use Blocks.stripped_jungle_log
  @deprecated
  static const Block stripped_jungle_log =
      Block('minecraft:stripped_jungle_log');

  /// DEPRECATED, please use Blocks.stripped_acacia_log
  @deprecated
  static const Block stripped_acacia_log =
      Block('minecraft:stripped_acacia_log');

  /// DEPRECATED, please use Blocks.stripped_dark_oak_log
  @deprecated
  static const Block stripped_dark_oak_log =
      Block('minecraft:stripped_dark_oak_log');

  /// DEPRECATED, please use Blocks.stripped_oak_log
  @deprecated
  static const Block stripped_oak_log = Block('minecraft:stripped_oak_log');

  /// DEPRECATED, please use Blocks.oak_wood
  @deprecated
  static const Block oak_wood = Block('minecraft:oak_wood');

  /// DEPRECATED, please use Blocks.spruce_wood
  @deprecated
  static const Block spruce_wood = Block('minecraft:spruce_wood');

  /// DEPRECATED, please use Blocks.birch_wood
  @deprecated
  static const Block birch_wood = Block('minecraft:birch_wood');

  /// DEPRECATED, please use Blocks.jungle_wood
  @deprecated
  static const Block jungle_wood = Block('minecraft:jungle_wood');

  /// DEPRECATED, please use Blocks.acacia_wood
  @deprecated
  static const Block acacia_wood = Block('minecraft:acacia_wood');

  /// DEPRECATED, please use Blocks.dark_oak_wood
  @deprecated
  static const Block dark_oak_wood = Block('minecraft:dark_oak_wood');

  /// DEPRECATED, please use Blocks.stripped_oak_wood
  @deprecated
  static const Block stripped_oak_wood = Block('minecraft:stripped_oak_wood');

  /// DEPRECATED, please use Blocks.stripped_spruce_wood
  @deprecated
  static const Block stripped_spruce_wood =
      Block('minecraft:stripped_spruce_wood');

  /// DEPRECATED, please use Blocks.stripped_birch_wood
  @deprecated
  static const Block stripped_birch_wood =
      Block('minecraft:stripped_birch_wood');

  /// DEPRECATED, please use Blocks.stripped_jungle_wood
  @deprecated
  static const Block stripped_jungle_wood =
      Block('minecraft:stripped_jungle_wood');

  /// DEPRECATED, please use Blocks.stripped_acacia_wood
  @deprecated
  static const Block stripped_acacia_wood =
      Block('minecraft:stripped_acacia_wood');

  /// DEPRECATED, please use Blocks.stripped_dark_oak_wood
  @deprecated
  static const Block stripped_dark_oak_wood =
      Block('minecraft:stripped_dark_oak_wood');

  /// DEPRECATED, please use Blocks.oak_leaves
  @deprecated
  static const Block oak_leaves = Block('minecraft:oak_leaves');

  /// DEPRECATED, please use Blocks.spruce_leaves
  @deprecated
  static const Block spruce_leaves = Block('minecraft:spruce_leaves');

  /// DEPRECATED, please use Blocks.birch_leaves
  @deprecated
  static const Block birch_leaves = Block('minecraft:birch_leaves');

  /// DEPRECATED, please use Blocks.jungle_leaves
  @deprecated
  static const Block jungle_leaves = Block('minecraft:jungle_leaves');

  /// DEPRECATED, please use Blocks.acacia_leaves
  @deprecated
  static const Block acacia_leaves = Block('minecraft:acacia_leaves');

  /// DEPRECATED, please use Blocks.dark_oak_leaves
  @deprecated
  static const Block dark_oak_leaves = Block('minecraft:dark_oak_leaves');

  /// DEPRECATED, please use Blocks.sponge
  @deprecated
  static const Block sponge = Block('minecraft:sponge');

  /// DEPRECATED, please use Blocks.wet_sponge
  @deprecated
  static const Block wet_sponge = Block('minecraft:wet_sponge');

  /// DEPRECATED, please use Blocks.glass
  @deprecated
  static const Block glass = Block('minecraft:glass');

  /// DEPRECATED, please use Blocks.lapis_ore
  @deprecated
  static const Block lapis_ore = Block('minecraft:lapis_ore');

  /// DEPRECATED, please use Blocks.lapis_block
  @deprecated
  static const Block lapis_block = Block('minecraft:lapis_block');

  /// DEPRECATED, please use Blocks.dispenser
  @deprecated
  static const Block dispenser = Block('minecraft:dispenser');

  /// DEPRECATED, please use Blocks.sandstone
  @deprecated
  static const Block sandstone = Block('minecraft:sandstone');

  /// DEPRECATED, please use Blocks.chiseled_sandstone
  @deprecated
  static const Block chiseled_sandstone = Block('minecraft:chiseled_sandstone');

  /// DEPRECATED, please use Blocks.cut_sandstone
  @deprecated
  static const Block cut_sandstone = Block('minecraft:cut_sandstone');

  /// DEPRECATED, please use Blocks.note_block
  @deprecated
  static const Block note_block = Block('minecraft:note_block');

  /// DEPRECATED, please use Blocks.white_bed
  @deprecated
  static const Block white_bed = Block('minecraft:white_bed');

  /// DEPRECATED, please use Blocks.orange_bed
  @deprecated
  static const Block orange_bed = Block('minecraft:orange_bed');

  /// DEPRECATED, please use Blocks.magenta_bed
  @deprecated
  static const Block magenta_bed = Block('minecraft:magenta_bed');

  /// DEPRECATED, please use Blocks.light_blue_bed
  @deprecated
  static const Block light_blue_bed = Block('minecraft:light_blue_bed');

  /// DEPRECATED, please use Blocks.yellow_bed
  @deprecated
  static const Block yellow_bed = Block('minecraft:yellow_bed');

  /// DEPRECATED, please use Blocks.lime_bed
  @deprecated
  static const Block lime_bed = Block('minecraft:lime_bed');

  /// DEPRECATED, please use Blocks.pink_bed
  @deprecated
  static const Block pink_bed = Block('minecraft:pink_bed');

  /// DEPRECATED, please use Blocks.gray_bed
  @deprecated
  static const Block gray_bed = Block('minecraft:gray_bed');

  /// DEPRECATED, please use Blocks.light_gray_bed
  @deprecated
  static const Block light_gray_bed = Block('minecraft:light_gray_bed');

  /// DEPRECATED, please use Blocks.cyan_bed
  @deprecated
  static const Block cyan_bed = Block('minecraft:cyan_bed');

  /// DEPRECATED, please use Blocks.purple_bed
  @deprecated
  static const Block purple_bed = Block('minecraft:purple_bed');

  /// DEPRECATED, please use Blocks.blue_bed
  @deprecated
  static const Block blue_bed = Block('minecraft:blue_bed');

  /// DEPRECATED, please use Blocks.brown_bed
  @deprecated
  static const Block brown_bed = Block('minecraft:brown_bed');

  /// DEPRECATED, please use Blocks.green_bed
  @deprecated
  static const Block green_bed = Block('minecraft:green_bed');

  /// DEPRECATED, please use Blocks.red_bed
  @deprecated
  static const Block red_bed = Block('minecraft:red_bed');

  /// DEPRECATED, please use Blocks.black_bed
  @deprecated
  static const Block black_bed = Block('minecraft:black_bed');

  /// DEPRECATED, please use Blocks.powered_rail
  @deprecated
  static const Block powered_rail = Block('minecraft:powered_rail');

  /// DEPRECATED, please use Blocks.detector_rail
  @deprecated
  static const Block detector_rail = Block('minecraft:detector_rail');

  /// DEPRECATED, please use Blocks.sticky_piston
  @deprecated
  static const Block sticky_piston = Block('minecraft:sticky_piston');

  /// DEPRECATED, please use Blocks.cobweb
  @deprecated
  static const Block cobweb = Block('minecraft:cobweb');

  /// DEPRECATED, please use Blocks.grass
  @deprecated
  static const Block grass = Block('minecraft:grass');

  /// DEPRECATED, please use Blocks.fern
  @deprecated
  static const Block fern = Block('minecraft:fern');

  /// DEPRECATED, please use Blocks.dead_bush
  @deprecated
  static const Block dead_bush = Block('minecraft:dead_bush');

  /// DEPRECATED, please use Blocks.seagrass
  @deprecated
  static const Block seagrass = Block('minecraft:seagrass');

  /// DEPRECATED, please use Blocks.tall_seagrass
  @deprecated
  static const Block tall_seagrass = Block('minecraft:tall_seagrass');

  /// DEPRECATED, please use Blocks.piston
  @deprecated
  static const Block piston = Block('minecraft:piston');

  /// DEPRECATED, please use Blocks.piston_head
  @deprecated
  static const Block piston_head = Block('minecraft:piston_head');

  /// DEPRECATED, please use Blocks.white_wool
  @deprecated
  static const Block white_wool = Block('minecraft:white_wool');

  /// DEPRECATED, please use Blocks.orange_wool
  @deprecated
  static const Block orange_wool = Block('minecraft:orange_wool');

  /// DEPRECATED, please use Blocks.magenta_wool
  @deprecated
  static const Block magenta_wool = Block('minecraft:magenta_wool');

  /// DEPRECATED, please use Blocks.light_blue_wool
  @deprecated
  static const Block light_blue_wool = Block('minecraft:light_blue_wool');

  /// DEPRECATED, please use Blocks.yellow_wool
  @deprecated
  static const Block yellow_wool = Block('minecraft:yellow_wool');

  /// DEPRECATED, please use Blocks.lime_wool
  @deprecated
  static const Block lime_wool = Block('minecraft:lime_wool');

  /// DEPRECATED, please use Blocks.pink_wool
  @deprecated
  static const Block pink_wool = Block('minecraft:pink_wool');

  /// DEPRECATED, please use Blocks.gray_wool
  @deprecated
  static const Block gray_wool = Block('minecraft:gray_wool');

  /// DEPRECATED, please use Blocks.light_gray_wool
  @deprecated
  static const Block light_gray_wool = Block('minecraft:light_gray_wool');

  /// DEPRECATED, please use Blocks.cyan_wool
  @deprecated
  static const Block cyan_wool = Block('minecraft:cyan_wool');

  /// DEPRECATED, please use Blocks.purple_wool
  @deprecated
  static const Block purple_wool = Block('minecraft:purple_wool');

  /// DEPRECATED, please use Blocks.blue_wool
  @deprecated
  static const Block blue_wool = Block('minecraft:blue_wool');

  /// DEPRECATED, please use Blocks.brown_wool
  @deprecated
  static const Block brown_wool = Block('minecraft:brown_wool');

  /// DEPRECATED, please use Blocks.green_wool
  @deprecated
  static const Block green_wool = Block('minecraft:green_wool');

  /// DEPRECATED, please use Blocks.red_wool
  @deprecated
  static const Block red_wool = Block('minecraft:red_wool');

  /// DEPRECATED, please use Blocks.black_wool
  @deprecated
  static const Block black_wool = Block('minecraft:black_wool');

  /// DEPRECATED, please use Blocks.moving_piston
  @deprecated
  static const Block moving_piston = Block('minecraft:moving_piston');

  /// DEPRECATED, please use Blocks.dandelion
  @deprecated
  static const Block dandelion = Block('minecraft:dandelion');

  /// DEPRECATED, please use Blocks.poppy
  @deprecated
  static const Block poppy = Block('minecraft:poppy');

  /// DEPRECATED, please use Blocks.blue_orchid
  @deprecated
  static const Block blue_orchid = Block('minecraft:blue_orchid');

  /// DEPRECATED, please use Blocks.allium
  @deprecated
  static const Block allium = Block('minecraft:allium');

  /// DEPRECATED, please use Blocks.azure_bluet
  @deprecated
  static const Block azure_bluet = Block('minecraft:azure_bluet');

  /// DEPRECATED, please use Blocks.red_tulip
  @deprecated
  static const Block red_tulip = Block('minecraft:red_tulip');

  /// DEPRECATED, please use Blocks.orange_tulip
  @deprecated
  static const Block orange_tulip = Block('minecraft:orange_tulip');

  /// DEPRECATED, please use Blocks.white_tulip
  @deprecated
  static const Block white_tulip = Block('minecraft:white_tulip');

  /// DEPRECATED, please use Blocks.pink_tulip
  @deprecated
  static const Block pink_tulip = Block('minecraft:pink_tulip');

  /// DEPRECATED, please use Blocks.oxeye_daisy
  @deprecated
  static const Block oxeye_daisy = Block('minecraft:oxeye_daisy');

  /// DEPRECATED, please use Blocks.cornflower
  @deprecated
  static const Block cornflower = Block('minecraft:cornflower');

  /// DEPRECATED, please use Blocks.wither_rose
  @deprecated
  static const Block wither_rose = Block('minecraft:wither_rose');

  /// DEPRECATED, please use Blocks.lily_of_the_valley
  @deprecated
  static const Block lily_of_the_valley = Block('minecraft:lily_of_the_valley');

  /// DEPRECATED, please use Blocks.brown_mushroom
  @deprecated
  static const Block brown_mushroom = Block('minecraft:brown_mushroom');

  /// DEPRECATED, please use Blocks.red_mushroom
  @deprecated
  static const Block red_mushroom = Block('minecraft:red_mushroom');

  /// DEPRECATED, please use Blocks.gold_block
  @deprecated
  static const Block gold_block = Block('minecraft:gold_block');

  /// DEPRECATED, please use Blocks.iron_block
  @deprecated
  static const Block iron_block = Block('minecraft:iron_block');

  /// DEPRECATED, please use Blocks.bricks
  @deprecated
  static const Block bricks = Block('minecraft:bricks');

  /// DEPRECATED, please use Blocks.tnt
  @deprecated
  static const Block tnt = Block('minecraft:tnt');

  /// DEPRECATED, please use Blocks.bookshelf
  @deprecated
  static const Block bookshelf = Block('minecraft:bookshelf');

  /// DEPRECATED, please use Blocks.mossy_cobblestone
  @deprecated
  static const Block mossy_cobblestone = Block('minecraft:mossy_cobblestone');

  /// DEPRECATED, please use Blocks.obsidian
  @deprecated
  static const Block obsidian = Block('minecraft:obsidian');

  /// DEPRECATED, please use Blocks.torch
  @deprecated
  static const Block torch = Block('minecraft:torch');

  /// DEPRECATED, please use Blocks.wall_torch
  @deprecated
  static const Block wall_torch = Block('minecraft:wall_torch');

  /// DEPRECATED, please use Blocks.fire
  @deprecated
  static const Block fire = Block('minecraft:fire');

  /// DEPRECATED, please use Blocks.spawner
  @deprecated
  static const Block spawner = Block('minecraft:spawner');

  /// DEPRECATED, please use Blocks.oak_stairs
  @deprecated
  static const Block oak_stairs = Block('minecraft:oak_stairs');

  /// DEPRECATED, please use Blocks.chest
  @deprecated
  static const Block chest = Block('minecraft:chest');

  /// DEPRECATED, please use Blocks.redstone_wire
  @deprecated
  static const Block redstone_wire = Block('minecraft:redstone_wire');

  /// DEPRECATED, please use Blocks.diamond_ore
  @deprecated
  static const Block diamond_ore = Block('minecraft:diamond_ore');

  /// DEPRECATED, please use Blocks.diamond_block
  @deprecated
  static const Block diamond_block = Block('minecraft:diamond_block');

  /// DEPRECATED, please use Blocks.crafting_table
  @deprecated
  static const Block crafting_table = Block('minecraft:crafting_table');

  /// DEPRECATED, please use Blocks.wheat
  @deprecated
  static const Block wheat = Block('minecraft:wheat');

  /// DEPRECATED, please use Blocks.farmland
  @deprecated
  static const Block farmland = Block('minecraft:farmland');

  /// DEPRECATED, please use Blocks.furnace
  @deprecated
  static const Block furnace = Block('minecraft:furnace');

  /// DEPRECATED, please use Blocks.oak_sign
  @deprecated
  static const Block oak_sign = Block('minecraft:oak_sign');

  /// DEPRECATED, please use Blocks.spruce_sign
  @deprecated
  static const Block spruce_sign = Block('minecraft:spruce_sign');

  /// DEPRECATED, please use Blocks.birch_sign
  @deprecated
  static const Block birch_sign = Block('minecraft:birch_sign');

  /// DEPRECATED, please use Blocks.acacia_sign
  @deprecated
  static const Block acacia_sign = Block('minecraft:acacia_sign');

  /// DEPRECATED, please use Blocks.jungle_sign
  @deprecated
  static const Block jungle_sign = Block('minecraft:jungle_sign');

  /// DEPRECATED, please use Blocks.dark_oak_sign
  @deprecated
  static const Block dark_oak_sign = Block('minecraft:dark_oak_sign');

  /// DEPRECATED, please use Blocks.oak_door
  @deprecated
  static const Block oak_door = Block('minecraft:oak_door');

  /// DEPRECATED, please use Blocks.ladder
  @deprecated
  static const Block ladder = Block('minecraft:ladder');

  /// DEPRECATED, please use Blocks.rail
  @deprecated
  static const Block rail = Block('minecraft:rail');

  /// DEPRECATED, please use Blocks.cobblestone_stairs
  @deprecated
  static const Block cobblestone_stairs = Block('minecraft:cobblestone_stairs');

  /// DEPRECATED, please use Blocks.oak_wall_sign
  @deprecated
  static const Block oak_wall_sign = Block('minecraft:oak_wall_sign');

  /// DEPRECATED, please use Blocks.spruce_wall_sign
  @deprecated
  static const Block spruce_wall_sign = Block('minecraft:spruce_wall_sign');

  /// DEPRECATED, please use Blocks.birch_wall_sign
  @deprecated
  static const Block birch_wall_sign = Block('minecraft:birch_wall_sign');

  /// DEPRECATED, please use Blocks.acacia_wall_sign
  @deprecated
  static const Block acacia_wall_sign = Block('minecraft:acacia_wall_sign');

  /// DEPRECATED, please use Blocks.jungle_wall_sign
  @deprecated
  static const Block jungle_wall_sign = Block('minecraft:jungle_wall_sign');

  /// DEPRECATED, please use Blocks.dark_oak_wall_sign
  @deprecated
  static const Block dark_oak_wall_sign = Block('minecraft:dark_oak_wall_sign');

  /// DEPRECATED, please use Blocks.lever
  @deprecated
  static const Block lever = Block('minecraft:lever');

  /// DEPRECATED, please use Blocks.stone_pressure_plate
  @deprecated
  static const Block stone_pressure_plate =
      Block('minecraft:stone_pressure_plate');

  /// DEPRECATED, please use Blocks.iron_door
  @deprecated
  static const Block iron_door = Block('minecraft:iron_door');

  /// DEPRECATED, please use Blocks.oak_pressure_plate
  @deprecated
  static const Block oak_pressure_plate = Block('minecraft:oak_pressure_plate');

  /// DEPRECATED, please use Blocks.spruce_pressure_plate
  @deprecated
  static const Block spruce_pressure_plate =
      Block('minecraft:spruce_pressure_plate');

  /// DEPRECATED, please use Blocks.birch_pressure_plate
  @deprecated
  static const Block birch_pressure_plate =
      Block('minecraft:birch_pressure_plate');

  /// DEPRECATED, please use Blocks.jungle_pressure_plate
  @deprecated
  static const Block jungle_pressure_plate =
      Block('minecraft:jungle_pressure_plate');

  /// DEPRECATED, please use Blocks.acacia_pressure_plate
  @deprecated
  static const Block acacia_pressure_plate =
      Block('minecraft:acacia_pressure_plate');

  /// DEPRECATED, please use Blocks.dark_oak_pressure_plate
  @deprecated
  static const Block dark_oak_pressure_plate =
      Block('minecraft:dark_oak_pressure_plate');

  /// DEPRECATED, please use Blocks.redstone_ore
  @deprecated
  static const Block redstone_ore = Block('minecraft:redstone_ore');

  /// DEPRECATED, please use Blocks.redstone_torch
  @deprecated
  static const Block redstone_torch = Block('minecraft:redstone_torch');

  /// DEPRECATED, please use Blocks.redstone_wall_torch
  @deprecated
  static const Block redstone_wall_torch =
      Block('minecraft:redstone_wall_torch');

  /// DEPRECATED, please use Blocks.stone_button
  @deprecated
  static const Block stone_button = Block('minecraft:stone_button');

  /// DEPRECATED, please use Blocks.snow
  @deprecated
  static const Block snow = Block('minecraft:snow');

  /// DEPRECATED, please use Blocks.ice
  @deprecated
  static const Block ice = Block('minecraft:ice');

  /// DEPRECATED, please use Blocks.snow_block
  @deprecated
  static const Block snow_block = Block('minecraft:snow_block');

  /// DEPRECATED, please use Blocks.cactus
  @deprecated
  static const Block cactus = Block('minecraft:cactus');

  /// DEPRECATED, please use Blocks.clay
  @deprecated
  static const Block clay = Block('minecraft:clay');

  /// DEPRECATED, please use Blocks.sugar_cane
  @deprecated
  static const Block sugar_cane = Block('minecraft:sugar_cane');

  /// DEPRECATED, please use Blocks.jukebox
  @deprecated
  static const Block jukebox = Block('minecraft:jukebox');

  /// DEPRECATED, please use Blocks.oak_fence
  @deprecated
  static const Block oak_fence = Block('minecraft:oak_fence');

  /// DEPRECATED, please use Blocks.pumpkin
  @deprecated
  static const Block pumpkin = Block('minecraft:pumpkin');

  /// DEPRECATED, please use Blocks.netherrack
  @deprecated
  static const Block netherrack = Block('minecraft:netherrack');

  /// DEPRECATED, please use Blocks.soul_sand
  @deprecated
  static const Block soul_sand = Block('minecraft:soul_sand');

  /// DEPRECATED, please use Blocks.glowstone
  @deprecated
  static const Block glowstone = Block('minecraft:glowstone');

  /// DEPRECATED, please use Blocks.nether_portal
  @deprecated
  static const Block nether_portal = Block('minecraft:nether_portal');

  /// DEPRECATED, please use Blocks.carved_pumpkin
  @deprecated
  static const Block carved_pumpkin = Block('minecraft:carved_pumpkin');

  /// DEPRECATED, please use Blocks.jack_o_lantern
  @deprecated
  static const Block jack_o_lantern = Block('minecraft:jack_o_lantern');

  /// DEPRECATED, please use Blocks.cake
  @deprecated
  static const Block cake = Block('minecraft:cake');

  /// DEPRECATED, please use Blocks.repeater
  @deprecated
  static const Block repeater = Block('minecraft:repeater');

  /// DEPRECATED, please use Blocks.white_stained_glass
  @deprecated
  static const Block white_stained_glass =
      Block('minecraft:white_stained_glass');

  /// DEPRECATED, please use Blocks.orange_stained_glass
  @deprecated
  static const Block orange_stained_glass =
      Block('minecraft:orange_stained_glass');

  /// DEPRECATED, please use Blocks.magenta_stained_glass
  @deprecated
  static const Block magenta_stained_glass =
      Block('minecraft:magenta_stained_glass');

  /// DEPRECATED, please use Blocks.light_blue_stained_glass
  @deprecated
  static const Block light_blue_stained_glass =
      Block('minecraft:light_blue_stained_glass');

  /// DEPRECATED, please use Blocks.yellow_stained_glass
  @deprecated
  static const Block yellow_stained_glass =
      Block('minecraft:yellow_stained_glass');

  /// DEPRECATED, please use Blocks.lime_stained_glass
  @deprecated
  static const Block lime_stained_glass = Block('minecraft:lime_stained_glass');

  /// DEPRECATED, please use Blocks.pink_stained_glass
  @deprecated
  static const Block pink_stained_glass = Block('minecraft:pink_stained_glass');

  /// DEPRECATED, please use Blocks.gray_stained_glass
  @deprecated
  static const Block gray_stained_glass = Block('minecraft:gray_stained_glass');

  /// DEPRECATED, please use Blocks.light_gray_stained_glass
  @deprecated
  static const Block light_gray_stained_glass =
      Block('minecraft:light_gray_stained_glass');

  /// DEPRECATED, please use Blocks.cyan_stained_glass
  @deprecated
  static const Block cyan_stained_glass = Block('minecraft:cyan_stained_glass');

  /// DEPRECATED, please use Blocks.purple_stained_glass
  @deprecated
  static const Block purple_stained_glass =
      Block('minecraft:purple_stained_glass');

  /// DEPRECATED, please use Blocks.blue_stained_glass
  @deprecated
  static const Block blue_stained_glass = Block('minecraft:blue_stained_glass');

  /// DEPRECATED, please use Blocks.brown_stained_glass
  @deprecated
  static const Block brown_stained_glass =
      Block('minecraft:brown_stained_glass');

  /// DEPRECATED, please use Blocks.green_stained_glass
  @deprecated
  static const Block green_stained_glass =
      Block('minecraft:green_stained_glass');

  /// DEPRECATED, please use Blocks.red_stained_glass
  @deprecated
  static const Block red_stained_glass = Block('minecraft:red_stained_glass');

  /// DEPRECATED, please use Blocks.black_stained_glass
  @deprecated
  static const Block black_stained_glass =
      Block('minecraft:black_stained_glass');

  /// DEPRECATED, please use Blocks.oak_trapdoor
  @deprecated
  static const Block oak_trapdoor = Block('minecraft:oak_trapdoor');

  /// DEPRECATED, please use Blocks.spruce_trapdoor
  @deprecated
  static const Block spruce_trapdoor = Block('minecraft:spruce_trapdoor');

  /// DEPRECATED, please use Blocks.birch_trapdoor
  @deprecated
  static const Block birch_trapdoor = Block('minecraft:birch_trapdoor');

  /// DEPRECATED, please use Blocks.jungle_trapdoor
  @deprecated
  static const Block jungle_trapdoor = Block('minecraft:jungle_trapdoor');

  /// DEPRECATED, please use Blocks.acacia_trapdoor
  @deprecated
  static const Block acacia_trapdoor = Block('minecraft:acacia_trapdoor');

  /// DEPRECATED, please use Blocks.dark_oak_trapdoor
  @deprecated
  static const Block dark_oak_trapdoor = Block('minecraft:dark_oak_trapdoor');

  /// DEPRECATED, please use Blocks.stone_bricks
  @deprecated
  static const Block stone_bricks = Block('minecraft:stone_bricks');

  /// DEPRECATED, please use Blocks.mossy_stone_bricks
  @deprecated
  static const Block mossy_stone_bricks = Block('minecraft:mossy_stone_bricks');

  /// DEPRECATED, please use Blocks.cracked_stone_bricks
  @deprecated
  static const Block cracked_stone_bricks =
      Block('minecraft:cracked_stone_bricks');

  /// DEPRECATED, please use Blocks.chiseled_stone_bricks
  @deprecated
  static const Block chiseled_stone_bricks =
      Block('minecraft:chiseled_stone_bricks');

  /// DEPRECATED, please use Blocks.infested_stone
  @deprecated
  static const Block infested_stone = Block('minecraft:infested_stone');

  /// DEPRECATED, please use Blocks.infested_cobblestone
  @deprecated
  static const Block infested_cobblestone =
      Block('minecraft:infested_cobblestone');

  /// DEPRECATED, please use Blocks.infested_stone_bricks
  @deprecated
  static const Block infested_stone_bricks =
      Block('minecraft:infested_stone_bricks');

  /// DEPRECATED, please use Blocks.infested_mossy_stone_bricks
  @deprecated
  static const Block infested_mossy_stone_bricks =
      Block('minecraft:infested_mossy_stone_bricks');

  /// DEPRECATED, please use Blocks.infested_cracked_stone_bricks
  @deprecated
  static const Block infested_cracked_stone_bricks =
      Block('minecraft:infested_cracked_stone_bricks');

  /// DEPRECATED, please use Blocks.infested_chiseled_stone_bricks
  @deprecated
  static const Block infested_chiseled_stone_bricks =
      Block('minecraft:infested_chiseled_stone_bricks');

  /// DEPRECATED, please use Blocks.brown_mushroom_block
  @deprecated
  static const Block brown_mushroom_block =
      Block('minecraft:brown_mushroom_block');

  /// DEPRECATED, please use Blocks.red_mushroom_block
  @deprecated
  static const Block red_mushroom_block = Block('minecraft:red_mushroom_block');

  /// DEPRECATED, please use Blocks.mushroom_stem
  @deprecated
  static const Block mushroom_stem = Block('minecraft:mushroom_stem');

  /// DEPRECATED, please use Blocks.iron_bars
  @deprecated
  static const Block iron_bars = Block('minecraft:iron_bars');

  /// DEPRECATED, please use Blocks.glass_pane
  @deprecated
  static const Block glass_pane = Block('minecraft:glass_pane');

  /// DEPRECATED, please use Blocks.melon
  @deprecated
  static const Block melon = Block('minecraft:melon');

  /// DEPRECATED, please use Blocks.attached_pumpkin_stem
  @deprecated
  static const Block attached_pumpkin_stem =
      Block('minecraft:attached_pumpkin_stem');

  /// DEPRECATED, please use Blocks.attached_melon_stem
  @deprecated
  static const Block attached_melon_stem =
      Block('minecraft:attached_melon_stem');

  /// DEPRECATED, please use Blocks.pumpkin_stem
  @deprecated
  static const Block pumpkin_stem = Block('minecraft:pumpkin_stem');

  /// DEPRECATED, please use Blocks.melon_stem
  @deprecated
  static const Block melon_stem = Block('minecraft:melon_stem');

  /// DEPRECATED, please use Blocks.vine
  @deprecated
  static const Block vine = Block('minecraft:vine');

  /// DEPRECATED, please use Blocks.oak_fence_gate
  @deprecated
  static const Block oak_fence_gate = Block('minecraft:oak_fence_gate');

  /// DEPRECATED, please use Blocks.brick_stairs
  @deprecated
  static const Block brick_stairs = Block('minecraft:brick_stairs');

  /// DEPRECATED, please use Blocks.stone_brick_stairs
  @deprecated
  static const Block stone_brick_stairs = Block('minecraft:stone_brick_stairs');

  /// DEPRECATED, please use Blocks.mycelium
  @deprecated
  static const Block mycelium = Block('minecraft:mycelium');

  /// DEPRECATED, please use Blocks.lily_pad
  @deprecated
  static const Block lily_pad = Block('minecraft:lily_pad');

  /// DEPRECATED, please use Blocks.nether_bricks
  @deprecated
  static const Block nether_bricks = Block('minecraft:nether_bricks');

  /// DEPRECATED, please use Blocks.nether_brick_fence
  @deprecated
  static const Block nether_brick_fence = Block('minecraft:nether_brick_fence');

  /// DEPRECATED, please use Blocks.nether_brick_stairs
  @deprecated
  static const Block nether_brick_stairs =
      Block('minecraft:nether_brick_stairs');

  /// DEPRECATED, please use Blocks.nether_wart
  @deprecated
  static const Block nether_wart = Block('minecraft:nether_wart');

  /// DEPRECATED, please use Blocks.enchanting_table
  @deprecated
  static const Block enchanting_table = Block('minecraft:enchanting_table');

  /// DEPRECATED, please use Blocks.brewing_stand
  @deprecated
  static const Block brewing_stand = Block('minecraft:brewing_stand');

  /// DEPRECATED, please use Blocks.cauldron
  @deprecated
  static const Block cauldron = Block('minecraft:cauldron');

  /// DEPRECATED, please use Blocks.end_portal
  @deprecated
  static const Block end_portal = Block('minecraft:end_portal');

  /// DEPRECATED, please use Blocks.end_portal_frame
  @deprecated
  static const Block end_portal_frame = Block('minecraft:end_portal_frame');

  /// DEPRECATED, please use Blocks.end_stone
  @deprecated
  static const Block end_stone = Block('minecraft:end_stone');

  /// DEPRECATED, please use Blocks.dragon_egg
  @deprecated
  static const Block dragon_egg = Block('minecraft:dragon_egg');

  /// DEPRECATED, please use Blocks.redstone_lamp
  @deprecated
  static const Block redstone_lamp = Block('minecraft:redstone_lamp');

  /// DEPRECATED, please use Blocks.cocoa
  @deprecated
  static const Block cocoa = Block('minecraft:cocoa');

  /// DEPRECATED, please use Blocks.sandstone_stairs
  @deprecated
  static const Block sandstone_stairs = Block('minecraft:sandstone_stairs');

  /// DEPRECATED, please use Blocks.emerald_ore
  @deprecated
  static const Block emerald_ore = Block('minecraft:emerald_ore');

  /// DEPRECATED, please use Blocks.ender_chest
  @deprecated
  static const Block ender_chest = Block('minecraft:ender_chest');

  /// DEPRECATED, please use Blocks.tripwire_hook
  @deprecated
  static const Block tripwire_hook = Block('minecraft:tripwire_hook');

  /// DEPRECATED, please use Blocks.tripwire
  @deprecated
  static const Block tripwire = Block('minecraft:tripwire');

  /// DEPRECATED, please use Blocks.emerald_block
  @deprecated
  static const Block emerald_block = Block('minecraft:emerald_block');

  /// DEPRECATED, please use Blocks.spruce_stairs
  @deprecated
  static const Block spruce_stairs = Block('minecraft:spruce_stairs');

  /// DEPRECATED, please use Blocks.birch_stairs
  @deprecated
  static const Block birch_stairs = Block('minecraft:birch_stairs');

  /// DEPRECATED, please use Blocks.jungle_stairs
  @deprecated
  static const Block jungle_stairs = Block('minecraft:jungle_stairs');

  /// DEPRECATED, please use Blocks.command_block
  @deprecated
  static const Block command_block = Block('minecraft:command_block');

  /// DEPRECATED, please use Blocks.beacon
  @deprecated
  static const Block beacon = Block('minecraft:beacon');

  /// DEPRECATED, please use Blocks.cobblestone_wall
  @deprecated
  static const Block cobblestone_wall = Block('minecraft:cobblestone_wall');

  /// DEPRECATED, please use Blocks.mossy_cobblestone_wall
  @deprecated
  static const Block mossy_cobblestone_wall =
      Block('minecraft:mossy_cobblestone_wall');

  /// DEPRECATED, please use Blocks.flower_pot
  @deprecated
  static const Block flower_pot = Block('minecraft:flower_pot');

  /// DEPRECATED, please use Blocks.potted_oak_sapling
  @deprecated
  static const Block potted_oak_sapling = Block('minecraft:potted_oak_sapling');

  /// DEPRECATED, please use Blocks.potted_spruce_sapling
  @deprecated
  static const Block potted_spruce_sapling =
      Block('minecraft:potted_spruce_sapling');

  /// DEPRECATED, please use Blocks.potted_birch_sapling
  @deprecated
  static const Block potted_birch_sapling =
      Block('minecraft:potted_birch_sapling');

  /// DEPRECATED, please use Blocks.potted_jungle_sapling
  @deprecated
  static const Block potted_jungle_sapling =
      Block('minecraft:potted_jungle_sapling');

  /// DEPRECATED, please use Blocks.potted_acacia_sapling
  @deprecated
  static const Block potted_acacia_sapling =
      Block('minecraft:potted_acacia_sapling');

  /// DEPRECATED, please use Blocks.potted_dark_oak_sapling
  @deprecated
  static const Block potted_dark_oak_sapling =
      Block('minecraft:potted_dark_oak_sapling');

  /// DEPRECATED, please use Blocks.potted_fern
  @deprecated
  static const Block potted_fern = Block('minecraft:potted_fern');

  /// DEPRECATED, please use Blocks.potted_dandelion
  @deprecated
  static const Block potted_dandelion = Block('minecraft:potted_dandelion');

  /// DEPRECATED, please use Blocks.potted_poppy
  @deprecated
  static const Block potted_poppy = Block('minecraft:potted_poppy');

  /// DEPRECATED, please use Blocks.potted_blue_orchid
  @deprecated
  static const Block potted_blue_orchid = Block('minecraft:potted_blue_orchid');

  /// DEPRECATED, please use Blocks.potted_allium
  @deprecated
  static const Block potted_allium = Block('minecraft:potted_allium');

  /// DEPRECATED, please use Blocks.potted_azure_bluet
  @deprecated
  static const Block potted_azure_bluet = Block('minecraft:potted_azure_bluet');

  /// DEPRECATED, please use Blocks.potted_red_tulip
  @deprecated
  static const Block potted_red_tulip = Block('minecraft:potted_red_tulip');

  /// DEPRECATED, please use Blocks.potted_orange_tulip
  @deprecated
  static const Block potted_orange_tulip =
      Block('minecraft:potted_orange_tulip');

  /// DEPRECATED, please use Blocks.potted_white_tulip
  @deprecated
  static const Block potted_white_tulip = Block('minecraft:potted_white_tulip');

  /// DEPRECATED, please use Blocks.potted_pink_tulip
  @deprecated
  static const Block potted_pink_tulip = Block('minecraft:potted_pink_tulip');

  /// DEPRECATED, please use Blocks.potted_oxeye_daisy
  @deprecated
  static const Block potted_oxeye_daisy = Block('minecraft:potted_oxeye_daisy');

  /// DEPRECATED, please use Blocks.potted_cornflower
  @deprecated
  static const Block potted_cornflower = Block('minecraft:potted_cornflower');

  /// DEPRECATED, please use Blocks.potted_lily_of_the_valley
  @deprecated
  static const Block potted_lily_of_the_valley =
      Block('minecraft:potted_lily_of_the_valley');

  /// DEPRECATED, please use Blocks.potted_wither_rose
  @deprecated
  static const Block potted_wither_rose = Block('minecraft:potted_wither_rose');

  /// DEPRECATED, please use Blocks.potted_red_mushroom
  @deprecated
  static const Block potted_red_mushroom =
      Block('minecraft:potted_red_mushroom');

  /// DEPRECATED, please use Blocks.potted_brown_mushroom
  @deprecated
  static const Block potted_brown_mushroom =
      Block('minecraft:potted_brown_mushroom');

  /// DEPRECATED, please use Blocks.potted_dead_bush
  @deprecated
  static const Block potted_dead_bush = Block('minecraft:potted_dead_bush');

  /// DEPRECATED, please use Blocks.potted_cactus
  @deprecated
  static const Block potted_cactus = Block('minecraft:potted_cactus');

  /// DEPRECATED, please use Blocks.carrots
  @deprecated
  static const Block carrots = Block('minecraft:carrots');

  /// DEPRECATED, please use Blocks.potatoes
  @deprecated
  static const Block potatoes = Block('minecraft:potatoes');

  /// DEPRECATED, please use Blocks.oak_button
  @deprecated
  static const Block oak_button = Block('minecraft:oak_button');

  /// DEPRECATED, please use Blocks.spruce_button
  @deprecated
  static const Block spruce_button = Block('minecraft:spruce_button');

  /// DEPRECATED, please use Blocks.birch_button
  @deprecated
  static const Block birch_button = Block('minecraft:birch_button');

  /// DEPRECATED, please use Blocks.jungle_button
  @deprecated
  static const Block jungle_button = Block('minecraft:jungle_button');

  /// DEPRECATED, please use Blocks.acacia_button
  @deprecated
  static const Block acacia_button = Block('minecraft:acacia_button');

  /// DEPRECATED, please use Blocks.dark_oak_button
  @deprecated
  static const Block dark_oak_button = Block('minecraft:dark_oak_button');

  /// DEPRECATED, please use Blocks.skeleton_skull
  @deprecated
  static const Block skeleton_skull = Block('minecraft:skeleton_skull');

  /// DEPRECATED, please use Blocks.skeleton_wall_skull
  @deprecated
  static const Block skeleton_wall_skull =
      Block('minecraft:skeleton_wall_skull');

  /// DEPRECATED, please use Blocks.wither_skeleton_skull
  @deprecated
  static const Block wither_skeleton_skull =
      Block('minecraft:wither_skeleton_skull');

  /// DEPRECATED, please use Blocks.wither_skeleton_wall_skull
  @deprecated
  static const Block wither_skeleton_wall_skull =
      Block('minecraft:wither_skeleton_wall_skull');

  /// DEPRECATED, please use Blocks.zombie_head
  @deprecated
  static const Block zombie_head = Block('minecraft:zombie_head');

  /// DEPRECATED, please use Blocks.zombie_wall_head
  @deprecated
  static const Block zombie_wall_head = Block('minecraft:zombie_wall_head');

  /// DEPRECATED, please use Blocks.player_head
  @deprecated
  static const Block player_head = Block('minecraft:player_head');

  /// DEPRECATED, please use Blocks.player_wall_head
  @deprecated
  static const Block player_wall_head = Block('minecraft:player_wall_head');

  /// DEPRECATED, please use Blocks.creeper_head
  @deprecated
  static const Block creeper_head = Block('minecraft:creeper_head');

  /// DEPRECATED, please use Blocks.creeper_wall_head
  @deprecated
  static const Block creeper_wall_head = Block('minecraft:creeper_wall_head');

  /// DEPRECATED, please use Blocks.dragon_head
  @deprecated
  static const Block dragon_head = Block('minecraft:dragon_head');

  /// DEPRECATED, please use Blocks.dragon_wall_head
  @deprecated
  static const Block dragon_wall_head = Block('minecraft:dragon_wall_head');

  /// DEPRECATED, please use Blocks.anvil
  @deprecated
  static const Block anvil = Block('minecraft:anvil');

  /// DEPRECATED, please use Blocks.chipped_anvil
  @deprecated
  static const Block chipped_anvil = Block('minecraft:chipped_anvil');

  /// DEPRECATED, please use Blocks.damaged_anvil
  @deprecated
  static const Block damaged_anvil = Block('minecraft:damaged_anvil');

  /// DEPRECATED, please use Blocks.trapped_chest
  @deprecated
  static const Block trapped_chest = Block('minecraft:trapped_chest');

  /// DEPRECATED, please use Blocks.light_weighted_pressure_plate
  @deprecated
  static const Block light_weighted_pressure_plate =
      Block('minecraft:light_weighted_pressure_plate');

  /// DEPRECATED, please use Blocks.heavy_weighted_pressure_plate
  @deprecated
  static const Block heavy_weighted_pressure_plate =
      Block('minecraft:heavy_weighted_pressure_plate');

  /// DEPRECATED, please use Blocks.comparator
  @deprecated
  static const Block comparator = Block('minecraft:comparator');

  /// DEPRECATED, please use Blocks.daylight_detector
  @deprecated
  static const Block daylight_detector = Block('minecraft:daylight_detector');

  /// DEPRECATED, please use Blocks.redstone_block
  @deprecated
  static const Block redstone_block = Block('minecraft:redstone_block');

  /// DEPRECATED, please use Blocks.nether_quartz_ore
  @deprecated
  static const Block nether_quartz_ore = Block('minecraft:nether_quartz_ore');

  /// DEPRECATED, please use Blocks.hopper
  @deprecated
  static const Block hopper = Block('minecraft:hopper');

  /// DEPRECATED, please use Blocks.quartz_block
  @deprecated
  static const Block quartz_block = Block('minecraft:quartz_block');

  /// DEPRECATED, please use Blocks.chiseled_quartz_block
  @deprecated
  static const Block chiseled_quartz_block =
      Block('minecraft:chiseled_quartz_block');

  /// DEPRECATED, please use Blocks.quartz_pillar
  @deprecated
  static const Block quartz_pillar = Block('minecraft:quartz_pillar');

  /// DEPRECATED, please use Blocks.quartz_stairs
  @deprecated
  static const Block quartz_stairs = Block('minecraft:quartz_stairs');

  /// DEPRECATED, please use Blocks.activator_rail
  @deprecated
  static const Block activator_rail = Block('minecraft:activator_rail');

  /// DEPRECATED, please use Blocks.dropper
  @deprecated
  static const Block dropper = Block('minecraft:dropper');

  /// DEPRECATED, please use Blocks.white_terracotta
  @deprecated
  static const Block white_terracotta = Block('minecraft:white_terracotta');

  /// DEPRECATED, please use Blocks.orange_terracotta
  @deprecated
  static const Block orange_terracotta = Block('minecraft:orange_terracotta');

  /// DEPRECATED, please use Blocks.magenta_terracotta
  @deprecated
  static const Block magenta_terracotta = Block('minecraft:magenta_terracotta');

  /// DEPRECATED, please use Blocks.light_blue_terracotta
  @deprecated
  static const Block light_blue_terracotta =
      Block('minecraft:light_blue_terracotta');

  /// DEPRECATED, please use Blocks.yellow_terracotta
  @deprecated
  static const Block yellow_terracotta = Block('minecraft:yellow_terracotta');

  /// DEPRECATED, please use Blocks.lime_terracotta
  @deprecated
  static const Block lime_terracotta = Block('minecraft:lime_terracotta');

  /// DEPRECATED, please use Blocks.pink_terracotta
  @deprecated
  static const Block pink_terracotta = Block('minecraft:pink_terracotta');

  /// DEPRECATED, please use Blocks.gray_terracotta
  @deprecated
  static const Block gray_terracotta = Block('minecraft:gray_terracotta');

  /// DEPRECATED, please use Blocks.light_gray_terracotta
  @deprecated
  static const Block light_gray_terracotta =
      Block('minecraft:light_gray_terracotta');

  /// DEPRECATED, please use Blocks.cyan_terracotta
  @deprecated
  static const Block cyan_terracotta = Block('minecraft:cyan_terracotta');

  /// DEPRECATED, please use Blocks.purple_terracotta
  @deprecated
  static const Block purple_terracotta = Block('minecraft:purple_terracotta');

  /// DEPRECATED, please use Blocks.blue_terracotta
  @deprecated
  static const Block blue_terracotta = Block('minecraft:blue_terracotta');

  /// DEPRECATED, please use Blocks.brown_terracotta
  @deprecated
  static const Block brown_terracotta = Block('minecraft:brown_terracotta');

  /// DEPRECATED, please use Blocks.green_terracotta
  @deprecated
  static const Block green_terracotta = Block('minecraft:green_terracotta');

  /// DEPRECATED, please use Blocks.red_terracotta
  @deprecated
  static const Block red_terracotta = Block('minecraft:red_terracotta');

  /// DEPRECATED, please use Blocks.black_terracotta
  @deprecated
  static const Block black_terracotta = Block('minecraft:black_terracotta');

  /// DEPRECATED, please use Blocks.white_stained_glass_pane
  @deprecated
  static const Block white_stained_glass_pane =
      Block('minecraft:white_stained_glass_pane');

  /// DEPRECATED, please use Blocks.orange_stained_glass_pane
  @deprecated
  static const Block orange_stained_glass_pane =
      Block('minecraft:orange_stained_glass_pane');

  /// DEPRECATED, please use Blocks.magenta_stained_glass_pane
  @deprecated
  static const Block magenta_stained_glass_pane =
      Block('minecraft:magenta_stained_glass_pane');

  /// DEPRECATED, please use Blocks.light_blue_stained_glass_pane
  @deprecated
  static const Block light_blue_stained_glass_pane =
      Block('minecraft:light_blue_stained_glass_pane');

  /// DEPRECATED, please use Blocks.yellow_stained_glass_pane
  @deprecated
  static const Block yellow_stained_glass_pane =
      Block('minecraft:yellow_stained_glass_pane');

  /// DEPRECATED, please use Blocks.lime_stained_glass_pane
  @deprecated
  static const Block lime_stained_glass_pane =
      Block('minecraft:lime_stained_glass_pane');

  /// DEPRECATED, please use Blocks.pink_stained_glass_pane
  @deprecated
  static const Block pink_stained_glass_pane =
      Block('minecraft:pink_stained_glass_pane');

  /// DEPRECATED, please use Blocks.gray_stained_glass_pane
  @deprecated
  static const Block gray_stained_glass_pane =
      Block('minecraft:gray_stained_glass_pane');

  /// DEPRECATED, please use Blocks.light_gray_stained_glass_pane
  @deprecated
  static const Block light_gray_stained_glass_pane =
      Block('minecraft:light_gray_stained_glass_pane');

  /// DEPRECATED, please use Blocks.cyan_stained_glass_pane
  @deprecated
  static const Block cyan_stained_glass_pane =
      Block('minecraft:cyan_stained_glass_pane');

  /// DEPRECATED, please use Blocks.purple_stained_glass_pane
  @deprecated
  static const Block purple_stained_glass_pane =
      Block('minecraft:purple_stained_glass_pane');

  /// DEPRECATED, please use Blocks.blue_stained_glass_pane
  @deprecated
  static const Block blue_stained_glass_pane =
      Block('minecraft:blue_stained_glass_pane');

  /// DEPRECATED, please use Blocks.brown_stained_glass_pane
  @deprecated
  static const Block brown_stained_glass_pane =
      Block('minecraft:brown_stained_glass_pane');

  /// DEPRECATED, please use Blocks.green_stained_glass_pane
  @deprecated
  static const Block green_stained_glass_pane =
      Block('minecraft:green_stained_glass_pane');

  /// DEPRECATED, please use Blocks.red_stained_glass_pane
  @deprecated
  static const Block red_stained_glass_pane =
      Block('minecraft:red_stained_glass_pane');

  /// DEPRECATED, please use Blocks.black_stained_glass_pane
  @deprecated
  static const Block black_stained_glass_pane =
      Block('minecraft:black_stained_glass_pane');

  /// DEPRECATED, please use Blocks.acacia_stairs
  @deprecated
  static const Block acacia_stairs = Block('minecraft:acacia_stairs');

  /// DEPRECATED, please use Blocks.dark_oak_stairs
  @deprecated
  static const Block dark_oak_stairs = Block('minecraft:dark_oak_stairs');

  /// DEPRECATED, please use Blocks.slime_block
  @deprecated
  static const Block slime_block = Block('minecraft:slime_block');

  /// DEPRECATED, please use Blocks.barrier
  @deprecated
  static const Block barrier = Block('minecraft:barrier');

  /// DEPRECATED, please use Blocks.iron_trapdoor
  @deprecated
  static const Block iron_trapdoor = Block('minecraft:iron_trapdoor');

  /// DEPRECATED, please use Blocks.prismarine
  @deprecated
  static const Block prismarine = Block('minecraft:prismarine');

  /// DEPRECATED, please use Blocks.prismarine_bricks
  @deprecated
  static const Block prismarine_bricks = Block('minecraft:prismarine_bricks');

  /// DEPRECATED, please use Blocks.dark_prismarine
  @deprecated
  static const Block dark_prismarine = Block('minecraft:dark_prismarine');

  /// DEPRECATED, please use Blocks.prismarine_stairs
  @deprecated
  static const Block prismarine_stairs = Block('minecraft:prismarine_stairs');

  /// DEPRECATED, please use Blocks.prismarine_brick_stairs
  @deprecated
  static const Block prismarine_brick_stairs =
      Block('minecraft:prismarine_brick_stairs');

  /// DEPRECATED, please use Blocks.dark_prismarine_stairs
  @deprecated
  static const Block dark_prismarine_stairs =
      Block('minecraft:dark_prismarine_stairs');

  /// DEPRECATED, please use Blocks.prismarine_slab
  @deprecated
  static const Block prismarine_slab = Block('minecraft:prismarine_slab');

  /// DEPRECATED, please use Blocks.prismarine_brick_slab
  @deprecated
  static const Block prismarine_brick_slab =
      Block('minecraft:prismarine_brick_slab');

  /// DEPRECATED, please use Blocks.dark_prismarine_slab
  @deprecated
  static const Block dark_prismarine_slab =
      Block('minecraft:dark_prismarine_slab');

  /// DEPRECATED, please use Blocks.sea_lantern
  @deprecated
  static const Block sea_lantern = Block('minecraft:sea_lantern');

  /// DEPRECATED, please use Blocks.hay_block
  @deprecated
  static const Block hay_block = Block('minecraft:hay_block');

  /// DEPRECATED, please use Blocks.white_carpet
  @deprecated
  static const Block white_carpet = Block('minecraft:white_carpet');

  /// DEPRECATED, please use Blocks.orange_carpet
  @deprecated
  static const Block orange_carpet = Block('minecraft:orange_carpet');

  /// DEPRECATED, please use Blocks.magenta_carpet
  @deprecated
  static const Block magenta_carpet = Block('minecraft:magenta_carpet');

  /// DEPRECATED, please use Blocks.light_blue_carpet
  @deprecated
  static const Block light_blue_carpet = Block('minecraft:light_blue_carpet');

  /// DEPRECATED, please use Blocks.yellow_carpet
  @deprecated
  static const Block yellow_carpet = Block('minecraft:yellow_carpet');

  /// DEPRECATED, please use Blocks.lime_carpet
  @deprecated
  static const Block lime_carpet = Block('minecraft:lime_carpet');

  /// DEPRECATED, please use Blocks.pink_carpet
  @deprecated
  static const Block pink_carpet = Block('minecraft:pink_carpet');

  /// DEPRECATED, please use Blocks.gray_carpet
  @deprecated
  static const Block gray_carpet = Block('minecraft:gray_carpet');

  /// DEPRECATED, please use Blocks.light_gray_carpet
  @deprecated
  static const Block light_gray_carpet = Block('minecraft:light_gray_carpet');

  /// DEPRECATED, please use Blocks.cyan_carpet
  @deprecated
  static const Block cyan_carpet = Block('minecraft:cyan_carpet');

  /// DEPRECATED, please use Blocks.purple_carpet
  @deprecated
  static const Block purple_carpet = Block('minecraft:purple_carpet');

  /// DEPRECATED, please use Blocks.blue_carpet
  @deprecated
  static const Block blue_carpet = Block('minecraft:blue_carpet');

  /// DEPRECATED, please use Blocks.brown_carpet
  @deprecated
  static const Block brown_carpet = Block('minecraft:brown_carpet');

  /// DEPRECATED, please use Blocks.green_carpet
  @deprecated
  static const Block green_carpet = Block('minecraft:green_carpet');

  /// DEPRECATED, please use Blocks.red_carpet
  @deprecated
  static const Block red_carpet = Block('minecraft:red_carpet');

  /// DEPRECATED, please use Blocks.black_carpet
  @deprecated
  static const Block black_carpet = Block('minecraft:black_carpet');

  /// DEPRECATED, please use Blocks.terracotta
  @deprecated
  static const Block terracotta = Block('minecraft:terracotta');

  /// DEPRECATED, please use Blocks.coal_block
  @deprecated
  static const Block coal_block = Block('minecraft:coal_block');

  /// DEPRECATED, please use Blocks.packed_ice
  @deprecated
  static const Block packed_ice = Block('minecraft:packed_ice');

  /// DEPRECATED, please use Blocks.sunflower
  @deprecated
  static const Block sunflower = Block('minecraft:sunflower');

  /// DEPRECATED, please use Blocks.lilac
  @deprecated
  static const Block lilac = Block('minecraft:lilac');

  /// DEPRECATED, please use Blocks.rose_bush
  @deprecated
  static const Block rose_bush = Block('minecraft:rose_bush');

  /// DEPRECATED, please use Blocks.peony
  @deprecated
  static const Block peony = Block('minecraft:peony');

  /// DEPRECATED, please use Blocks.tall_grass
  @deprecated
  static const Block tall_grass = Block('minecraft:tall_grass');

  /// DEPRECATED, please use Blocks.large_fern
  @deprecated
  static const Block large_fern = Block('minecraft:large_fern');

  /// DEPRECATED, please use Blocks.white_banner
  @deprecated
  static const Block white_banner = Block('minecraft:white_banner');

  /// DEPRECATED, please use Blocks.orange_banner
  @deprecated
  static const Block orange_banner = Block('minecraft:orange_banner');

  /// DEPRECATED, please use Blocks.magenta_banner
  @deprecated
  static const Block magenta_banner = Block('minecraft:magenta_banner');

  /// DEPRECATED, please use Blocks.light_blue_banner
  @deprecated
  static const Block light_blue_banner = Block('minecraft:light_blue_banner');

  /// DEPRECATED, please use Blocks.yellow_banner
  @deprecated
  static const Block yellow_banner = Block('minecraft:yellow_banner');

  /// DEPRECATED, please use Blocks.lime_banner
  @deprecated
  static const Block lime_banner = Block('minecraft:lime_banner');

  /// DEPRECATED, please use Blocks.pink_banner
  @deprecated
  static const Block pink_banner = Block('minecraft:pink_banner');

  /// DEPRECATED, please use Blocks.gray_banner
  @deprecated
  static const Block gray_banner = Block('minecraft:gray_banner');

  /// DEPRECATED, please use Blocks.light_gray_banner
  @deprecated
  static const Block light_gray_banner = Block('minecraft:light_gray_banner');

  /// DEPRECATED, please use Blocks.cyan_banner
  @deprecated
  static const Block cyan_banner = Block('minecraft:cyan_banner');

  /// DEPRECATED, please use Blocks.purple_banner
  @deprecated
  static const Block purple_banner = Block('minecraft:purple_banner');

  /// DEPRECATED, please use Blocks.blue_banner
  @deprecated
  static const Block blue_banner = Block('minecraft:blue_banner');

  /// DEPRECATED, please use Blocks.brown_banner
  @deprecated
  static const Block brown_banner = Block('minecraft:brown_banner');

  /// DEPRECATED, please use Blocks.green_banner
  @deprecated
  static const Block green_banner = Block('minecraft:green_banner');

  /// DEPRECATED, please use Blocks.red_banner
  @deprecated
  static const Block red_banner = Block('minecraft:red_banner');

  /// DEPRECATED, please use Blocks.black_banner
  @deprecated
  static const Block black_banner = Block('minecraft:black_banner');

  /// DEPRECATED, please use Blocks.white_wall_banner
  @deprecated
  static const Block white_wall_banner = Block('minecraft:white_wall_banner');

  /// DEPRECATED, please use Blocks.orange_wall_banner
  @deprecated
  static const Block orange_wall_banner = Block('minecraft:orange_wall_banner');

  /// DEPRECATED, please use Blocks.magenta_wall_banner
  @deprecated
  static const Block magenta_wall_banner =
      Block('minecraft:magenta_wall_banner');

  /// DEPRECATED, please use Blocks.light_blue_wall_banner
  @deprecated
  static const Block light_blue_wall_banner =
      Block('minecraft:light_blue_wall_banner');

  /// DEPRECATED, please use Blocks.yellow_wall_banner
  @deprecated
  static const Block yellow_wall_banner = Block('minecraft:yellow_wall_banner');

  /// DEPRECATED, please use Blocks.lime_wall_banner
  @deprecated
  static const Block lime_wall_banner = Block('minecraft:lime_wall_banner');

  /// DEPRECATED, please use Blocks.pink_wall_banner
  @deprecated
  static const Block pink_wall_banner = Block('minecraft:pink_wall_banner');

  /// DEPRECATED, please use Blocks.gray_wall_banner
  @deprecated
  static const Block gray_wall_banner = Block('minecraft:gray_wall_banner');

  /// DEPRECATED, please use Blocks.light_gray_wall_banner
  @deprecated
  static const Block light_gray_wall_banner =
      Block('minecraft:light_gray_wall_banner');

  /// DEPRECATED, please use Blocks.cyan_wall_banner
  @deprecated
  static const Block cyan_wall_banner = Block('minecraft:cyan_wall_banner');

  /// DEPRECATED, please use Blocks.purple_wall_banner
  @deprecated
  static const Block purple_wall_banner = Block('minecraft:purple_wall_banner');

  /// DEPRECATED, please use Blocks.blue_wall_banner
  @deprecated
  static const Block blue_wall_banner = Block('minecraft:blue_wall_banner');

  /// DEPRECATED, please use Blocks.brown_wall_banner
  @deprecated
  static const Block brown_wall_banner = Block('minecraft:brown_wall_banner');

  /// DEPRECATED, please use Blocks.green_wall_banner
  @deprecated
  static const Block green_wall_banner = Block('minecraft:green_wall_banner');

  /// DEPRECATED, please use Blocks.red_wall_banner
  @deprecated
  static const Block red_wall_banner = Block('minecraft:red_wall_banner');

  /// DEPRECATED, please use Blocks.black_wall_banner
  @deprecated
  static const Block black_wall_banner = Block('minecraft:black_wall_banner');

  /// DEPRECATED, please use Blocks.red_sandstone
  @deprecated
  static const Block red_sandstone = Block('minecraft:red_sandstone');

  /// DEPRECATED, please use Blocks.chiseled_red_sandstone
  @deprecated
  static const Block chiseled_red_sandstone =
      Block('minecraft:chiseled_red_sandstone');

  /// DEPRECATED, please use Blocks.cut_red_sandstone
  @deprecated
  static const Block cut_red_sandstone = Block('minecraft:cut_red_sandstone');

  /// DEPRECATED, please use Blocks.red_sandstone_stairs
  @deprecated
  static const Block red_sandstone_stairs =
      Block('minecraft:red_sandstone_stairs');

  /// DEPRECATED, please use Blocks.oak_slab
  @deprecated
  static const Block oak_slab = Block('minecraft:oak_slab');

  /// DEPRECATED, please use Blocks.spruce_slab
  @deprecated
  static const Block spruce_slab = Block('minecraft:spruce_slab');

  /// DEPRECATED, please use Blocks.birch_slab
  @deprecated
  static const Block birch_slab = Block('minecraft:birch_slab');

  /// DEPRECATED, please use Blocks.jungle_slab
  @deprecated
  static const Block jungle_slab = Block('minecraft:jungle_slab');

  /// DEPRECATED, please use Blocks.acacia_slab
  @deprecated
  static const Block acacia_slab = Block('minecraft:acacia_slab');

  /// DEPRECATED, please use Blocks.dark_oak_slab
  @deprecated
  static const Block dark_oak_slab = Block('minecraft:dark_oak_slab');

  /// DEPRECATED, please use Blocks.stone_slab
  @deprecated
  static const Block stone_slab = Block('minecraft:stone_slab');

  /// DEPRECATED, please use Blocks.smooth_stone_slab
  @deprecated
  static const Block smooth_stone_slab = Block('minecraft:smooth_stone_slab');

  /// DEPRECATED, please use Blocks.sandstone_slab
  @deprecated
  static const Block sandstone_slab = Block('minecraft:sandstone_slab');

  /// DEPRECATED, please use Blocks.cut_sandstone_slab
  @deprecated
  static const Block cut_sandstone_slab = Block('minecraft:cut_sandstone_slab');

  /// DEPRECATED, please use Blocks.petrified_oak_slab
  @deprecated
  static const Block petrified_oak_slab = Block('minecraft:petrified_oak_slab');

  /// DEPRECATED, please use Blocks.cobblestone_slab
  @deprecated
  static const Block cobblestone_slab = Block('minecraft:cobblestone_slab');

  /// DEPRECATED, please use Blocks.brick_slab
  @deprecated
  static const Block brick_slab = Block('minecraft:brick_slab');

  /// DEPRECATED, please use Blocks.stone_brick_slab
  @deprecated
  static const Block stone_brick_slab = Block('minecraft:stone_brick_slab');

  /// DEPRECATED, please use Blocks.nether_brick_slab
  @deprecated
  static const Block nether_brick_slab = Block('minecraft:nether_brick_slab');

  /// DEPRECATED, please use Blocks.quartz_slab
  @deprecated
  static const Block quartz_slab = Block('minecraft:quartz_slab');

  /// DEPRECATED, please use Blocks.red_sandstone_slab
  @deprecated
  static const Block red_sandstone_slab = Block('minecraft:red_sandstone_slab');

  /// DEPRECATED, please use Blocks.cut_red_sandstone_slab
  @deprecated
  static const Block cut_red_sandstone_slab =
      Block('minecraft:cut_red_sandstone_slab');

  /// DEPRECATED, please use Blocks.purpur_slab
  @deprecated
  static const Block purpur_slab = Block('minecraft:purpur_slab');

  /// DEPRECATED, please use Blocks.smooth_stone
  @deprecated
  static const Block smooth_stone = Block('minecraft:smooth_stone');

  /// DEPRECATED, please use Blocks.smooth_sandstone
  @deprecated
  static const Block smooth_sandstone = Block('minecraft:smooth_sandstone');

  /// DEPRECATED, please use Blocks.smooth_quartz
  @deprecated
  static const Block smooth_quartz = Block('minecraft:smooth_quartz');

  /// DEPRECATED, please use Blocks.smooth_red_sandstone
  @deprecated
  static const Block smooth_red_sandstone =
      Block('minecraft:smooth_red_sandstone');

  /// DEPRECATED, please use Blocks.spruce_fence_gate
  @deprecated
  static const Block spruce_fence_gate = Block('minecraft:spruce_fence_gate');

  /// DEPRECATED, please use Blocks.birch_fence_gate
  @deprecated
  static const Block birch_fence_gate = Block('minecraft:birch_fence_gate');

  /// DEPRECATED, please use Blocks.jungle_fence_gate
  @deprecated
  static const Block jungle_fence_gate = Block('minecraft:jungle_fence_gate');

  /// DEPRECATED, please use Blocks.acacia_fence_gate
  @deprecated
  static const Block acacia_fence_gate = Block('minecraft:acacia_fence_gate');

  /// DEPRECATED, please use Blocks.dark_oak_fence_gate
  @deprecated
  static const Block dark_oak_fence_gate =
      Block('minecraft:dark_oak_fence_gate');

  /// DEPRECATED, please use Blocks.spruce_fence
  @deprecated
  static const Block spruce_fence = Block('minecraft:spruce_fence');

  /// DEPRECATED, please use Blocks.birch_fence
  @deprecated
  static const Block birch_fence = Block('minecraft:birch_fence');

  /// DEPRECATED, please use Blocks.jungle_fence
  @deprecated
  static const Block jungle_fence = Block('minecraft:jungle_fence');

  /// DEPRECATED, please use Blocks.acacia_fence
  @deprecated
  static const Block acacia_fence = Block('minecraft:acacia_fence');

  /// DEPRECATED, please use Blocks.dark_oak_fence
  @deprecated
  static const Block dark_oak_fence = Block('minecraft:dark_oak_fence');

  /// DEPRECATED, please use Blocks.spruce_door
  @deprecated
  static const Block spruce_door = Block('minecraft:spruce_door');

  /// DEPRECATED, please use Blocks.birch_door
  @deprecated
  static const Block birch_door = Block('minecraft:birch_door');

  /// DEPRECATED, please use Blocks.jungle_door
  @deprecated
  static const Block jungle_door = Block('minecraft:jungle_door');

  /// DEPRECATED, please use Blocks.acacia_door
  @deprecated
  static const Block acacia_door = Block('minecraft:acacia_door');

  /// DEPRECATED, please use Blocks.dark_oak_door
  @deprecated
  static const Block dark_oak_door = Block('minecraft:dark_oak_door');

  /// DEPRECATED, please use Blocks.end_rod
  @deprecated
  static const Block end_rod = Block('minecraft:end_rod');

  /// DEPRECATED, please use Blocks.chorus_plant
  @deprecated
  static const Block chorus_plant = Block('minecraft:chorus_plant');

  /// DEPRECATED, please use Blocks.chorus_flower
  @deprecated
  static const Block chorus_flower = Block('minecraft:chorus_flower');

  /// DEPRECATED, please use Blocks.purpur_block
  @deprecated
  static const Block purpur_block = Block('minecraft:purpur_block');

  /// DEPRECATED, please use Blocks.purpur_pillar
  @deprecated
  static const Block purpur_pillar = Block('minecraft:purpur_pillar');

  /// DEPRECATED, please use Blocks.purpur_stairs
  @deprecated
  static const Block purpur_stairs = Block('minecraft:purpur_stairs');

  /// DEPRECATED, please use Blocks.end_stone_bricks
  @deprecated
  static const Block end_stone_bricks = Block('minecraft:end_stone_bricks');

  /// DEPRECATED, please use Blocks.beetroots
  @deprecated
  static const Block beetroots = Block('minecraft:beetroots');

  /// DEPRECATED, please use Blocks.grass_path
  @deprecated
  static const Block grass_path = Block('minecraft:grass_path');

  /// DEPRECATED, please use Blocks.end_gateway
  @deprecated
  static const Block end_gateway = Block('minecraft:end_gateway');

  /// DEPRECATED, please use Blocks.repeating_command_block
  @deprecated
  static const Block repeating_command_block =
      Block('minecraft:repeating_command_block');

  /// DEPRECATED, please use Blocks.chain_command_block
  @deprecated
  static const Block chain_command_block =
      Block('minecraft:chain_command_block');

  /// DEPRECATED, please use Blocks.frosted_ice
  @deprecated
  static const Block frosted_ice = Block('minecraft:frosted_ice');

  /// DEPRECATED, please use Blocks.magma_block
  @deprecated
  static const Block magma_block = Block('minecraft:magma_block');

  /// DEPRECATED, please use Blocks.nether_wart_block
  @deprecated
  static const Block nether_wart_block = Block('minecraft:nether_wart_block');

  /// DEPRECATED, please use Blocks.red_nether_bricks
  @deprecated
  static const Block red_nether_bricks = Block('minecraft:red_nether_bricks');

  /// DEPRECATED, please use Blocks.bone_block
  @deprecated
  static const Block bone_block = Block('minecraft:bone_block');

  /// DEPRECATED, please use Blocks.structure_void
  @deprecated
  static const Block structure_void = Block('minecraft:structure_void');

  /// DEPRECATED, please use Blocks.observer
  @deprecated
  static const Block observer = Block('minecraft:observer');

  /// DEPRECATED, please use Blocks.shulker_box
  @deprecated
  static const Block shulker_box = Block('minecraft:shulker_box');

  /// DEPRECATED, please use Blocks.white_shulker_box
  @deprecated
  static const Block white_shulker_box = Block('minecraft:white_shulker_box');

  /// DEPRECATED, please use Blocks.orange_shulker_box
  @deprecated
  static const Block orange_shulker_box = Block('minecraft:orange_shulker_box');

  /// DEPRECATED, please use Blocks.magenta_shulker_box
  @deprecated
  static const Block magenta_shulker_box =
      Block('minecraft:magenta_shulker_box');

  /// DEPRECATED, please use Blocks.light_blue_shulker_box
  @deprecated
  static const Block light_blue_shulker_box =
      Block('minecraft:light_blue_shulker_box');

  /// DEPRECATED, please use Blocks.yellow_shulker_box
  @deprecated
  static const Block yellow_shulker_box = Block('minecraft:yellow_shulker_box');

  /// DEPRECATED, please use Blocks.lime_shulker_box
  @deprecated
  static const Block lime_shulker_box = Block('minecraft:lime_shulker_box');

  /// DEPRECATED, please use Blocks.pink_shulker_box
  @deprecated
  static const Block pink_shulker_box = Block('minecraft:pink_shulker_box');

  /// DEPRECATED, please use Blocks.gray_shulker_box
  @deprecated
  static const Block gray_shulker_box = Block('minecraft:gray_shulker_box');

  /// DEPRECATED, please use Blocks.light_gray_shulker_box
  @deprecated
  static const Block light_gray_shulker_box =
      Block('minecraft:light_gray_shulker_box');

  /// DEPRECATED, please use Blocks.cyan_shulker_box
  @deprecated
  static const Block cyan_shulker_box = Block('minecraft:cyan_shulker_box');

  /// DEPRECATED, please use Blocks.purple_shulker_box
  @deprecated
  static const Block purple_shulker_box = Block('minecraft:purple_shulker_box');

  /// DEPRECATED, please use Blocks.blue_shulker_box
  @deprecated
  static const Block blue_shulker_box = Block('minecraft:blue_shulker_box');

  /// DEPRECATED, please use Blocks.brown_shulker_box
  @deprecated
  static const Block brown_shulker_box = Block('minecraft:brown_shulker_box');

  /// DEPRECATED, please use Blocks.green_shulker_box
  @deprecated
  static const Block green_shulker_box = Block('minecraft:green_shulker_box');

  /// DEPRECATED, please use Blocks.red_shulker_box
  @deprecated
  static const Block red_shulker_box = Block('minecraft:red_shulker_box');

  /// DEPRECATED, please use Blocks.black_shulker_box
  @deprecated
  static const Block black_shulker_box = Block('minecraft:black_shulker_box');

  /// DEPRECATED, please use Blocks.white_glazed_terracotta
  @deprecated
  static const Block white_glazed_terracotta =
      Block('minecraft:white_glazed_terracotta');

  /// DEPRECATED, please use Blocks.orange_glazed_terracotta
  @deprecated
  static const Block orange_glazed_terracotta =
      Block('minecraft:orange_glazed_terracotta');

  /// DEPRECATED, please use Blocks.magenta_glazed_terracotta
  @deprecated
  static const Block magenta_glazed_terracotta =
      Block('minecraft:magenta_glazed_terracotta');

  /// DEPRECATED, please use Blocks.light_blue_glazed_terracotta
  @deprecated
  static const Block light_blue_glazed_terracotta =
      Block('minecraft:light_blue_glazed_terracotta');

  /// DEPRECATED, please use Blocks.yellow_glazed_terracotta
  @deprecated
  static const Block yellow_glazed_terracotta =
      Block('minecraft:yellow_glazed_terracotta');

  /// DEPRECATED, please use Blocks.lime_glazed_terracotta
  @deprecated
  static const Block lime_glazed_terracotta =
      Block('minecraft:lime_glazed_terracotta');

  /// DEPRECATED, please use Blocks.pink_glazed_terracotta
  @deprecated
  static const Block pink_glazed_terracotta =
      Block('minecraft:pink_glazed_terracotta');

  /// DEPRECATED, please use Blocks.gray_glazed_terracotta
  @deprecated
  static const Block gray_glazed_terracotta =
      Block('minecraft:gray_glazed_terracotta');

  /// DEPRECATED, please use Blocks.light_gray_glazed_terracotta
  @deprecated
  static const Block light_gray_glazed_terracotta =
      Block('minecraft:light_gray_glazed_terracotta');

  /// DEPRECATED, please use Blocks.cyan_glazed_terracotta
  @deprecated
  static const Block cyan_glazed_terracotta =
      Block('minecraft:cyan_glazed_terracotta');

  /// DEPRECATED, please use Blocks.purple_glazed_terracotta
  @deprecated
  static const Block purple_glazed_terracotta =
      Block('minecraft:purple_glazed_terracotta');

  /// DEPRECATED, please use Blocks.blue_glazed_terracotta
  @deprecated
  static const Block blue_glazed_terracotta =
      Block('minecraft:blue_glazed_terracotta');

  /// DEPRECATED, please use Blocks.brown_glazed_terracotta
  @deprecated
  static const Block brown_glazed_terracotta =
      Block('minecraft:brown_glazed_terracotta');

  /// DEPRECATED, please use Blocks.green_glazed_terracotta
  @deprecated
  static const Block green_glazed_terracotta =
      Block('minecraft:green_glazed_terracotta');

  /// DEPRECATED, please use Blocks.red_glazed_terracotta
  @deprecated
  static const Block red_glazed_terracotta =
      Block('minecraft:red_glazed_terracotta');

  /// DEPRECATED, please use Blocks.black_glazed_terracotta
  @deprecated
  static const Block black_glazed_terracotta =
      Block('minecraft:black_glazed_terracotta');

  /// DEPRECATED, please use Blocks.white_concrete
  @deprecated
  static const Block white_concrete = Block('minecraft:white_concrete');

  /// DEPRECATED, please use Blocks.orange_concrete
  @deprecated
  static const Block orange_concrete = Block('minecraft:orange_concrete');

  /// DEPRECATED, please use Blocks.magenta_concrete
  @deprecated
  static const Block magenta_concrete = Block('minecraft:magenta_concrete');

  /// DEPRECATED, please use Blocks.light_blue_concrete
  @deprecated
  static const Block light_blue_concrete =
      Block('minecraft:light_blue_concrete');

  /// DEPRECATED, please use Blocks.yellow_concrete
  @deprecated
  static const Block yellow_concrete = Block('minecraft:yellow_concrete');

  /// DEPRECATED, please use Blocks.lime_concrete
  @deprecated
  static const Block lime_concrete = Block('minecraft:lime_concrete');

  /// DEPRECATED, please use Blocks.pink_concrete
  @deprecated
  static const Block pink_concrete = Block('minecraft:pink_concrete');

  /// DEPRECATED, please use Blocks.gray_concrete
  @deprecated
  static const Block gray_concrete = Block('minecraft:gray_concrete');

  /// DEPRECATED, please use Blocks.light_gray_concrete
  @deprecated
  static const Block light_gray_concrete =
      Block('minecraft:light_gray_concrete');

  /// DEPRECATED, please use Blocks.cyan_concrete
  @deprecated
  static const Block cyan_concrete = Block('minecraft:cyan_concrete');

  /// DEPRECATED, please use Blocks.purple_concrete
  @deprecated
  static const Block purple_concrete = Block('minecraft:purple_concrete');

  /// DEPRECATED, please use Blocks.blue_concrete
  @deprecated
  static const Block blue_concrete = Block('minecraft:blue_concrete');

  /// DEPRECATED, please use Blocks.brown_concrete
  @deprecated
  static const Block brown_concrete = Block('minecraft:brown_concrete');

  /// DEPRECATED, please use Blocks.green_concrete
  @deprecated
  static const Block green_concrete = Block('minecraft:green_concrete');

  /// DEPRECATED, please use Blocks.red_concrete
  @deprecated
  static const Block red_concrete = Block('minecraft:red_concrete');

  /// DEPRECATED, please use Blocks.black_concrete
  @deprecated
  static const Block black_concrete = Block('minecraft:black_concrete');

  /// DEPRECATED, please use Blocks.white_concrete_powder
  @deprecated
  static const Block white_concrete_powder =
      Block('minecraft:white_concrete_powder');

  /// DEPRECATED, please use Blocks.orange_concrete_powder
  @deprecated
  static const Block orange_concrete_powder =
      Block('minecraft:orange_concrete_powder');

  /// DEPRECATED, please use Blocks.magenta_concrete_powder
  @deprecated
  static const Block magenta_concrete_powder =
      Block('minecraft:magenta_concrete_powder');

  /// DEPRECATED, please use Blocks.light_blue_concrete_powder
  @deprecated
  static const Block light_blue_concrete_powder =
      Block('minecraft:light_blue_concrete_powder');

  /// DEPRECATED, please use Blocks.yellow_concrete_powder
  @deprecated
  static const Block yellow_concrete_powder =
      Block('minecraft:yellow_concrete_powder');

  /// DEPRECATED, please use Blocks.lime_concrete_powder
  @deprecated
  static const Block lime_concrete_powder =
      Block('minecraft:lime_concrete_powder');

  /// DEPRECATED, please use Blocks.pink_concrete_powder
  @deprecated
  static const Block pink_concrete_powder =
      Block('minecraft:pink_concrete_powder');

  /// DEPRECATED, please use Blocks.gray_concrete_powder
  @deprecated
  static const Block gray_concrete_powder =
      Block('minecraft:gray_concrete_powder');

  /// DEPRECATED, please use Blocks.light_gray_concrete_powder
  @deprecated
  static const Block light_gray_concrete_powder =
      Block('minecraft:light_gray_concrete_powder');

  /// DEPRECATED, please use Blocks.cyan_concrete_powder
  @deprecated
  static const Block cyan_concrete_powder =
      Block('minecraft:cyan_concrete_powder');

  /// DEPRECATED, please use Blocks.purple_concrete_powder
  @deprecated
  static const Block purple_concrete_powder =
      Block('minecraft:purple_concrete_powder');

  /// DEPRECATED, please use Blocks.blue_concrete_powder
  @deprecated
  static const Block blue_concrete_powder =
      Block('minecraft:blue_concrete_powder');

  /// DEPRECATED, please use Blocks.brown_concrete_powder
  @deprecated
  static const Block brown_concrete_powder =
      Block('minecraft:brown_concrete_powder');

  /// DEPRECATED, please use Blocks.green_concrete_powder
  @deprecated
  static const Block green_concrete_powder =
      Block('minecraft:green_concrete_powder');

  /// DEPRECATED, please use Blocks.red_concrete_powder
  @deprecated
  static const Block red_concrete_powder =
      Block('minecraft:red_concrete_powder');

  /// DEPRECATED, please use Blocks.black_concrete_powder
  @deprecated
  static const Block black_concrete_powder =
      Block('minecraft:black_concrete_powder');

  /// DEPRECATED, please use Blocks.kelp
  @deprecated
  static const Block kelp = Block('minecraft:kelp');

  /// DEPRECATED, please use Blocks.kelp_plant
  @deprecated
  static const Block kelp_plant = Block('minecraft:kelp_plant');

  /// DEPRECATED, please use Blocks.dried_kelp_block
  @deprecated
  static const Block dried_kelp_block = Block('minecraft:dried_kelp_block');

  /// DEPRECATED, please use Blocks.turtle_egg
  @deprecated
  static const Block turtle_egg = Block('minecraft:turtle_egg');

  /// DEPRECATED, please use Blocks.dead_tube_coral_block
  @deprecated
  static const Block dead_tube_coral_block =
      Block('minecraft:dead_tube_coral_block');

  /// DEPRECATED, please use Blocks.dead_brain_coral_block
  @deprecated
  static const Block dead_brain_coral_block =
      Block('minecraft:dead_brain_coral_block');

  /// DEPRECATED, please use Blocks.dead_bubble_coral_block
  @deprecated
  static const Block dead_bubble_coral_block =
      Block('minecraft:dead_bubble_coral_block');

  /// DEPRECATED, please use Blocks.dead_fire_coral_block
  @deprecated
  static const Block dead_fire_coral_block =
      Block('minecraft:dead_fire_coral_block');

  /// DEPRECATED, please use Blocks.dead_horn_coral_block
  @deprecated
  static const Block dead_horn_coral_block =
      Block('minecraft:dead_horn_coral_block');

  /// DEPRECATED, please use Blocks.tube_coral_block
  @deprecated
  static const Block tube_coral_block = Block('minecraft:tube_coral_block');

  /// DEPRECATED, please use Blocks.brain_coral_block
  @deprecated
  static const Block brain_coral_block = Block('minecraft:brain_coral_block');

  /// DEPRECATED, please use Blocks.bubble_coral_block
  @deprecated
  static const Block bubble_coral_block = Block('minecraft:bubble_coral_block');

  /// DEPRECATED, please use Blocks.fire_coral_block
  @deprecated
  static const Block fire_coral_block = Block('minecraft:fire_coral_block');

  /// DEPRECATED, please use Blocks.horn_coral_block
  @deprecated
  static const Block horn_coral_block = Block('minecraft:horn_coral_block');

  /// DEPRECATED, please use Blocks.dead_tube_coral
  @deprecated
  static const Block dead_tube_coral = Block('minecraft:dead_tube_coral');

  /// DEPRECATED, please use Blocks.dead_brain_coral
  @deprecated
  static const Block dead_brain_coral = Block('minecraft:dead_brain_coral');

  /// DEPRECATED, please use Blocks.dead_bubble_coral
  @deprecated
  static const Block dead_bubble_coral = Block('minecraft:dead_bubble_coral');

  /// DEPRECATED, please use Blocks.dead_fire_coral
  @deprecated
  static const Block dead_fire_coral = Block('minecraft:dead_fire_coral');

  /// DEPRECATED, please use Blocks.dead_horn_coral
  @deprecated
  static const Block dead_horn_coral = Block('minecraft:dead_horn_coral');

  /// DEPRECATED, please use Blocks.tube_coral
  @deprecated
  static const Block tube_coral = Block('minecraft:tube_coral');

  /// DEPRECATED, please use Blocks.brain_coral
  @deprecated
  static const Block brain_coral = Block('minecraft:brain_coral');

  /// DEPRECATED, please use Blocks.bubble_coral
  @deprecated
  static const Block bubble_coral = Block('minecraft:bubble_coral');

  /// DEPRECATED, please use Blocks.fire_coral
  @deprecated
  static const Block fire_coral = Block('minecraft:fire_coral');

  /// DEPRECATED, please use Blocks.horn_coral
  @deprecated
  static const Block horn_coral = Block('minecraft:horn_coral');

  /// DEPRECATED, please use Blocks.dead_tube_coral_fan
  @deprecated
  static const Block dead_tube_coral_fan =
      Block('minecraft:dead_tube_coral_fan');

  /// DEPRECATED, please use Blocks.dead_brain_coral_fan
  @deprecated
  static const Block dead_brain_coral_fan =
      Block('minecraft:dead_brain_coral_fan');

  /// DEPRECATED, please use Blocks.dead_bubble_coral_fan
  @deprecated
  static const Block dead_bubble_coral_fan =
      Block('minecraft:dead_bubble_coral_fan');

  /// DEPRECATED, please use Blocks.dead_fire_coral_fan
  @deprecated
  static const Block dead_fire_coral_fan =
      Block('minecraft:dead_fire_coral_fan');

  /// DEPRECATED, please use Blocks.dead_horn_coral_fan
  @deprecated
  static const Block dead_horn_coral_fan =
      Block('minecraft:dead_horn_coral_fan');

  /// DEPRECATED, please use Blocks.tube_coral_fan
  @deprecated
  static const Block tube_coral_fan = Block('minecraft:tube_coral_fan');

  /// DEPRECATED, please use Blocks.brain_coral_fan
  @deprecated
  static const Block brain_coral_fan = Block('minecraft:brain_coral_fan');

  /// DEPRECATED, please use Blocks.bubble_coral_fan
  @deprecated
  static const Block bubble_coral_fan = Block('minecraft:bubble_coral_fan');

  /// DEPRECATED, please use Blocks.fire_coral_fan
  @deprecated
  static const Block fire_coral_fan = Block('minecraft:fire_coral_fan');

  /// DEPRECATED, please use Blocks.horn_coral_fan
  @deprecated
  static const Block horn_coral_fan = Block('minecraft:horn_coral_fan');

  /// DEPRECATED, please use Blocks.dead_tube_coral_wall_fan
  @deprecated
  static const Block dead_tube_coral_wall_fan =
      Block('minecraft:dead_tube_coral_wall_fan');

  /// DEPRECATED, please use Blocks.dead_brain_coral_wall_fan
  @deprecated
  static const Block dead_brain_coral_wall_fan =
      Block('minecraft:dead_brain_coral_wall_fan');

  /// DEPRECATED, please use Blocks.dead_bubble_coral_wall_fan
  @deprecated
  static const Block dead_bubble_coral_wall_fan =
      Block('minecraft:dead_bubble_coral_wall_fan');

  /// DEPRECATED, please use Blocks.dead_fire_coral_wall_fan
  @deprecated
  static const Block dead_fire_coral_wall_fan =
      Block('minecraft:dead_fire_coral_wall_fan');

  /// DEPRECATED, please use Blocks.dead_horn_coral_wall_fan
  @deprecated
  static const Block dead_horn_coral_wall_fan =
      Block('minecraft:dead_horn_coral_wall_fan');

  /// DEPRECATED, please use Blocks.tube_coral_wall_fan
  @deprecated
  static const Block tube_coral_wall_fan =
      Block('minecraft:tube_coral_wall_fan');

  /// DEPRECATED, please use Blocks.brain_coral_wall_fan
  @deprecated
  static const Block brain_coral_wall_fan =
      Block('minecraft:brain_coral_wall_fan');

  /// DEPRECATED, please use Blocks.bubble_coral_wall_fan
  @deprecated
  static const Block bubble_coral_wall_fan =
      Block('minecraft:bubble_coral_wall_fan');

  /// DEPRECATED, please use Blocks.fire_coral_wall_fan
  @deprecated
  static const Block fire_coral_wall_fan =
      Block('minecraft:fire_coral_wall_fan');

  /// DEPRECATED, please use Blocks.horn_coral_wall_fan
  @deprecated
  static const Block horn_coral_wall_fan =
      Block('minecraft:horn_coral_wall_fan');

  /// DEPRECATED, please use Blocks.sea_pickle
  @deprecated
  static const Block sea_pickle = Block('minecraft:sea_pickle');

  /// DEPRECATED, please use Blocks.blue_ice
  @deprecated
  static const Block blue_ice = Block('minecraft:blue_ice');

  /// DEPRECATED, please use Blocks.conduit
  @deprecated
  static const Block conduit = Block('minecraft:conduit');

  /// DEPRECATED, please use Blocks.bamboo_sapling
  @deprecated
  static const Block bamboo_sapling = Block('minecraft:bamboo_sapling');

  /// DEPRECATED, please use Blocks.bamboo
  @deprecated
  static const Block bamboo = Block('minecraft:bamboo');

  /// DEPRECATED, please use Blocks.potted_bamboo
  @deprecated
  static const Block potted_bamboo = Block('minecraft:potted_bamboo');

  /// DEPRECATED, please use Blocks.void_air
  @deprecated
  static const Block void_air = Block('minecraft:void_air');

  /// DEPRECATED, please use Blocks.cave_air
  @deprecated
  static const Block cave_air = Block('minecraft:cave_air');

  /// DEPRECATED, please use Blocks.bubble_column
  @deprecated
  static const Block bubble_column = Block('minecraft:bubble_column');

  /// DEPRECATED, please use Blocks.polished_granite_stairs
  @deprecated
  static const Block polished_granite_stairs =
      Block('minecraft:polished_granite_stairs');

  /// DEPRECATED, please use Blocks.smooth_red_sandstone_stairs
  @deprecated
  static const Block smooth_red_sandstone_stairs =
      Block('minecraft:smooth_red_sandstone_stairs');

  /// DEPRECATED, please use Blocks.mossy_stone_brick_stairs
  @deprecated
  static const Block mossy_stone_brick_stairs =
      Block('minecraft:mossy_stone_brick_stairs');

  /// DEPRECATED, please use Blocks.polished_diorite_stairs
  @deprecated
  static const Block polished_diorite_stairs =
      Block('minecraft:polished_diorite_stairs');

  /// DEPRECATED, please use Blocks.mossy_cobblestone_stairs
  @deprecated
  static const Block mossy_cobblestone_stairs =
      Block('minecraft:mossy_cobblestone_stairs');

  /// DEPRECATED, please use Blocks.end_stone_brick_stairs
  @deprecated
  static const Block end_stone_brick_stairs =
      Block('minecraft:end_stone_brick_stairs');

  /// DEPRECATED, please use Blocks.stone_stairs
  @deprecated
  static const Block stone_stairs = Block('minecraft:stone_stairs');

  /// DEPRECATED, please use Blocks.smooth_sandstone_stairs
  @deprecated
  static const Block smooth_sandstone_stairs =
      Block('minecraft:smooth_sandstone_stairs');

  /// DEPRECATED, please use Blocks.smooth_quartz_stairs
  @deprecated
  static const Block smooth_quartz_stairs =
      Block('minecraft:smooth_quartz_stairs');

  /// DEPRECATED, please use Blocks.granite_stairs
  @deprecated
  static const Block granite_stairs = Block('minecraft:granite_stairs');

  /// DEPRECATED, please use Blocks.andesite_stairs
  @deprecated
  static const Block andesite_stairs = Block('minecraft:andesite_stairs');

  /// DEPRECATED, please use Blocks.red_nether_brick_stairs
  @deprecated
  static const Block red_nether_brick_stairs =
      Block('minecraft:red_nether_brick_stairs');

  /// DEPRECATED, please use Blocks.polished_andesite_stairs
  @deprecated
  static const Block polished_andesite_stairs =
      Block('minecraft:polished_andesite_stairs');

  /// DEPRECATED, please use Blocks.diorite_stairs
  @deprecated
  static const Block diorite_stairs = Block('minecraft:diorite_stairs');

  /// DEPRECATED, please use Blocks.polished_granite_slab
  @deprecated
  static const Block polished_granite_slab =
      Block('minecraft:polished_granite_slab');

  /// DEPRECATED, please use Blocks.smooth_red_sandstone_slab
  @deprecated
  static const Block smooth_red_sandstone_slab =
      Block('minecraft:smooth_red_sandstone_slab');

  /// DEPRECATED, please use Blocks.mossy_stone_brick_slab
  @deprecated
  static const Block mossy_stone_brick_slab =
      Block('minecraft:mossy_stone_brick_slab');

  /// DEPRECATED, please use Blocks.polished_diorite_slab
  @deprecated
  static const Block polished_diorite_slab =
      Block('minecraft:polished_diorite_slab');

  /// DEPRECATED, please use Blocks.mossy_cobblestone_slab
  @deprecated
  static const Block mossy_cobblestone_slab =
      Block('minecraft:mossy_cobblestone_slab');

  /// DEPRECATED, please use Blocks.end_stone_brick_slab
  @deprecated
  static const Block end_stone_brick_slab =
      Block('minecraft:end_stone_brick_slab');

  /// DEPRECATED, please use Blocks.smooth_sandstone_slab
  @deprecated
  static const Block smooth_sandstone_slab =
      Block('minecraft:smooth_sandstone_slab');

  /// DEPRECATED, please use Blocks.smooth_quartz_slab
  @deprecated
  static const Block smooth_quartz_slab = Block('minecraft:smooth_quartz_slab');

  /// DEPRECATED, please use Blocks.granite_slab
  @deprecated
  static const Block granite_slab = Block('minecraft:granite_slab');

  /// DEPRECATED, please use Blocks.andesite_slab
  @deprecated
  static const Block andesite_slab = Block('minecraft:andesite_slab');

  /// DEPRECATED, please use Blocks.red_nether_brick_slab
  @deprecated
  static const Block red_nether_brick_slab =
      Block('minecraft:red_nether_brick_slab');

  /// DEPRECATED, please use Blocks.polished_andesite_slab
  @deprecated
  static const Block polished_andesite_slab =
      Block('minecraft:polished_andesite_slab');

  /// DEPRECATED, please use Blocks.diorite_slab
  @deprecated
  static const Block diorite_slab = Block('minecraft:diorite_slab');

  /// DEPRECATED, please use Blocks.brick_wall
  @deprecated
  static const Block brick_wall = Block('minecraft:brick_wall');

  /// DEPRECATED, please use Blocks.prismarine_wall
  @deprecated
  static const Block prismarine_wall = Block('minecraft:prismarine_wall');

  /// DEPRECATED, please use Blocks.red_sandstone_wall
  @deprecated
  static const Block red_sandstone_wall = Block('minecraft:red_sandstone_wall');

  /// DEPRECATED, please use Blocks.mossy_stone_brick_wall
  @deprecated
  static const Block mossy_stone_brick_wall =
      Block('minecraft:mossy_stone_brick_wall');

  /// DEPRECATED, please use Blocks.granite_wall
  @deprecated
  static const Block granite_wall = Block('minecraft:granite_wall');

  /// DEPRECATED, please use Blocks.stone_brick_wall
  @deprecated
  static const Block stone_brick_wall = Block('minecraft:stone_brick_wall');

  /// DEPRECATED, please use Blocks.nether_brick_wall
  @deprecated
  static const Block nether_brick_wall = Block('minecraft:nether_brick_wall');

  /// DEPRECATED, please use Blocks.andesite_wall
  @deprecated
  static const Block andesite_wall = Block('minecraft:andesite_wall');

  /// DEPRECATED, please use Blocks.red_nether_brick_wall
  @deprecated
  static const Block red_nether_brick_wall =
      Block('minecraft:red_nether_brick_wall');

  /// DEPRECATED, please use Blocks.sandstone_wall
  @deprecated
  static const Block sandstone_wall = Block('minecraft:sandstone_wall');

  /// DEPRECATED, please use Blocks.end_stone_brick_wall
  @deprecated
  static const Block end_stone_brick_wall =
      Block('minecraft:end_stone_brick_wall');

  /// DEPRECATED, please use Blocks.diorite_wall
  @deprecated
  static const Block diorite_wall = Block('minecraft:diorite_wall');

  /// DEPRECATED, please use Blocks.scaffolding
  @deprecated
  static const Block scaffolding = Block('minecraft:scaffolding');

  /// DEPRECATED, please use Blocks.loom
  @deprecated
  static const Block loom = Block('minecraft:loom');

  /// DEPRECATED, please use Blocks.barrel
  @deprecated
  static const Block barrel = Block('minecraft:barrel');

  /// DEPRECATED, please use Blocks.smoker
  @deprecated
  static const Block smoker = Block('minecraft:smoker');

  /// DEPRECATED, please use Blocks.blast_furnace
  @deprecated
  static const Block blast_furnace = Block('minecraft:blast_furnace');

  /// DEPRECATED, please use Blocks.cartography_table
  @deprecated
  static const Block cartography_table = Block('minecraft:cartography_table');

  /// DEPRECATED, please use Blocks.fletching_table
  @deprecated
  static const Block fletching_table = Block('minecraft:fletching_table');

  /// DEPRECATED, please use Blocks.grindstone
  @deprecated
  static const Block grindstone = Block('minecraft:grindstone');

  /// DEPRECATED, please use Blocks.lectern
  @deprecated
  static const Block lectern = Block('minecraft:lectern');

  /// DEPRECATED, please use Blocks.smithing_table
  @deprecated
  static const Block smithing_table = Block('minecraft:smithing_table');

  /// DEPRECATED, please use Blocks.stonecutter
  @deprecated
  static const Block stonecutter = Block('minecraft:stonecutter');

  /// DEPRECATED, please use Blocks.bell
  @deprecated
  static const Block bell = Block('minecraft:bell');

  /// DEPRECATED, please use Blocks.lantern
  @deprecated
  static const Block lantern = Block('minecraft:lantern');

  /// DEPRECATED, please use Blocks.campfire
  @deprecated
  static const Block campfire = Block('minecraft:campfire');

  /// DEPRECATED, please use Blocks.sweet_berry_bush
  @deprecated
  static const Block sweet_berry_bush = Block('minecraft:sweet_berry_bush');

  /// DEPRECATED, please use Blocks.structure_block
  @deprecated
  static const Block structure_block = Block('minecraft:structure_block');

  /// DEPRECATED, please use Blocks.jigsaw
  @deprecated
  static const Block jigsaw = Block('minecraft:jigsaw');

  /// DEPRECATED, please use Blocks.composter
  @deprecated
  static const Block composter = Block('minecraft:composter');

  /// DEPRECATED, please use Blocks.bee_nest
  @deprecated
  static const Block bee_nest = Block('minecraft:bee_nest');

  /// DEPRECATED, please use Blocks.beehive
  @deprecated
  static const Block beehive = Block('minecraft:beehive');

  /// DEPRECATED, please use Blocks.honey_block
  @deprecated
  static const Block honey_block = Block('minecraft:honey_block');

  /// DEPRECATED, please use Blocks.honeycomb_block
  @deprecated
  static const Block honeycomb_block = Block('minecraft:honeycomb_block');
}
