import 'block.dart';

class Blocks {
  /// A List of all Minecraft blocks
  static const List<Block> all = [
    air,
    stone,
    granite,
    polished_granite,
    diorite,
    polished_diorite,
    andesite,
    polished_andesite,
    grass_block,
    dirt,
    coarse_dirt,
    podzol,
    cobblestone,
    oak_planks,
    spruce_planks,
    birch_planks,
    jungle_planks,
    acacia_planks,
    dark_oak_planks,
    oak_sapling,
    spruce_sapling,
    birch_sapling,
    jungle_sapling,
    acacia_sapling,
    dark_oak_sapling,
    bedrock,
    water,
    lava,
    sand,
    red_sand,
    gravel,
    gold_ore,
    iron_ore,
    coal_ore,
    oak_log,
    spruce_log,
    birch_log,
    jungle_log,
    acacia_log,
    dark_oak_log,
    stripped_spruce_log,
    stripped_birch_log,
    stripped_jungle_log,
    stripped_acacia_log,
    stripped_dark_oak_log,
    stripped_oak_log,
    oak_wood,
    spruce_wood,
    birch_wood,
    jungle_wood,
    acacia_wood,
    dark_oak_wood,
    stripped_oak_wood,
    stripped_spruce_wood,
    stripped_birch_wood,
    stripped_jungle_wood,
    stripped_acacia_wood,
    stripped_dark_oak_wood,
    oak_leaves,
    spruce_leaves,
    birch_leaves,
    jungle_leaves,
    acacia_leaves,
    dark_oak_leaves,
    sponge,
    wet_sponge,
    glass,
    lapis_ore,
    lapis_block,
    dispenser,
    sandstone,
    chiseled_sandstone,
    cut_sandstone,
    note_block,
    white_bed,
    orange_bed,
    magenta_bed,
    light_blue_bed,
    yellow_bed,
    lime_bed,
    pink_bed,
    gray_bed,
    light_gray_bed,
    cyan_bed,
    purple_bed,
    blue_bed,
    brown_bed,
    green_bed,
    red_bed,
    black_bed,
    powered_rail,
    detector_rail,
    sticky_piston,
    cobweb,
    grass,
    fern,
    dead_bush,
    seagrass,
    tall_seagrass,
    piston,
    piston_head,
    white_wool,
    orange_wool,
    magenta_wool,
    light_blue_wool,
    yellow_wool,
    lime_wool,
    pink_wool,
    gray_wool,
    light_gray_wool,
    cyan_wool,
    purple_wool,
    blue_wool,
    brown_wool,
    green_wool,
    red_wool,
    black_wool,
    moving_piston,
    dandelion,
    poppy,
    blue_orchid,
    allium,
    azure_bluet,
    red_tulip,
    orange_tulip,
    white_tulip,
    pink_tulip,
    oxeye_daisy,
    cornflower,
    wither_rose,
    lily_of_the_valley,
    brown_mushroom,
    red_mushroom,
    gold_block,
    iron_block,
    bricks,
    tnt,
    bookshelf,
    mossy_cobblestone,
    obsidian,
    torch,
    wall_torch,
    fire,
    soul_fire,
    spawner,
    oak_stairs,
    chest,
    redstone_wire,
    diamond_ore,
    diamond_block,
    crafting_table,
    wheat,
    farmland,
    furnace,
    oak_sign,
    spruce_sign,
    birch_sign,
    acacia_sign,
    jungle_sign,
    dark_oak_sign,
    oak_door,
    ladder,
    rail,
    cobblestone_stairs,
    oak_wall_sign,
    spruce_wall_sign,
    birch_wall_sign,
    acacia_wall_sign,
    jungle_wall_sign,
    dark_oak_wall_sign,
    lever,
    stone_pressure_plate,
    iron_door,
    oak_pressure_plate,
    spruce_pressure_plate,
    birch_pressure_plate,
    jungle_pressure_plate,
    acacia_pressure_plate,
    dark_oak_pressure_plate,
    redstone_ore,
    redstone_torch,
    redstone_wall_torch,
    stone_button,
    snow,
    ice,
    snow_block,
    cactus,
    clay,
    sugar_cane,
    jukebox,
    oak_fence,
    pumpkin,
    netherrack,
    soul_sand,
    soul_soil,
    basalt,
    soul_fire_torch,
    soul_fire_wall_torch,
    glowstone,
    nether_portal,
    carved_pumpkin,
    jack_o_lantern,
    cake,
    repeater,
    white_stained_glass,
    orange_stained_glass,
    magenta_stained_glass,
    light_blue_stained_glass,
    yellow_stained_glass,
    lime_stained_glass,
    pink_stained_glass,
    gray_stained_glass,
    light_gray_stained_glass,
    cyan_stained_glass,
    purple_stained_glass,
    blue_stained_glass,
    brown_stained_glass,
    green_stained_glass,
    red_stained_glass,
    black_stained_glass,
    oak_trapdoor,
    spruce_trapdoor,
    birch_trapdoor,
    jungle_trapdoor,
    acacia_trapdoor,
    dark_oak_trapdoor,
    stone_bricks,
    mossy_stone_bricks,
    cracked_stone_bricks,
    chiseled_stone_bricks,
    infested_stone,
    infested_cobblestone,
    infested_stone_bricks,
    infested_mossy_stone_bricks,
    infested_cracked_stone_bricks,
    infested_chiseled_stone_bricks,
    brown_mushroom_block,
    red_mushroom_block,
    mushroom_stem,
    iron_bars,
    glass_pane,
    melon,
    attached_pumpkin_stem,
    attached_melon_stem,
    pumpkin_stem,
    melon_stem,
    vine,
    oak_fence_gate,
    brick_stairs,
    stone_brick_stairs,
    mycelium,
    lily_pad,
    nether_bricks,
    nether_brick_fence,
    nether_brick_stairs,
    nether_wart,
    enchanting_table,
    brewing_stand,
    cauldron,
    end_portal,
    end_portal_frame,
    end_stone,
    dragon_egg,
    redstone_lamp,
    cocoa,
    sandstone_stairs,
    emerald_ore,
    ender_chest,
    tripwire_hook,
    tripwire,
    emerald_block,
    spruce_stairs,
    birch_stairs,
    jungle_stairs,
    command_block,
    beacon,
    cobblestone_wall,
    mossy_cobblestone_wall,
    flower_pot,
    potted_oak_sapling,
    potted_spruce_sapling,
    potted_birch_sapling,
    potted_jungle_sapling,
    potted_acacia_sapling,
    potted_dark_oak_sapling,
    potted_fern,
    potted_dandelion,
    potted_poppy,
    potted_blue_orchid,
    potted_allium,
    potted_azure_bluet,
    potted_red_tulip,
    potted_orange_tulip,
    potted_white_tulip,
    potted_pink_tulip,
    potted_oxeye_daisy,
    potted_cornflower,
    potted_lily_of_the_valley,
    potted_wither_rose,
    potted_red_mushroom,
    potted_brown_mushroom,
    potted_dead_bush,
    potted_cactus,
    carrots,
    potatoes,
    oak_button,
    spruce_button,
    birch_button,
    jungle_button,
    acacia_button,
    dark_oak_button,
    skeleton_skull,
    skeleton_wall_skull,
    wither_skeleton_skull,
    wither_skeleton_wall_skull,
    zombie_head,
    zombie_wall_head,
    player_head,
    player_wall_head,
    creeper_head,
    creeper_wall_head,
    dragon_head,
    dragon_wall_head,
    anvil,
    chipped_anvil,
    damaged_anvil,
    trapped_chest,
    light_weighted_pressure_plate,
    heavy_weighted_pressure_plate,
    comparator,
    daylight_detector,
    redstone_block,
    nether_quartz_ore,
    hopper,
    quartz_block,
    chiseled_quartz_block,
    quartz_pillar,
    quartz_stairs,
    activator_rail,
    dropper,
    white_terracotta,
    orange_terracotta,
    magenta_terracotta,
    light_blue_terracotta,
    yellow_terracotta,
    lime_terracotta,
    pink_terracotta,
    gray_terracotta,
    light_gray_terracotta,
    cyan_terracotta,
    purple_terracotta,
    blue_terracotta,
    brown_terracotta,
    green_terracotta,
    red_terracotta,
    black_terracotta,
    white_stained_glass_pane,
    orange_stained_glass_pane,
    magenta_stained_glass_pane,
    light_blue_stained_glass_pane,
    yellow_stained_glass_pane,
    lime_stained_glass_pane,
    pink_stained_glass_pane,
    gray_stained_glass_pane,
    light_gray_stained_glass_pane,
    cyan_stained_glass_pane,
    purple_stained_glass_pane,
    blue_stained_glass_pane,
    brown_stained_glass_pane,
    green_stained_glass_pane,
    red_stained_glass_pane,
    black_stained_glass_pane,
    acacia_stairs,
    dark_oak_stairs,
    slime_block,
    barrier,
    iron_trapdoor,
    prismarine,
    prismarine_bricks,
    dark_prismarine,
    prismarine_stairs,
    prismarine_brick_stairs,
    dark_prismarine_stairs,
    prismarine_slab,
    prismarine_brick_slab,
    dark_prismarine_slab,
    sea_lantern,
    hay_block,
    white_carpet,
    orange_carpet,
    magenta_carpet,
    light_blue_carpet,
    yellow_carpet,
    lime_carpet,
    pink_carpet,
    gray_carpet,
    light_gray_carpet,
    cyan_carpet,
    purple_carpet,
    blue_carpet,
    brown_carpet,
    green_carpet,
    red_carpet,
    black_carpet,
    terracotta,
    coal_block,
    packed_ice,
    sunflower,
    lilac,
    rose_bush,
    peony,
    tall_grass,
    large_fern,
    white_banner,
    orange_banner,
    magenta_banner,
    light_blue_banner,
    yellow_banner,
    lime_banner,
    pink_banner,
    gray_banner,
    light_gray_banner,
    cyan_banner,
    purple_banner,
    blue_banner,
    brown_banner,
    green_banner,
    red_banner,
    black_banner,
    white_wall_banner,
    orange_wall_banner,
    magenta_wall_banner,
    light_blue_wall_banner,
    yellow_wall_banner,
    lime_wall_banner,
    pink_wall_banner,
    gray_wall_banner,
    light_gray_wall_banner,
    cyan_wall_banner,
    purple_wall_banner,
    blue_wall_banner,
    brown_wall_banner,
    green_wall_banner,
    red_wall_banner,
    black_wall_banner,
    red_sandstone,
    chiseled_red_sandstone,
    cut_red_sandstone,
    red_sandstone_stairs,
    oak_slab,
    spruce_slab,
    birch_slab,
    jungle_slab,
    acacia_slab,
    dark_oak_slab,
    stone_slab,
    smooth_stone_slab,
    sandstone_slab,
    cut_sandstone_slab,
    petrified_oak_slab,
    cobblestone_slab,
    brick_slab,
    stone_brick_slab,
    nether_brick_slab,
    quartz_slab,
    red_sandstone_slab,
    cut_red_sandstone_slab,
    purpur_slab,
    smooth_stone,
    smooth_sandstone,
    smooth_quartz,
    smooth_red_sandstone,
    spruce_fence_gate,
    birch_fence_gate,
    jungle_fence_gate,
    acacia_fence_gate,
    dark_oak_fence_gate,
    spruce_fence,
    birch_fence,
    jungle_fence,
    acacia_fence,
    dark_oak_fence,
    spruce_door,
    birch_door,
    jungle_door,
    acacia_door,
    dark_oak_door,
    end_rod,
    chorus_plant,
    chorus_flower,
    purpur_block,
    purpur_pillar,
    purpur_stairs,
    end_stone_bricks,
    beetroots,
    grass_path,
    end_gateway,
    repeating_command_block,
    chain_command_block,
    frosted_ice,
    magma_block,
    nether_wart_block,
    red_nether_bricks,
    bone_block,
    structure_void,
    observer,
    shulker_box,
    white_shulker_box,
    orange_shulker_box,
    magenta_shulker_box,
    light_blue_shulker_box,
    yellow_shulker_box,
    lime_shulker_box,
    pink_shulker_box,
    gray_shulker_box,
    light_gray_shulker_box,
    cyan_shulker_box,
    purple_shulker_box,
    blue_shulker_box,
    brown_shulker_box,
    green_shulker_box,
    red_shulker_box,
    black_shulker_box,
    white_glazed_terracotta,
    orange_glazed_terracotta,
    magenta_glazed_terracotta,
    light_blue_glazed_terracotta,
    yellow_glazed_terracotta,
    lime_glazed_terracotta,
    pink_glazed_terracotta,
    gray_glazed_terracotta,
    light_gray_glazed_terracotta,
    cyan_glazed_terracotta,
    purple_glazed_terracotta,
    blue_glazed_terracotta,
    brown_glazed_terracotta,
    green_glazed_terracotta,
    red_glazed_terracotta,
    black_glazed_terracotta,
    white_concrete,
    orange_concrete,
    magenta_concrete,
    light_blue_concrete,
    yellow_concrete,
    lime_concrete,
    pink_concrete,
    gray_concrete,
    light_gray_concrete,
    cyan_concrete,
    purple_concrete,
    blue_concrete,
    brown_concrete,
    green_concrete,
    red_concrete,
    black_concrete,
    white_concrete_powder,
    orange_concrete_powder,
    magenta_concrete_powder,
    light_blue_concrete_powder,
    yellow_concrete_powder,
    lime_concrete_powder,
    pink_concrete_powder,
    gray_concrete_powder,
    light_gray_concrete_powder,
    cyan_concrete_powder,
    purple_concrete_powder,
    blue_concrete_powder,
    brown_concrete_powder,
    green_concrete_powder,
    red_concrete_powder,
    black_concrete_powder,
    kelp,
    kelp_plant,
    dried_kelp_block,
    turtle_egg,
    dead_tube_coral_block,
    dead_brain_coral_block,
    dead_bubble_coral_block,
    dead_fire_coral_block,
    dead_horn_coral_block,
    tube_coral_block,
    brain_coral_block,
    bubble_coral_block,
    fire_coral_block,
    horn_coral_block,
    dead_tube_coral,
    dead_brain_coral,
    dead_bubble_coral,
    dead_fire_coral,
    dead_horn_coral,
    tube_coral,
    brain_coral,
    bubble_coral,
    fire_coral,
    horn_coral,
    dead_tube_coral_fan,
    dead_brain_coral_fan,
    dead_bubble_coral_fan,
    dead_fire_coral_fan,
    dead_horn_coral_fan,
    tube_coral_fan,
    brain_coral_fan,
    bubble_coral_fan,
    fire_coral_fan,
    horn_coral_fan,
    dead_tube_coral_wall_fan,
    dead_brain_coral_wall_fan,
    dead_bubble_coral_wall_fan,
    dead_fire_coral_wall_fan,
    dead_horn_coral_wall_fan,
    tube_coral_wall_fan,
    brain_coral_wall_fan,
    bubble_coral_wall_fan,
    fire_coral_wall_fan,
    horn_coral_wall_fan,
    sea_pickle,
    blue_ice,
    conduit,
    bamboo_sapling,
    bamboo,
    potted_bamboo,
    void_air,
    cave_air,
    bubble_column,
    polished_granite_stairs,
    smooth_red_sandstone_stairs,
    mossy_stone_brick_stairs,
    polished_diorite_stairs,
    mossy_cobblestone_stairs,
    end_stone_brick_stairs,
    stone_stairs,
    smooth_sandstone_stairs,
    smooth_quartz_stairs,
    granite_stairs,
    andesite_stairs,
    red_nether_brick_stairs,
    polished_andesite_stairs,
    diorite_stairs,
    polished_granite_slab,
    smooth_red_sandstone_slab,
    mossy_stone_brick_slab,
    polished_diorite_slab,
    mossy_cobblestone_slab,
    end_stone_brick_slab,
    smooth_sandstone_slab,
    smooth_quartz_slab,
    granite_slab,
    andesite_slab,
    red_nether_brick_slab,
    polished_andesite_slab,
    diorite_slab,
    brick_wall,
    prismarine_wall,
    red_sandstone_wall,
    mossy_stone_brick_wall,
    granite_wall,
    stone_brick_wall,
    nether_brick_wall,
    andesite_wall,
    red_nether_brick_wall,
    sandstone_wall,
    end_stone_brick_wall,
    diorite_wall,
    scaffolding,
    loom,
    barrel,
    smoker,
    blast_furnace,
    cartography_table,
    fletching_table,
    grindstone,
    lectern,
    smithing_table,
    stonecutter,
    bell,
    lantern,
    soul_fire_lantern,
    campfire,
    sweet_berry_bush,
    warped_stem,
    stripped_warped_stem,
    warped_hyphae,
    stripped_warped_hyphae,
    warped_nylium,
    warped_fungus,
    warped_wart_block,
    warped_roots,
    nether_sprouts,
    crimson_stem,
    stripped_crimson_stem,
    crimson_hyphae,
    stripped_crimson_hyphae,
    crimson_nylium,
    crimson_fungus,
    shroomlight,
    weeping_vines,
    weeping_vines_plant,
    crimson_roots,
    crimson_planks,
    warped_planks,
    crimson_slab,
    warped_slab,
    crimson_pressure_plate,
    warped_pressure_plate,
    crimson_fence,
    warped_fence,
    crimson_trapdoor,
    warped_trapdoor,
    crimson_fence_gate,
    warped_fence_gate,
    crimson_stairs,
    warped_stairs,
    crimson_button,
    warped_button,
    crimson_door,
    warped_door,
    crimson_sign,
    warped_sign,
    crimson_wall_sign,
    warped_wall_sign,
    structure_block,
    jigsaw,
    composter,
    target,
    bee_nest,
    beehive,
    honey_block,
    honeycomb_block,
    netherite_block,
    ancient_debris,
    crying_obsidian,
    potted_crimson_fungus,
    potted_warped_fungus,
    potted_crimson_roots,
    potted_warped_roots
  ];

  /// [Air](https://minecraft.gamepedia.com/air)
  ///
  /// _(minecraft:air)_
  static const Block air = Block('minecraft:air');

  /// [Stone](https://minecraft.gamepedia.com/stone)
  ///
  /// _(minecraft:stone)_
  static const Block stone = Block('minecraft:stone');

  /// [Granite](https://minecraft.gamepedia.com/granite)
  ///
  /// _(minecraft:granite)_
  static const Block granite = Block('minecraft:granite');

  /// [Polished Granite](https://minecraft.gamepedia.com/polished_granite)
  ///
  /// _(minecraft:polished_granite)_
  static const Block polished_granite = Block('minecraft:polished_granite');

  /// [Diorite](https://minecraft.gamepedia.com/diorite)
  ///
  /// _(minecraft:diorite)_
  static const Block diorite = Block('minecraft:diorite');

  /// [Polished Diorite](https://minecraft.gamepedia.com/polished_diorite)
  ///
  /// _(minecraft:polished_diorite)_
  static const Block polished_diorite = Block('minecraft:polished_diorite');

  /// [Andesite](https://minecraft.gamepedia.com/andesite)
  ///
  /// _(minecraft:andesite)_
  static const Block andesite = Block('minecraft:andesite');

  /// [Polished Andesite](https://minecraft.gamepedia.com/polished_andesite)
  ///
  /// _(minecraft:polished_andesite)_
  static const Block polished_andesite = Block('minecraft:polished_andesite');

  /// [Grass Block](https://minecraft.gamepedia.com/grass_block)
  ///
  /// _(minecraft:grass_block)_
  static const Block grass_block = Block('minecraft:grass_block');

  /// [Dirt](https://minecraft.gamepedia.com/dirt)
  ///
  /// _(minecraft:dirt)_
  static const Block dirt = Block('minecraft:dirt');

  /// [Coarse Dirt](https://minecraft.gamepedia.com/coarse_dirt)
  ///
  /// _(minecraft:coarse_dirt)_
  static const Block coarse_dirt = Block('minecraft:coarse_dirt');

  /// [Podzol](https://minecraft.gamepedia.com/podzol)
  ///
  /// _(minecraft:podzol)_
  static const Block podzol = Block('minecraft:podzol');

  /// [Cobblestone](https://minecraft.gamepedia.com/cobblestone)
  ///
  /// _(minecraft:cobblestone)_
  static const Block cobblestone = Block('minecraft:cobblestone');

  /// [Oak Planks](https://minecraft.gamepedia.com/oak_planks)
  ///
  /// _(minecraft:oak_planks)_
  static const Block oak_planks = Block('minecraft:oak_planks');

  /// [Spruce Planks](https://minecraft.gamepedia.com/spruce_planks)
  ///
  /// _(minecraft:spruce_planks)_
  static const Block spruce_planks = Block('minecraft:spruce_planks');

  /// [Birch Planks](https://minecraft.gamepedia.com/birch_planks)
  ///
  /// _(minecraft:birch_planks)_
  static const Block birch_planks = Block('minecraft:birch_planks');

  /// [Jungle Planks](https://minecraft.gamepedia.com/jungle_planks)
  ///
  /// _(minecraft:jungle_planks)_
  static const Block jungle_planks = Block('minecraft:jungle_planks');

  /// [Acacia Planks](https://minecraft.gamepedia.com/acacia_planks)
  ///
  /// _(minecraft:acacia_planks)_
  static const Block acacia_planks = Block('minecraft:acacia_planks');

  /// [Dark Oak Planks](https://minecraft.gamepedia.com/dark_oak_planks)
  ///
  /// _(minecraft:dark_oak_planks)_
  static const Block dark_oak_planks = Block('minecraft:dark_oak_planks');

  /// [Oak Sapling](https://minecraft.gamepedia.com/oak_sapling)
  ///
  /// _(minecraft:oak_sapling)_
  static const Block oak_sapling = Block('minecraft:oak_sapling');

  /// [Spruce Sapling](https://minecraft.gamepedia.com/spruce_sapling)
  ///
  /// _(minecraft:spruce_sapling)_
  static const Block spruce_sapling = Block('minecraft:spruce_sapling');

  /// [Birch Sapling](https://minecraft.gamepedia.com/birch_sapling)
  ///
  /// _(minecraft:birch_sapling)_
  static const Block birch_sapling = Block('minecraft:birch_sapling');

  /// [Jungle Sapling](https://minecraft.gamepedia.com/jungle_sapling)
  ///
  /// _(minecraft:jungle_sapling)_
  static const Block jungle_sapling = Block('minecraft:jungle_sapling');

  /// [Acacia Sapling](https://minecraft.gamepedia.com/acacia_sapling)
  ///
  /// _(minecraft:acacia_sapling)_
  static const Block acacia_sapling = Block('minecraft:acacia_sapling');

  /// [Dark Oak Sapling](https://minecraft.gamepedia.com/dark_oak_sapling)
  ///
  /// _(minecraft:dark_oak_sapling)_
  static const Block dark_oak_sapling = Block('minecraft:dark_oak_sapling');

  /// [Bedrock](https://minecraft.gamepedia.com/bedrock)
  ///
  /// _(minecraft:bedrock)_
  static const Block bedrock = Block('minecraft:bedrock');

  /// [Water](https://minecraft.gamepedia.com/water)
  ///
  /// _(minecraft:water)_
  static const Block water = Block('minecraft:water');

  /// [Lava](https://minecraft.gamepedia.com/lava)
  ///
  /// _(minecraft:lava)_
  static const Block lava = Block('minecraft:lava');

  /// [Sand](https://minecraft.gamepedia.com/sand)
  ///
  /// _(minecraft:sand)_
  static const Block sand = Block('minecraft:sand');

  /// [Red Sand](https://minecraft.gamepedia.com/red_sand)
  ///
  /// _(minecraft:red_sand)_
  static const Block red_sand = Block('minecraft:red_sand');

  /// [Gravel](https://minecraft.gamepedia.com/gravel)
  ///
  /// _(minecraft:gravel)_
  static const Block gravel = Block('minecraft:gravel');

  /// [Gold Ore](https://minecraft.gamepedia.com/gold_ore)
  ///
  /// _(minecraft:gold_ore)_
  static const Block gold_ore = Block('minecraft:gold_ore');

  /// [Iron Ore](https://minecraft.gamepedia.com/iron_ore)
  ///
  /// _(minecraft:iron_ore)_
  static const Block iron_ore = Block('minecraft:iron_ore');

  /// [Coal Ore](https://minecraft.gamepedia.com/coal_ore)
  ///
  /// _(minecraft:coal_ore)_
  static const Block coal_ore = Block('minecraft:coal_ore');

  /// [Oak Log](https://minecraft.gamepedia.com/oak_log)
  ///
  /// _(minecraft:oak_log)_
  static const Block oak_log = Block('minecraft:oak_log');

  /// [Spruce Log](https://minecraft.gamepedia.com/spruce_log)
  ///
  /// _(minecraft:spruce_log)_
  static const Block spruce_log = Block('minecraft:spruce_log');

  /// [Birch Log](https://minecraft.gamepedia.com/birch_log)
  ///
  /// _(minecraft:birch_log)_
  static const Block birch_log = Block('minecraft:birch_log');

  /// [Jungle Log](https://minecraft.gamepedia.com/jungle_log)
  ///
  /// _(minecraft:jungle_log)_
  static const Block jungle_log = Block('minecraft:jungle_log');

  /// [Acacia Log](https://minecraft.gamepedia.com/acacia_log)
  ///
  /// _(minecraft:acacia_log)_
  static const Block acacia_log = Block('minecraft:acacia_log');

  /// [Dark Oak Log](https://minecraft.gamepedia.com/dark_oak_log)
  ///
  /// _(minecraft:dark_oak_log)_
  static const Block dark_oak_log = Block('minecraft:dark_oak_log');

  /// [Stripped Spruce Log](https://minecraft.gamepedia.com/stripped_spruce_log)
  ///
  /// _(minecraft:stripped_spruce_log)_
  static const Block stripped_spruce_log =
      Block('minecraft:stripped_spruce_log');

  /// [Stripped Birch Log](https://minecraft.gamepedia.com/stripped_birch_log)
  ///
  /// _(minecraft:stripped_birch_log)_
  static const Block stripped_birch_log = Block('minecraft:stripped_birch_log');

  /// [Stripped Jungle Log](https://minecraft.gamepedia.com/stripped_jungle_log)
  ///
  /// _(minecraft:stripped_jungle_log)_
  static const Block stripped_jungle_log =
      Block('minecraft:stripped_jungle_log');

  /// [Stripped Acacia Log](https://minecraft.gamepedia.com/stripped_acacia_log)
  ///
  /// _(minecraft:stripped_acacia_log)_
  static const Block stripped_acacia_log =
      Block('minecraft:stripped_acacia_log');

  /// [Stripped Dark Oak Log](https://minecraft.gamepedia.com/stripped_dark_oak_log)
  ///
  /// _(minecraft:stripped_dark_oak_log)_
  static const Block stripped_dark_oak_log =
      Block('minecraft:stripped_dark_oak_log');

  /// [Stripped Oak Log](https://minecraft.gamepedia.com/stripped_oak_log)
  ///
  /// _(minecraft:stripped_oak_log)_
  static const Block stripped_oak_log = Block('minecraft:stripped_oak_log');

  /// [Oak Wood](https://minecraft.gamepedia.com/oak_wood)
  ///
  /// _(minecraft:oak_wood)_
  static const Block oak_wood = Block('minecraft:oak_wood');

  /// [Spruce Wood](https://minecraft.gamepedia.com/spruce_wood)
  ///
  /// _(minecraft:spruce_wood)_
  static const Block spruce_wood = Block('minecraft:spruce_wood');

  /// [Birch Wood](https://minecraft.gamepedia.com/birch_wood)
  ///
  /// _(minecraft:birch_wood)_
  static const Block birch_wood = Block('minecraft:birch_wood');

  /// [Jungle Wood](https://minecraft.gamepedia.com/jungle_wood)
  ///
  /// _(minecraft:jungle_wood)_
  static const Block jungle_wood = Block('minecraft:jungle_wood');

  /// [Acacia Wood](https://minecraft.gamepedia.com/acacia_wood)
  ///
  /// _(minecraft:acacia_wood)_
  static const Block acacia_wood = Block('minecraft:acacia_wood');

  /// [Dark Oak Wood](https://minecraft.gamepedia.com/dark_oak_wood)
  ///
  /// _(minecraft:dark_oak_wood)_
  static const Block dark_oak_wood = Block('minecraft:dark_oak_wood');

  /// [Stripped Oak Wood](https://minecraft.gamepedia.com/stripped_oak_wood)
  ///
  /// _(minecraft:stripped_oak_wood)_
  static const Block stripped_oak_wood = Block('minecraft:stripped_oak_wood');

  /// [Stripped Spruce Wood](https://minecraft.gamepedia.com/stripped_spruce_wood)
  ///
  /// _(minecraft:stripped_spruce_wood)_
  static const Block stripped_spruce_wood =
      Block('minecraft:stripped_spruce_wood');

  /// [Stripped Birch Wood](https://minecraft.gamepedia.com/stripped_birch_wood)
  ///
  /// _(minecraft:stripped_birch_wood)_
  static const Block stripped_birch_wood =
      Block('minecraft:stripped_birch_wood');

  /// [Stripped Jungle Wood](https://minecraft.gamepedia.com/stripped_jungle_wood)
  ///
  /// _(minecraft:stripped_jungle_wood)_
  static const Block stripped_jungle_wood =
      Block('minecraft:stripped_jungle_wood');

  /// [Stripped Acacia Wood](https://minecraft.gamepedia.com/stripped_acacia_wood)
  ///
  /// _(minecraft:stripped_acacia_wood)_
  static const Block stripped_acacia_wood =
      Block('minecraft:stripped_acacia_wood');

  /// [Stripped Dark Oak Wood](https://minecraft.gamepedia.com/stripped_dark_oak_wood)
  ///
  /// _(minecraft:stripped_dark_oak_wood)_
  static const Block stripped_dark_oak_wood =
      Block('minecraft:stripped_dark_oak_wood');

  /// [Oak Leaves](https://minecraft.gamepedia.com/oak_leaves)
  ///
  /// _(minecraft:oak_leaves)_
  static const Block oak_leaves = Block('minecraft:oak_leaves');

  /// [Spruce Leaves](https://minecraft.gamepedia.com/spruce_leaves)
  ///
  /// _(minecraft:spruce_leaves)_
  static const Block spruce_leaves = Block('minecraft:spruce_leaves');

  /// [Birch Leaves](https://minecraft.gamepedia.com/birch_leaves)
  ///
  /// _(minecraft:birch_leaves)_
  static const Block birch_leaves = Block('minecraft:birch_leaves');

  /// [Jungle Leaves](https://minecraft.gamepedia.com/jungle_leaves)
  ///
  /// _(minecraft:jungle_leaves)_
  static const Block jungle_leaves = Block('minecraft:jungle_leaves');

  /// [Acacia Leaves](https://minecraft.gamepedia.com/acacia_leaves)
  ///
  /// _(minecraft:acacia_leaves)_
  static const Block acacia_leaves = Block('minecraft:acacia_leaves');

  /// [Dark Oak Leaves](https://minecraft.gamepedia.com/dark_oak_leaves)
  ///
  /// _(minecraft:dark_oak_leaves)_
  static const Block dark_oak_leaves = Block('minecraft:dark_oak_leaves');

  /// [Sponge](https://minecraft.gamepedia.com/sponge)
  ///
  /// _(minecraft:sponge)_
  static const Block sponge = Block('minecraft:sponge');

  /// [Wet Sponge](https://minecraft.gamepedia.com/wet_sponge)
  ///
  /// _(minecraft:wet_sponge)_
  static const Block wet_sponge = Block('minecraft:wet_sponge');

  /// [Glass](https://minecraft.gamepedia.com/glass)
  ///
  /// _(minecraft:glass)_
  static const Block glass = Block('minecraft:glass');

  /// [Lapis Ore](https://minecraft.gamepedia.com/lapis_ore)
  ///
  /// _(minecraft:lapis_ore)_
  static const Block lapis_ore = Block('minecraft:lapis_ore');

  /// [Lapis Block](https://minecraft.gamepedia.com/lapis_block)
  ///
  /// _(minecraft:lapis_block)_
  static const Block lapis_block = Block('minecraft:lapis_block');

  /// [Dispenser](https://minecraft.gamepedia.com/dispenser)
  ///
  /// _(minecraft:dispenser)_
  static const Block dispenser = Block('minecraft:dispenser');

  /// [Sandstone](https://minecraft.gamepedia.com/sandstone)
  ///
  /// _(minecraft:sandstone)_
  static const Block sandstone = Block('minecraft:sandstone');

  /// [Chiseled Sandstone](https://minecraft.gamepedia.com/chiseled_sandstone)
  ///
  /// _(minecraft:chiseled_sandstone)_
  static const Block chiseled_sandstone = Block('minecraft:chiseled_sandstone');

  /// [Cut Sandstone](https://minecraft.gamepedia.com/cut_sandstone)
  ///
  /// _(minecraft:cut_sandstone)_
  static const Block cut_sandstone = Block('minecraft:cut_sandstone');

  /// [Note Block](https://minecraft.gamepedia.com/note_block)
  ///
  /// _(minecraft:note_block)_
  static const Block note_block = Block('minecraft:note_block');

  /// [White Bed](https://minecraft.gamepedia.com/white_bed)
  ///
  /// _(minecraft:white_bed)_
  static const Block white_bed = Block('minecraft:white_bed');

  /// [Orange Bed](https://minecraft.gamepedia.com/orange_bed)
  ///
  /// _(minecraft:orange_bed)_
  static const Block orange_bed = Block('minecraft:orange_bed');

  /// [Magenta Bed](https://minecraft.gamepedia.com/magenta_bed)
  ///
  /// _(minecraft:magenta_bed)_
  static const Block magenta_bed = Block('minecraft:magenta_bed');

  /// [Light Blue Bed](https://minecraft.gamepedia.com/light_blue_bed)
  ///
  /// _(minecraft:light_blue_bed)_
  static const Block light_blue_bed = Block('minecraft:light_blue_bed');

  /// [Yellow Bed](https://minecraft.gamepedia.com/yellow_bed)
  ///
  /// _(minecraft:yellow_bed)_
  static const Block yellow_bed = Block('minecraft:yellow_bed');

  /// [Lime Bed](https://minecraft.gamepedia.com/lime_bed)
  ///
  /// _(minecraft:lime_bed)_
  static const Block lime_bed = Block('minecraft:lime_bed');

  /// [Pink Bed](https://minecraft.gamepedia.com/pink_bed)
  ///
  /// _(minecraft:pink_bed)_
  static const Block pink_bed = Block('minecraft:pink_bed');

  /// [Gray Bed](https://minecraft.gamepedia.com/gray_bed)
  ///
  /// _(minecraft:gray_bed)_
  static const Block gray_bed = Block('minecraft:gray_bed');

  /// [Light Gray Bed](https://minecraft.gamepedia.com/light_gray_bed)
  ///
  /// _(minecraft:light_gray_bed)_
  static const Block light_gray_bed = Block('minecraft:light_gray_bed');

  /// [Cyan Bed](https://minecraft.gamepedia.com/cyan_bed)
  ///
  /// _(minecraft:cyan_bed)_
  static const Block cyan_bed = Block('minecraft:cyan_bed');

  /// [Purple Bed](https://minecraft.gamepedia.com/purple_bed)
  ///
  /// _(minecraft:purple_bed)_
  static const Block purple_bed = Block('minecraft:purple_bed');

  /// [Blue Bed](https://minecraft.gamepedia.com/blue_bed)
  ///
  /// _(minecraft:blue_bed)_
  static const Block blue_bed = Block('minecraft:blue_bed');

  /// [Brown Bed](https://minecraft.gamepedia.com/brown_bed)
  ///
  /// _(minecraft:brown_bed)_
  static const Block brown_bed = Block('minecraft:brown_bed');

  /// [Green Bed](https://minecraft.gamepedia.com/green_bed)
  ///
  /// _(minecraft:green_bed)_
  static const Block green_bed = Block('minecraft:green_bed');

  /// [Red Bed](https://minecraft.gamepedia.com/red_bed)
  ///
  /// _(minecraft:red_bed)_
  static const Block red_bed = Block('minecraft:red_bed');

  /// [Black Bed](https://minecraft.gamepedia.com/black_bed)
  ///
  /// _(minecraft:black_bed)_
  static const Block black_bed = Block('minecraft:black_bed');

  /// [Powered Rail](https://minecraft.gamepedia.com/powered_rail)
  ///
  /// _(minecraft:powered_rail)_
  static const Block powered_rail = Block('minecraft:powered_rail');

  /// [Detector Rail](https://minecraft.gamepedia.com/detector_rail)
  ///
  /// _(minecraft:detector_rail)_
  static const Block detector_rail = Block('minecraft:detector_rail');

  /// [Sticky Piston](https://minecraft.gamepedia.com/sticky_piston)
  ///
  /// _(minecraft:sticky_piston)_
  static const Block sticky_piston = Block('minecraft:sticky_piston');

  /// [Cobweb](https://minecraft.gamepedia.com/cobweb)
  ///
  /// _(minecraft:cobweb)_
  static const Block cobweb = Block('minecraft:cobweb');

  /// [Grass](https://minecraft.gamepedia.com/grass)
  ///
  /// _(minecraft:grass)_
  static const Block grass = Block('minecraft:grass');

  /// [Fern](https://minecraft.gamepedia.com/fern)
  ///
  /// _(minecraft:fern)_
  static const Block fern = Block('minecraft:fern');

  /// [Dead Bush](https://minecraft.gamepedia.com/dead_bush)
  ///
  /// _(minecraft:dead_bush)_
  static const Block dead_bush = Block('minecraft:dead_bush');

  /// [Seagrass](https://minecraft.gamepedia.com/seagrass)
  ///
  /// _(minecraft:seagrass)_
  static const Block seagrass = Block('minecraft:seagrass');

  /// [Tall Seagrass](https://minecraft.gamepedia.com/tall_seagrass)
  ///
  /// _(minecraft:tall_seagrass)_
  static const Block tall_seagrass = Block('minecraft:tall_seagrass');

  /// [Piston](https://minecraft.gamepedia.com/piston)
  ///
  /// _(minecraft:piston)_
  static const Block piston = Block('minecraft:piston');

  /// [Piston Head](https://minecraft.gamepedia.com/piston_head)
  ///
  /// _(minecraft:piston_head)_
  static const Block piston_head = Block('minecraft:piston_head');

  /// [White Wool](https://minecraft.gamepedia.com/white_wool)
  ///
  /// _(minecraft:white_wool)_
  static const Block white_wool = Block('minecraft:white_wool');

  /// [Orange Wool](https://minecraft.gamepedia.com/orange_wool)
  ///
  /// _(minecraft:orange_wool)_
  static const Block orange_wool = Block('minecraft:orange_wool');

  /// [Magenta Wool](https://minecraft.gamepedia.com/magenta_wool)
  ///
  /// _(minecraft:magenta_wool)_
  static const Block magenta_wool = Block('minecraft:magenta_wool');

  /// [Light Blue Wool](https://minecraft.gamepedia.com/light_blue_wool)
  ///
  /// _(minecraft:light_blue_wool)_
  static const Block light_blue_wool = Block('minecraft:light_blue_wool');

  /// [Yellow Wool](https://minecraft.gamepedia.com/yellow_wool)
  ///
  /// _(minecraft:yellow_wool)_
  static const Block yellow_wool = Block('minecraft:yellow_wool');

  /// [Lime Wool](https://minecraft.gamepedia.com/lime_wool)
  ///
  /// _(minecraft:lime_wool)_
  static const Block lime_wool = Block('minecraft:lime_wool');

  /// [Pink Wool](https://minecraft.gamepedia.com/pink_wool)
  ///
  /// _(minecraft:pink_wool)_
  static const Block pink_wool = Block('minecraft:pink_wool');

  /// [Gray Wool](https://minecraft.gamepedia.com/gray_wool)
  ///
  /// _(minecraft:gray_wool)_
  static const Block gray_wool = Block('minecraft:gray_wool');

  /// [Light Gray Wool](https://minecraft.gamepedia.com/light_gray_wool)
  ///
  /// _(minecraft:light_gray_wool)_
  static const Block light_gray_wool = Block('minecraft:light_gray_wool');

  /// [Cyan Wool](https://minecraft.gamepedia.com/cyan_wool)
  ///
  /// _(minecraft:cyan_wool)_
  static const Block cyan_wool = Block('minecraft:cyan_wool');

  /// [Purple Wool](https://minecraft.gamepedia.com/purple_wool)
  ///
  /// _(minecraft:purple_wool)_
  static const Block purple_wool = Block('minecraft:purple_wool');

  /// [Blue Wool](https://minecraft.gamepedia.com/blue_wool)
  ///
  /// _(minecraft:blue_wool)_
  static const Block blue_wool = Block('minecraft:blue_wool');

  /// [Brown Wool](https://minecraft.gamepedia.com/brown_wool)
  ///
  /// _(minecraft:brown_wool)_
  static const Block brown_wool = Block('minecraft:brown_wool');

  /// [Green Wool](https://minecraft.gamepedia.com/green_wool)
  ///
  /// _(minecraft:green_wool)_
  static const Block green_wool = Block('minecraft:green_wool');

  /// [Red Wool](https://minecraft.gamepedia.com/red_wool)
  ///
  /// _(minecraft:red_wool)_
  static const Block red_wool = Block('minecraft:red_wool');

  /// [Black Wool](https://minecraft.gamepedia.com/black_wool)
  ///
  /// _(minecraft:black_wool)_
  static const Block black_wool = Block('minecraft:black_wool');

  /// [Moving Piston](https://minecraft.gamepedia.com/moving_piston)
  ///
  /// _(minecraft:moving_piston)_
  static const Block moving_piston = Block('minecraft:moving_piston');

  /// [Dandelion](https://minecraft.gamepedia.com/dandelion)
  ///
  /// _(minecraft:dandelion)_
  static const Block dandelion = Block('minecraft:dandelion');

  /// [Poppy](https://minecraft.gamepedia.com/poppy)
  ///
  /// _(minecraft:poppy)_
  static const Block poppy = Block('minecraft:poppy');

  /// [Blue Orchid](https://minecraft.gamepedia.com/blue_orchid)
  ///
  /// _(minecraft:blue_orchid)_
  static const Block blue_orchid = Block('minecraft:blue_orchid');

  /// [Allium](https://minecraft.gamepedia.com/allium)
  ///
  /// _(minecraft:allium)_
  static const Block allium = Block('minecraft:allium');

  /// [Azure Bluet](https://minecraft.gamepedia.com/azure_bluet)
  ///
  /// _(minecraft:azure_bluet)_
  static const Block azure_bluet = Block('minecraft:azure_bluet');

  /// [Red Tulip](https://minecraft.gamepedia.com/red_tulip)
  ///
  /// _(minecraft:red_tulip)_
  static const Block red_tulip = Block('minecraft:red_tulip');

  /// [Orange Tulip](https://minecraft.gamepedia.com/orange_tulip)
  ///
  /// _(minecraft:orange_tulip)_
  static const Block orange_tulip = Block('minecraft:orange_tulip');

  /// [White Tulip](https://minecraft.gamepedia.com/white_tulip)
  ///
  /// _(minecraft:white_tulip)_
  static const Block white_tulip = Block('minecraft:white_tulip');

  /// [Pink Tulip](https://minecraft.gamepedia.com/pink_tulip)
  ///
  /// _(minecraft:pink_tulip)_
  static const Block pink_tulip = Block('minecraft:pink_tulip');

  /// [Oxeye Daisy](https://minecraft.gamepedia.com/oxeye_daisy)
  ///
  /// _(minecraft:oxeye_daisy)_
  static const Block oxeye_daisy = Block('minecraft:oxeye_daisy');

  /// [Cornflower](https://minecraft.gamepedia.com/cornflower)
  ///
  /// _(minecraft:cornflower)_
  static const Block cornflower = Block('minecraft:cornflower');

  /// [Wither Rose](https://minecraft.gamepedia.com/wither_rose)
  ///
  /// _(minecraft:wither_rose)_
  static const Block wither_rose = Block('minecraft:wither_rose');

  /// [Lily Of The Valley](https://minecraft.gamepedia.com/lily_of_the_valley)
  ///
  /// _(minecraft:lily_of_the_valley)_
  static const Block lily_of_the_valley = Block('minecraft:lily_of_the_valley');

  /// [Brown Mushroom](https://minecraft.gamepedia.com/brown_mushroom)
  ///
  /// _(minecraft:brown_mushroom)_
  static const Block brown_mushroom = Block('minecraft:brown_mushroom');

  /// [Red Mushroom](https://minecraft.gamepedia.com/red_mushroom)
  ///
  /// _(minecraft:red_mushroom)_
  static const Block red_mushroom = Block('minecraft:red_mushroom');

  /// [Gold Block](https://minecraft.gamepedia.com/gold_block)
  ///
  /// _(minecraft:gold_block)_
  static const Block gold_block = Block('minecraft:gold_block');

  /// [Iron Block](https://minecraft.gamepedia.com/iron_block)
  ///
  /// _(minecraft:iron_block)_
  static const Block iron_block = Block('minecraft:iron_block');

  /// [Bricks](https://minecraft.gamepedia.com/bricks)
  ///
  /// _(minecraft:bricks)_
  static const Block bricks = Block('minecraft:bricks');

  /// [Tnt](https://minecraft.gamepedia.com/tnt)
  ///
  /// _(minecraft:tnt)_
  static const Block tnt = Block('minecraft:tnt');

  /// [Bookshelf](https://minecraft.gamepedia.com/bookshelf)
  ///
  /// _(minecraft:bookshelf)_
  static const Block bookshelf = Block('minecraft:bookshelf');

  /// [Mossy Cobblestone](https://minecraft.gamepedia.com/mossy_cobblestone)
  ///
  /// _(minecraft:mossy_cobblestone)_
  static const Block mossy_cobblestone = Block('minecraft:mossy_cobblestone');

  /// [Obsidian](https://minecraft.gamepedia.com/obsidian)
  ///
  /// _(minecraft:obsidian)_
  static const Block obsidian = Block('minecraft:obsidian');

  /// [Torch](https://minecraft.gamepedia.com/torch)
  ///
  /// _(minecraft:torch)_
  static const Block torch = Block('minecraft:torch');

  /// [Wall Torch](https://minecraft.gamepedia.com/wall_torch)
  ///
  /// _(minecraft:wall_torch)_
  static const Block wall_torch = Block('minecraft:wall_torch');

  /// [Fire](https://minecraft.gamepedia.com/fire)
  ///
  /// _(minecraft:fire)_
  static const Block fire = Block('minecraft:fire');

  /// [Soul Fire](https://minecraft.gamepedia.com/soul_fire)
  ///
  /// _(minecraft:soul_fire)_
  static const Block soul_fire = Block('minecraft:soul_fire');

  /// [Spawner](https://minecraft.gamepedia.com/spawner)
  ///
  /// _(minecraft:spawner)_
  static const Block spawner = Block('minecraft:spawner');

  /// [Oak Stairs](https://minecraft.gamepedia.com/oak_stairs)
  ///
  /// _(minecraft:oak_stairs)_
  static const Block oak_stairs = Block('minecraft:oak_stairs');

  /// [Chest](https://minecraft.gamepedia.com/chest)
  ///
  /// _(minecraft:chest)_
  static const Block chest = Block('minecraft:chest');

  /// [Redstone Wire](https://minecraft.gamepedia.com/redstone_wire)
  ///
  /// _(minecraft:redstone_wire)_
  static const Block redstone_wire = Block('minecraft:redstone_wire');

  /// [Diamond Ore](https://minecraft.gamepedia.com/diamond_ore)
  ///
  /// _(minecraft:diamond_ore)_
  static const Block diamond_ore = Block('minecraft:diamond_ore');

  /// [Diamond Block](https://minecraft.gamepedia.com/diamond_block)
  ///
  /// _(minecraft:diamond_block)_
  static const Block diamond_block = Block('minecraft:diamond_block');

  /// [Crafting Table](https://minecraft.gamepedia.com/crafting_table)
  ///
  /// _(minecraft:crafting_table)_
  static const Block crafting_table = Block('minecraft:crafting_table');

  /// [Wheat](https://minecraft.gamepedia.com/wheat)
  ///
  /// _(minecraft:wheat)_
  static const Block wheat = Block('minecraft:wheat');

  /// [Farmland](https://minecraft.gamepedia.com/farmland)
  ///
  /// _(minecraft:farmland)_
  static const Block farmland = Block('minecraft:farmland');

  /// [Furnace](https://minecraft.gamepedia.com/furnace)
  ///
  /// _(minecraft:furnace)_
  static const Block furnace = Block('minecraft:furnace');

  /// [Oak Sign](https://minecraft.gamepedia.com/oak_sign)
  ///
  /// _(minecraft:oak_sign)_
  static const Block oak_sign = Block('minecraft:oak_sign');

  /// [Spruce Sign](https://minecraft.gamepedia.com/spruce_sign)
  ///
  /// _(minecraft:spruce_sign)_
  static const Block spruce_sign = Block('minecraft:spruce_sign');

  /// [Birch Sign](https://minecraft.gamepedia.com/birch_sign)
  ///
  /// _(minecraft:birch_sign)_
  static const Block birch_sign = Block('minecraft:birch_sign');

  /// [Acacia Sign](https://minecraft.gamepedia.com/acacia_sign)
  ///
  /// _(minecraft:acacia_sign)_
  static const Block acacia_sign = Block('minecraft:acacia_sign');

  /// [Jungle Sign](https://minecraft.gamepedia.com/jungle_sign)
  ///
  /// _(minecraft:jungle_sign)_
  static const Block jungle_sign = Block('minecraft:jungle_sign');

  /// [Dark Oak Sign](https://minecraft.gamepedia.com/dark_oak_sign)
  ///
  /// _(minecraft:dark_oak_sign)_
  static const Block dark_oak_sign = Block('minecraft:dark_oak_sign');

  /// [Oak Door](https://minecraft.gamepedia.com/oak_door)
  ///
  /// _(minecraft:oak_door)_
  static const Block oak_door = Block('minecraft:oak_door');

  /// [Ladder](https://minecraft.gamepedia.com/ladder)
  ///
  /// _(minecraft:ladder)_
  static const Block ladder = Block('minecraft:ladder');

  /// [Rail](https://minecraft.gamepedia.com/rail)
  ///
  /// _(minecraft:rail)_
  static const Block rail = Block('minecraft:rail');

  /// [Cobblestone Stairs](https://minecraft.gamepedia.com/cobblestone_stairs)
  ///
  /// _(minecraft:cobblestone_stairs)_
  static const Block cobblestone_stairs = Block('minecraft:cobblestone_stairs');

  /// [Oak Wall Sign](https://minecraft.gamepedia.com/oak_wall_sign)
  ///
  /// _(minecraft:oak_wall_sign)_
  static const Block oak_wall_sign = Block('minecraft:oak_wall_sign');

  /// [Spruce Wall Sign](https://minecraft.gamepedia.com/spruce_wall_sign)
  ///
  /// _(minecraft:spruce_wall_sign)_
  static const Block spruce_wall_sign = Block('minecraft:spruce_wall_sign');

  /// [Birch Wall Sign](https://minecraft.gamepedia.com/birch_wall_sign)
  ///
  /// _(minecraft:birch_wall_sign)_
  static const Block birch_wall_sign = Block('minecraft:birch_wall_sign');

  /// [Acacia Wall Sign](https://minecraft.gamepedia.com/acacia_wall_sign)
  ///
  /// _(minecraft:acacia_wall_sign)_
  static const Block acacia_wall_sign = Block('minecraft:acacia_wall_sign');

  /// [Jungle Wall Sign](https://minecraft.gamepedia.com/jungle_wall_sign)
  ///
  /// _(minecraft:jungle_wall_sign)_
  static const Block jungle_wall_sign = Block('minecraft:jungle_wall_sign');

  /// [Dark Oak Wall Sign](https://minecraft.gamepedia.com/dark_oak_wall_sign)
  ///
  /// _(minecraft:dark_oak_wall_sign)_
  static const Block dark_oak_wall_sign = Block('minecraft:dark_oak_wall_sign');

  /// [Lever](https://minecraft.gamepedia.com/lever)
  ///
  /// _(minecraft:lever)_
  static const Block lever = Block('minecraft:lever');

  /// [Stone Pressure Plate](https://minecraft.gamepedia.com/stone_pressure_plate)
  ///
  /// _(minecraft:stone_pressure_plate)_
  static const Block stone_pressure_plate =
      Block('minecraft:stone_pressure_plate');

  /// [Iron Door](https://minecraft.gamepedia.com/iron_door)
  ///
  /// _(minecraft:iron_door)_
  static const Block iron_door = Block('minecraft:iron_door');

  /// [Oak Pressure Plate](https://minecraft.gamepedia.com/oak_pressure_plate)
  ///
  /// _(minecraft:oak_pressure_plate)_
  static const Block oak_pressure_plate = Block('minecraft:oak_pressure_plate');

  /// [Spruce Pressure Plate](https://minecraft.gamepedia.com/spruce_pressure_plate)
  ///
  /// _(minecraft:spruce_pressure_plate)_
  static const Block spruce_pressure_plate =
      Block('minecraft:spruce_pressure_plate');

  /// [Birch Pressure Plate](https://minecraft.gamepedia.com/birch_pressure_plate)
  ///
  /// _(minecraft:birch_pressure_plate)_
  static const Block birch_pressure_plate =
      Block('minecraft:birch_pressure_plate');

  /// [Jungle Pressure Plate](https://minecraft.gamepedia.com/jungle_pressure_plate)
  ///
  /// _(minecraft:jungle_pressure_plate)_
  static const Block jungle_pressure_plate =
      Block('minecraft:jungle_pressure_plate');

  /// [Acacia Pressure Plate](https://minecraft.gamepedia.com/acacia_pressure_plate)
  ///
  /// _(minecraft:acacia_pressure_plate)_
  static const Block acacia_pressure_plate =
      Block('minecraft:acacia_pressure_plate');

  /// [Dark Oak Pressure Plate](https://minecraft.gamepedia.com/dark_oak_pressure_plate)
  ///
  /// _(minecraft:dark_oak_pressure_plate)_
  static const Block dark_oak_pressure_plate =
      Block('minecraft:dark_oak_pressure_plate');

  /// [Redstone Ore](https://minecraft.gamepedia.com/redstone_ore)
  ///
  /// _(minecraft:redstone_ore)_
  static const Block redstone_ore = Block('minecraft:redstone_ore');

  /// [Redstone Torch](https://minecraft.gamepedia.com/redstone_torch)
  ///
  /// _(minecraft:redstone_torch)_
  static const Block redstone_torch = Block('minecraft:redstone_torch');

  /// [Redstone Wall Torch](https://minecraft.gamepedia.com/redstone_wall_torch)
  ///
  /// _(minecraft:redstone_wall_torch)_
  static const Block redstone_wall_torch =
      Block('minecraft:redstone_wall_torch');

  /// [Stone Button](https://minecraft.gamepedia.com/stone_button)
  ///
  /// _(minecraft:stone_button)_
  static const Block stone_button = Block('minecraft:stone_button');

  /// [Snow](https://minecraft.gamepedia.com/snow)
  ///
  /// _(minecraft:snow)_
  static const Block snow = Block('minecraft:snow');

  /// [Ice](https://minecraft.gamepedia.com/ice)
  ///
  /// _(minecraft:ice)_
  static const Block ice = Block('minecraft:ice');

  /// [Snow Block](https://minecraft.gamepedia.com/snow_block)
  ///
  /// _(minecraft:snow_block)_
  static const Block snow_block = Block('minecraft:snow_block');

  /// [Cactus](https://minecraft.gamepedia.com/cactus)
  ///
  /// _(minecraft:cactus)_
  static const Block cactus = Block('minecraft:cactus');

  /// [Clay](https://minecraft.gamepedia.com/clay)
  ///
  /// _(minecraft:clay)_
  static const Block clay = Block('minecraft:clay');

  /// [Sugar Cane](https://minecraft.gamepedia.com/sugar_cane)
  ///
  /// _(minecraft:sugar_cane)_
  static const Block sugar_cane = Block('minecraft:sugar_cane');

  /// [Jukebox](https://minecraft.gamepedia.com/jukebox)
  ///
  /// _(minecraft:jukebox)_
  static const Block jukebox = Block('minecraft:jukebox');

  /// [Oak Fence](https://minecraft.gamepedia.com/oak_fence)
  ///
  /// _(minecraft:oak_fence)_
  static const Block oak_fence = Block('minecraft:oak_fence');

  /// [Pumpkin](https://minecraft.gamepedia.com/pumpkin)
  ///
  /// _(minecraft:pumpkin)_
  static const Block pumpkin = Block('minecraft:pumpkin');

  /// [Netherrack](https://minecraft.gamepedia.com/netherrack)
  ///
  /// _(minecraft:netherrack)_
  static const Block netherrack = Block('minecraft:netherrack');

  /// [Soul Sand](https://minecraft.gamepedia.com/soul_sand)
  ///
  /// _(minecraft:soul_sand)_
  static const Block soul_sand = Block('minecraft:soul_sand');

  /// [Soul Soil](https://minecraft.gamepedia.com/soul_soil)
  ///
  /// _(minecraft:soul_soil)_
  static const Block soul_soil = Block('minecraft:soul_soil');

  /// [Basalt](https://minecraft.gamepedia.com/basalt)
  ///
  /// _(minecraft:basalt)_
  static const Block basalt = Block('minecraft:basalt');

  /// [Soul Fire Torch](https://minecraft.gamepedia.com/soul_fire_torch)
  ///
  /// _(minecraft:soul_fire_torch)_
  static const Block soul_fire_torch = Block('minecraft:soul_fire_torch');

  /// [Soul Fire Wall Torch](https://minecraft.gamepedia.com/soul_fire_wall_torch)
  ///
  /// _(minecraft:soul_fire_wall_torch)_
  static const Block soul_fire_wall_torch =
      Block('minecraft:soul_fire_wall_torch');

  /// [Glowstone](https://minecraft.gamepedia.com/glowstone)
  ///
  /// _(minecraft:glowstone)_
  static const Block glowstone = Block('minecraft:glowstone');

  /// [Nether Portal](https://minecraft.gamepedia.com/nether_portal)
  ///
  /// _(minecraft:nether_portal)_
  static const Block nether_portal = Block('minecraft:nether_portal');

  /// [Carved Pumpkin](https://minecraft.gamepedia.com/carved_pumpkin)
  ///
  /// _(minecraft:carved_pumpkin)_
  static const Block carved_pumpkin = Block('minecraft:carved_pumpkin');

  /// [Jack O Lantern](https://minecraft.gamepedia.com/jack_o_lantern)
  ///
  /// _(minecraft:jack_o_lantern)_
  static const Block jack_o_lantern = Block('minecraft:jack_o_lantern');

  /// [Cake](https://minecraft.gamepedia.com/cake)
  ///
  /// _(minecraft:cake)_
  static const Block cake = Block('minecraft:cake');

  /// [Repeater](https://minecraft.gamepedia.com/repeater)
  ///
  /// _(minecraft:repeater)_
  static const Block repeater = Block('minecraft:repeater');

  /// [White Stained Glass](https://minecraft.gamepedia.com/white_stained_glass)
  ///
  /// _(minecraft:white_stained_glass)_
  static const Block white_stained_glass =
      Block('minecraft:white_stained_glass');

  /// [Orange Stained Glass](https://minecraft.gamepedia.com/orange_stained_glass)
  ///
  /// _(minecraft:orange_stained_glass)_
  static const Block orange_stained_glass =
      Block('minecraft:orange_stained_glass');

  /// [Magenta Stained Glass](https://minecraft.gamepedia.com/magenta_stained_glass)
  ///
  /// _(minecraft:magenta_stained_glass)_
  static const Block magenta_stained_glass =
      Block('minecraft:magenta_stained_glass');

  /// [Light Blue Stained Glass](https://minecraft.gamepedia.com/light_blue_stained_glass)
  ///
  /// _(minecraft:light_blue_stained_glass)_
  static const Block light_blue_stained_glass =
      Block('minecraft:light_blue_stained_glass');

  /// [Yellow Stained Glass](https://minecraft.gamepedia.com/yellow_stained_glass)
  ///
  /// _(minecraft:yellow_stained_glass)_
  static const Block yellow_stained_glass =
      Block('minecraft:yellow_stained_glass');

  /// [Lime Stained Glass](https://minecraft.gamepedia.com/lime_stained_glass)
  ///
  /// _(minecraft:lime_stained_glass)_
  static const Block lime_stained_glass = Block('minecraft:lime_stained_glass');

  /// [Pink Stained Glass](https://minecraft.gamepedia.com/pink_stained_glass)
  ///
  /// _(minecraft:pink_stained_glass)_
  static const Block pink_stained_glass = Block('minecraft:pink_stained_glass');

  /// [Gray Stained Glass](https://minecraft.gamepedia.com/gray_stained_glass)
  ///
  /// _(minecraft:gray_stained_glass)_
  static const Block gray_stained_glass = Block('minecraft:gray_stained_glass');

  /// [Light Gray Stained Glass](https://minecraft.gamepedia.com/light_gray_stained_glass)
  ///
  /// _(minecraft:light_gray_stained_glass)_
  static const Block light_gray_stained_glass =
      Block('minecraft:light_gray_stained_glass');

  /// [Cyan Stained Glass](https://minecraft.gamepedia.com/cyan_stained_glass)
  ///
  /// _(minecraft:cyan_stained_glass)_
  static const Block cyan_stained_glass = Block('minecraft:cyan_stained_glass');

  /// [Purple Stained Glass](https://minecraft.gamepedia.com/purple_stained_glass)
  ///
  /// _(minecraft:purple_stained_glass)_
  static const Block purple_stained_glass =
      Block('minecraft:purple_stained_glass');

  /// [Blue Stained Glass](https://minecraft.gamepedia.com/blue_stained_glass)
  ///
  /// _(minecraft:blue_stained_glass)_
  static const Block blue_stained_glass = Block('minecraft:blue_stained_glass');

  /// [Brown Stained Glass](https://minecraft.gamepedia.com/brown_stained_glass)
  ///
  /// _(minecraft:brown_stained_glass)_
  static const Block brown_stained_glass =
      Block('minecraft:brown_stained_glass');

  /// [Green Stained Glass](https://minecraft.gamepedia.com/green_stained_glass)
  ///
  /// _(minecraft:green_stained_glass)_
  static const Block green_stained_glass =
      Block('minecraft:green_stained_glass');

  /// [Red Stained Glass](https://minecraft.gamepedia.com/red_stained_glass)
  ///
  /// _(minecraft:red_stained_glass)_
  static const Block red_stained_glass = Block('minecraft:red_stained_glass');

  /// [Black Stained Glass](https://minecraft.gamepedia.com/black_stained_glass)
  ///
  /// _(minecraft:black_stained_glass)_
  static const Block black_stained_glass =
      Block('minecraft:black_stained_glass');

  /// [Oak Trapdoor](https://minecraft.gamepedia.com/oak_trapdoor)
  ///
  /// _(minecraft:oak_trapdoor)_
  static const Block oak_trapdoor = Block('minecraft:oak_trapdoor');

  /// [Spruce Trapdoor](https://minecraft.gamepedia.com/spruce_trapdoor)
  ///
  /// _(minecraft:spruce_trapdoor)_
  static const Block spruce_trapdoor = Block('minecraft:spruce_trapdoor');

  /// [Birch Trapdoor](https://minecraft.gamepedia.com/birch_trapdoor)
  ///
  /// _(minecraft:birch_trapdoor)_
  static const Block birch_trapdoor = Block('minecraft:birch_trapdoor');

  /// [Jungle Trapdoor](https://minecraft.gamepedia.com/jungle_trapdoor)
  ///
  /// _(minecraft:jungle_trapdoor)_
  static const Block jungle_trapdoor = Block('minecraft:jungle_trapdoor');

  /// [Acacia Trapdoor](https://minecraft.gamepedia.com/acacia_trapdoor)
  ///
  /// _(minecraft:acacia_trapdoor)_
  static const Block acacia_trapdoor = Block('minecraft:acacia_trapdoor');

  /// [Dark Oak Trapdoor](https://minecraft.gamepedia.com/dark_oak_trapdoor)
  ///
  /// _(minecraft:dark_oak_trapdoor)_
  static const Block dark_oak_trapdoor = Block('minecraft:dark_oak_trapdoor');

  /// [Stone Bricks](https://minecraft.gamepedia.com/stone_bricks)
  ///
  /// _(minecraft:stone_bricks)_
  static const Block stone_bricks = Block('minecraft:stone_bricks');

  /// [Mossy Stone Bricks](https://minecraft.gamepedia.com/mossy_stone_bricks)
  ///
  /// _(minecraft:mossy_stone_bricks)_
  static const Block mossy_stone_bricks = Block('minecraft:mossy_stone_bricks');

  /// [Cracked Stone Bricks](https://minecraft.gamepedia.com/cracked_stone_bricks)
  ///
  /// _(minecraft:cracked_stone_bricks)_
  static const Block cracked_stone_bricks =
      Block('minecraft:cracked_stone_bricks');

  /// [Chiseled Stone Bricks](https://minecraft.gamepedia.com/chiseled_stone_bricks)
  ///
  /// _(minecraft:chiseled_stone_bricks)_
  static const Block chiseled_stone_bricks =
      Block('minecraft:chiseled_stone_bricks');

  /// [Infested Stone](https://minecraft.gamepedia.com/infested_stone)
  ///
  /// _(minecraft:infested_stone)_
  static const Block infested_stone = Block('minecraft:infested_stone');

  /// [Infested Cobblestone](https://minecraft.gamepedia.com/infested_cobblestone)
  ///
  /// _(minecraft:infested_cobblestone)_
  static const Block infested_cobblestone =
      Block('minecraft:infested_cobblestone');

  /// [Infested Stone Bricks](https://minecraft.gamepedia.com/infested_stone_bricks)
  ///
  /// _(minecraft:infested_stone_bricks)_
  static const Block infested_stone_bricks =
      Block('minecraft:infested_stone_bricks');

  /// [Infested Mossy Stone Bricks](https://minecraft.gamepedia.com/infested_mossy_stone_bricks)
  ///
  /// _(minecraft:infested_mossy_stone_bricks)_
  static const Block infested_mossy_stone_bricks =
      Block('minecraft:infested_mossy_stone_bricks');

  /// [Infested Cracked Stone Bricks](https://minecraft.gamepedia.com/infested_cracked_stone_bricks)
  ///
  /// _(minecraft:infested_cracked_stone_bricks)_
  static const Block infested_cracked_stone_bricks =
      Block('minecraft:infested_cracked_stone_bricks');

  /// [Infested Chiseled Stone Bricks](https://minecraft.gamepedia.com/infested_chiseled_stone_bricks)
  ///
  /// _(minecraft:infested_chiseled_stone_bricks)_
  static const Block infested_chiseled_stone_bricks =
      Block('minecraft:infested_chiseled_stone_bricks');

  /// [Brown Mushroom Block](https://minecraft.gamepedia.com/brown_mushroom_block)
  ///
  /// _(minecraft:brown_mushroom_block)_
  static const Block brown_mushroom_block =
      Block('minecraft:brown_mushroom_block');

  /// [Red Mushroom Block](https://minecraft.gamepedia.com/red_mushroom_block)
  ///
  /// _(minecraft:red_mushroom_block)_
  static const Block red_mushroom_block = Block('minecraft:red_mushroom_block');

  /// [Mushroom Stem](https://minecraft.gamepedia.com/mushroom_stem)
  ///
  /// _(minecraft:mushroom_stem)_
  static const Block mushroom_stem = Block('minecraft:mushroom_stem');

  /// [Iron Bars](https://minecraft.gamepedia.com/iron_bars)
  ///
  /// _(minecraft:iron_bars)_
  static const Block iron_bars = Block('minecraft:iron_bars');

  /// [Glass Pane](https://minecraft.gamepedia.com/glass_pane)
  ///
  /// _(minecraft:glass_pane)_
  static const Block glass_pane = Block('minecraft:glass_pane');

  /// [Melon](https://minecraft.gamepedia.com/melon)
  ///
  /// _(minecraft:melon)_
  static const Block melon = Block('minecraft:melon');

  /// [Attached Pumpkin Stem](https://minecraft.gamepedia.com/attached_pumpkin_stem)
  ///
  /// _(minecraft:attached_pumpkin_stem)_
  static const Block attached_pumpkin_stem =
      Block('minecraft:attached_pumpkin_stem');

  /// [Attached Melon Stem](https://minecraft.gamepedia.com/attached_melon_stem)
  ///
  /// _(minecraft:attached_melon_stem)_
  static const Block attached_melon_stem =
      Block('minecraft:attached_melon_stem');

  /// [Pumpkin Stem](https://minecraft.gamepedia.com/pumpkin_stem)
  ///
  /// _(minecraft:pumpkin_stem)_
  static const Block pumpkin_stem = Block('minecraft:pumpkin_stem');

  /// [Melon Stem](https://minecraft.gamepedia.com/melon_stem)
  ///
  /// _(minecraft:melon_stem)_
  static const Block melon_stem = Block('minecraft:melon_stem');

  /// [Vine](https://minecraft.gamepedia.com/vine)
  ///
  /// _(minecraft:vine)_
  static const Block vine = Block('minecraft:vine');

  /// [Oak Fence Gate](https://minecraft.gamepedia.com/oak_fence_gate)
  ///
  /// _(minecraft:oak_fence_gate)_
  static const Block oak_fence_gate = Block('minecraft:oak_fence_gate');

  /// [Brick Stairs](https://minecraft.gamepedia.com/brick_stairs)
  ///
  /// _(minecraft:brick_stairs)_
  static const Block brick_stairs = Block('minecraft:brick_stairs');

  /// [Stone Brick Stairs](https://minecraft.gamepedia.com/stone_brick_stairs)
  ///
  /// _(minecraft:stone_brick_stairs)_
  static const Block stone_brick_stairs = Block('minecraft:stone_brick_stairs');

  /// [Mycelium](https://minecraft.gamepedia.com/mycelium)
  ///
  /// _(minecraft:mycelium)_
  static const Block mycelium = Block('minecraft:mycelium');

  /// [Lily Pad](https://minecraft.gamepedia.com/lily_pad)
  ///
  /// _(minecraft:lily_pad)_
  static const Block lily_pad = Block('minecraft:lily_pad');

  /// [Nether Bricks](https://minecraft.gamepedia.com/nether_bricks)
  ///
  /// _(minecraft:nether_bricks)_
  static const Block nether_bricks = Block('minecraft:nether_bricks');

  /// [Nether Brick Fence](https://minecraft.gamepedia.com/nether_brick_fence)
  ///
  /// _(minecraft:nether_brick_fence)_
  static const Block nether_brick_fence = Block('minecraft:nether_brick_fence');

  /// [Nether Brick Stairs](https://minecraft.gamepedia.com/nether_brick_stairs)
  ///
  /// _(minecraft:nether_brick_stairs)_
  static const Block nether_brick_stairs =
      Block('minecraft:nether_brick_stairs');

  /// [Nether Wart](https://minecraft.gamepedia.com/nether_wart)
  ///
  /// _(minecraft:nether_wart)_
  static const Block nether_wart = Block('minecraft:nether_wart');

  /// [Enchanting Table](https://minecraft.gamepedia.com/enchanting_table)
  ///
  /// _(minecraft:enchanting_table)_
  static const Block enchanting_table = Block('minecraft:enchanting_table');

  /// [Brewing Stand](https://minecraft.gamepedia.com/brewing_stand)
  ///
  /// _(minecraft:brewing_stand)_
  static const Block brewing_stand = Block('minecraft:brewing_stand');

  /// [Cauldron](https://minecraft.gamepedia.com/cauldron)
  ///
  /// _(minecraft:cauldron)_
  static const Block cauldron = Block('minecraft:cauldron');

  /// [End Portal](https://minecraft.gamepedia.com/end_portal)
  ///
  /// _(minecraft:end_portal)_
  static const Block end_portal = Block('minecraft:end_portal');

  /// [End Portal Frame](https://minecraft.gamepedia.com/end_portal_frame)
  ///
  /// _(minecraft:end_portal_frame)_
  static const Block end_portal_frame = Block('minecraft:end_portal_frame');

  /// [End Stone](https://minecraft.gamepedia.com/end_stone)
  ///
  /// _(minecraft:end_stone)_
  static const Block end_stone = Block('minecraft:end_stone');

  /// [Dragon Egg](https://minecraft.gamepedia.com/dragon_egg)
  ///
  /// _(minecraft:dragon_egg)_
  static const Block dragon_egg = Block('minecraft:dragon_egg');

  /// [Redstone Lamp](https://minecraft.gamepedia.com/redstone_lamp)
  ///
  /// _(minecraft:redstone_lamp)_
  static const Block redstone_lamp = Block('minecraft:redstone_lamp');

  /// [Cocoa](https://minecraft.gamepedia.com/cocoa)
  ///
  /// _(minecraft:cocoa)_
  static const Block cocoa = Block('minecraft:cocoa');

  /// [Sandstone Stairs](https://minecraft.gamepedia.com/sandstone_stairs)
  ///
  /// _(minecraft:sandstone_stairs)_
  static const Block sandstone_stairs = Block('minecraft:sandstone_stairs');

  /// [Emerald Ore](https://minecraft.gamepedia.com/emerald_ore)
  ///
  /// _(minecraft:emerald_ore)_
  static const Block emerald_ore = Block('minecraft:emerald_ore');

  /// [Ender Chest](https://minecraft.gamepedia.com/ender_chest)
  ///
  /// _(minecraft:ender_chest)_
  static const Block ender_chest = Block('minecraft:ender_chest');

  /// [Tripwire Hook](https://minecraft.gamepedia.com/tripwire_hook)
  ///
  /// _(minecraft:tripwire_hook)_
  static const Block tripwire_hook = Block('minecraft:tripwire_hook');

  /// [Tripwire](https://minecraft.gamepedia.com/tripwire)
  ///
  /// _(minecraft:tripwire)_
  static const Block tripwire = Block('minecraft:tripwire');

  /// [Emerald Block](https://minecraft.gamepedia.com/emerald_block)
  ///
  /// _(minecraft:emerald_block)_
  static const Block emerald_block = Block('minecraft:emerald_block');

  /// [Spruce Stairs](https://minecraft.gamepedia.com/spruce_stairs)
  ///
  /// _(minecraft:spruce_stairs)_
  static const Block spruce_stairs = Block('minecraft:spruce_stairs');

  /// [Birch Stairs](https://minecraft.gamepedia.com/birch_stairs)
  ///
  /// _(minecraft:birch_stairs)_
  static const Block birch_stairs = Block('minecraft:birch_stairs');

  /// [Jungle Stairs](https://minecraft.gamepedia.com/jungle_stairs)
  ///
  /// _(minecraft:jungle_stairs)_
  static const Block jungle_stairs = Block('minecraft:jungle_stairs');

  /// [Command Block](https://minecraft.gamepedia.com/command_block)
  ///
  /// _(minecraft:command_block)_
  static const Block command_block = Block('minecraft:command_block');

  /// [Beacon](https://minecraft.gamepedia.com/beacon)
  ///
  /// _(minecraft:beacon)_
  static const Block beacon = Block('minecraft:beacon');

  /// [Cobblestone Wall](https://minecraft.gamepedia.com/cobblestone_wall)
  ///
  /// _(minecraft:cobblestone_wall)_
  static const Block cobblestone_wall = Block('minecraft:cobblestone_wall');

  /// [Mossy Cobblestone Wall](https://minecraft.gamepedia.com/mossy_cobblestone_wall)
  ///
  /// _(minecraft:mossy_cobblestone_wall)_
  static const Block mossy_cobblestone_wall =
      Block('minecraft:mossy_cobblestone_wall');

  /// [Flower Pot](https://minecraft.gamepedia.com/flower_pot)
  ///
  /// _(minecraft:flower_pot)_
  static const Block flower_pot = Block('minecraft:flower_pot');

  /// [Potted Oak Sapling](https://minecraft.gamepedia.com/potted_oak_sapling)
  ///
  /// _(minecraft:potted_oak_sapling)_
  static const Block potted_oak_sapling = Block('minecraft:potted_oak_sapling');

  /// [Potted Spruce Sapling](https://minecraft.gamepedia.com/potted_spruce_sapling)
  ///
  /// _(minecraft:potted_spruce_sapling)_
  static const Block potted_spruce_sapling =
      Block('minecraft:potted_spruce_sapling');

  /// [Potted Birch Sapling](https://minecraft.gamepedia.com/potted_birch_sapling)
  ///
  /// _(minecraft:potted_birch_sapling)_
  static const Block potted_birch_sapling =
      Block('minecraft:potted_birch_sapling');

  /// [Potted Jungle Sapling](https://minecraft.gamepedia.com/potted_jungle_sapling)
  ///
  /// _(minecraft:potted_jungle_sapling)_
  static const Block potted_jungle_sapling =
      Block('minecraft:potted_jungle_sapling');

  /// [Potted Acacia Sapling](https://minecraft.gamepedia.com/potted_acacia_sapling)
  ///
  /// _(minecraft:potted_acacia_sapling)_
  static const Block potted_acacia_sapling =
      Block('minecraft:potted_acacia_sapling');

  /// [Potted Dark Oak Sapling](https://minecraft.gamepedia.com/potted_dark_oak_sapling)
  ///
  /// _(minecraft:potted_dark_oak_sapling)_
  static const Block potted_dark_oak_sapling =
      Block('minecraft:potted_dark_oak_sapling');

  /// [Potted Fern](https://minecraft.gamepedia.com/potted_fern)
  ///
  /// _(minecraft:potted_fern)_
  static const Block potted_fern = Block('minecraft:potted_fern');

  /// [Potted Dandelion](https://minecraft.gamepedia.com/potted_dandelion)
  ///
  /// _(minecraft:potted_dandelion)_
  static const Block potted_dandelion = Block('minecraft:potted_dandelion');

  /// [Potted Poppy](https://minecraft.gamepedia.com/potted_poppy)
  ///
  /// _(minecraft:potted_poppy)_
  static const Block potted_poppy = Block('minecraft:potted_poppy');

  /// [Potted Blue Orchid](https://minecraft.gamepedia.com/potted_blue_orchid)
  ///
  /// _(minecraft:potted_blue_orchid)_
  static const Block potted_blue_orchid = Block('minecraft:potted_blue_orchid');

  /// [Potted Allium](https://minecraft.gamepedia.com/potted_allium)
  ///
  /// _(minecraft:potted_allium)_
  static const Block potted_allium = Block('minecraft:potted_allium');

  /// [Potted Azure Bluet](https://minecraft.gamepedia.com/potted_azure_bluet)
  ///
  /// _(minecraft:potted_azure_bluet)_
  static const Block potted_azure_bluet = Block('minecraft:potted_azure_bluet');

  /// [Potted Red Tulip](https://minecraft.gamepedia.com/potted_red_tulip)
  ///
  /// _(minecraft:potted_red_tulip)_
  static const Block potted_red_tulip = Block('minecraft:potted_red_tulip');

  /// [Potted Orange Tulip](https://minecraft.gamepedia.com/potted_orange_tulip)
  ///
  /// _(minecraft:potted_orange_tulip)_
  static const Block potted_orange_tulip =
      Block('minecraft:potted_orange_tulip');

  /// [Potted White Tulip](https://minecraft.gamepedia.com/potted_white_tulip)
  ///
  /// _(minecraft:potted_white_tulip)_
  static const Block potted_white_tulip = Block('minecraft:potted_white_tulip');

  /// [Potted Pink Tulip](https://minecraft.gamepedia.com/potted_pink_tulip)
  ///
  /// _(minecraft:potted_pink_tulip)_
  static const Block potted_pink_tulip = Block('minecraft:potted_pink_tulip');

  /// [Potted Oxeye Daisy](https://minecraft.gamepedia.com/potted_oxeye_daisy)
  ///
  /// _(minecraft:potted_oxeye_daisy)_
  static const Block potted_oxeye_daisy = Block('minecraft:potted_oxeye_daisy');

  /// [Potted Cornflower](https://minecraft.gamepedia.com/potted_cornflower)
  ///
  /// _(minecraft:potted_cornflower)_
  static const Block potted_cornflower = Block('minecraft:potted_cornflower');

  /// [Potted Lily Of The Valley](https://minecraft.gamepedia.com/potted_lily_of_the_valley)
  ///
  /// _(minecraft:potted_lily_of_the_valley)_
  static const Block potted_lily_of_the_valley =
      Block('minecraft:potted_lily_of_the_valley');

  /// [Potted Wither Rose](https://minecraft.gamepedia.com/potted_wither_rose)
  ///
  /// _(minecraft:potted_wither_rose)_
  static const Block potted_wither_rose = Block('minecraft:potted_wither_rose');

  /// [Potted Red Mushroom](https://minecraft.gamepedia.com/potted_red_mushroom)
  ///
  /// _(minecraft:potted_red_mushroom)_
  static const Block potted_red_mushroom =
      Block('minecraft:potted_red_mushroom');

  /// [Potted Brown Mushroom](https://minecraft.gamepedia.com/potted_brown_mushroom)
  ///
  /// _(minecraft:potted_brown_mushroom)_
  static const Block potted_brown_mushroom =
      Block('minecraft:potted_brown_mushroom');

  /// [Potted Dead Bush](https://minecraft.gamepedia.com/potted_dead_bush)
  ///
  /// _(minecraft:potted_dead_bush)_
  static const Block potted_dead_bush = Block('minecraft:potted_dead_bush');

  /// [Potted Cactus](https://minecraft.gamepedia.com/potted_cactus)
  ///
  /// _(minecraft:potted_cactus)_
  static const Block potted_cactus = Block('minecraft:potted_cactus');

  /// [Carrots](https://minecraft.gamepedia.com/carrots)
  ///
  /// _(minecraft:carrots)_
  static const Block carrots = Block('minecraft:carrots');

  /// [Potatoes](https://minecraft.gamepedia.com/potatoes)
  ///
  /// _(minecraft:potatoes)_
  static const Block potatoes = Block('minecraft:potatoes');

  /// [Oak Button](https://minecraft.gamepedia.com/oak_button)
  ///
  /// _(minecraft:oak_button)_
  static const Block oak_button = Block('minecraft:oak_button');

  /// [Spruce Button](https://minecraft.gamepedia.com/spruce_button)
  ///
  /// _(minecraft:spruce_button)_
  static const Block spruce_button = Block('minecraft:spruce_button');

  /// [Birch Button](https://minecraft.gamepedia.com/birch_button)
  ///
  /// _(minecraft:birch_button)_
  static const Block birch_button = Block('minecraft:birch_button');

  /// [Jungle Button](https://minecraft.gamepedia.com/jungle_button)
  ///
  /// _(minecraft:jungle_button)_
  static const Block jungle_button = Block('minecraft:jungle_button');

  /// [Acacia Button](https://minecraft.gamepedia.com/acacia_button)
  ///
  /// _(minecraft:acacia_button)_
  static const Block acacia_button = Block('minecraft:acacia_button');

  /// [Dark Oak Button](https://minecraft.gamepedia.com/dark_oak_button)
  ///
  /// _(minecraft:dark_oak_button)_
  static const Block dark_oak_button = Block('minecraft:dark_oak_button');

  /// [Skeleton Skull](https://minecraft.gamepedia.com/skeleton_skull)
  ///
  /// _(minecraft:skeleton_skull)_
  static const Block skeleton_skull = Block('minecraft:skeleton_skull');

  /// [Skeleton Wall Skull](https://minecraft.gamepedia.com/skeleton_wall_skull)
  ///
  /// _(minecraft:skeleton_wall_skull)_
  static const Block skeleton_wall_skull =
      Block('minecraft:skeleton_wall_skull');

  /// [Wither Skeleton Skull](https://minecraft.gamepedia.com/wither_skeleton_skull)
  ///
  /// _(minecraft:wither_skeleton_skull)_
  static const Block wither_skeleton_skull =
      Block('minecraft:wither_skeleton_skull');

  /// [Wither Skeleton Wall Skull](https://minecraft.gamepedia.com/wither_skeleton_wall_skull)
  ///
  /// _(minecraft:wither_skeleton_wall_skull)_
  static const Block wither_skeleton_wall_skull =
      Block('minecraft:wither_skeleton_wall_skull');

  /// [Zombie Head](https://minecraft.gamepedia.com/zombie_head)
  ///
  /// _(minecraft:zombie_head)_
  static const Block zombie_head = Block('minecraft:zombie_head');

  /// [Zombie Wall Head](https://minecraft.gamepedia.com/zombie_wall_head)
  ///
  /// _(minecraft:zombie_wall_head)_
  static const Block zombie_wall_head = Block('minecraft:zombie_wall_head');

  /// [Player Head](https://minecraft.gamepedia.com/player_head)
  ///
  /// _(minecraft:player_head)_
  static const Block player_head = Block('minecraft:player_head');

  /// [Player Wall Head](https://minecraft.gamepedia.com/player_wall_head)
  ///
  /// _(minecraft:player_wall_head)_
  static const Block player_wall_head = Block('minecraft:player_wall_head');

  /// [Creeper Head](https://minecraft.gamepedia.com/creeper_head)
  ///
  /// _(minecraft:creeper_head)_
  static const Block creeper_head = Block('minecraft:creeper_head');

  /// [Creeper Wall Head](https://minecraft.gamepedia.com/creeper_wall_head)
  ///
  /// _(minecraft:creeper_wall_head)_
  static const Block creeper_wall_head = Block('minecraft:creeper_wall_head');

  /// [Dragon Head](https://minecraft.gamepedia.com/dragon_head)
  ///
  /// _(minecraft:dragon_head)_
  static const Block dragon_head = Block('minecraft:dragon_head');

  /// [Dragon Wall Head](https://minecraft.gamepedia.com/dragon_wall_head)
  ///
  /// _(minecraft:dragon_wall_head)_
  static const Block dragon_wall_head = Block('minecraft:dragon_wall_head');

  /// [Anvil](https://minecraft.gamepedia.com/anvil)
  ///
  /// _(minecraft:anvil)_
  static const Block anvil = Block('minecraft:anvil');

  /// [Chipped Anvil](https://minecraft.gamepedia.com/chipped_anvil)
  ///
  /// _(minecraft:chipped_anvil)_
  static const Block chipped_anvil = Block('minecraft:chipped_anvil');

  /// [Damaged Anvil](https://minecraft.gamepedia.com/damaged_anvil)
  ///
  /// _(minecraft:damaged_anvil)_
  static const Block damaged_anvil = Block('minecraft:damaged_anvil');

  /// [Trapped Chest](https://minecraft.gamepedia.com/trapped_chest)
  ///
  /// _(minecraft:trapped_chest)_
  static const Block trapped_chest = Block('minecraft:trapped_chest');

  /// [Light Weighted Pressure Plate](https://minecraft.gamepedia.com/light_weighted_pressure_plate)
  ///
  /// _(minecraft:light_weighted_pressure_plate)_
  static const Block light_weighted_pressure_plate =
      Block('minecraft:light_weighted_pressure_plate');

  /// [Heavy Weighted Pressure Plate](https://minecraft.gamepedia.com/heavy_weighted_pressure_plate)
  ///
  /// _(minecraft:heavy_weighted_pressure_plate)_
  static const Block heavy_weighted_pressure_plate =
      Block('minecraft:heavy_weighted_pressure_plate');

  /// [Comparator](https://minecraft.gamepedia.com/comparator)
  ///
  /// _(minecraft:comparator)_
  static const Block comparator = Block('minecraft:comparator');

  /// [Daylight Detector](https://minecraft.gamepedia.com/daylight_detector)
  ///
  /// _(minecraft:daylight_detector)_
  static const Block daylight_detector = Block('minecraft:daylight_detector');

  /// [Redstone Block](https://minecraft.gamepedia.com/redstone_block)
  ///
  /// _(minecraft:redstone_block)_
  static const Block redstone_block = Block('minecraft:redstone_block');

  /// [Nether Quartz Ore](https://minecraft.gamepedia.com/nether_quartz_ore)
  ///
  /// _(minecraft:nether_quartz_ore)_
  static const Block nether_quartz_ore = Block('minecraft:nether_quartz_ore');

  /// [Hopper](https://minecraft.gamepedia.com/hopper)
  ///
  /// _(minecraft:hopper)_
  static const Block hopper = Block('minecraft:hopper');

  /// [Quartz Block](https://minecraft.gamepedia.com/quartz_block)
  ///
  /// _(minecraft:quartz_block)_
  static const Block quartz_block = Block('minecraft:quartz_block');

  /// [Chiseled Quartz Block](https://minecraft.gamepedia.com/chiseled_quartz_block)
  ///
  /// _(minecraft:chiseled_quartz_block)_
  static const Block chiseled_quartz_block =
      Block('minecraft:chiseled_quartz_block');

  /// [Quartz Pillar](https://minecraft.gamepedia.com/quartz_pillar)
  ///
  /// _(minecraft:quartz_pillar)_
  static const Block quartz_pillar = Block('minecraft:quartz_pillar');

  /// [Quartz Stairs](https://minecraft.gamepedia.com/quartz_stairs)
  ///
  /// _(minecraft:quartz_stairs)_
  static const Block quartz_stairs = Block('minecraft:quartz_stairs');

  /// [Activator Rail](https://minecraft.gamepedia.com/activator_rail)
  ///
  /// _(minecraft:activator_rail)_
  static const Block activator_rail = Block('minecraft:activator_rail');

  /// [Dropper](https://minecraft.gamepedia.com/dropper)
  ///
  /// _(minecraft:dropper)_
  static const Block dropper = Block('minecraft:dropper');

  /// [White Terracotta](https://minecraft.gamepedia.com/white_terracotta)
  ///
  /// _(minecraft:white_terracotta)_
  static const Block white_terracotta = Block('minecraft:white_terracotta');

  /// [Orange Terracotta](https://minecraft.gamepedia.com/orange_terracotta)
  ///
  /// _(minecraft:orange_terracotta)_
  static const Block orange_terracotta = Block('minecraft:orange_terracotta');

  /// [Magenta Terracotta](https://minecraft.gamepedia.com/magenta_terracotta)
  ///
  /// _(minecraft:magenta_terracotta)_
  static const Block magenta_terracotta = Block('minecraft:magenta_terracotta');

  /// [Light Blue Terracotta](https://minecraft.gamepedia.com/light_blue_terracotta)
  ///
  /// _(minecraft:light_blue_terracotta)_
  static const Block light_blue_terracotta =
      Block('minecraft:light_blue_terracotta');

  /// [Yellow Terracotta](https://minecraft.gamepedia.com/yellow_terracotta)
  ///
  /// _(minecraft:yellow_terracotta)_
  static const Block yellow_terracotta = Block('minecraft:yellow_terracotta');

  /// [Lime Terracotta](https://minecraft.gamepedia.com/lime_terracotta)
  ///
  /// _(minecraft:lime_terracotta)_
  static const Block lime_terracotta = Block('minecraft:lime_terracotta');

  /// [Pink Terracotta](https://minecraft.gamepedia.com/pink_terracotta)
  ///
  /// _(minecraft:pink_terracotta)_
  static const Block pink_terracotta = Block('minecraft:pink_terracotta');

  /// [Gray Terracotta](https://minecraft.gamepedia.com/gray_terracotta)
  ///
  /// _(minecraft:gray_terracotta)_
  static const Block gray_terracotta = Block('minecraft:gray_terracotta');

  /// [Light Gray Terracotta](https://minecraft.gamepedia.com/light_gray_terracotta)
  ///
  /// _(minecraft:light_gray_terracotta)_
  static const Block light_gray_terracotta =
      Block('minecraft:light_gray_terracotta');

  /// [Cyan Terracotta](https://minecraft.gamepedia.com/cyan_terracotta)
  ///
  /// _(minecraft:cyan_terracotta)_
  static const Block cyan_terracotta = Block('minecraft:cyan_terracotta');

  /// [Purple Terracotta](https://minecraft.gamepedia.com/purple_terracotta)
  ///
  /// _(minecraft:purple_terracotta)_
  static const Block purple_terracotta = Block('minecraft:purple_terracotta');

  /// [Blue Terracotta](https://minecraft.gamepedia.com/blue_terracotta)
  ///
  /// _(minecraft:blue_terracotta)_
  static const Block blue_terracotta = Block('minecraft:blue_terracotta');

  /// [Brown Terracotta](https://minecraft.gamepedia.com/brown_terracotta)
  ///
  /// _(minecraft:brown_terracotta)_
  static const Block brown_terracotta = Block('minecraft:brown_terracotta');

  /// [Green Terracotta](https://minecraft.gamepedia.com/green_terracotta)
  ///
  /// _(minecraft:green_terracotta)_
  static const Block green_terracotta = Block('minecraft:green_terracotta');

  /// [Red Terracotta](https://minecraft.gamepedia.com/red_terracotta)
  ///
  /// _(minecraft:red_terracotta)_
  static const Block red_terracotta = Block('minecraft:red_terracotta');

  /// [Black Terracotta](https://minecraft.gamepedia.com/black_terracotta)
  ///
  /// _(minecraft:black_terracotta)_
  static const Block black_terracotta = Block('minecraft:black_terracotta');

  /// [White Stained Glass Pane](https://minecraft.gamepedia.com/white_stained_glass_pane)
  ///
  /// _(minecraft:white_stained_glass_pane)_
  static const Block white_stained_glass_pane =
      Block('minecraft:white_stained_glass_pane');

  /// [Orange Stained Glass Pane](https://minecraft.gamepedia.com/orange_stained_glass_pane)
  ///
  /// _(minecraft:orange_stained_glass_pane)_
  static const Block orange_stained_glass_pane =
      Block('minecraft:orange_stained_glass_pane');

  /// [Magenta Stained Glass Pane](https://minecraft.gamepedia.com/magenta_stained_glass_pane)
  ///
  /// _(minecraft:magenta_stained_glass_pane)_
  static const Block magenta_stained_glass_pane =
      Block('minecraft:magenta_stained_glass_pane');

  /// [Light Blue Stained Glass Pane](https://minecraft.gamepedia.com/light_blue_stained_glass_pane)
  ///
  /// _(minecraft:light_blue_stained_glass_pane)_
  static const Block light_blue_stained_glass_pane =
      Block('minecraft:light_blue_stained_glass_pane');

  /// [Yellow Stained Glass Pane](https://minecraft.gamepedia.com/yellow_stained_glass_pane)
  ///
  /// _(minecraft:yellow_stained_glass_pane)_
  static const Block yellow_stained_glass_pane =
      Block('minecraft:yellow_stained_glass_pane');

  /// [Lime Stained Glass Pane](https://minecraft.gamepedia.com/lime_stained_glass_pane)
  ///
  /// _(minecraft:lime_stained_glass_pane)_
  static const Block lime_stained_glass_pane =
      Block('minecraft:lime_stained_glass_pane');

  /// [Pink Stained Glass Pane](https://minecraft.gamepedia.com/pink_stained_glass_pane)
  ///
  /// _(minecraft:pink_stained_glass_pane)_
  static const Block pink_stained_glass_pane =
      Block('minecraft:pink_stained_glass_pane');

  /// [Gray Stained Glass Pane](https://minecraft.gamepedia.com/gray_stained_glass_pane)
  ///
  /// _(minecraft:gray_stained_glass_pane)_
  static const Block gray_stained_glass_pane =
      Block('minecraft:gray_stained_glass_pane');

  /// [Light Gray Stained Glass Pane](https://minecraft.gamepedia.com/light_gray_stained_glass_pane)
  ///
  /// _(minecraft:light_gray_stained_glass_pane)_
  static const Block light_gray_stained_glass_pane =
      Block('minecraft:light_gray_stained_glass_pane');

  /// [Cyan Stained Glass Pane](https://minecraft.gamepedia.com/cyan_stained_glass_pane)
  ///
  /// _(minecraft:cyan_stained_glass_pane)_
  static const Block cyan_stained_glass_pane =
      Block('minecraft:cyan_stained_glass_pane');

  /// [Purple Stained Glass Pane](https://minecraft.gamepedia.com/purple_stained_glass_pane)
  ///
  /// _(minecraft:purple_stained_glass_pane)_
  static const Block purple_stained_glass_pane =
      Block('minecraft:purple_stained_glass_pane');

  /// [Blue Stained Glass Pane](https://minecraft.gamepedia.com/blue_stained_glass_pane)
  ///
  /// _(minecraft:blue_stained_glass_pane)_
  static const Block blue_stained_glass_pane =
      Block('minecraft:blue_stained_glass_pane');

  /// [Brown Stained Glass Pane](https://minecraft.gamepedia.com/brown_stained_glass_pane)
  ///
  /// _(minecraft:brown_stained_glass_pane)_
  static const Block brown_stained_glass_pane =
      Block('minecraft:brown_stained_glass_pane');

  /// [Green Stained Glass Pane](https://minecraft.gamepedia.com/green_stained_glass_pane)
  ///
  /// _(minecraft:green_stained_glass_pane)_
  static const Block green_stained_glass_pane =
      Block('minecraft:green_stained_glass_pane');

  /// [Red Stained Glass Pane](https://minecraft.gamepedia.com/red_stained_glass_pane)
  ///
  /// _(minecraft:red_stained_glass_pane)_
  static const Block red_stained_glass_pane =
      Block('minecraft:red_stained_glass_pane');

  /// [Black Stained Glass Pane](https://minecraft.gamepedia.com/black_stained_glass_pane)
  ///
  /// _(minecraft:black_stained_glass_pane)_
  static const Block black_stained_glass_pane =
      Block('minecraft:black_stained_glass_pane');

  /// [Acacia Stairs](https://minecraft.gamepedia.com/acacia_stairs)
  ///
  /// _(minecraft:acacia_stairs)_
  static const Block acacia_stairs = Block('minecraft:acacia_stairs');

  /// [Dark Oak Stairs](https://minecraft.gamepedia.com/dark_oak_stairs)
  ///
  /// _(minecraft:dark_oak_stairs)_
  static const Block dark_oak_stairs = Block('minecraft:dark_oak_stairs');

  /// [Slime Block](https://minecraft.gamepedia.com/slime_block)
  ///
  /// _(minecraft:slime_block)_
  static const Block slime_block = Block('minecraft:slime_block');

  /// [Barrier](https://minecraft.gamepedia.com/barrier)
  ///
  /// _(minecraft:barrier)_
  static const Block barrier = Block('minecraft:barrier');

  /// [Iron Trapdoor](https://minecraft.gamepedia.com/iron_trapdoor)
  ///
  /// _(minecraft:iron_trapdoor)_
  static const Block iron_trapdoor = Block('minecraft:iron_trapdoor');

  /// [Prismarine](https://minecraft.gamepedia.com/prismarine)
  ///
  /// _(minecraft:prismarine)_
  static const Block prismarine = Block('minecraft:prismarine');

  /// [Prismarine Bricks](https://minecraft.gamepedia.com/prismarine_bricks)
  ///
  /// _(minecraft:prismarine_bricks)_
  static const Block prismarine_bricks = Block('minecraft:prismarine_bricks');

  /// [Dark Prismarine](https://minecraft.gamepedia.com/dark_prismarine)
  ///
  /// _(minecraft:dark_prismarine)_
  static const Block dark_prismarine = Block('minecraft:dark_prismarine');

  /// [Prismarine Stairs](https://minecraft.gamepedia.com/prismarine_stairs)
  ///
  /// _(minecraft:prismarine_stairs)_
  static const Block prismarine_stairs = Block('minecraft:prismarine_stairs');

  /// [Prismarine Brick Stairs](https://minecraft.gamepedia.com/prismarine_brick_stairs)
  ///
  /// _(minecraft:prismarine_brick_stairs)_
  static const Block prismarine_brick_stairs =
      Block('minecraft:prismarine_brick_stairs');

  /// [Dark Prismarine Stairs](https://minecraft.gamepedia.com/dark_prismarine_stairs)
  ///
  /// _(minecraft:dark_prismarine_stairs)_
  static const Block dark_prismarine_stairs =
      Block('minecraft:dark_prismarine_stairs');

  /// [Prismarine Slab](https://minecraft.gamepedia.com/prismarine_slab)
  ///
  /// _(minecraft:prismarine_slab)_
  static const Block prismarine_slab = Block('minecraft:prismarine_slab');

  /// [Prismarine Brick Slab](https://minecraft.gamepedia.com/prismarine_brick_slab)
  ///
  /// _(minecraft:prismarine_brick_slab)_
  static const Block prismarine_brick_slab =
      Block('minecraft:prismarine_brick_slab');

  /// [Dark Prismarine Slab](https://minecraft.gamepedia.com/dark_prismarine_slab)
  ///
  /// _(minecraft:dark_prismarine_slab)_
  static const Block dark_prismarine_slab =
      Block('minecraft:dark_prismarine_slab');

  /// [Sea Lantern](https://minecraft.gamepedia.com/sea_lantern)
  ///
  /// _(minecraft:sea_lantern)_
  static const Block sea_lantern = Block('minecraft:sea_lantern');

  /// [Hay Block](https://minecraft.gamepedia.com/hay_block)
  ///
  /// _(minecraft:hay_block)_
  static const Block hay_block = Block('minecraft:hay_block');

  /// [White Carpet](https://minecraft.gamepedia.com/white_carpet)
  ///
  /// _(minecraft:white_carpet)_
  static const Block white_carpet = Block('minecraft:white_carpet');

  /// [Orange Carpet](https://minecraft.gamepedia.com/orange_carpet)
  ///
  /// _(minecraft:orange_carpet)_
  static const Block orange_carpet = Block('minecraft:orange_carpet');

  /// [Magenta Carpet](https://minecraft.gamepedia.com/magenta_carpet)
  ///
  /// _(minecraft:magenta_carpet)_
  static const Block magenta_carpet = Block('minecraft:magenta_carpet');

  /// [Light Blue Carpet](https://minecraft.gamepedia.com/light_blue_carpet)
  ///
  /// _(minecraft:light_blue_carpet)_
  static const Block light_blue_carpet = Block('minecraft:light_blue_carpet');

  /// [Yellow Carpet](https://minecraft.gamepedia.com/yellow_carpet)
  ///
  /// _(minecraft:yellow_carpet)_
  static const Block yellow_carpet = Block('minecraft:yellow_carpet');

  /// [Lime Carpet](https://minecraft.gamepedia.com/lime_carpet)
  ///
  /// _(minecraft:lime_carpet)_
  static const Block lime_carpet = Block('minecraft:lime_carpet');

  /// [Pink Carpet](https://minecraft.gamepedia.com/pink_carpet)
  ///
  /// _(minecraft:pink_carpet)_
  static const Block pink_carpet = Block('minecraft:pink_carpet');

  /// [Gray Carpet](https://minecraft.gamepedia.com/gray_carpet)
  ///
  /// _(minecraft:gray_carpet)_
  static const Block gray_carpet = Block('minecraft:gray_carpet');

  /// [Light Gray Carpet](https://minecraft.gamepedia.com/light_gray_carpet)
  ///
  /// _(minecraft:light_gray_carpet)_
  static const Block light_gray_carpet = Block('minecraft:light_gray_carpet');

  /// [Cyan Carpet](https://minecraft.gamepedia.com/cyan_carpet)
  ///
  /// _(minecraft:cyan_carpet)_
  static const Block cyan_carpet = Block('minecraft:cyan_carpet');

  /// [Purple Carpet](https://minecraft.gamepedia.com/purple_carpet)
  ///
  /// _(minecraft:purple_carpet)_
  static const Block purple_carpet = Block('minecraft:purple_carpet');

  /// [Blue Carpet](https://minecraft.gamepedia.com/blue_carpet)
  ///
  /// _(minecraft:blue_carpet)_
  static const Block blue_carpet = Block('minecraft:blue_carpet');

  /// [Brown Carpet](https://minecraft.gamepedia.com/brown_carpet)
  ///
  /// _(minecraft:brown_carpet)_
  static const Block brown_carpet = Block('minecraft:brown_carpet');

  /// [Green Carpet](https://minecraft.gamepedia.com/green_carpet)
  ///
  /// _(minecraft:green_carpet)_
  static const Block green_carpet = Block('minecraft:green_carpet');

  /// [Red Carpet](https://minecraft.gamepedia.com/red_carpet)
  ///
  /// _(minecraft:red_carpet)_
  static const Block red_carpet = Block('minecraft:red_carpet');

  /// [Black Carpet](https://minecraft.gamepedia.com/black_carpet)
  ///
  /// _(minecraft:black_carpet)_
  static const Block black_carpet = Block('minecraft:black_carpet');

  /// [Terracotta](https://minecraft.gamepedia.com/terracotta)
  ///
  /// _(minecraft:terracotta)_
  static const Block terracotta = Block('minecraft:terracotta');

  /// [Coal Block](https://minecraft.gamepedia.com/coal_block)
  ///
  /// _(minecraft:coal_block)_
  static const Block coal_block = Block('minecraft:coal_block');

  /// [Packed Ice](https://minecraft.gamepedia.com/packed_ice)
  ///
  /// _(minecraft:packed_ice)_
  static const Block packed_ice = Block('minecraft:packed_ice');

  /// [Sunflower](https://minecraft.gamepedia.com/sunflower)
  ///
  /// _(minecraft:sunflower)_
  static const Block sunflower = Block('minecraft:sunflower');

  /// [Lilac](https://minecraft.gamepedia.com/lilac)
  ///
  /// _(minecraft:lilac)_
  static const Block lilac = Block('minecraft:lilac');

  /// [Rose Bush](https://minecraft.gamepedia.com/rose_bush)
  ///
  /// _(minecraft:rose_bush)_
  static const Block rose_bush = Block('minecraft:rose_bush');

  /// [Peony](https://minecraft.gamepedia.com/peony)
  ///
  /// _(minecraft:peony)_
  static const Block peony = Block('minecraft:peony');

  /// [Tall Grass](https://minecraft.gamepedia.com/tall_grass)
  ///
  /// _(minecraft:tall_grass)_
  static const Block tall_grass = Block('minecraft:tall_grass');

  /// [Large Fern](https://minecraft.gamepedia.com/large_fern)
  ///
  /// _(minecraft:large_fern)_
  static const Block large_fern = Block('minecraft:large_fern');

  /// [White Banner](https://minecraft.gamepedia.com/white_banner)
  ///
  /// _(minecraft:white_banner)_
  static const Block white_banner = Block('minecraft:white_banner');

  /// [Orange Banner](https://minecraft.gamepedia.com/orange_banner)
  ///
  /// _(minecraft:orange_banner)_
  static const Block orange_banner = Block('minecraft:orange_banner');

  /// [Magenta Banner](https://minecraft.gamepedia.com/magenta_banner)
  ///
  /// _(minecraft:magenta_banner)_
  static const Block magenta_banner = Block('minecraft:magenta_banner');

  /// [Light Blue Banner](https://minecraft.gamepedia.com/light_blue_banner)
  ///
  /// _(minecraft:light_blue_banner)_
  static const Block light_blue_banner = Block('minecraft:light_blue_banner');

  /// [Yellow Banner](https://minecraft.gamepedia.com/yellow_banner)
  ///
  /// _(minecraft:yellow_banner)_
  static const Block yellow_banner = Block('minecraft:yellow_banner');

  /// [Lime Banner](https://minecraft.gamepedia.com/lime_banner)
  ///
  /// _(minecraft:lime_banner)_
  static const Block lime_banner = Block('minecraft:lime_banner');

  /// [Pink Banner](https://minecraft.gamepedia.com/pink_banner)
  ///
  /// _(minecraft:pink_banner)_
  static const Block pink_banner = Block('minecraft:pink_banner');

  /// [Gray Banner](https://minecraft.gamepedia.com/gray_banner)
  ///
  /// _(minecraft:gray_banner)_
  static const Block gray_banner = Block('minecraft:gray_banner');

  /// [Light Gray Banner](https://minecraft.gamepedia.com/light_gray_banner)
  ///
  /// _(minecraft:light_gray_banner)_
  static const Block light_gray_banner = Block('minecraft:light_gray_banner');

  /// [Cyan Banner](https://minecraft.gamepedia.com/cyan_banner)
  ///
  /// _(minecraft:cyan_banner)_
  static const Block cyan_banner = Block('minecraft:cyan_banner');

  /// [Purple Banner](https://minecraft.gamepedia.com/purple_banner)
  ///
  /// _(minecraft:purple_banner)_
  static const Block purple_banner = Block('minecraft:purple_banner');

  /// [Blue Banner](https://minecraft.gamepedia.com/blue_banner)
  ///
  /// _(minecraft:blue_banner)_
  static const Block blue_banner = Block('minecraft:blue_banner');

  /// [Brown Banner](https://minecraft.gamepedia.com/brown_banner)
  ///
  /// _(minecraft:brown_banner)_
  static const Block brown_banner = Block('minecraft:brown_banner');

  /// [Green Banner](https://minecraft.gamepedia.com/green_banner)
  ///
  /// _(minecraft:green_banner)_
  static const Block green_banner = Block('minecraft:green_banner');

  /// [Red Banner](https://minecraft.gamepedia.com/red_banner)
  ///
  /// _(minecraft:red_banner)_
  static const Block red_banner = Block('minecraft:red_banner');

  /// [Black Banner](https://minecraft.gamepedia.com/black_banner)
  ///
  /// _(minecraft:black_banner)_
  static const Block black_banner = Block('minecraft:black_banner');

  /// [White Wall Banner](https://minecraft.gamepedia.com/white_wall_banner)
  ///
  /// _(minecraft:white_wall_banner)_
  static const Block white_wall_banner = Block('minecraft:white_wall_banner');

  /// [Orange Wall Banner](https://minecraft.gamepedia.com/orange_wall_banner)
  ///
  /// _(minecraft:orange_wall_banner)_
  static const Block orange_wall_banner = Block('minecraft:orange_wall_banner');

  /// [Magenta Wall Banner](https://minecraft.gamepedia.com/magenta_wall_banner)
  ///
  /// _(minecraft:magenta_wall_banner)_
  static const Block magenta_wall_banner =
      Block('minecraft:magenta_wall_banner');

  /// [Light Blue Wall Banner](https://minecraft.gamepedia.com/light_blue_wall_banner)
  ///
  /// _(minecraft:light_blue_wall_banner)_
  static const Block light_blue_wall_banner =
      Block('minecraft:light_blue_wall_banner');

  /// [Yellow Wall Banner](https://minecraft.gamepedia.com/yellow_wall_banner)
  ///
  /// _(minecraft:yellow_wall_banner)_
  static const Block yellow_wall_banner = Block('minecraft:yellow_wall_banner');

  /// [Lime Wall Banner](https://minecraft.gamepedia.com/lime_wall_banner)
  ///
  /// _(minecraft:lime_wall_banner)_
  static const Block lime_wall_banner = Block('minecraft:lime_wall_banner');

  /// [Pink Wall Banner](https://minecraft.gamepedia.com/pink_wall_banner)
  ///
  /// _(minecraft:pink_wall_banner)_
  static const Block pink_wall_banner = Block('minecraft:pink_wall_banner');

  /// [Gray Wall Banner](https://minecraft.gamepedia.com/gray_wall_banner)
  ///
  /// _(minecraft:gray_wall_banner)_
  static const Block gray_wall_banner = Block('minecraft:gray_wall_banner');

  /// [Light Gray Wall Banner](https://minecraft.gamepedia.com/light_gray_wall_banner)
  ///
  /// _(minecraft:light_gray_wall_banner)_
  static const Block light_gray_wall_banner =
      Block('minecraft:light_gray_wall_banner');

  /// [Cyan Wall Banner](https://minecraft.gamepedia.com/cyan_wall_banner)
  ///
  /// _(minecraft:cyan_wall_banner)_
  static const Block cyan_wall_banner = Block('minecraft:cyan_wall_banner');

  /// [Purple Wall Banner](https://minecraft.gamepedia.com/purple_wall_banner)
  ///
  /// _(minecraft:purple_wall_banner)_
  static const Block purple_wall_banner = Block('minecraft:purple_wall_banner');

  /// [Blue Wall Banner](https://minecraft.gamepedia.com/blue_wall_banner)
  ///
  /// _(minecraft:blue_wall_banner)_
  static const Block blue_wall_banner = Block('minecraft:blue_wall_banner');

  /// [Brown Wall Banner](https://minecraft.gamepedia.com/brown_wall_banner)
  ///
  /// _(minecraft:brown_wall_banner)_
  static const Block brown_wall_banner = Block('minecraft:brown_wall_banner');

  /// [Green Wall Banner](https://minecraft.gamepedia.com/green_wall_banner)
  ///
  /// _(minecraft:green_wall_banner)_
  static const Block green_wall_banner = Block('minecraft:green_wall_banner');

  /// [Red Wall Banner](https://minecraft.gamepedia.com/red_wall_banner)
  ///
  /// _(minecraft:red_wall_banner)_
  static const Block red_wall_banner = Block('minecraft:red_wall_banner');

  /// [Black Wall Banner](https://minecraft.gamepedia.com/black_wall_banner)
  ///
  /// _(minecraft:black_wall_banner)_
  static const Block black_wall_banner = Block('minecraft:black_wall_banner');

  /// [Red Sandstone](https://minecraft.gamepedia.com/red_sandstone)
  ///
  /// _(minecraft:red_sandstone)_
  static const Block red_sandstone = Block('minecraft:red_sandstone');

  /// [Chiseled Red Sandstone](https://minecraft.gamepedia.com/chiseled_red_sandstone)
  ///
  /// _(minecraft:chiseled_red_sandstone)_
  static const Block chiseled_red_sandstone =
      Block('minecraft:chiseled_red_sandstone');

  /// [Cut Red Sandstone](https://minecraft.gamepedia.com/cut_red_sandstone)
  ///
  /// _(minecraft:cut_red_sandstone)_
  static const Block cut_red_sandstone = Block('minecraft:cut_red_sandstone');

  /// [Red Sandstone Stairs](https://minecraft.gamepedia.com/red_sandstone_stairs)
  ///
  /// _(minecraft:red_sandstone_stairs)_
  static const Block red_sandstone_stairs =
      Block('minecraft:red_sandstone_stairs');

  /// [Oak Slab](https://minecraft.gamepedia.com/oak_slab)
  ///
  /// _(minecraft:oak_slab)_
  static const Block oak_slab = Block('minecraft:oak_slab');

  /// [Spruce Slab](https://minecraft.gamepedia.com/spruce_slab)
  ///
  /// _(minecraft:spruce_slab)_
  static const Block spruce_slab = Block('minecraft:spruce_slab');

  /// [Birch Slab](https://minecraft.gamepedia.com/birch_slab)
  ///
  /// _(minecraft:birch_slab)_
  static const Block birch_slab = Block('minecraft:birch_slab');

  /// [Jungle Slab](https://minecraft.gamepedia.com/jungle_slab)
  ///
  /// _(minecraft:jungle_slab)_
  static const Block jungle_slab = Block('minecraft:jungle_slab');

  /// [Acacia Slab](https://minecraft.gamepedia.com/acacia_slab)
  ///
  /// _(minecraft:acacia_slab)_
  static const Block acacia_slab = Block('minecraft:acacia_slab');

  /// [Dark Oak Slab](https://minecraft.gamepedia.com/dark_oak_slab)
  ///
  /// _(minecraft:dark_oak_slab)_
  static const Block dark_oak_slab = Block('minecraft:dark_oak_slab');

  /// [Stone Slab](https://minecraft.gamepedia.com/stone_slab)
  ///
  /// _(minecraft:stone_slab)_
  static const Block stone_slab = Block('minecraft:stone_slab');

  /// [Smooth Stone Slab](https://minecraft.gamepedia.com/smooth_stone_slab)
  ///
  /// _(minecraft:smooth_stone_slab)_
  static const Block smooth_stone_slab = Block('minecraft:smooth_stone_slab');

  /// [Sandstone Slab](https://minecraft.gamepedia.com/sandstone_slab)
  ///
  /// _(minecraft:sandstone_slab)_
  static const Block sandstone_slab = Block('minecraft:sandstone_slab');

  /// [Cut Sandstone Slab](https://minecraft.gamepedia.com/cut_sandstone_slab)
  ///
  /// _(minecraft:cut_sandstone_slab)_
  static const Block cut_sandstone_slab = Block('minecraft:cut_sandstone_slab');

  /// [Petrified Oak Slab](https://minecraft.gamepedia.com/petrified_oak_slab)
  ///
  /// _(minecraft:petrified_oak_slab)_
  static const Block petrified_oak_slab = Block('minecraft:petrified_oak_slab');

  /// [Cobblestone Slab](https://minecraft.gamepedia.com/cobblestone_slab)
  ///
  /// _(minecraft:cobblestone_slab)_
  static const Block cobblestone_slab = Block('minecraft:cobblestone_slab');

  /// [Brick Slab](https://minecraft.gamepedia.com/brick_slab)
  ///
  /// _(minecraft:brick_slab)_
  static const Block brick_slab = Block('minecraft:brick_slab');

  /// [Stone Brick Slab](https://minecraft.gamepedia.com/stone_brick_slab)
  ///
  /// _(minecraft:stone_brick_slab)_
  static const Block stone_brick_slab = Block('minecraft:stone_brick_slab');

  /// [Nether Brick Slab](https://minecraft.gamepedia.com/nether_brick_slab)
  ///
  /// _(minecraft:nether_brick_slab)_
  static const Block nether_brick_slab = Block('minecraft:nether_brick_slab');

  /// [Quartz Slab](https://minecraft.gamepedia.com/quartz_slab)
  ///
  /// _(minecraft:quartz_slab)_
  static const Block quartz_slab = Block('minecraft:quartz_slab');

  /// [Red Sandstone Slab](https://minecraft.gamepedia.com/red_sandstone_slab)
  ///
  /// _(minecraft:red_sandstone_slab)_
  static const Block red_sandstone_slab = Block('minecraft:red_sandstone_slab');

  /// [Cut Red Sandstone Slab](https://minecraft.gamepedia.com/cut_red_sandstone_slab)
  ///
  /// _(minecraft:cut_red_sandstone_slab)_
  static const Block cut_red_sandstone_slab =
      Block('minecraft:cut_red_sandstone_slab');

  /// [Purpur Slab](https://minecraft.gamepedia.com/purpur_slab)
  ///
  /// _(minecraft:purpur_slab)_
  static const Block purpur_slab = Block('minecraft:purpur_slab');

  /// [Smooth Stone](https://minecraft.gamepedia.com/smooth_stone)
  ///
  /// _(minecraft:smooth_stone)_
  static const Block smooth_stone = Block('minecraft:smooth_stone');

  /// [Smooth Sandstone](https://minecraft.gamepedia.com/smooth_sandstone)
  ///
  /// _(minecraft:smooth_sandstone)_
  static const Block smooth_sandstone = Block('minecraft:smooth_sandstone');

  /// [Smooth Quartz](https://minecraft.gamepedia.com/smooth_quartz)
  ///
  /// _(minecraft:smooth_quartz)_
  static const Block smooth_quartz = Block('minecraft:smooth_quartz');

  /// [Smooth Red Sandstone](https://minecraft.gamepedia.com/smooth_red_sandstone)
  ///
  /// _(minecraft:smooth_red_sandstone)_
  static const Block smooth_red_sandstone =
      Block('minecraft:smooth_red_sandstone');

  /// [Spruce Fence Gate](https://minecraft.gamepedia.com/spruce_fence_gate)
  ///
  /// _(minecraft:spruce_fence_gate)_
  static const Block spruce_fence_gate = Block('minecraft:spruce_fence_gate');

  /// [Birch Fence Gate](https://minecraft.gamepedia.com/birch_fence_gate)
  ///
  /// _(minecraft:birch_fence_gate)_
  static const Block birch_fence_gate = Block('minecraft:birch_fence_gate');

  /// [Jungle Fence Gate](https://minecraft.gamepedia.com/jungle_fence_gate)
  ///
  /// _(minecraft:jungle_fence_gate)_
  static const Block jungle_fence_gate = Block('minecraft:jungle_fence_gate');

  /// [Acacia Fence Gate](https://minecraft.gamepedia.com/acacia_fence_gate)
  ///
  /// _(minecraft:acacia_fence_gate)_
  static const Block acacia_fence_gate = Block('minecraft:acacia_fence_gate');

  /// [Dark Oak Fence Gate](https://minecraft.gamepedia.com/dark_oak_fence_gate)
  ///
  /// _(minecraft:dark_oak_fence_gate)_
  static const Block dark_oak_fence_gate =
      Block('minecraft:dark_oak_fence_gate');

  /// [Spruce Fence](https://minecraft.gamepedia.com/spruce_fence)
  ///
  /// _(minecraft:spruce_fence)_
  static const Block spruce_fence = Block('minecraft:spruce_fence');

  /// [Birch Fence](https://minecraft.gamepedia.com/birch_fence)
  ///
  /// _(minecraft:birch_fence)_
  static const Block birch_fence = Block('minecraft:birch_fence');

  /// [Jungle Fence](https://minecraft.gamepedia.com/jungle_fence)
  ///
  /// _(minecraft:jungle_fence)_
  static const Block jungle_fence = Block('minecraft:jungle_fence');

  /// [Acacia Fence](https://minecraft.gamepedia.com/acacia_fence)
  ///
  /// _(minecraft:acacia_fence)_
  static const Block acacia_fence = Block('minecraft:acacia_fence');

  /// [Dark Oak Fence](https://minecraft.gamepedia.com/dark_oak_fence)
  ///
  /// _(minecraft:dark_oak_fence)_
  static const Block dark_oak_fence = Block('minecraft:dark_oak_fence');

  /// [Spruce Door](https://minecraft.gamepedia.com/spruce_door)
  ///
  /// _(minecraft:spruce_door)_
  static const Block spruce_door = Block('minecraft:spruce_door');

  /// [Birch Door](https://minecraft.gamepedia.com/birch_door)
  ///
  /// _(minecraft:birch_door)_
  static const Block birch_door = Block('minecraft:birch_door');

  /// [Jungle Door](https://minecraft.gamepedia.com/jungle_door)
  ///
  /// _(minecraft:jungle_door)_
  static const Block jungle_door = Block('minecraft:jungle_door');

  /// [Acacia Door](https://minecraft.gamepedia.com/acacia_door)
  ///
  /// _(minecraft:acacia_door)_
  static const Block acacia_door = Block('minecraft:acacia_door');

  /// [Dark Oak Door](https://minecraft.gamepedia.com/dark_oak_door)
  ///
  /// _(minecraft:dark_oak_door)_
  static const Block dark_oak_door = Block('minecraft:dark_oak_door');

  /// [End Rod](https://minecraft.gamepedia.com/end_rod)
  ///
  /// _(minecraft:end_rod)_
  static const Block end_rod = Block('minecraft:end_rod');

  /// [Chorus Plant](https://minecraft.gamepedia.com/chorus_plant)
  ///
  /// _(minecraft:chorus_plant)_
  static const Block chorus_plant = Block('minecraft:chorus_plant');

  /// [Chorus Flower](https://minecraft.gamepedia.com/chorus_flower)
  ///
  /// _(minecraft:chorus_flower)_
  static const Block chorus_flower = Block('minecraft:chorus_flower');

  /// [Purpur Block](https://minecraft.gamepedia.com/purpur_block)
  ///
  /// _(minecraft:purpur_block)_
  static const Block purpur_block = Block('minecraft:purpur_block');

  /// [Purpur Pillar](https://minecraft.gamepedia.com/purpur_pillar)
  ///
  /// _(minecraft:purpur_pillar)_
  static const Block purpur_pillar = Block('minecraft:purpur_pillar');

  /// [Purpur Stairs](https://minecraft.gamepedia.com/purpur_stairs)
  ///
  /// _(minecraft:purpur_stairs)_
  static const Block purpur_stairs = Block('minecraft:purpur_stairs');

  /// [End Stone Bricks](https://minecraft.gamepedia.com/end_stone_bricks)
  ///
  /// _(minecraft:end_stone_bricks)_
  static const Block end_stone_bricks = Block('minecraft:end_stone_bricks');

  /// [Beetroots](https://minecraft.gamepedia.com/beetroots)
  ///
  /// _(minecraft:beetroots)_
  static const Block beetroots = Block('minecraft:beetroots');

  /// [Grass Path](https://minecraft.gamepedia.com/grass_path)
  ///
  /// _(minecraft:grass_path)_
  static const Block grass_path = Block('minecraft:grass_path');

  /// [End Gateway](https://minecraft.gamepedia.com/end_gateway)
  ///
  /// _(minecraft:end_gateway)_
  static const Block end_gateway = Block('minecraft:end_gateway');

  /// [Repeating Command Block](https://minecraft.gamepedia.com/repeating_command_block)
  ///
  /// _(minecraft:repeating_command_block)_
  static const Block repeating_command_block =
      Block('minecraft:repeating_command_block');

  /// [Chain Command Block](https://minecraft.gamepedia.com/chain_command_block)
  ///
  /// _(minecraft:chain_command_block)_
  static const Block chain_command_block =
      Block('minecraft:chain_command_block');

  /// [Frosted Ice](https://minecraft.gamepedia.com/frosted_ice)
  ///
  /// _(minecraft:frosted_ice)_
  static const Block frosted_ice = Block('minecraft:frosted_ice');

  /// [Magma Block](https://minecraft.gamepedia.com/magma_block)
  ///
  /// _(minecraft:magma_block)_
  static const Block magma_block = Block('minecraft:magma_block');

  /// [Nether Wart Block](https://minecraft.gamepedia.com/nether_wart_block)
  ///
  /// _(minecraft:nether_wart_block)_
  static const Block nether_wart_block = Block('minecraft:nether_wart_block');

  /// [Red Nether Bricks](https://minecraft.gamepedia.com/red_nether_bricks)
  ///
  /// _(minecraft:red_nether_bricks)_
  static const Block red_nether_bricks = Block('minecraft:red_nether_bricks');

  /// [Bone Block](https://minecraft.gamepedia.com/bone_block)
  ///
  /// _(minecraft:bone_block)_
  static const Block bone_block = Block('minecraft:bone_block');

  /// [Structure Void](https://minecraft.gamepedia.com/structure_void)
  ///
  /// _(minecraft:structure_void)_
  static const Block structure_void = Block('minecraft:structure_void');

  /// [Observer](https://minecraft.gamepedia.com/observer)
  ///
  /// _(minecraft:observer)_
  static const Block observer = Block('minecraft:observer');

  /// [Shulker Box](https://minecraft.gamepedia.com/shulker_box)
  ///
  /// _(minecraft:shulker_box)_
  static const Block shulker_box = Block('minecraft:shulker_box');

  /// [White Shulker Box](https://minecraft.gamepedia.com/white_shulker_box)
  ///
  /// _(minecraft:white_shulker_box)_
  static const Block white_shulker_box = Block('minecraft:white_shulker_box');

  /// [Orange Shulker Box](https://minecraft.gamepedia.com/orange_shulker_box)
  ///
  /// _(minecraft:orange_shulker_box)_
  static const Block orange_shulker_box = Block('minecraft:orange_shulker_box');

  /// [Magenta Shulker Box](https://minecraft.gamepedia.com/magenta_shulker_box)
  ///
  /// _(minecraft:magenta_shulker_box)_
  static const Block magenta_shulker_box =
      Block('minecraft:magenta_shulker_box');

  /// [Light Blue Shulker Box](https://minecraft.gamepedia.com/light_blue_shulker_box)
  ///
  /// _(minecraft:light_blue_shulker_box)_
  static const Block light_blue_shulker_box =
      Block('minecraft:light_blue_shulker_box');

  /// [Yellow Shulker Box](https://minecraft.gamepedia.com/yellow_shulker_box)
  ///
  /// _(minecraft:yellow_shulker_box)_
  static const Block yellow_shulker_box = Block('minecraft:yellow_shulker_box');

  /// [Lime Shulker Box](https://minecraft.gamepedia.com/lime_shulker_box)
  ///
  /// _(minecraft:lime_shulker_box)_
  static const Block lime_shulker_box = Block('minecraft:lime_shulker_box');

  /// [Pink Shulker Box](https://minecraft.gamepedia.com/pink_shulker_box)
  ///
  /// _(minecraft:pink_shulker_box)_
  static const Block pink_shulker_box = Block('minecraft:pink_shulker_box');

  /// [Gray Shulker Box](https://minecraft.gamepedia.com/gray_shulker_box)
  ///
  /// _(minecraft:gray_shulker_box)_
  static const Block gray_shulker_box = Block('minecraft:gray_shulker_box');

  /// [Light Gray Shulker Box](https://minecraft.gamepedia.com/light_gray_shulker_box)
  ///
  /// _(minecraft:light_gray_shulker_box)_
  static const Block light_gray_shulker_box =
      Block('minecraft:light_gray_shulker_box');

  /// [Cyan Shulker Box](https://minecraft.gamepedia.com/cyan_shulker_box)
  ///
  /// _(minecraft:cyan_shulker_box)_
  static const Block cyan_shulker_box = Block('minecraft:cyan_shulker_box');

  /// [Purple Shulker Box](https://minecraft.gamepedia.com/purple_shulker_box)
  ///
  /// _(minecraft:purple_shulker_box)_
  static const Block purple_shulker_box = Block('minecraft:purple_shulker_box');

  /// [Blue Shulker Box](https://minecraft.gamepedia.com/blue_shulker_box)
  ///
  /// _(minecraft:blue_shulker_box)_
  static const Block blue_shulker_box = Block('minecraft:blue_shulker_box');

  /// [Brown Shulker Box](https://minecraft.gamepedia.com/brown_shulker_box)
  ///
  /// _(minecraft:brown_shulker_box)_
  static const Block brown_shulker_box = Block('minecraft:brown_shulker_box');

  /// [Green Shulker Box](https://minecraft.gamepedia.com/green_shulker_box)
  ///
  /// _(minecraft:green_shulker_box)_
  static const Block green_shulker_box = Block('minecraft:green_shulker_box');

  /// [Red Shulker Box](https://minecraft.gamepedia.com/red_shulker_box)
  ///
  /// _(minecraft:red_shulker_box)_
  static const Block red_shulker_box = Block('minecraft:red_shulker_box');

  /// [Black Shulker Box](https://minecraft.gamepedia.com/black_shulker_box)
  ///
  /// _(minecraft:black_shulker_box)_
  static const Block black_shulker_box = Block('minecraft:black_shulker_box');

  /// [White Glazed Terracotta](https://minecraft.gamepedia.com/white_glazed_terracotta)
  ///
  /// _(minecraft:white_glazed_terracotta)_
  static const Block white_glazed_terracotta =
      Block('minecraft:white_glazed_terracotta');

  /// [Orange Glazed Terracotta](https://minecraft.gamepedia.com/orange_glazed_terracotta)
  ///
  /// _(minecraft:orange_glazed_terracotta)_
  static const Block orange_glazed_terracotta =
      Block('minecraft:orange_glazed_terracotta');

  /// [Magenta Glazed Terracotta](https://minecraft.gamepedia.com/magenta_glazed_terracotta)
  ///
  /// _(minecraft:magenta_glazed_terracotta)_
  static const Block magenta_glazed_terracotta =
      Block('minecraft:magenta_glazed_terracotta');

  /// [Light Blue Glazed Terracotta](https://minecraft.gamepedia.com/light_blue_glazed_terracotta)
  ///
  /// _(minecraft:light_blue_glazed_terracotta)_
  static const Block light_blue_glazed_terracotta =
      Block('minecraft:light_blue_glazed_terracotta');

  /// [Yellow Glazed Terracotta](https://minecraft.gamepedia.com/yellow_glazed_terracotta)
  ///
  /// _(minecraft:yellow_glazed_terracotta)_
  static const Block yellow_glazed_terracotta =
      Block('minecraft:yellow_glazed_terracotta');

  /// [Lime Glazed Terracotta](https://minecraft.gamepedia.com/lime_glazed_terracotta)
  ///
  /// _(minecraft:lime_glazed_terracotta)_
  static const Block lime_glazed_terracotta =
      Block('minecraft:lime_glazed_terracotta');

  /// [Pink Glazed Terracotta](https://minecraft.gamepedia.com/pink_glazed_terracotta)
  ///
  /// _(minecraft:pink_glazed_terracotta)_
  static const Block pink_glazed_terracotta =
      Block('minecraft:pink_glazed_terracotta');

  /// [Gray Glazed Terracotta](https://minecraft.gamepedia.com/gray_glazed_terracotta)
  ///
  /// _(minecraft:gray_glazed_terracotta)_
  static const Block gray_glazed_terracotta =
      Block('minecraft:gray_glazed_terracotta');

  /// [Light Gray Glazed Terracotta](https://minecraft.gamepedia.com/light_gray_glazed_terracotta)
  ///
  /// _(minecraft:light_gray_glazed_terracotta)_
  static const Block light_gray_glazed_terracotta =
      Block('minecraft:light_gray_glazed_terracotta');

  /// [Cyan Glazed Terracotta](https://minecraft.gamepedia.com/cyan_glazed_terracotta)
  ///
  /// _(minecraft:cyan_glazed_terracotta)_
  static const Block cyan_glazed_terracotta =
      Block('minecraft:cyan_glazed_terracotta');

  /// [Purple Glazed Terracotta](https://minecraft.gamepedia.com/purple_glazed_terracotta)
  ///
  /// _(minecraft:purple_glazed_terracotta)_
  static const Block purple_glazed_terracotta =
      Block('minecraft:purple_glazed_terracotta');

  /// [Blue Glazed Terracotta](https://minecraft.gamepedia.com/blue_glazed_terracotta)
  ///
  /// _(minecraft:blue_glazed_terracotta)_
  static const Block blue_glazed_terracotta =
      Block('minecraft:blue_glazed_terracotta');

  /// [Brown Glazed Terracotta](https://minecraft.gamepedia.com/brown_glazed_terracotta)
  ///
  /// _(minecraft:brown_glazed_terracotta)_
  static const Block brown_glazed_terracotta =
      Block('minecraft:brown_glazed_terracotta');

  /// [Green Glazed Terracotta](https://minecraft.gamepedia.com/green_glazed_terracotta)
  ///
  /// _(minecraft:green_glazed_terracotta)_
  static const Block green_glazed_terracotta =
      Block('minecraft:green_glazed_terracotta');

  /// [Red Glazed Terracotta](https://minecraft.gamepedia.com/red_glazed_terracotta)
  ///
  /// _(minecraft:red_glazed_terracotta)_
  static const Block red_glazed_terracotta =
      Block('minecraft:red_glazed_terracotta');

  /// [Black Glazed Terracotta](https://minecraft.gamepedia.com/black_glazed_terracotta)
  ///
  /// _(minecraft:black_glazed_terracotta)_
  static const Block black_glazed_terracotta =
      Block('minecraft:black_glazed_terracotta');

  /// [White Concrete](https://minecraft.gamepedia.com/white_concrete)
  ///
  /// _(minecraft:white_concrete)_
  static const Block white_concrete = Block('minecraft:white_concrete');

  /// [Orange Concrete](https://minecraft.gamepedia.com/orange_concrete)
  ///
  /// _(minecraft:orange_concrete)_
  static const Block orange_concrete = Block('minecraft:orange_concrete');

  /// [Magenta Concrete](https://minecraft.gamepedia.com/magenta_concrete)
  ///
  /// _(minecraft:magenta_concrete)_
  static const Block magenta_concrete = Block('minecraft:magenta_concrete');

  /// [Light Blue Concrete](https://minecraft.gamepedia.com/light_blue_concrete)
  ///
  /// _(minecraft:light_blue_concrete)_
  static const Block light_blue_concrete =
      Block('minecraft:light_blue_concrete');

  /// [Yellow Concrete](https://minecraft.gamepedia.com/yellow_concrete)
  ///
  /// _(minecraft:yellow_concrete)_
  static const Block yellow_concrete = Block('minecraft:yellow_concrete');

  /// [Lime Concrete](https://minecraft.gamepedia.com/lime_concrete)
  ///
  /// _(minecraft:lime_concrete)_
  static const Block lime_concrete = Block('minecraft:lime_concrete');

  /// [Pink Concrete](https://minecraft.gamepedia.com/pink_concrete)
  ///
  /// _(minecraft:pink_concrete)_
  static const Block pink_concrete = Block('minecraft:pink_concrete');

  /// [Gray Concrete](https://minecraft.gamepedia.com/gray_concrete)
  ///
  /// _(minecraft:gray_concrete)_
  static const Block gray_concrete = Block('minecraft:gray_concrete');

  /// [Light Gray Concrete](https://minecraft.gamepedia.com/light_gray_concrete)
  ///
  /// _(minecraft:light_gray_concrete)_
  static const Block light_gray_concrete =
      Block('minecraft:light_gray_concrete');

  /// [Cyan Concrete](https://minecraft.gamepedia.com/cyan_concrete)
  ///
  /// _(minecraft:cyan_concrete)_
  static const Block cyan_concrete = Block('minecraft:cyan_concrete');

  /// [Purple Concrete](https://minecraft.gamepedia.com/purple_concrete)
  ///
  /// _(minecraft:purple_concrete)_
  static const Block purple_concrete = Block('minecraft:purple_concrete');

  /// [Blue Concrete](https://minecraft.gamepedia.com/blue_concrete)
  ///
  /// _(minecraft:blue_concrete)_
  static const Block blue_concrete = Block('minecraft:blue_concrete');

  /// [Brown Concrete](https://minecraft.gamepedia.com/brown_concrete)
  ///
  /// _(minecraft:brown_concrete)_
  static const Block brown_concrete = Block('minecraft:brown_concrete');

  /// [Green Concrete](https://minecraft.gamepedia.com/green_concrete)
  ///
  /// _(minecraft:green_concrete)_
  static const Block green_concrete = Block('minecraft:green_concrete');

  /// [Red Concrete](https://minecraft.gamepedia.com/red_concrete)
  ///
  /// _(minecraft:red_concrete)_
  static const Block red_concrete = Block('minecraft:red_concrete');

  /// [Black Concrete](https://minecraft.gamepedia.com/black_concrete)
  ///
  /// _(minecraft:black_concrete)_
  static const Block black_concrete = Block('minecraft:black_concrete');

  /// [White Concrete Powder](https://minecraft.gamepedia.com/white_concrete_powder)
  ///
  /// _(minecraft:white_concrete_powder)_
  static const Block white_concrete_powder =
      Block('minecraft:white_concrete_powder');

  /// [Orange Concrete Powder](https://minecraft.gamepedia.com/orange_concrete_powder)
  ///
  /// _(minecraft:orange_concrete_powder)_
  static const Block orange_concrete_powder =
      Block('minecraft:orange_concrete_powder');

  /// [Magenta Concrete Powder](https://minecraft.gamepedia.com/magenta_concrete_powder)
  ///
  /// _(minecraft:magenta_concrete_powder)_
  static const Block magenta_concrete_powder =
      Block('minecraft:magenta_concrete_powder');

  /// [Light Blue Concrete Powder](https://minecraft.gamepedia.com/light_blue_concrete_powder)
  ///
  /// _(minecraft:light_blue_concrete_powder)_
  static const Block light_blue_concrete_powder =
      Block('minecraft:light_blue_concrete_powder');

  /// [Yellow Concrete Powder](https://minecraft.gamepedia.com/yellow_concrete_powder)
  ///
  /// _(minecraft:yellow_concrete_powder)_
  static const Block yellow_concrete_powder =
      Block('minecraft:yellow_concrete_powder');

  /// [Lime Concrete Powder](https://minecraft.gamepedia.com/lime_concrete_powder)
  ///
  /// _(minecraft:lime_concrete_powder)_
  static const Block lime_concrete_powder =
      Block('minecraft:lime_concrete_powder');

  /// [Pink Concrete Powder](https://minecraft.gamepedia.com/pink_concrete_powder)
  ///
  /// _(minecraft:pink_concrete_powder)_
  static const Block pink_concrete_powder =
      Block('minecraft:pink_concrete_powder');

  /// [Gray Concrete Powder](https://minecraft.gamepedia.com/gray_concrete_powder)
  ///
  /// _(minecraft:gray_concrete_powder)_
  static const Block gray_concrete_powder =
      Block('minecraft:gray_concrete_powder');

  /// [Light Gray Concrete Powder](https://minecraft.gamepedia.com/light_gray_concrete_powder)
  ///
  /// _(minecraft:light_gray_concrete_powder)_
  static const Block light_gray_concrete_powder =
      Block('minecraft:light_gray_concrete_powder');

  /// [Cyan Concrete Powder](https://minecraft.gamepedia.com/cyan_concrete_powder)
  ///
  /// _(minecraft:cyan_concrete_powder)_
  static const Block cyan_concrete_powder =
      Block('minecraft:cyan_concrete_powder');

  /// [Purple Concrete Powder](https://minecraft.gamepedia.com/purple_concrete_powder)
  ///
  /// _(minecraft:purple_concrete_powder)_
  static const Block purple_concrete_powder =
      Block('minecraft:purple_concrete_powder');

  /// [Blue Concrete Powder](https://minecraft.gamepedia.com/blue_concrete_powder)
  ///
  /// _(minecraft:blue_concrete_powder)_
  static const Block blue_concrete_powder =
      Block('minecraft:blue_concrete_powder');

  /// [Brown Concrete Powder](https://minecraft.gamepedia.com/brown_concrete_powder)
  ///
  /// _(minecraft:brown_concrete_powder)_
  static const Block brown_concrete_powder =
      Block('minecraft:brown_concrete_powder');

  /// [Green Concrete Powder](https://minecraft.gamepedia.com/green_concrete_powder)
  ///
  /// _(minecraft:green_concrete_powder)_
  static const Block green_concrete_powder =
      Block('minecraft:green_concrete_powder');

  /// [Red Concrete Powder](https://minecraft.gamepedia.com/red_concrete_powder)
  ///
  /// _(minecraft:red_concrete_powder)_
  static const Block red_concrete_powder =
      Block('minecraft:red_concrete_powder');

  /// [Black Concrete Powder](https://minecraft.gamepedia.com/black_concrete_powder)
  ///
  /// _(minecraft:black_concrete_powder)_
  static const Block black_concrete_powder =
      Block('minecraft:black_concrete_powder');

  /// [Kelp](https://minecraft.gamepedia.com/kelp)
  ///
  /// _(minecraft:kelp)_
  static const Block kelp = Block('minecraft:kelp');

  /// [Kelp Plant](https://minecraft.gamepedia.com/kelp_plant)
  ///
  /// _(minecraft:kelp_plant)_
  static const Block kelp_plant = Block('minecraft:kelp_plant');

  /// [Dried Kelp Block](https://minecraft.gamepedia.com/dried_kelp_block)
  ///
  /// _(minecraft:dried_kelp_block)_
  static const Block dried_kelp_block = Block('minecraft:dried_kelp_block');

  /// [Turtle Egg](https://minecraft.gamepedia.com/turtle_egg)
  ///
  /// _(minecraft:turtle_egg)_
  static const Block turtle_egg = Block('minecraft:turtle_egg');

  /// [Dead Tube Coral Block](https://minecraft.gamepedia.com/dead_tube_coral_block)
  ///
  /// _(minecraft:dead_tube_coral_block)_
  static const Block dead_tube_coral_block =
      Block('minecraft:dead_tube_coral_block');

  /// [Dead Brain Coral Block](https://minecraft.gamepedia.com/dead_brain_coral_block)
  ///
  /// _(minecraft:dead_brain_coral_block)_
  static const Block dead_brain_coral_block =
      Block('minecraft:dead_brain_coral_block');

  /// [Dead Bubble Coral Block](https://minecraft.gamepedia.com/dead_bubble_coral_block)
  ///
  /// _(minecraft:dead_bubble_coral_block)_
  static const Block dead_bubble_coral_block =
      Block('minecraft:dead_bubble_coral_block');

  /// [Dead Fire Coral Block](https://minecraft.gamepedia.com/dead_fire_coral_block)
  ///
  /// _(minecraft:dead_fire_coral_block)_
  static const Block dead_fire_coral_block =
      Block('minecraft:dead_fire_coral_block');

  /// [Dead Horn Coral Block](https://minecraft.gamepedia.com/dead_horn_coral_block)
  ///
  /// _(minecraft:dead_horn_coral_block)_
  static const Block dead_horn_coral_block =
      Block('minecraft:dead_horn_coral_block');

  /// [Tube Coral Block](https://minecraft.gamepedia.com/tube_coral_block)
  ///
  /// _(minecraft:tube_coral_block)_
  static const Block tube_coral_block = Block('minecraft:tube_coral_block');

  /// [Brain Coral Block](https://minecraft.gamepedia.com/brain_coral_block)
  ///
  /// _(minecraft:brain_coral_block)_
  static const Block brain_coral_block = Block('minecraft:brain_coral_block');

  /// [Bubble Coral Block](https://minecraft.gamepedia.com/bubble_coral_block)
  ///
  /// _(minecraft:bubble_coral_block)_
  static const Block bubble_coral_block = Block('minecraft:bubble_coral_block');

  /// [Fire Coral Block](https://minecraft.gamepedia.com/fire_coral_block)
  ///
  /// _(minecraft:fire_coral_block)_
  static const Block fire_coral_block = Block('minecraft:fire_coral_block');

  /// [Horn Coral Block](https://minecraft.gamepedia.com/horn_coral_block)
  ///
  /// _(minecraft:horn_coral_block)_
  static const Block horn_coral_block = Block('minecraft:horn_coral_block');

  /// [Dead Tube Coral](https://minecraft.gamepedia.com/dead_tube_coral)
  ///
  /// _(minecraft:dead_tube_coral)_
  static const Block dead_tube_coral = Block('minecraft:dead_tube_coral');

  /// [Dead Brain Coral](https://minecraft.gamepedia.com/dead_brain_coral)
  ///
  /// _(minecraft:dead_brain_coral)_
  static const Block dead_brain_coral = Block('minecraft:dead_brain_coral');

  /// [Dead Bubble Coral](https://minecraft.gamepedia.com/dead_bubble_coral)
  ///
  /// _(minecraft:dead_bubble_coral)_
  static const Block dead_bubble_coral = Block('minecraft:dead_bubble_coral');

  /// [Dead Fire Coral](https://minecraft.gamepedia.com/dead_fire_coral)
  ///
  /// _(minecraft:dead_fire_coral)_
  static const Block dead_fire_coral = Block('minecraft:dead_fire_coral');

  /// [Dead Horn Coral](https://minecraft.gamepedia.com/dead_horn_coral)
  ///
  /// _(minecraft:dead_horn_coral)_
  static const Block dead_horn_coral = Block('minecraft:dead_horn_coral');

  /// [Tube Coral](https://minecraft.gamepedia.com/tube_coral)
  ///
  /// _(minecraft:tube_coral)_
  static const Block tube_coral = Block('minecraft:tube_coral');

  /// [Brain Coral](https://minecraft.gamepedia.com/brain_coral)
  ///
  /// _(minecraft:brain_coral)_
  static const Block brain_coral = Block('minecraft:brain_coral');

  /// [Bubble Coral](https://minecraft.gamepedia.com/bubble_coral)
  ///
  /// _(minecraft:bubble_coral)_
  static const Block bubble_coral = Block('minecraft:bubble_coral');

  /// [Fire Coral](https://minecraft.gamepedia.com/fire_coral)
  ///
  /// _(minecraft:fire_coral)_
  static const Block fire_coral = Block('minecraft:fire_coral');

  /// [Horn Coral](https://minecraft.gamepedia.com/horn_coral)
  ///
  /// _(minecraft:horn_coral)_
  static const Block horn_coral = Block('minecraft:horn_coral');

  /// [Dead Tube Coral Fan](https://minecraft.gamepedia.com/dead_tube_coral_fan)
  ///
  /// _(minecraft:dead_tube_coral_fan)_
  static const Block dead_tube_coral_fan =
      Block('minecraft:dead_tube_coral_fan');

  /// [Dead Brain Coral Fan](https://minecraft.gamepedia.com/dead_brain_coral_fan)
  ///
  /// _(minecraft:dead_brain_coral_fan)_
  static const Block dead_brain_coral_fan =
      Block('minecraft:dead_brain_coral_fan');

  /// [Dead Bubble Coral Fan](https://minecraft.gamepedia.com/dead_bubble_coral_fan)
  ///
  /// _(minecraft:dead_bubble_coral_fan)_
  static const Block dead_bubble_coral_fan =
      Block('minecraft:dead_bubble_coral_fan');

  /// [Dead Fire Coral Fan](https://minecraft.gamepedia.com/dead_fire_coral_fan)
  ///
  /// _(minecraft:dead_fire_coral_fan)_
  static const Block dead_fire_coral_fan =
      Block('minecraft:dead_fire_coral_fan');

  /// [Dead Horn Coral Fan](https://minecraft.gamepedia.com/dead_horn_coral_fan)
  ///
  /// _(minecraft:dead_horn_coral_fan)_
  static const Block dead_horn_coral_fan =
      Block('minecraft:dead_horn_coral_fan');

  /// [Tube Coral Fan](https://minecraft.gamepedia.com/tube_coral_fan)
  ///
  /// _(minecraft:tube_coral_fan)_
  static const Block tube_coral_fan = Block('minecraft:tube_coral_fan');

  /// [Brain Coral Fan](https://minecraft.gamepedia.com/brain_coral_fan)
  ///
  /// _(minecraft:brain_coral_fan)_
  static const Block brain_coral_fan = Block('minecraft:brain_coral_fan');

  /// [Bubble Coral Fan](https://minecraft.gamepedia.com/bubble_coral_fan)
  ///
  /// _(minecraft:bubble_coral_fan)_
  static const Block bubble_coral_fan = Block('minecraft:bubble_coral_fan');

  /// [Fire Coral Fan](https://minecraft.gamepedia.com/fire_coral_fan)
  ///
  /// _(minecraft:fire_coral_fan)_
  static const Block fire_coral_fan = Block('minecraft:fire_coral_fan');

  /// [Horn Coral Fan](https://minecraft.gamepedia.com/horn_coral_fan)
  ///
  /// _(minecraft:horn_coral_fan)_
  static const Block horn_coral_fan = Block('minecraft:horn_coral_fan');

  /// [Dead Tube Coral Wall Fan](https://minecraft.gamepedia.com/dead_tube_coral_wall_fan)
  ///
  /// _(minecraft:dead_tube_coral_wall_fan)_
  static const Block dead_tube_coral_wall_fan =
      Block('minecraft:dead_tube_coral_wall_fan');

  /// [Dead Brain Coral Wall Fan](https://minecraft.gamepedia.com/dead_brain_coral_wall_fan)
  ///
  /// _(minecraft:dead_brain_coral_wall_fan)_
  static const Block dead_brain_coral_wall_fan =
      Block('minecraft:dead_brain_coral_wall_fan');

  /// [Dead Bubble Coral Wall Fan](https://minecraft.gamepedia.com/dead_bubble_coral_wall_fan)
  ///
  /// _(minecraft:dead_bubble_coral_wall_fan)_
  static const Block dead_bubble_coral_wall_fan =
      Block('minecraft:dead_bubble_coral_wall_fan');

  /// [Dead Fire Coral Wall Fan](https://minecraft.gamepedia.com/dead_fire_coral_wall_fan)
  ///
  /// _(minecraft:dead_fire_coral_wall_fan)_
  static const Block dead_fire_coral_wall_fan =
      Block('minecraft:dead_fire_coral_wall_fan');

  /// [Dead Horn Coral Wall Fan](https://minecraft.gamepedia.com/dead_horn_coral_wall_fan)
  ///
  /// _(minecraft:dead_horn_coral_wall_fan)_
  static const Block dead_horn_coral_wall_fan =
      Block('minecraft:dead_horn_coral_wall_fan');

  /// [Tube Coral Wall Fan](https://minecraft.gamepedia.com/tube_coral_wall_fan)
  ///
  /// _(minecraft:tube_coral_wall_fan)_
  static const Block tube_coral_wall_fan =
      Block('minecraft:tube_coral_wall_fan');

  /// [Brain Coral Wall Fan](https://minecraft.gamepedia.com/brain_coral_wall_fan)
  ///
  /// _(minecraft:brain_coral_wall_fan)_
  static const Block brain_coral_wall_fan =
      Block('minecraft:brain_coral_wall_fan');

  /// [Bubble Coral Wall Fan](https://minecraft.gamepedia.com/bubble_coral_wall_fan)
  ///
  /// _(minecraft:bubble_coral_wall_fan)_
  static const Block bubble_coral_wall_fan =
      Block('minecraft:bubble_coral_wall_fan');

  /// [Fire Coral Wall Fan](https://minecraft.gamepedia.com/fire_coral_wall_fan)
  ///
  /// _(minecraft:fire_coral_wall_fan)_
  static const Block fire_coral_wall_fan =
      Block('minecraft:fire_coral_wall_fan');

  /// [Horn Coral Wall Fan](https://minecraft.gamepedia.com/horn_coral_wall_fan)
  ///
  /// _(minecraft:horn_coral_wall_fan)_
  static const Block horn_coral_wall_fan =
      Block('minecraft:horn_coral_wall_fan');

  /// [Sea Pickle](https://minecraft.gamepedia.com/sea_pickle)
  ///
  /// _(minecraft:sea_pickle)_
  static const Block sea_pickle = Block('minecraft:sea_pickle');

  /// [Blue Ice](https://minecraft.gamepedia.com/blue_ice)
  ///
  /// _(minecraft:blue_ice)_
  static const Block blue_ice = Block('minecraft:blue_ice');

  /// [Conduit](https://minecraft.gamepedia.com/conduit)
  ///
  /// _(minecraft:conduit)_
  static const Block conduit = Block('minecraft:conduit');

  /// [Bamboo Sapling](https://minecraft.gamepedia.com/bamboo_sapling)
  ///
  /// _(minecraft:bamboo_sapling)_
  static const Block bamboo_sapling = Block('minecraft:bamboo_sapling');

  /// [Bamboo](https://minecraft.gamepedia.com/bamboo)
  ///
  /// _(minecraft:bamboo)_
  static const Block bamboo = Block('minecraft:bamboo');

  /// [Potted Bamboo](https://minecraft.gamepedia.com/potted_bamboo)
  ///
  /// _(minecraft:potted_bamboo)_
  static const Block potted_bamboo = Block('minecraft:potted_bamboo');

  /// [Void Air](https://minecraft.gamepedia.com/void_air)
  ///
  /// _(minecraft:void_air)_
  static const Block void_air = Block('minecraft:void_air');

  /// [Cave Air](https://minecraft.gamepedia.com/cave_air)
  ///
  /// _(minecraft:cave_air)_
  static const Block cave_air = Block('minecraft:cave_air');

  /// [Bubble Column](https://minecraft.gamepedia.com/bubble_column)
  ///
  /// _(minecraft:bubble_column)_
  static const Block bubble_column = Block('minecraft:bubble_column');

  /// [Polished Granite Stairs](https://minecraft.gamepedia.com/polished_granite_stairs)
  ///
  /// _(minecraft:polished_granite_stairs)_
  static const Block polished_granite_stairs =
      Block('minecraft:polished_granite_stairs');

  /// [Smooth Red Sandstone Stairs](https://minecraft.gamepedia.com/smooth_red_sandstone_stairs)
  ///
  /// _(minecraft:smooth_red_sandstone_stairs)_
  static const Block smooth_red_sandstone_stairs =
      Block('minecraft:smooth_red_sandstone_stairs');

  /// [Mossy Stone Brick Stairs](https://minecraft.gamepedia.com/mossy_stone_brick_stairs)
  ///
  /// _(minecraft:mossy_stone_brick_stairs)_
  static const Block mossy_stone_brick_stairs =
      Block('minecraft:mossy_stone_brick_stairs');

  /// [Polished Diorite Stairs](https://minecraft.gamepedia.com/polished_diorite_stairs)
  ///
  /// _(minecraft:polished_diorite_stairs)_
  static const Block polished_diorite_stairs =
      Block('minecraft:polished_diorite_stairs');

  /// [Mossy Cobblestone Stairs](https://minecraft.gamepedia.com/mossy_cobblestone_stairs)
  ///
  /// _(minecraft:mossy_cobblestone_stairs)_
  static const Block mossy_cobblestone_stairs =
      Block('minecraft:mossy_cobblestone_stairs');

  /// [End Stone Brick Stairs](https://minecraft.gamepedia.com/end_stone_brick_stairs)
  ///
  /// _(minecraft:end_stone_brick_stairs)_
  static const Block end_stone_brick_stairs =
      Block('minecraft:end_stone_brick_stairs');

  /// [Stone Stairs](https://minecraft.gamepedia.com/stone_stairs)
  ///
  /// _(minecraft:stone_stairs)_
  static const Block stone_stairs = Block('minecraft:stone_stairs');

  /// [Smooth Sandstone Stairs](https://minecraft.gamepedia.com/smooth_sandstone_stairs)
  ///
  /// _(minecraft:smooth_sandstone_stairs)_
  static const Block smooth_sandstone_stairs =
      Block('minecraft:smooth_sandstone_stairs');

  /// [Smooth Quartz Stairs](https://minecraft.gamepedia.com/smooth_quartz_stairs)
  ///
  /// _(minecraft:smooth_quartz_stairs)_
  static const Block smooth_quartz_stairs =
      Block('minecraft:smooth_quartz_stairs');

  /// [Granite Stairs](https://minecraft.gamepedia.com/granite_stairs)
  ///
  /// _(minecraft:granite_stairs)_
  static const Block granite_stairs = Block('minecraft:granite_stairs');

  /// [Andesite Stairs](https://minecraft.gamepedia.com/andesite_stairs)
  ///
  /// _(minecraft:andesite_stairs)_
  static const Block andesite_stairs = Block('minecraft:andesite_stairs');

  /// [Red Nether Brick Stairs](https://minecraft.gamepedia.com/red_nether_brick_stairs)
  ///
  /// _(minecraft:red_nether_brick_stairs)_
  static const Block red_nether_brick_stairs =
      Block('minecraft:red_nether_brick_stairs');

  /// [Polished Andesite Stairs](https://minecraft.gamepedia.com/polished_andesite_stairs)
  ///
  /// _(minecraft:polished_andesite_stairs)_
  static const Block polished_andesite_stairs =
      Block('minecraft:polished_andesite_stairs');

  /// [Diorite Stairs](https://minecraft.gamepedia.com/diorite_stairs)
  ///
  /// _(minecraft:diorite_stairs)_
  static const Block diorite_stairs = Block('minecraft:diorite_stairs');

  /// [Polished Granite Slab](https://minecraft.gamepedia.com/polished_granite_slab)
  ///
  /// _(minecraft:polished_granite_slab)_
  static const Block polished_granite_slab =
      Block('minecraft:polished_granite_slab');

  /// [Smooth Red Sandstone Slab](https://minecraft.gamepedia.com/smooth_red_sandstone_slab)
  ///
  /// _(minecraft:smooth_red_sandstone_slab)_
  static const Block smooth_red_sandstone_slab =
      Block('minecraft:smooth_red_sandstone_slab');

  /// [Mossy Stone Brick Slab](https://minecraft.gamepedia.com/mossy_stone_brick_slab)
  ///
  /// _(minecraft:mossy_stone_brick_slab)_
  static const Block mossy_stone_brick_slab =
      Block('minecraft:mossy_stone_brick_slab');

  /// [Polished Diorite Slab](https://minecraft.gamepedia.com/polished_diorite_slab)
  ///
  /// _(minecraft:polished_diorite_slab)_
  static const Block polished_diorite_slab =
      Block('minecraft:polished_diorite_slab');

  /// [Mossy Cobblestone Slab](https://minecraft.gamepedia.com/mossy_cobblestone_slab)
  ///
  /// _(minecraft:mossy_cobblestone_slab)_
  static const Block mossy_cobblestone_slab =
      Block('minecraft:mossy_cobblestone_slab');

  /// [End Stone Brick Slab](https://minecraft.gamepedia.com/end_stone_brick_slab)
  ///
  /// _(minecraft:end_stone_brick_slab)_
  static const Block end_stone_brick_slab =
      Block('minecraft:end_stone_brick_slab');

  /// [Smooth Sandstone Slab](https://minecraft.gamepedia.com/smooth_sandstone_slab)
  ///
  /// _(minecraft:smooth_sandstone_slab)_
  static const Block smooth_sandstone_slab =
      Block('minecraft:smooth_sandstone_slab');

  /// [Smooth Quartz Slab](https://minecraft.gamepedia.com/smooth_quartz_slab)
  ///
  /// _(minecraft:smooth_quartz_slab)_
  static const Block smooth_quartz_slab = Block('minecraft:smooth_quartz_slab');

  /// [Granite Slab](https://minecraft.gamepedia.com/granite_slab)
  ///
  /// _(minecraft:granite_slab)_
  static const Block granite_slab = Block('minecraft:granite_slab');

  /// [Andesite Slab](https://minecraft.gamepedia.com/andesite_slab)
  ///
  /// _(minecraft:andesite_slab)_
  static const Block andesite_slab = Block('minecraft:andesite_slab');

  /// [Red Nether Brick Slab](https://minecraft.gamepedia.com/red_nether_brick_slab)
  ///
  /// _(minecraft:red_nether_brick_slab)_
  static const Block red_nether_brick_slab =
      Block('minecraft:red_nether_brick_slab');

  /// [Polished Andesite Slab](https://minecraft.gamepedia.com/polished_andesite_slab)
  ///
  /// _(minecraft:polished_andesite_slab)_
  static const Block polished_andesite_slab =
      Block('minecraft:polished_andesite_slab');

  /// [Diorite Slab](https://minecraft.gamepedia.com/diorite_slab)
  ///
  /// _(minecraft:diorite_slab)_
  static const Block diorite_slab = Block('minecraft:diorite_slab');

  /// [Brick Wall](https://minecraft.gamepedia.com/brick_wall)
  ///
  /// _(minecraft:brick_wall)_
  static const Block brick_wall = Block('minecraft:brick_wall');

  /// [Prismarine Wall](https://minecraft.gamepedia.com/prismarine_wall)
  ///
  /// _(minecraft:prismarine_wall)_
  static const Block prismarine_wall = Block('minecraft:prismarine_wall');

  /// [Red Sandstone Wall](https://minecraft.gamepedia.com/red_sandstone_wall)
  ///
  /// _(minecraft:red_sandstone_wall)_
  static const Block red_sandstone_wall = Block('minecraft:red_sandstone_wall');

  /// [Mossy Stone Brick Wall](https://minecraft.gamepedia.com/mossy_stone_brick_wall)
  ///
  /// _(minecraft:mossy_stone_brick_wall)_
  static const Block mossy_stone_brick_wall =
      Block('minecraft:mossy_stone_brick_wall');

  /// [Granite Wall](https://minecraft.gamepedia.com/granite_wall)
  ///
  /// _(minecraft:granite_wall)_
  static const Block granite_wall = Block('minecraft:granite_wall');

  /// [Stone Brick Wall](https://minecraft.gamepedia.com/stone_brick_wall)
  ///
  /// _(minecraft:stone_brick_wall)_
  static const Block stone_brick_wall = Block('minecraft:stone_brick_wall');

  /// [Nether Brick Wall](https://minecraft.gamepedia.com/nether_brick_wall)
  ///
  /// _(minecraft:nether_brick_wall)_
  static const Block nether_brick_wall = Block('minecraft:nether_brick_wall');

  /// [Andesite Wall](https://minecraft.gamepedia.com/andesite_wall)
  ///
  /// _(minecraft:andesite_wall)_
  static const Block andesite_wall = Block('minecraft:andesite_wall');

  /// [Red Nether Brick Wall](https://minecraft.gamepedia.com/red_nether_brick_wall)
  ///
  /// _(minecraft:red_nether_brick_wall)_
  static const Block red_nether_brick_wall =
      Block('minecraft:red_nether_brick_wall');

  /// [Sandstone Wall](https://minecraft.gamepedia.com/sandstone_wall)
  ///
  /// _(minecraft:sandstone_wall)_
  static const Block sandstone_wall = Block('minecraft:sandstone_wall');

  /// [End Stone Brick Wall](https://minecraft.gamepedia.com/end_stone_brick_wall)
  ///
  /// _(minecraft:end_stone_brick_wall)_
  static const Block end_stone_brick_wall =
      Block('minecraft:end_stone_brick_wall');

  /// [Diorite Wall](https://minecraft.gamepedia.com/diorite_wall)
  ///
  /// _(minecraft:diorite_wall)_
  static const Block diorite_wall = Block('minecraft:diorite_wall');

  /// [Scaffolding](https://minecraft.gamepedia.com/scaffolding)
  ///
  /// _(minecraft:scaffolding)_
  static const Block scaffolding = Block('minecraft:scaffolding');

  /// [Loom](https://minecraft.gamepedia.com/loom)
  ///
  /// _(minecraft:loom)_
  static const Block loom = Block('minecraft:loom');

  /// [Barrel](https://minecraft.gamepedia.com/barrel)
  ///
  /// _(minecraft:barrel)_
  static const Block barrel = Block('minecraft:barrel');

  /// [Smoker](https://minecraft.gamepedia.com/smoker)
  ///
  /// _(minecraft:smoker)_
  static const Block smoker = Block('minecraft:smoker');

  /// [Blast Furnace](https://minecraft.gamepedia.com/blast_furnace)
  ///
  /// _(minecraft:blast_furnace)_
  static const Block blast_furnace = Block('minecraft:blast_furnace');

  /// [Cartography Table](https://minecraft.gamepedia.com/cartography_table)
  ///
  /// _(minecraft:cartography_table)_
  static const Block cartography_table = Block('minecraft:cartography_table');

  /// [Fletching Table](https://minecraft.gamepedia.com/fletching_table)
  ///
  /// _(minecraft:fletching_table)_
  static const Block fletching_table = Block('minecraft:fletching_table');

  /// [Grindstone](https://minecraft.gamepedia.com/grindstone)
  ///
  /// _(minecraft:grindstone)_
  static const Block grindstone = Block('minecraft:grindstone');

  /// [Lectern](https://minecraft.gamepedia.com/lectern)
  ///
  /// _(minecraft:lectern)_
  static const Block lectern = Block('minecraft:lectern');

  /// [Smithing Table](https://minecraft.gamepedia.com/smithing_table)
  ///
  /// _(minecraft:smithing_table)_
  static const Block smithing_table = Block('minecraft:smithing_table');

  /// [Stonecutter](https://minecraft.gamepedia.com/stonecutter)
  ///
  /// _(minecraft:stonecutter)_
  static const Block stonecutter = Block('minecraft:stonecutter');

  /// [Bell](https://minecraft.gamepedia.com/bell)
  ///
  /// _(minecraft:bell)_
  static const Block bell = Block('minecraft:bell');

  /// [Lantern](https://minecraft.gamepedia.com/lantern)
  ///
  /// _(minecraft:lantern)_
  static const Block lantern = Block('minecraft:lantern');

  /// [Soul Fire Lantern](https://minecraft.gamepedia.com/soul_fire_lantern)
  ///
  /// _(minecraft:soul_fire_lantern)_
  static const Block soul_fire_lantern = Block('minecraft:soul_fire_lantern');

  /// [Campfire](https://minecraft.gamepedia.com/campfire)
  ///
  /// _(minecraft:campfire)_
  static const Block campfire = Block('minecraft:campfire');

  /// [Sweet Berry Bush](https://minecraft.gamepedia.com/sweet_berry_bush)
  ///
  /// _(minecraft:sweet_berry_bush)_
  static const Block sweet_berry_bush = Block('minecraft:sweet_berry_bush');

  /// [Warped Stem](https://minecraft.gamepedia.com/warped_stem)
  ///
  /// _(minecraft:warped_stem)_
  static const Block warped_stem = Block('minecraft:warped_stem');

  /// [Stripped Warped Stem](https://minecraft.gamepedia.com/stripped_warped_stem)
  ///
  /// _(minecraft:stripped_warped_stem)_
  static const Block stripped_warped_stem =
      Block('minecraft:stripped_warped_stem');

  /// [Warped Hyphae](https://minecraft.gamepedia.com/warped_hyphae)
  ///
  /// _(minecraft:warped_hyphae)_
  static const Block warped_hyphae = Block('minecraft:warped_hyphae');

  /// [Stripped Warped Hyphae](https://minecraft.gamepedia.com/stripped_warped_hyphae)
  ///
  /// _(minecraft:stripped_warped_hyphae)_
  static const Block stripped_warped_hyphae =
      Block('minecraft:stripped_warped_hyphae');

  /// [Warped Nylium](https://minecraft.gamepedia.com/warped_nylium)
  ///
  /// _(minecraft:warped_nylium)_
  static const Block warped_nylium = Block('minecraft:warped_nylium');

  /// [Warped Fungus](https://minecraft.gamepedia.com/warped_fungus)
  ///
  /// _(minecraft:warped_fungus)_
  static const Block warped_fungus = Block('minecraft:warped_fungus');

  /// [Warped Wart Block](https://minecraft.gamepedia.com/warped_wart_block)
  ///
  /// _(minecraft:warped_wart_block)_
  static const Block warped_wart_block = Block('minecraft:warped_wart_block');

  /// [Warped Roots](https://minecraft.gamepedia.com/warped_roots)
  ///
  /// _(minecraft:warped_roots)_
  static const Block warped_roots = Block('minecraft:warped_roots');

  /// [Nether Sprouts](https://minecraft.gamepedia.com/nether_sprouts)
  ///
  /// _(minecraft:nether_sprouts)_
  static const Block nether_sprouts = Block('minecraft:nether_sprouts');

  /// [Crimson Stem](https://minecraft.gamepedia.com/crimson_stem)
  ///
  /// _(minecraft:crimson_stem)_
  static const Block crimson_stem = Block('minecraft:crimson_stem');

  /// [Stripped Crimson Stem](https://minecraft.gamepedia.com/stripped_crimson_stem)
  ///
  /// _(minecraft:stripped_crimson_stem)_
  static const Block stripped_crimson_stem =
      Block('minecraft:stripped_crimson_stem');

  /// [Crimson Hyphae](https://minecraft.gamepedia.com/crimson_hyphae)
  ///
  /// _(minecraft:crimson_hyphae)_
  static const Block crimson_hyphae = Block('minecraft:crimson_hyphae');

  /// [Stripped Crimson Hyphae](https://minecraft.gamepedia.com/stripped_crimson_hyphae)
  ///
  /// _(minecraft:stripped_crimson_hyphae)_
  static const Block stripped_crimson_hyphae =
      Block('minecraft:stripped_crimson_hyphae');

  /// [Crimson Nylium](https://minecraft.gamepedia.com/crimson_nylium)
  ///
  /// _(minecraft:crimson_nylium)_
  static const Block crimson_nylium = Block('minecraft:crimson_nylium');

  /// [Crimson Fungus](https://minecraft.gamepedia.com/crimson_fungus)
  ///
  /// _(minecraft:crimson_fungus)_
  static const Block crimson_fungus = Block('minecraft:crimson_fungus');

  /// [Shroomlight](https://minecraft.gamepedia.com/shroomlight)
  ///
  /// _(minecraft:shroomlight)_
  static const Block shroomlight = Block('minecraft:shroomlight');

  /// [Weeping Vines](https://minecraft.gamepedia.com/weeping_vines)
  ///
  /// _(minecraft:weeping_vines)_
  static const Block weeping_vines = Block('minecraft:weeping_vines');

  /// [Weeping Vines Plant](https://minecraft.gamepedia.com/weeping_vines_plant)
  ///
  /// _(minecraft:weeping_vines_plant)_
  static const Block weeping_vines_plant =
      Block('minecraft:weeping_vines_plant');

  /// [Crimson Roots](https://minecraft.gamepedia.com/crimson_roots)
  ///
  /// _(minecraft:crimson_roots)_
  static const Block crimson_roots = Block('minecraft:crimson_roots');

  /// [Crimson Planks](https://minecraft.gamepedia.com/crimson_planks)
  ///
  /// _(minecraft:crimson_planks)_
  static const Block crimson_planks = Block('minecraft:crimson_planks');

  /// [Warped Planks](https://minecraft.gamepedia.com/warped_planks)
  ///
  /// _(minecraft:warped_planks)_
  static const Block warped_planks = Block('minecraft:warped_planks');

  /// [Crimson Slab](https://minecraft.gamepedia.com/crimson_slab)
  ///
  /// _(minecraft:crimson_slab)_
  static const Block crimson_slab = Block('minecraft:crimson_slab');

  /// [Warped Slab](https://minecraft.gamepedia.com/warped_slab)
  ///
  /// _(minecraft:warped_slab)_
  static const Block warped_slab = Block('minecraft:warped_slab');

  /// [Crimson Pressure Plate](https://minecraft.gamepedia.com/crimson_pressure_plate)
  ///
  /// _(minecraft:crimson_pressure_plate)_
  static const Block crimson_pressure_plate =
      Block('minecraft:crimson_pressure_plate');

  /// [Warped Pressure Plate](https://minecraft.gamepedia.com/warped_pressure_plate)
  ///
  /// _(minecraft:warped_pressure_plate)_
  static const Block warped_pressure_plate =
      Block('minecraft:warped_pressure_plate');

  /// [Crimson Fence](https://minecraft.gamepedia.com/crimson_fence)
  ///
  /// _(minecraft:crimson_fence)_
  static const Block crimson_fence = Block('minecraft:crimson_fence');

  /// [Warped Fence](https://minecraft.gamepedia.com/warped_fence)
  ///
  /// _(minecraft:warped_fence)_
  static const Block warped_fence = Block('minecraft:warped_fence');

  /// [Crimson Trapdoor](https://minecraft.gamepedia.com/crimson_trapdoor)
  ///
  /// _(minecraft:crimson_trapdoor)_
  static const Block crimson_trapdoor = Block('minecraft:crimson_trapdoor');

  /// [Warped Trapdoor](https://minecraft.gamepedia.com/warped_trapdoor)
  ///
  /// _(minecraft:warped_trapdoor)_
  static const Block warped_trapdoor = Block('minecraft:warped_trapdoor');

  /// [Crimson Fence Gate](https://minecraft.gamepedia.com/crimson_fence_gate)
  ///
  /// _(minecraft:crimson_fence_gate)_
  static const Block crimson_fence_gate = Block('minecraft:crimson_fence_gate');

  /// [Warped Fence Gate](https://minecraft.gamepedia.com/warped_fence_gate)
  ///
  /// _(minecraft:warped_fence_gate)_
  static const Block warped_fence_gate = Block('minecraft:warped_fence_gate');

  /// [Crimson Stairs](https://minecraft.gamepedia.com/crimson_stairs)
  ///
  /// _(minecraft:crimson_stairs)_
  static const Block crimson_stairs = Block('minecraft:crimson_stairs');

  /// [Warped Stairs](https://minecraft.gamepedia.com/warped_stairs)
  ///
  /// _(minecraft:warped_stairs)_
  static const Block warped_stairs = Block('minecraft:warped_stairs');

  /// [Crimson Button](https://minecraft.gamepedia.com/crimson_button)
  ///
  /// _(minecraft:crimson_button)_
  static const Block crimson_button = Block('minecraft:crimson_button');

  /// [Warped Button](https://minecraft.gamepedia.com/warped_button)
  ///
  /// _(minecraft:warped_button)_
  static const Block warped_button = Block('minecraft:warped_button');

  /// [Crimson Door](https://minecraft.gamepedia.com/crimson_door)
  ///
  /// _(minecraft:crimson_door)_
  static const Block crimson_door = Block('minecraft:crimson_door');

  /// [Warped Door](https://minecraft.gamepedia.com/warped_door)
  ///
  /// _(minecraft:warped_door)_
  static const Block warped_door = Block('minecraft:warped_door');

  /// [Crimson Sign](https://minecraft.gamepedia.com/crimson_sign)
  ///
  /// _(minecraft:crimson_sign)_
  static const Block crimson_sign = Block('minecraft:crimson_sign');

  /// [Warped Sign](https://minecraft.gamepedia.com/warped_sign)
  ///
  /// _(minecraft:warped_sign)_
  static const Block warped_sign = Block('minecraft:warped_sign');

  /// [Crimson Wall Sign](https://minecraft.gamepedia.com/crimson_wall_sign)
  ///
  /// _(minecraft:crimson_wall_sign)_
  static const Block crimson_wall_sign = Block('minecraft:crimson_wall_sign');

  /// [Warped Wall Sign](https://minecraft.gamepedia.com/warped_wall_sign)
  ///
  /// _(minecraft:warped_wall_sign)_
  static const Block warped_wall_sign = Block('minecraft:warped_wall_sign');

  /// [Structure Block](https://minecraft.gamepedia.com/structure_block)
  ///
  /// _(minecraft:structure_block)_
  static const Block structure_block = Block('minecraft:structure_block');

  /// [Jigsaw](https://minecraft.gamepedia.com/jigsaw)
  ///
  /// _(minecraft:jigsaw)_
  static const Block jigsaw = Block('minecraft:jigsaw');

  /// [Composter](https://minecraft.gamepedia.com/composter)
  ///
  /// _(minecraft:composter)_
  static const Block composter = Block('minecraft:composter');

  /// [Target](https://minecraft.gamepedia.com/target)
  ///
  /// _(minecraft:target)_
  static const Block target = Block('minecraft:target');

  /// [Bee Nest](https://minecraft.gamepedia.com/bee_nest)
  ///
  /// _(minecraft:bee_nest)_
  static const Block bee_nest = Block('minecraft:bee_nest');

  /// [Beehive](https://minecraft.gamepedia.com/beehive)
  ///
  /// _(minecraft:beehive)_
  static const Block beehive = Block('minecraft:beehive');

  /// [Honey Block](https://minecraft.gamepedia.com/honey_block)
  ///
  /// _(minecraft:honey_block)_
  static const Block honey_block = Block('minecraft:honey_block');

  /// [Honeycomb Block](https://minecraft.gamepedia.com/honeycomb_block)
  ///
  /// _(minecraft:honeycomb_block)_
  static const Block honeycomb_block = Block('minecraft:honeycomb_block');

  /// [Netherite Block](https://minecraft.gamepedia.com/netherite_block)
  ///
  /// _(minecraft:netherite_block)_
  static const Block netherite_block = Block('minecraft:netherite_block');

  /// [Ancient Debris](https://minecraft.gamepedia.com/ancient_debris)
  ///
  /// _(minecraft:ancient_debris)_
  static const Block ancient_debris = Block('minecraft:ancient_debris');

  /// [Crying Obsidian](https://minecraft.gamepedia.com/crying_obsidian)
  ///
  /// _(minecraft:crying_obsidian)_
  static const Block crying_obsidian = Block('minecraft:crying_obsidian');

  /// [Potted Crimson Fungus](https://minecraft.gamepedia.com/potted_crimson_fungus)
  ///
  /// _(minecraft:potted_crimson_fungus)_
  static const Block potted_crimson_fungus =
      Block('minecraft:potted_crimson_fungus');

  /// [Potted Warped Fungus](https://minecraft.gamepedia.com/potted_warped_fungus)
  ///
  /// _(minecraft:potted_warped_fungus)_
  static const Block potted_warped_fungus =
      Block('minecraft:potted_warped_fungus');

  /// [Potted Crimson Roots](https://minecraft.gamepedia.com/potted_crimson_roots)
  ///
  /// _(minecraft:potted_crimson_roots)_
  static const Block potted_crimson_roots =
      Block('minecraft:potted_crimson_roots');

  /// [Potted Warped Roots](https://minecraft.gamepedia.com/potted_warped_roots)
  ///
  /// _(minecraft:potted_warped_roots)_
  static const Block potted_warped_roots =
      Block('minecraft:potted_warped_roots');
}
