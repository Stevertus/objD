import 'item.dart';

class Items {
  /// A List of all Minecraft items
  static const List<ItemType> all = [
    acacia_boat,
    acacia_button,
    acacia_door,
    acacia_fence,
    acacia_fence_gate,
    acacia_leaves,
    acacia_log,
    acacia_planks,
    acacia_pressure_plate,
    acacia_sapling,
    acacia_sign,
    acacia_slab,
    acacia_stairs,
    acacia_trapdoor,
    acacia_wood,
    activator_rail,
    air,
    allium,
    andesite,
    andesite_slab,
    andesite_stairs,
    andesite_wall,
    anvil,
    apple,
    armor_stand,
    arrow,
    azure_bluet,
    baked_potato,
    bamboo,
    barrel,
    barrier,
    bat_spawn_egg,
    beacon,
    bedrock,
    bee_nest,
    bee_spawn_egg,
    beef,
    beehive,
    beetroot,
    beetroot_seeds,
    beetroot_soup,
    bell,
    birch_boat,
    birch_button,
    birch_door,
    birch_fence,
    birch_fence_gate,
    birch_leaves,
    birch_log,
    birch_planks,
    birch_pressure_plate,
    birch_sapling,
    birch_sign,
    birch_slab,
    birch_stairs,
    birch_trapdoor,
    birch_wood,
    black_banner,
    black_bed,
    black_carpet,
    black_concrete,
    black_concrete_powder,
    black_dye,
    black_glazed_terracotta,
    black_shulker_box,
    black_stained_glass,
    black_stained_glass_pane,
    black_terracotta,
    black_wool,
    blast_furnace,
    blaze_powder,
    blaze_rod,
    blaze_spawn_egg,
    blue_banner,
    blue_bed,
    blue_carpet,
    blue_concrete,
    blue_concrete_powder,
    blue_dye,
    blue_glazed_terracotta,
    blue_ice,
    blue_orchid,
    blue_shulker_box,
    blue_stained_glass,
    blue_stained_glass_pane,
    blue_terracotta,
    blue_wool,
    bone,
    bone_block,
    bone_meal,
    book,
    bookshelf,
    bow,
    bowl,
    brain_coral,
    brain_coral_block,
    brain_coral_fan,
    bread,
    brewing_stand,
    brick,
    brick_slab,
    brick_stairs,
    brick_wall,
    bricks,
    brown_banner,
    brown_bed,
    brown_carpet,
    brown_concrete,
    brown_concrete_powder,
    brown_dye,
    brown_glazed_terracotta,
    brown_mushroom,
    brown_mushroom_block,
    brown_shulker_box,
    brown_stained_glass,
    brown_stained_glass_pane,
    brown_terracotta,
    brown_wool,
    bubble_coral,
    bubble_coral_block,
    bubble_coral_fan,
    bucket,
    cactus,
    cake,
    campfire,
    carrot,
    carrot_on_a_stick,
    cartography_table,
    carved_pumpkin,
    cat_spawn_egg,
    cauldron,
    cave_spider_spawn_egg,
    chain_command_block,
    chainmail_boots,
    chainmail_chestplate,
    chainmail_helmet,
    chainmail_leggings,
    charcoal,
    chest,
    chest_minecart,
    chicken,
    chicken_spawn_egg,
    chipped_anvil,
    chiseled_quartz_block,
    chiseled_red_sandstone,
    chiseled_sandstone,
    chiseled_stone_bricks,
    chorus_flower,
    chorus_fruit,
    chorus_plant,
    clay,
    clay_ball,
    clock,
    coal,
    coal_block,
    coal_ore,
    coarse_dirt,
    cobblestone,
    cobblestone_slab,
    cobblestone_stairs,
    cobblestone_wall,
    cobweb,
    cocoa_beans,
    cod,
    cod_bucket,
    cod_spawn_egg,
    command_block,
    command_block_minecart,
    comparator,
    compass,
    composter,
    conduit,
    cooked_beef,
    cooked_chicken,
    cooked_cod,
    cooked_mutton,
    cooked_porkchop,
    cooked_rabbit,
    cooked_salmon,
    cookie,
    cornflower,
    cow_spawn_egg,
    cracked_stone_bricks,
    crafting_table,
    creeper_banner_pattern,
    creeper_head,
    creeper_spawn_egg,
    crossbow,
    cut_red_sandstone,
    cut_red_sandstone_slab,
    cut_sandstone,
    cut_sandstone_slab,
    cyan_banner,
    cyan_bed,
    cyan_carpet,
    cyan_concrete,
    cyan_concrete_powder,
    cyan_dye,
    cyan_glazed_terracotta,
    cyan_shulker_box,
    cyan_stained_glass,
    cyan_stained_glass_pane,
    cyan_terracotta,
    cyan_wool,
    damaged_anvil,
    dandelion,
    dark_oak_boat,
    dark_oak_button,
    dark_oak_door,
    dark_oak_fence,
    dark_oak_fence_gate,
    dark_oak_leaves,
    dark_oak_log,
    dark_oak_planks,
    dark_oak_pressure_plate,
    dark_oak_sapling,
    dark_oak_sign,
    dark_oak_slab,
    dark_oak_stairs,
    dark_oak_trapdoor,
    dark_oak_wood,
    dark_prismarine,
    dark_prismarine_slab,
    dark_prismarine_stairs,
    daylight_detector,
    dead_brain_coral,
    dead_brain_coral_block,
    dead_brain_coral_fan,
    dead_bubble_coral,
    dead_bubble_coral_block,
    dead_bubble_coral_fan,
    dead_bush,
    dead_fire_coral,
    dead_fire_coral_block,
    dead_fire_coral_fan,
    dead_horn_coral,
    dead_horn_coral_block,
    dead_horn_coral_fan,
    dead_tube_coral,
    dead_tube_coral_block,
    dead_tube_coral_fan,
    debug_stick,
    detector_rail,
    diamond,
    diamond_axe,
    diamond_block,
    diamond_boots,
    diamond_chestplate,
    diamond_helmet,
    diamond_hoe,
    diamond_horse_armor,
    diamond_leggings,
    diamond_ore,
    diamond_pickaxe,
    diamond_shovel,
    diamond_sword,
    diorite,
    diorite_slab,
    diorite_stairs,
    diorite_wall,
    dirt,
    dispenser,
    dolphin_spawn_egg,
    donkey_spawn_egg,
    dragon_breath,
    dragon_egg,
    dragon_head,
    dried_kelp,
    dried_kelp_block,
    dropper,
    drowned_spawn_egg,
    egg,
    elder_guardian_spawn_egg,
    elytra,
    emerald,
    emerald_block,
    emerald_ore,
    enchanted_book,
    enchanted_golden_apple,
    enchanting_table,
    end_crystal,
    end_portal_frame,
    end_rod,
    end_stone,
    end_stone_brick_slab,
    end_stone_brick_stairs,
    end_stone_brick_wall,
    end_stone_bricks,
    ender_chest,
    ender_eye,
    ender_pearl,
    enderman_spawn_egg,
    endermite_spawn_egg,
    evoker_spawn_egg,
    experience_bottle,
    farmland,
    feather,
    fermented_spider_eye,
    fern,
    filled_map,
    fire_charge,
    fire_coral,
    fire_coral_block,
    fire_coral_fan,
    firework_rocket,
    firework_star,
    fishing_rod,
    fletching_table,
    flint,
    flint_and_steel,
    flower_banner_pattern,
    flower_pot,
    fox_spawn_egg,
    furnace,
    furnace_minecart,
    ghast_spawn_egg,
    ghast_tear,
    glass,
    glass_bottle,
    glass_pane,
    glistering_melon_slice,
    globe_banner_pattern,
    glowstone,
    glowstone_dust,
    gold_block,
    gold_ingot,
    gold_nugget,
    gold_ore,
    golden_apple,
    golden_axe,
    golden_boots,
    golden_carrot,
    golden_chestplate,
    golden_helmet,
    golden_hoe,
    golden_horse_armor,
    golden_leggings,
    golden_pickaxe,
    golden_shovel,
    golden_sword,
    granite,
    granite_slab,
    granite_stairs,
    granite_wall,
    grass,
    grass_block,
    grass_path,
    gravel,
    gray_banner,
    gray_bed,
    gray_carpet,
    gray_concrete,
    gray_concrete_powder,
    gray_dye,
    gray_glazed_terracotta,
    gray_shulker_box,
    gray_stained_glass,
    gray_stained_glass_pane,
    gray_terracotta,
    gray_wool,
    green_banner,
    green_bed,
    green_carpet,
    green_concrete,
    green_concrete_powder,
    green_dye,
    green_glazed_terracotta,
    green_shulker_box,
    green_stained_glass,
    green_stained_glass_pane,
    green_terracotta,
    green_wool,
    grindstone,
    guardian_spawn_egg,
    gunpowder,
    hay_block,
    heart_of_the_sea,
    heavy_weighted_pressure_plate,
    honey_block,
    honey_bottle,
    honeycomb,
    honeycomb_block,
    hopper,
    hopper_minecart,
    horn_coral,
    horn_coral_block,
    horn_coral_fan,
    horse_spawn_egg,
    husk_spawn_egg,
    ice,
    infested_chiseled_stone_bricks,
    infested_cobblestone,
    infested_cracked_stone_bricks,
    infested_mossy_stone_bricks,
    infested_stone,
    infested_stone_bricks,
    ink_sac,
    iron_axe,
    iron_bars,
    iron_block,
    iron_boots,
    iron_chestplate,
    iron_door,
    iron_helmet,
    iron_hoe,
    iron_horse_armor,
    iron_ingot,
    iron_leggings,
    iron_nugget,
    iron_ore,
    iron_pickaxe,
    iron_shovel,
    iron_sword,
    iron_trapdoor,
    item_frame,
    jack_o_lantern,
    jigsaw,
    jukebox,
    jungle_boat,
    jungle_button,
    jungle_door,
    jungle_fence,
    jungle_fence_gate,
    jungle_leaves,
    jungle_log,
    jungle_planks,
    jungle_pressure_plate,
    jungle_sapling,
    jungle_sign,
    jungle_slab,
    jungle_stairs,
    jungle_trapdoor,
    jungle_wood,
    kelp,
    knowledge_book,
    ladder,
    lantern,
    lapis_block,
    lapis_lazuli,
    lapis_ore,
    large_fern,
    lava_bucket,
    lead,
    leather,
    leather_boots,
    leather_chestplate,
    leather_helmet,
    leather_horse_armor,
    leather_leggings,
    lectern,
    lever,
    light_blue_banner,
    light_blue_bed,
    light_blue_carpet,
    light_blue_concrete,
    light_blue_concrete_powder,
    light_blue_dye,
    light_blue_glazed_terracotta,
    light_blue_shulker_box,
    light_blue_stained_glass,
    light_blue_stained_glass_pane,
    light_blue_terracotta,
    light_blue_wool,
    light_gray_banner,
    light_gray_bed,
    light_gray_carpet,
    light_gray_concrete,
    light_gray_concrete_powder,
    light_gray_dye,
    light_gray_glazed_terracotta,
    light_gray_shulker_box,
    light_gray_stained_glass,
    light_gray_stained_glass_pane,
    light_gray_terracotta,
    light_gray_wool,
    light_weighted_pressure_plate,
    lilac,
    lily_of_the_valley,
    lily_pad,
    lime_banner,
    lime_bed,
    lime_carpet,
    lime_concrete,
    lime_concrete_powder,
    lime_dye,
    lime_glazed_terracotta,
    lime_shulker_box,
    lime_stained_glass,
    lime_stained_glass_pane,
    lime_terracotta,
    lime_wool,
    lingering_potion,
    llama_spawn_egg,
    loom,
    magenta_banner,
    magenta_bed,
    magenta_carpet,
    magenta_concrete,
    magenta_concrete_powder,
    magenta_dye,
    magenta_glazed_terracotta,
    magenta_shulker_box,
    magenta_stained_glass,
    magenta_stained_glass_pane,
    magenta_terracotta,
    magenta_wool,
    magma_block,
    magma_cream,
    magma_cube_spawn_egg,
    map,
    melon,
    melon_seeds,
    melon_slice,
    milk_bucket,
    minecart,
    mojang_banner_pattern,
    mooshroom_spawn_egg,
    mossy_cobblestone,
    mossy_cobblestone_slab,
    mossy_cobblestone_stairs,
    mossy_cobblestone_wall,
    mossy_stone_brick_slab,
    mossy_stone_brick_stairs,
    mossy_stone_brick_wall,
    mossy_stone_bricks,
    mule_spawn_egg,
    mushroom_stem,
    mushroom_stew,
    music_disc_11,
    music_disc_13,
    music_disc_blocks,
    music_disc_cat,
    music_disc_chirp,
    music_disc_far,
    music_disc_mall,
    music_disc_mellohi,
    music_disc_stal,
    music_disc_strad,
    music_disc_wait,
    music_disc_ward,
    mutton,
    mycelium,
    name_tag,
    nautilus_shell,
    nether_brick,
    nether_brick_fence,
    nether_brick_slab,
    nether_brick_stairs,
    nether_brick_wall,
    nether_bricks,
    nether_quartz_ore,
    nether_star,
    nether_wart,
    nether_wart_block,
    netherrack,
    note_block,
    oak_boat,
    oak_button,
    oak_door,
    oak_fence,
    oak_fence_gate,
    oak_leaves,
    oak_log,
    oak_planks,
    oak_pressure_plate,
    oak_sapling,
    oak_sign,
    oak_slab,
    oak_stairs,
    oak_trapdoor,
    oak_wood,
    observer,
    obsidian,
    ocelot_spawn_egg,
    orange_banner,
    orange_bed,
    orange_carpet,
    orange_concrete,
    orange_concrete_powder,
    orange_dye,
    orange_glazed_terracotta,
    orange_shulker_box,
    orange_stained_glass,
    orange_stained_glass_pane,
    orange_terracotta,
    orange_tulip,
    orange_wool,
    oxeye_daisy,
    packed_ice,
    painting,
    panda_spawn_egg,
    paper,
    parrot_spawn_egg,
    peony,
    petrified_oak_slab,
    phantom_membrane,
    phantom_spawn_egg,
    pig_spawn_egg,
    pillager_spawn_egg,
    pink_banner,
    pink_bed,
    pink_carpet,
    pink_concrete,
    pink_concrete_powder,
    pink_dye,
    pink_glazed_terracotta,
    pink_shulker_box,
    pink_stained_glass,
    pink_stained_glass_pane,
    pink_terracotta,
    pink_tulip,
    pink_wool,
    piston,
    player_head,
    podzol,
    poisonous_potato,
    polar_bear_spawn_egg,
    polished_andesite,
    polished_andesite_slab,
    polished_andesite_stairs,
    polished_diorite,
    polished_diorite_slab,
    polished_diorite_stairs,
    polished_granite,
    polished_granite_slab,
    polished_granite_stairs,
    popped_chorus_fruit,
    poppy,
    porkchop,
    potato,
    potion,
    powered_rail,
    prismarine,
    prismarine_brick_slab,
    prismarine_brick_stairs,
    prismarine_bricks,
    prismarine_crystals,
    prismarine_shard,
    prismarine_slab,
    prismarine_stairs,
    prismarine_wall,
    pufferfish,
    pufferfish_bucket,
    pufferfish_spawn_egg,
    pumpkin,
    pumpkin_pie,
    pumpkin_seeds,
    purple_banner,
    purple_bed,
    purple_carpet,
    purple_concrete,
    purple_concrete_powder,
    purple_dye,
    purple_glazed_terracotta,
    purple_shulker_box,
    purple_stained_glass,
    purple_stained_glass_pane,
    purple_terracotta,
    purple_wool,
    purpur_block,
    purpur_pillar,
    purpur_slab,
    purpur_stairs,
    quartz,
    quartz_block,
    quartz_pillar,
    quartz_slab,
    quartz_stairs,
    rabbit,
    rabbit_foot,
    rabbit_hide,
    rabbit_spawn_egg,
    rabbit_stew,
    rail,
    ravager_spawn_egg,
    red_banner,
    red_bed,
    red_carpet,
    red_concrete,
    red_concrete_powder,
    red_dye,
    red_glazed_terracotta,
    red_mushroom,
    red_mushroom_block,
    red_nether_brick_slab,
    red_nether_brick_stairs,
    red_nether_brick_wall,
    red_nether_bricks,
    red_sand,
    red_sandstone,
    red_sandstone_slab,
    red_sandstone_stairs,
    red_sandstone_wall,
    red_shulker_box,
    red_stained_glass,
    red_stained_glass_pane,
    red_terracotta,
    red_tulip,
    red_wool,
    redstone,
    redstone_block,
    redstone_lamp,
    redstone_ore,
    redstone_torch,
    repeater,
    repeating_command_block,
    rose_bush,
    rotten_flesh,
    saddle,
    salmon,
    salmon_bucket,
    salmon_spawn_egg,
    sand,
    sandstone,
    sandstone_slab,
    sandstone_stairs,
    sandstone_wall,
    scaffolding,
    scute,
    sea_lantern,
    sea_pickle,
    seagrass,
    shears,
    sheep_spawn_egg,
    shield,
    shulker_box,
    shulker_shell,
    shulker_spawn_egg,
    silverfish_spawn_egg,
    skeleton_horse_spawn_egg,
    skeleton_skull,
    skeleton_spawn_egg,
    skull_banner_pattern,
    slime_ball,
    slime_block,
    slime_spawn_egg,
    smithing_table,
    smoker,
    smooth_quartz,
    smooth_quartz_slab,
    smooth_quartz_stairs,
    smooth_red_sandstone,
    smooth_red_sandstone_slab,
    smooth_red_sandstone_stairs,
    smooth_sandstone,
    smooth_sandstone_slab,
    smooth_sandstone_stairs,
    smooth_stone,
    smooth_stone_slab,
    snow,
    snow_block,
    snowball,
    soul_sand,
    spawner,
    spectral_arrow,
    spider_eye,
    spider_spawn_egg,
    splash_potion,
    sponge,
    spruce_boat,
    spruce_button,
    spruce_door,
    spruce_fence,
    spruce_fence_gate,
    spruce_leaves,
    spruce_log,
    spruce_planks,
    spruce_pressure_plate,
    spruce_sapling,
    spruce_sign,
    spruce_slab,
    spruce_stairs,
    spruce_trapdoor,
    spruce_wood,
    squid_spawn_egg,
    stick,
    sticky_piston,
    stone,
    stone_axe,
    stone_brick_slab,
    stone_brick_stairs,
    stone_brick_wall,
    stone_bricks,
    stone_button,
    stone_hoe,
    stone_pickaxe,
    stone_pressure_plate,
    stone_shovel,
    stone_slab,
    stone_stairs,
    stone_sword,
    stonecutter,
    stray_spawn_egg,
    string,
    stripped_acacia_log,
    stripped_acacia_wood,
    stripped_birch_log,
    stripped_birch_wood,
    stripped_dark_oak_log,
    stripped_dark_oak_wood,
    stripped_jungle_log,
    stripped_jungle_wood,
    stripped_oak_log,
    stripped_oak_wood,
    stripped_spruce_log,
    stripped_spruce_wood,
    structure_block,
    structure_void,
    sugar,
    sugar_cane,
    sunflower,
    suspicious_stew,
    sweet_berries,
    tall_grass,
    terracotta,
    tipped_arrow,
    tnt,
    tnt_minecart,
    torch,
    totem_of_undying,
    trader_llama_spawn_egg,
    trapped_chest,
    trident,
    tripwire_hook,
    tropical_fish,
    tropical_fish_bucket,
    tropical_fish_spawn_egg,
    tube_coral,
    tube_coral_block,
    tube_coral_fan,
    turtle_egg,
    turtle_helmet,
    turtle_spawn_egg,
    vex_spawn_egg,
    villager_spawn_egg,
    vindicator_spawn_egg,
    vine,
    wandering_trader_spawn_egg,
    water_bucket,
    wet_sponge,
    wheat,
    wheat_seeds,
    white_banner,
    white_bed,
    white_carpet,
    white_concrete,
    white_concrete_powder,
    white_dye,
    white_glazed_terracotta,
    white_shulker_box,
    white_stained_glass,
    white_stained_glass_pane,
    white_terracotta,
    white_tulip,
    white_wool,
    witch_spawn_egg,
    wither_rose,
    wither_skeleton_skull,
    wither_skeleton_spawn_egg,
    wolf_spawn_egg,
    wooden_axe,
    wooden_hoe,
    wooden_pickaxe,
    wooden_shovel,
    wooden_sword,
    writable_book,
    written_book,
    yellow_banner,
    yellow_bed,
    yellow_carpet,
    yellow_concrete,
    yellow_concrete_powder,
    yellow_dye,
    yellow_glazed_terracotta,
    yellow_shulker_box,
    yellow_stained_glass,
    yellow_stained_glass_pane,
    yellow_terracotta,
    yellow_wool,
    zombie_head,
    zombie_horse_spawn_egg,
    zombie_pigman_spawn_egg,
    zombie_spawn_egg,
    zombie_villager_spawn_egg
  ];

  /// A List of newer experimental items introduced in the next minecraft version
  static const List<ItemType> snapshot = [
    ancient_debris,
    basalt,
    blackstone,
    blackstone_slab,
    blackstone_stairs,
    blackstone_wall,
    chain,
    chiseled_nether_bricks,
    chiseled_polished_blackstone,
    cracked_nether_bricks,
    cracked_polished_blackstone_bricks,
    crimson_button,
    crimson_door,
    crimson_fence,
    crimson_fence_gate,
    crimson_fungus,
    crimson_hyphae,
    crimson_nylium,
    crimson_planks,
    crimson_pressure_plate,
    crimson_roots,
    crimson_sign,
    crimson_slab,
    crimson_stairs,
    crimson_stem,
    crimson_trapdoor,
    crying_obsidian,
    gilded_blackstone,
    hoglin_spawn_egg,
    lodestone,
    music_disc_pigstep,
    nether_gold_ore,
    nether_sprouts,
    netherite_axe,
    netherite_block,
    netherite_boots,
    netherite_chestplate,
    netherite_helmet,
    netherite_hoe,
    netherite_ingot,
    netherite_leggings,
    netherite_pickaxe,
    netherite_scrap,
    netherite_shovel,
    netherite_sword,
    piglin_banner_pattern,
    piglin_spawn_egg,
    polished_basalt,
    polished_blackstone,
    polished_blackstone_brick_slab,
    polished_blackstone_brick_stairs,
    polished_blackstone_brick_wall,
    polished_blackstone_bricks,
    polished_blackstone_button,
    polished_blackstone_pressure_plate,
    polished_blackstone_slab,
    polished_blackstone_stairs,
    polished_blackstone_wall,
    quartz_bricks,
    respawn_anchor,
    shroomlight,
    soul_campfire,
    soul_lantern,
    soul_soil,
    soul_torch,
    strider_spawn_egg,
    stripped_crimson_hyphae,
    stripped_crimson_stem,
    stripped_warped_hyphae,
    stripped_warped_stem,
    target,
    twisting_vines,
    warped_button,
    warped_door,
    warped_fence,
    warped_fence_gate,
    warped_fungus,
    warped_fungus_on_a_stick,
    warped_hyphae,
    warped_nylium,
    warped_planks,
    warped_pressure_plate,
    warped_roots,
    warped_sign,
    warped_slab,
    warped_stairs,
    warped_stem,
    warped_trapdoor,
    warped_wart_block,
    weeping_vines,
    zoglin_spawn_egg,
    zombified_piglin_spawn_egg
  ];

  /// [Acacia Boat](https://minecraft.gamepedia.com/acacia_boat)
  ///
  /// _(minecraft:acacia_boat)_
  static const ItemType acacia_boat = ItemType('minecraft:acacia_boat');

  /// [Acacia Button](https://minecraft.gamepedia.com/acacia_button)
  ///
  /// _(minecraft:acacia_button)_
  static const ItemType acacia_button = ItemType('minecraft:acacia_button');

  /// [Acacia Door](https://minecraft.gamepedia.com/acacia_door)
  ///
  /// _(minecraft:acacia_door)_
  static const ItemType acacia_door = ItemType('minecraft:acacia_door');

  /// [Acacia Fence](https://minecraft.gamepedia.com/acacia_fence)
  ///
  /// _(minecraft:acacia_fence)_
  static const ItemType acacia_fence = ItemType('minecraft:acacia_fence');

  /// [Acacia Fence Gate](https://minecraft.gamepedia.com/acacia_fence_gate)
  ///
  /// _(minecraft:acacia_fence_gate)_
  static const ItemType acacia_fence_gate =
      ItemType('minecraft:acacia_fence_gate');

  /// [Acacia Leaves](https://minecraft.gamepedia.com/acacia_leaves)
  ///
  /// _(minecraft:acacia_leaves)_
  static const ItemType acacia_leaves = ItemType('minecraft:acacia_leaves');

  /// [Acacia Log](https://minecraft.gamepedia.com/acacia_log)
  ///
  /// _(minecraft:acacia_log)_
  static const ItemType acacia_log = ItemType('minecraft:acacia_log');

  /// [Acacia Planks](https://minecraft.gamepedia.com/acacia_planks)
  ///
  /// _(minecraft:acacia_planks)_
  static const ItemType acacia_planks = ItemType('minecraft:acacia_planks');

  /// [Acacia Pressure Plate](https://minecraft.gamepedia.com/acacia_pressure_plate)
  ///
  /// _(minecraft:acacia_pressure_plate)_
  static const ItemType acacia_pressure_plate =
      ItemType('minecraft:acacia_pressure_plate');

  /// [Acacia Sapling](https://minecraft.gamepedia.com/acacia_sapling)
  ///
  /// _(minecraft:acacia_sapling)_
  static const ItemType acacia_sapling = ItemType('minecraft:acacia_sapling');

  /// [Acacia Sign](https://minecraft.gamepedia.com/acacia_sign)
  ///
  /// _(minecraft:acacia_sign)_
  static const ItemType acacia_sign = ItemType('minecraft:acacia_sign');

  /// [Acacia Slab](https://minecraft.gamepedia.com/acacia_slab)
  ///
  /// _(minecraft:acacia_slab)_
  static const ItemType acacia_slab = ItemType('minecraft:acacia_slab');

  /// [Acacia Stairs](https://minecraft.gamepedia.com/acacia_stairs)
  ///
  /// _(minecraft:acacia_stairs)_
  static const ItemType acacia_stairs = ItemType('minecraft:acacia_stairs');

  /// [Acacia Trapdoor](https://minecraft.gamepedia.com/acacia_trapdoor)
  ///
  /// _(minecraft:acacia_trapdoor)_
  static const ItemType acacia_trapdoor = ItemType('minecraft:acacia_trapdoor');

  /// [Acacia Wood](https://minecraft.gamepedia.com/acacia_wood)
  ///
  /// _(minecraft:acacia_wood)_
  static const ItemType acacia_wood = ItemType('minecraft:acacia_wood');

  /// [Activator Rail](https://minecraft.gamepedia.com/activator_rail)
  ///
  /// _(minecraft:activator_rail)_
  static const ItemType activator_rail = ItemType('minecraft:activator_rail');

  /// [Air](https://minecraft.gamepedia.com/air)
  ///
  /// _(minecraft:air)_
  static const ItemType air = ItemType('minecraft:air');

  /// [Allium](https://minecraft.gamepedia.com/allium)
  ///
  /// _(minecraft:allium)_
  static const ItemType allium = ItemType('minecraft:allium');

  /// [Andesite](https://minecraft.gamepedia.com/andesite)
  ///
  /// _(minecraft:andesite)_
  static const ItemType andesite = ItemType('minecraft:andesite');

  /// [Andesite Slab](https://minecraft.gamepedia.com/andesite_slab)
  ///
  /// _(minecraft:andesite_slab)_
  static const ItemType andesite_slab = ItemType('minecraft:andesite_slab');

  /// [Andesite Stairs](https://minecraft.gamepedia.com/andesite_stairs)
  ///
  /// _(minecraft:andesite_stairs)_
  static const ItemType andesite_stairs = ItemType('minecraft:andesite_stairs');

  /// [Andesite Wall](https://minecraft.gamepedia.com/andesite_wall)
  ///
  /// _(minecraft:andesite_wall)_
  static const ItemType andesite_wall = ItemType('minecraft:andesite_wall');

  /// [Anvil](https://minecraft.gamepedia.com/anvil)
  ///
  /// _(minecraft:anvil)_
  static const ItemType anvil = ItemType('minecraft:anvil');

  /// [Apple](https://minecraft.gamepedia.com/apple)
  ///
  /// _(minecraft:apple)_
  static const ItemType apple = ItemType('minecraft:apple');

  /// [Armor Stand](https://minecraft.gamepedia.com/armor_stand)
  ///
  /// _(minecraft:armor_stand)_
  static const ItemType armor_stand = ItemType('minecraft:armor_stand');

  /// [Arrow](https://minecraft.gamepedia.com/arrow)
  ///
  /// _(minecraft:arrow)_
  static const ItemType arrow = ItemType('minecraft:arrow');

  /// [Azure Bluet](https://minecraft.gamepedia.com/azure_bluet)
  ///
  /// _(minecraft:azure_bluet)_
  static const ItemType azure_bluet = ItemType('minecraft:azure_bluet');

  /// [Baked Potato](https://minecraft.gamepedia.com/baked_potato)
  ///
  /// _(minecraft:baked_potato)_
  static const ItemType baked_potato = ItemType('minecraft:baked_potato');

  /// [Bamboo](https://minecraft.gamepedia.com/bamboo)
  ///
  /// _(minecraft:bamboo)_
  static const ItemType bamboo = ItemType('minecraft:bamboo');

  /// [Barrel](https://minecraft.gamepedia.com/barrel)
  ///
  /// _(minecraft:barrel)_
  static const ItemType barrel = ItemType('minecraft:barrel');

  /// [Barrier](https://minecraft.gamepedia.com/barrier)
  ///
  /// _(minecraft:barrier)_
  static const ItemType barrier = ItemType('minecraft:barrier');

  /// [Bat Spawn Egg](https://minecraft.gamepedia.com/bat_spawn_egg)
  ///
  /// _(minecraft:bat_spawn_egg)_
  static const ItemType bat_spawn_egg = ItemType('minecraft:bat_spawn_egg');

  /// [Beacon](https://minecraft.gamepedia.com/beacon)
  ///
  /// _(minecraft:beacon)_
  static const ItemType beacon = ItemType('minecraft:beacon');

  /// [Bedrock](https://minecraft.gamepedia.com/bedrock)
  ///
  /// _(minecraft:bedrock)_
  static const ItemType bedrock = ItemType('minecraft:bedrock');

  /// [Bee Nest](https://minecraft.gamepedia.com/bee_nest)
  ///
  /// _(minecraft:bee_nest)_
  static const ItemType bee_nest = ItemType('minecraft:bee_nest');

  /// [Bee Spawn Egg](https://minecraft.gamepedia.com/bee_spawn_egg)
  ///
  /// _(minecraft:bee_spawn_egg)_
  static const ItemType bee_spawn_egg = ItemType('minecraft:bee_spawn_egg');

  /// [Beef](https://minecraft.gamepedia.com/beef)
  ///
  /// _(minecraft:beef)_
  static const ItemType beef = ItemType('minecraft:beef');

  /// [Beehive](https://minecraft.gamepedia.com/beehive)
  ///
  /// _(minecraft:beehive)_
  static const ItemType beehive = ItemType('minecraft:beehive');

  /// [Beetroot](https://minecraft.gamepedia.com/beetroot)
  ///
  /// _(minecraft:beetroot)_
  static const ItemType beetroot = ItemType('minecraft:beetroot');

  /// [Beetroot Seeds](https://minecraft.gamepedia.com/beetroot_seeds)
  ///
  /// _(minecraft:beetroot_seeds)_
  static const ItemType beetroot_seeds = ItemType('minecraft:beetroot_seeds');

  /// [Beetroot Soup](https://minecraft.gamepedia.com/beetroot_soup)
  ///
  /// _(minecraft:beetroot_soup)_
  static const ItemType beetroot_soup = ItemType('minecraft:beetroot_soup');

  /// [Bell](https://minecraft.gamepedia.com/bell)
  ///
  /// _(minecraft:bell)_
  static const ItemType bell = ItemType('minecraft:bell');

  /// [Birch Boat](https://minecraft.gamepedia.com/birch_boat)
  ///
  /// _(minecraft:birch_boat)_
  static const ItemType birch_boat = ItemType('minecraft:birch_boat');

  /// [Birch Button](https://minecraft.gamepedia.com/birch_button)
  ///
  /// _(minecraft:birch_button)_
  static const ItemType birch_button = ItemType('minecraft:birch_button');

  /// [Birch Door](https://minecraft.gamepedia.com/birch_door)
  ///
  /// _(minecraft:birch_door)_
  static const ItemType birch_door = ItemType('minecraft:birch_door');

  /// [Birch Fence](https://minecraft.gamepedia.com/birch_fence)
  ///
  /// _(minecraft:birch_fence)_
  static const ItemType birch_fence = ItemType('minecraft:birch_fence');

  /// [Birch Fence Gate](https://minecraft.gamepedia.com/birch_fence_gate)
  ///
  /// _(minecraft:birch_fence_gate)_
  static const ItemType birch_fence_gate =
      ItemType('minecraft:birch_fence_gate');

  /// [Birch Leaves](https://minecraft.gamepedia.com/birch_leaves)
  ///
  /// _(minecraft:birch_leaves)_
  static const ItemType birch_leaves = ItemType('minecraft:birch_leaves');

  /// [Birch Log](https://minecraft.gamepedia.com/birch_log)
  ///
  /// _(minecraft:birch_log)_
  static const ItemType birch_log = ItemType('minecraft:birch_log');

  /// [Birch Planks](https://minecraft.gamepedia.com/birch_planks)
  ///
  /// _(minecraft:birch_planks)_
  static const ItemType birch_planks = ItemType('minecraft:birch_planks');

  /// [Birch Pressure Plate](https://minecraft.gamepedia.com/birch_pressure_plate)
  ///
  /// _(minecraft:birch_pressure_plate)_
  static const ItemType birch_pressure_plate =
      ItemType('minecraft:birch_pressure_plate');

  /// [Birch Sapling](https://minecraft.gamepedia.com/birch_sapling)
  ///
  /// _(minecraft:birch_sapling)_
  static const ItemType birch_sapling = ItemType('minecraft:birch_sapling');

  /// [Birch Sign](https://minecraft.gamepedia.com/birch_sign)
  ///
  /// _(minecraft:birch_sign)_
  static const ItemType birch_sign = ItemType('minecraft:birch_sign');

  /// [Birch Slab](https://minecraft.gamepedia.com/birch_slab)
  ///
  /// _(minecraft:birch_slab)_
  static const ItemType birch_slab = ItemType('minecraft:birch_slab');

  /// [Birch Stairs](https://minecraft.gamepedia.com/birch_stairs)
  ///
  /// _(minecraft:birch_stairs)_
  static const ItemType birch_stairs = ItemType('minecraft:birch_stairs');

  /// [Birch Trapdoor](https://minecraft.gamepedia.com/birch_trapdoor)
  ///
  /// _(minecraft:birch_trapdoor)_
  static const ItemType birch_trapdoor = ItemType('minecraft:birch_trapdoor');

  /// [Birch Wood](https://minecraft.gamepedia.com/birch_wood)
  ///
  /// _(minecraft:birch_wood)_
  static const ItemType birch_wood = ItemType('minecraft:birch_wood');

  /// [Black Banner](https://minecraft.gamepedia.com/black_banner)
  ///
  /// _(minecraft:black_banner)_
  static const ItemType black_banner = ItemType('minecraft:black_banner');

  /// [Black Bed](https://minecraft.gamepedia.com/black_bed)
  ///
  /// _(minecraft:black_bed)_
  static const ItemType black_bed = ItemType('minecraft:black_bed');

  /// [Black Carpet](https://minecraft.gamepedia.com/black_carpet)
  ///
  /// _(minecraft:black_carpet)_
  static const ItemType black_carpet = ItemType('minecraft:black_carpet');

  /// [Black Concrete](https://minecraft.gamepedia.com/black_concrete)
  ///
  /// _(minecraft:black_concrete)_
  static const ItemType black_concrete = ItemType('minecraft:black_concrete');

  /// [Black Concrete Powder](https://minecraft.gamepedia.com/black_concrete_powder)
  ///
  /// _(minecraft:black_concrete_powder)_
  static const ItemType black_concrete_powder =
      ItemType('minecraft:black_concrete_powder');

  /// [Black Dye](https://minecraft.gamepedia.com/black_dye)
  ///
  /// _(minecraft:black_dye)_
  static const ItemType black_dye = ItemType('minecraft:black_dye');

  /// [Black Glazed Terracotta](https://minecraft.gamepedia.com/black_glazed_terracotta)
  ///
  /// _(minecraft:black_glazed_terracotta)_
  static const ItemType black_glazed_terracotta =
      ItemType('minecraft:black_glazed_terracotta');

  /// [Black Shulker Box](https://minecraft.gamepedia.com/black_shulker_box)
  ///
  /// _(minecraft:black_shulker_box)_
  static const ItemType black_shulker_box =
      ItemType('minecraft:black_shulker_box');

  /// [Black Stained Glass](https://minecraft.gamepedia.com/black_stained_glass)
  ///
  /// _(minecraft:black_stained_glass)_
  static const ItemType black_stained_glass =
      ItemType('minecraft:black_stained_glass');

  /// [Black Stained Glass Pane](https://minecraft.gamepedia.com/black_stained_glass_pane)
  ///
  /// _(minecraft:black_stained_glass_pane)_
  static const ItemType black_stained_glass_pane =
      ItemType('minecraft:black_stained_glass_pane');

  /// [Black Terracotta](https://minecraft.gamepedia.com/black_terracotta)
  ///
  /// _(minecraft:black_terracotta)_
  static const ItemType black_terracotta =
      ItemType('minecraft:black_terracotta');

  /// [Black Wool](https://minecraft.gamepedia.com/black_wool)
  ///
  /// _(minecraft:black_wool)_
  static const ItemType black_wool = ItemType('minecraft:black_wool');

  /// [Blast Furnace](https://minecraft.gamepedia.com/blast_furnace)
  ///
  /// _(minecraft:blast_furnace)_
  static const ItemType blast_furnace = ItemType('minecraft:blast_furnace');

  /// [Blaze Powder](https://minecraft.gamepedia.com/blaze_powder)
  ///
  /// _(minecraft:blaze_powder)_
  static const ItemType blaze_powder = ItemType('minecraft:blaze_powder');

  /// [Blaze Rod](https://minecraft.gamepedia.com/blaze_rod)
  ///
  /// _(minecraft:blaze_rod)_
  static const ItemType blaze_rod = ItemType('minecraft:blaze_rod');

  /// [Blaze Spawn Egg](https://minecraft.gamepedia.com/blaze_spawn_egg)
  ///
  /// _(minecraft:blaze_spawn_egg)_
  static const ItemType blaze_spawn_egg = ItemType('minecraft:blaze_spawn_egg');

  /// [Blue Banner](https://minecraft.gamepedia.com/blue_banner)
  ///
  /// _(minecraft:blue_banner)_
  static const ItemType blue_banner = ItemType('minecraft:blue_banner');

  /// [Blue Bed](https://minecraft.gamepedia.com/blue_bed)
  ///
  /// _(minecraft:blue_bed)_
  static const ItemType blue_bed = ItemType('minecraft:blue_bed');

  /// [Blue Carpet](https://minecraft.gamepedia.com/blue_carpet)
  ///
  /// _(minecraft:blue_carpet)_
  static const ItemType blue_carpet = ItemType('minecraft:blue_carpet');

  /// [Blue Concrete](https://minecraft.gamepedia.com/blue_concrete)
  ///
  /// _(minecraft:blue_concrete)_
  static const ItemType blue_concrete = ItemType('minecraft:blue_concrete');

  /// [Blue Concrete Powder](https://minecraft.gamepedia.com/blue_concrete_powder)
  ///
  /// _(minecraft:blue_concrete_powder)_
  static const ItemType blue_concrete_powder =
      ItemType('minecraft:blue_concrete_powder');

  /// [Blue Dye](https://minecraft.gamepedia.com/blue_dye)
  ///
  /// _(minecraft:blue_dye)_
  static const ItemType blue_dye = ItemType('minecraft:blue_dye');

  /// [Blue Glazed Terracotta](https://minecraft.gamepedia.com/blue_glazed_terracotta)
  ///
  /// _(minecraft:blue_glazed_terracotta)_
  static const ItemType blue_glazed_terracotta =
      ItemType('minecraft:blue_glazed_terracotta');

  /// [Blue Ice](https://minecraft.gamepedia.com/blue_ice)
  ///
  /// _(minecraft:blue_ice)_
  static const ItemType blue_ice = ItemType('minecraft:blue_ice');

  /// [Blue Orchid](https://minecraft.gamepedia.com/blue_orchid)
  ///
  /// _(minecraft:blue_orchid)_
  static const ItemType blue_orchid = ItemType('minecraft:blue_orchid');

  /// [Blue Shulker Box](https://minecraft.gamepedia.com/blue_shulker_box)
  ///
  /// _(minecraft:blue_shulker_box)_
  static const ItemType blue_shulker_box =
      ItemType('minecraft:blue_shulker_box');

  /// [Blue Stained Glass](https://minecraft.gamepedia.com/blue_stained_glass)
  ///
  /// _(minecraft:blue_stained_glass)_
  static const ItemType blue_stained_glass =
      ItemType('minecraft:blue_stained_glass');

  /// [Blue Stained Glass Pane](https://minecraft.gamepedia.com/blue_stained_glass_pane)
  ///
  /// _(minecraft:blue_stained_glass_pane)_
  static const ItemType blue_stained_glass_pane =
      ItemType('minecraft:blue_stained_glass_pane');

  /// [Blue Terracotta](https://minecraft.gamepedia.com/blue_terracotta)
  ///
  /// _(minecraft:blue_terracotta)_
  static const ItemType blue_terracotta = ItemType('minecraft:blue_terracotta');

  /// [Blue Wool](https://minecraft.gamepedia.com/blue_wool)
  ///
  /// _(minecraft:blue_wool)_
  static const ItemType blue_wool = ItemType('minecraft:blue_wool');

  /// [Bone](https://minecraft.gamepedia.com/bone)
  ///
  /// _(minecraft:bone)_
  static const ItemType bone = ItemType('minecraft:bone');

  /// [Bone Block](https://minecraft.gamepedia.com/bone_block)
  ///
  /// _(minecraft:bone_block)_
  static const ItemType bone_block = ItemType('minecraft:bone_block');

  /// [Bone Meal](https://minecraft.gamepedia.com/bone_meal)
  ///
  /// _(minecraft:bone_meal)_
  static const ItemType bone_meal = ItemType('minecraft:bone_meal');

  /// [Book](https://minecraft.gamepedia.com/book)
  ///
  /// _(minecraft:book)_
  static const ItemType book = ItemType('minecraft:book');

  /// [Bookshelf](https://minecraft.gamepedia.com/bookshelf)
  ///
  /// _(minecraft:bookshelf)_
  static const ItemType bookshelf = ItemType('minecraft:bookshelf');

  /// [Bow](https://minecraft.gamepedia.com/bow)
  ///
  /// _(minecraft:bow)_
  static const ItemType bow = ItemType('minecraft:bow');

  /// [Bowl](https://minecraft.gamepedia.com/bowl)
  ///
  /// _(minecraft:bowl)_
  static const ItemType bowl = ItemType('minecraft:bowl');

  /// [Brain Coral](https://minecraft.gamepedia.com/brain_coral)
  ///
  /// _(minecraft:brain_coral)_
  static const ItemType brain_coral = ItemType('minecraft:brain_coral');

  /// [Brain Coral Block](https://minecraft.gamepedia.com/brain_coral_block)
  ///
  /// _(minecraft:brain_coral_block)_
  static const ItemType brain_coral_block =
      ItemType('minecraft:brain_coral_block');

  /// [Brain Coral Fan](https://minecraft.gamepedia.com/brain_coral_fan)
  ///
  /// _(minecraft:brain_coral_fan)_
  static const ItemType brain_coral_fan = ItemType('minecraft:brain_coral_fan');

  /// [Bread](https://minecraft.gamepedia.com/bread)
  ///
  /// _(minecraft:bread)_
  static const ItemType bread = ItemType('minecraft:bread');

  /// [Brewing Stand](https://minecraft.gamepedia.com/brewing_stand)
  ///
  /// _(minecraft:brewing_stand)_
  static const ItemType brewing_stand = ItemType('minecraft:brewing_stand');

  /// [Brick](https://minecraft.gamepedia.com/brick)
  ///
  /// _(minecraft:brick)_
  static const ItemType brick = ItemType('minecraft:brick');

  /// [Brick Slab](https://minecraft.gamepedia.com/brick_slab)
  ///
  /// _(minecraft:brick_slab)_
  static const ItemType brick_slab = ItemType('minecraft:brick_slab');

  /// [Brick Stairs](https://minecraft.gamepedia.com/brick_stairs)
  ///
  /// _(minecraft:brick_stairs)_
  static const ItemType brick_stairs = ItemType('minecraft:brick_stairs');

  /// [Brick Wall](https://minecraft.gamepedia.com/brick_wall)
  ///
  /// _(minecraft:brick_wall)_
  static const ItemType brick_wall = ItemType('minecraft:brick_wall');

  /// [Bricks](https://minecraft.gamepedia.com/bricks)
  ///
  /// _(minecraft:bricks)_
  static const ItemType bricks = ItemType('minecraft:bricks');

  /// [Brown Banner](https://minecraft.gamepedia.com/brown_banner)
  ///
  /// _(minecraft:brown_banner)_
  static const ItemType brown_banner = ItemType('minecraft:brown_banner');

  /// [Brown Bed](https://minecraft.gamepedia.com/brown_bed)
  ///
  /// _(minecraft:brown_bed)_
  static const ItemType brown_bed = ItemType('minecraft:brown_bed');

  /// [Brown Carpet](https://minecraft.gamepedia.com/brown_carpet)
  ///
  /// _(minecraft:brown_carpet)_
  static const ItemType brown_carpet = ItemType('minecraft:brown_carpet');

  /// [Brown Concrete](https://minecraft.gamepedia.com/brown_concrete)
  ///
  /// _(minecraft:brown_concrete)_
  static const ItemType brown_concrete = ItemType('minecraft:brown_concrete');

  /// [Brown Concrete Powder](https://minecraft.gamepedia.com/brown_concrete_powder)
  ///
  /// _(minecraft:brown_concrete_powder)_
  static const ItemType brown_concrete_powder =
      ItemType('minecraft:brown_concrete_powder');

  /// [Brown Dye](https://minecraft.gamepedia.com/brown_dye)
  ///
  /// _(minecraft:brown_dye)_
  static const ItemType brown_dye = ItemType('minecraft:brown_dye');

  /// [Brown Glazed Terracotta](https://minecraft.gamepedia.com/brown_glazed_terracotta)
  ///
  /// _(minecraft:brown_glazed_terracotta)_
  static const ItemType brown_glazed_terracotta =
      ItemType('minecraft:brown_glazed_terracotta');

  /// [Brown Mushroom](https://minecraft.gamepedia.com/brown_mushroom)
  ///
  /// _(minecraft:brown_mushroom)_
  static const ItemType brown_mushroom = ItemType('minecraft:brown_mushroom');

  /// [Brown Mushroom Block](https://minecraft.gamepedia.com/brown_mushroom_block)
  ///
  /// _(minecraft:brown_mushroom_block)_
  static const ItemType brown_mushroom_block =
      ItemType('minecraft:brown_mushroom_block');

  /// [Brown Shulker Box](https://minecraft.gamepedia.com/brown_shulker_box)
  ///
  /// _(minecraft:brown_shulker_box)_
  static const ItemType brown_shulker_box =
      ItemType('minecraft:brown_shulker_box');

  /// [Brown Stained Glass](https://minecraft.gamepedia.com/brown_stained_glass)
  ///
  /// _(minecraft:brown_stained_glass)_
  static const ItemType brown_stained_glass =
      ItemType('minecraft:brown_stained_glass');

  /// [Brown Stained Glass Pane](https://minecraft.gamepedia.com/brown_stained_glass_pane)
  ///
  /// _(minecraft:brown_stained_glass_pane)_
  static const ItemType brown_stained_glass_pane =
      ItemType('minecraft:brown_stained_glass_pane');

  /// [Brown Terracotta](https://minecraft.gamepedia.com/brown_terracotta)
  ///
  /// _(minecraft:brown_terracotta)_
  static const ItemType brown_terracotta =
      ItemType('minecraft:brown_terracotta');

  /// [Brown Wool](https://minecraft.gamepedia.com/brown_wool)
  ///
  /// _(minecraft:brown_wool)_
  static const ItemType brown_wool = ItemType('minecraft:brown_wool');

  /// [Bubble Coral](https://minecraft.gamepedia.com/bubble_coral)
  ///
  /// _(minecraft:bubble_coral)_
  static const ItemType bubble_coral = ItemType('minecraft:bubble_coral');

  /// [Bubble Coral Block](https://minecraft.gamepedia.com/bubble_coral_block)
  ///
  /// _(minecraft:bubble_coral_block)_
  static const ItemType bubble_coral_block =
      ItemType('minecraft:bubble_coral_block');

  /// [Bubble Coral Fan](https://minecraft.gamepedia.com/bubble_coral_fan)
  ///
  /// _(minecraft:bubble_coral_fan)_
  static const ItemType bubble_coral_fan =
      ItemType('minecraft:bubble_coral_fan');

  /// [Bucket](https://minecraft.gamepedia.com/bucket)
  ///
  /// _(minecraft:bucket)_
  static const ItemType bucket = ItemType('minecraft:bucket');

  /// [Cactus](https://minecraft.gamepedia.com/cactus)
  ///
  /// _(minecraft:cactus)_
  static const ItemType cactus = ItemType('minecraft:cactus');

  /// [Cake](https://minecraft.gamepedia.com/cake)
  ///
  /// _(minecraft:cake)_
  static const ItemType cake = ItemType('minecraft:cake');

  /// [Campfire](https://minecraft.gamepedia.com/campfire)
  ///
  /// _(minecraft:campfire)_
  static const ItemType campfire = ItemType('minecraft:campfire');

  /// [Carrot](https://minecraft.gamepedia.com/carrot)
  ///
  /// _(minecraft:carrot)_
  static const ItemType carrot = ItemType('minecraft:carrot');

  /// [Carrot On A Stick](https://minecraft.gamepedia.com/carrot_on_a_stick)
  ///
  /// _(minecraft:carrot_on_a_stick)_
  static const ItemType carrot_on_a_stick =
      ItemType('minecraft:carrot_on_a_stick');

  /// [Cartography Table](https://minecraft.gamepedia.com/cartography_table)
  ///
  /// _(minecraft:cartography_table)_
  static const ItemType cartography_table =
      ItemType('minecraft:cartography_table');

  /// [Carved Pumpkin](https://minecraft.gamepedia.com/carved_pumpkin)
  ///
  /// _(minecraft:carved_pumpkin)_
  static const ItemType carved_pumpkin = ItemType('minecraft:carved_pumpkin');

  /// [Cat Spawn Egg](https://minecraft.gamepedia.com/cat_spawn_egg)
  ///
  /// _(minecraft:cat_spawn_egg)_
  static const ItemType cat_spawn_egg = ItemType('minecraft:cat_spawn_egg');

  /// [Cauldron](https://minecraft.gamepedia.com/cauldron)
  ///
  /// _(minecraft:cauldron)_
  static const ItemType cauldron = ItemType('minecraft:cauldron');

  /// [Cave Spider Spawn Egg](https://minecraft.gamepedia.com/cave_spider_spawn_egg)
  ///
  /// _(minecraft:cave_spider_spawn_egg)_
  static const ItemType cave_spider_spawn_egg =
      ItemType('minecraft:cave_spider_spawn_egg');

  /// [Chain Command Block](https://minecraft.gamepedia.com/chain_command_block)
  ///
  /// _(minecraft:chain_command_block)_
  static const ItemType chain_command_block =
      ItemType('minecraft:chain_command_block');

  /// [Chainmail Boots](https://minecraft.gamepedia.com/chainmail_boots)
  ///
  /// _(minecraft:chainmail_boots)_
  static const ItemType chainmail_boots = ItemType('minecraft:chainmail_boots');

  /// [Chainmail Chestplate](https://minecraft.gamepedia.com/chainmail_chestplate)
  ///
  /// _(minecraft:chainmail_chestplate)_
  static const ItemType chainmail_chestplate =
      ItemType('minecraft:chainmail_chestplate');

  /// [Chainmail Helmet](https://minecraft.gamepedia.com/chainmail_helmet)
  ///
  /// _(minecraft:chainmail_helmet)_
  static const ItemType chainmail_helmet =
      ItemType('minecraft:chainmail_helmet');

  /// [Chainmail Leggings](https://minecraft.gamepedia.com/chainmail_leggings)
  ///
  /// _(minecraft:chainmail_leggings)_
  static const ItemType chainmail_leggings =
      ItemType('minecraft:chainmail_leggings');

  /// [Charcoal](https://minecraft.gamepedia.com/charcoal)
  ///
  /// _(minecraft:charcoal)_
  static const ItemType charcoal = ItemType('minecraft:charcoal');

  /// [Chest](https://minecraft.gamepedia.com/chest)
  ///
  /// _(minecraft:chest)_
  static const ItemType chest = ItemType('minecraft:chest');

  /// [Chest Minecart](https://minecraft.gamepedia.com/chest_minecart)
  ///
  /// _(minecraft:chest_minecart)_
  static const ItemType chest_minecart = ItemType('minecraft:chest_minecart');

  /// [Chicken](https://minecraft.gamepedia.com/chicken)
  ///
  /// _(minecraft:chicken)_
  static const ItemType chicken = ItemType('minecraft:chicken');

  /// [Chicken Spawn Egg](https://minecraft.gamepedia.com/chicken_spawn_egg)
  ///
  /// _(minecraft:chicken_spawn_egg)_
  static const ItemType chicken_spawn_egg =
      ItemType('minecraft:chicken_spawn_egg');

  /// [Chipped Anvil](https://minecraft.gamepedia.com/chipped_anvil)
  ///
  /// _(minecraft:chipped_anvil)_
  static const ItemType chipped_anvil = ItemType('minecraft:chipped_anvil');

  /// [Chiseled Quartz Block](https://minecraft.gamepedia.com/chiseled_quartz_block)
  ///
  /// _(minecraft:chiseled_quartz_block)_
  static const ItemType chiseled_quartz_block =
      ItemType('minecraft:chiseled_quartz_block');

  /// [Chiseled Red Sandstone](https://minecraft.gamepedia.com/chiseled_red_sandstone)
  ///
  /// _(minecraft:chiseled_red_sandstone)_
  static const ItemType chiseled_red_sandstone =
      ItemType('minecraft:chiseled_red_sandstone');

  /// [Chiseled Sandstone](https://minecraft.gamepedia.com/chiseled_sandstone)
  ///
  /// _(minecraft:chiseled_sandstone)_
  static const ItemType chiseled_sandstone =
      ItemType('minecraft:chiseled_sandstone');

  /// [Chiseled Stone Bricks](https://minecraft.gamepedia.com/chiseled_stone_bricks)
  ///
  /// _(minecraft:chiseled_stone_bricks)_
  static const ItemType chiseled_stone_bricks =
      ItemType('minecraft:chiseled_stone_bricks');

  /// [Chorus Flower](https://minecraft.gamepedia.com/chorus_flower)
  ///
  /// _(minecraft:chorus_flower)_
  static const ItemType chorus_flower = ItemType('minecraft:chorus_flower');

  /// [Chorus Fruit](https://minecraft.gamepedia.com/chorus_fruit)
  ///
  /// _(minecraft:chorus_fruit)_
  static const ItemType chorus_fruit = ItemType('minecraft:chorus_fruit');

  /// [Chorus Plant](https://minecraft.gamepedia.com/chorus_plant)
  ///
  /// _(minecraft:chorus_plant)_
  static const ItemType chorus_plant = ItemType('minecraft:chorus_plant');

  /// [Clay](https://minecraft.gamepedia.com/clay)
  ///
  /// _(minecraft:clay)_
  static const ItemType clay = ItemType('minecraft:clay');

  /// [Clay Ball](https://minecraft.gamepedia.com/clay_ball)
  ///
  /// _(minecraft:clay_ball)_
  static const ItemType clay_ball = ItemType('minecraft:clay_ball');

  /// [Clock](https://minecraft.gamepedia.com/clock)
  ///
  /// _(minecraft:clock)_
  static const ItemType clock = ItemType('minecraft:clock');

  /// [Coal](https://minecraft.gamepedia.com/coal)
  ///
  /// _(minecraft:coal)_
  static const ItemType coal = ItemType('minecraft:coal');

  /// [Coal Block](https://minecraft.gamepedia.com/coal_block)
  ///
  /// _(minecraft:coal_block)_
  static const ItemType coal_block = ItemType('minecraft:coal_block');

  /// [Coal Ore](https://minecraft.gamepedia.com/coal_ore)
  ///
  /// _(minecraft:coal_ore)_
  static const ItemType coal_ore = ItemType('minecraft:coal_ore');

  /// [Coarse Dirt](https://minecraft.gamepedia.com/coarse_dirt)
  ///
  /// _(minecraft:coarse_dirt)_
  static const ItemType coarse_dirt = ItemType('minecraft:coarse_dirt');

  /// [Cobblestone](https://minecraft.gamepedia.com/cobblestone)
  ///
  /// _(minecraft:cobblestone)_
  static const ItemType cobblestone = ItemType('minecraft:cobblestone');

  /// [Cobblestone Slab](https://minecraft.gamepedia.com/cobblestone_slab)
  ///
  /// _(minecraft:cobblestone_slab)_
  static const ItemType cobblestone_slab =
      ItemType('minecraft:cobblestone_slab');

  /// [Cobblestone Stairs](https://minecraft.gamepedia.com/cobblestone_stairs)
  ///
  /// _(minecraft:cobblestone_stairs)_
  static const ItemType cobblestone_stairs =
      ItemType('minecraft:cobblestone_stairs');

  /// [Cobblestone Wall](https://minecraft.gamepedia.com/cobblestone_wall)
  ///
  /// _(minecraft:cobblestone_wall)_
  static const ItemType cobblestone_wall =
      ItemType('minecraft:cobblestone_wall');

  /// [Cobweb](https://minecraft.gamepedia.com/cobweb)
  ///
  /// _(minecraft:cobweb)_
  static const ItemType cobweb = ItemType('minecraft:cobweb');

  /// [Cocoa Beans](https://minecraft.gamepedia.com/cocoa_beans)
  ///
  /// _(minecraft:cocoa_beans)_
  static const ItemType cocoa_beans = ItemType('minecraft:cocoa_beans');

  /// [Cod](https://minecraft.gamepedia.com/cod)
  ///
  /// _(minecraft:cod)_
  static const ItemType cod = ItemType('minecraft:cod');

  /// [Cod Bucket](https://minecraft.gamepedia.com/cod_bucket)
  ///
  /// _(minecraft:cod_bucket)_
  static const ItemType cod_bucket = ItemType('minecraft:cod_bucket');

  /// [Cod Spawn Egg](https://minecraft.gamepedia.com/cod_spawn_egg)
  ///
  /// _(minecraft:cod_spawn_egg)_
  static const ItemType cod_spawn_egg = ItemType('minecraft:cod_spawn_egg');

  /// [Command Block](https://minecraft.gamepedia.com/command_block)
  ///
  /// _(minecraft:command_block)_
  static const ItemType command_block = ItemType('minecraft:command_block');

  /// [Command Block Minecart](https://minecraft.gamepedia.com/command_block_minecart)
  ///
  /// _(minecraft:command_block_minecart)_
  static const ItemType command_block_minecart =
      ItemType('minecraft:command_block_minecart');

  /// [Comparator](https://minecraft.gamepedia.com/comparator)
  ///
  /// _(minecraft:comparator)_
  static const ItemType comparator = ItemType('minecraft:comparator');

  /// [Compass](https://minecraft.gamepedia.com/compass)
  ///
  /// _(minecraft:compass)_
  static const ItemType compass = ItemType('minecraft:compass');

  /// [Composter](https://minecraft.gamepedia.com/composter)
  ///
  /// _(minecraft:composter)_
  static const ItemType composter = ItemType('minecraft:composter');

  /// [Conduit](https://minecraft.gamepedia.com/conduit)
  ///
  /// _(minecraft:conduit)_
  static const ItemType conduit = ItemType('minecraft:conduit');

  /// [Cooked Beef](https://minecraft.gamepedia.com/cooked_beef)
  ///
  /// _(minecraft:cooked_beef)_
  static const ItemType cooked_beef = ItemType('minecraft:cooked_beef');

  /// [Cooked Chicken](https://minecraft.gamepedia.com/cooked_chicken)
  ///
  /// _(minecraft:cooked_chicken)_
  static const ItemType cooked_chicken = ItemType('minecraft:cooked_chicken');

  /// [Cooked Cod](https://minecraft.gamepedia.com/cooked_cod)
  ///
  /// _(minecraft:cooked_cod)_
  static const ItemType cooked_cod = ItemType('minecraft:cooked_cod');

  /// [Cooked Mutton](https://minecraft.gamepedia.com/cooked_mutton)
  ///
  /// _(minecraft:cooked_mutton)_
  static const ItemType cooked_mutton = ItemType('minecraft:cooked_mutton');

  /// [Cooked Porkchop](https://minecraft.gamepedia.com/cooked_porkchop)
  ///
  /// _(minecraft:cooked_porkchop)_
  static const ItemType cooked_porkchop = ItemType('minecraft:cooked_porkchop');

  /// [Cooked Rabbit](https://minecraft.gamepedia.com/cooked_rabbit)
  ///
  /// _(minecraft:cooked_rabbit)_
  static const ItemType cooked_rabbit = ItemType('minecraft:cooked_rabbit');

  /// [Cooked Salmon](https://minecraft.gamepedia.com/cooked_salmon)
  ///
  /// _(minecraft:cooked_salmon)_
  static const ItemType cooked_salmon = ItemType('minecraft:cooked_salmon');

  /// [Cookie](https://minecraft.gamepedia.com/cookie)
  ///
  /// _(minecraft:cookie)_
  static const ItemType cookie = ItemType('minecraft:cookie');

  /// [Cornflower](https://minecraft.gamepedia.com/cornflower)
  ///
  /// _(minecraft:cornflower)_
  static const ItemType cornflower = ItemType('minecraft:cornflower');

  /// [Cow Spawn Egg](https://minecraft.gamepedia.com/cow_spawn_egg)
  ///
  /// _(minecraft:cow_spawn_egg)_
  static const ItemType cow_spawn_egg = ItemType('minecraft:cow_spawn_egg');

  /// [Cracked Stone Bricks](https://minecraft.gamepedia.com/cracked_stone_bricks)
  ///
  /// _(minecraft:cracked_stone_bricks)_
  static const ItemType cracked_stone_bricks =
      ItemType('minecraft:cracked_stone_bricks');

  /// [Crafting Table](https://minecraft.gamepedia.com/crafting_table)
  ///
  /// _(minecraft:crafting_table)_
  static const ItemType crafting_table = ItemType('minecraft:crafting_table');

  /// [Creeper Banner Pattern](https://minecraft.gamepedia.com/creeper_banner_pattern)
  ///
  /// _(minecraft:creeper_banner_pattern)_
  static const ItemType creeper_banner_pattern =
      ItemType('minecraft:creeper_banner_pattern');

  /// [Creeper Head](https://minecraft.gamepedia.com/creeper_head)
  ///
  /// _(minecraft:creeper_head)_
  static const ItemType creeper_head = ItemType('minecraft:creeper_head');

  /// [Creeper Spawn Egg](https://minecraft.gamepedia.com/creeper_spawn_egg)
  ///
  /// _(minecraft:creeper_spawn_egg)_
  static const ItemType creeper_spawn_egg =
      ItemType('minecraft:creeper_spawn_egg');

  /// [Crossbow](https://minecraft.gamepedia.com/crossbow)
  ///
  /// _(minecraft:crossbow)_
  static const ItemType crossbow = ItemType('minecraft:crossbow');

  /// [Cut Red Sandstone](https://minecraft.gamepedia.com/cut_red_sandstone)
  ///
  /// _(minecraft:cut_red_sandstone)_
  static const ItemType cut_red_sandstone =
      ItemType('minecraft:cut_red_sandstone');

  /// [Cut Red Sandstone Slab](https://minecraft.gamepedia.com/cut_red_sandstone_slab)
  ///
  /// _(minecraft:cut_red_sandstone_slab)_
  static const ItemType cut_red_sandstone_slab =
      ItemType('minecraft:cut_red_sandstone_slab');

  /// [Cut Sandstone](https://minecraft.gamepedia.com/cut_sandstone)
  ///
  /// _(minecraft:cut_sandstone)_
  static const ItemType cut_sandstone = ItemType('minecraft:cut_sandstone');

  /// [Cut Sandstone Slab](https://minecraft.gamepedia.com/cut_sandstone_slab)
  ///
  /// _(minecraft:cut_sandstone_slab)_
  static const ItemType cut_sandstone_slab =
      ItemType('minecraft:cut_sandstone_slab');

  /// [Cyan Banner](https://minecraft.gamepedia.com/cyan_banner)
  ///
  /// _(minecraft:cyan_banner)_
  static const ItemType cyan_banner = ItemType('minecraft:cyan_banner');

  /// [Cyan Bed](https://minecraft.gamepedia.com/cyan_bed)
  ///
  /// _(minecraft:cyan_bed)_
  static const ItemType cyan_bed = ItemType('minecraft:cyan_bed');

  /// [Cyan Carpet](https://minecraft.gamepedia.com/cyan_carpet)
  ///
  /// _(minecraft:cyan_carpet)_
  static const ItemType cyan_carpet = ItemType('minecraft:cyan_carpet');

  /// [Cyan Concrete](https://minecraft.gamepedia.com/cyan_concrete)
  ///
  /// _(minecraft:cyan_concrete)_
  static const ItemType cyan_concrete = ItemType('minecraft:cyan_concrete');

  /// [Cyan Concrete Powder](https://minecraft.gamepedia.com/cyan_concrete_powder)
  ///
  /// _(minecraft:cyan_concrete_powder)_
  static const ItemType cyan_concrete_powder =
      ItemType('minecraft:cyan_concrete_powder');

  /// [Cyan Dye](https://minecraft.gamepedia.com/cyan_dye)
  ///
  /// _(minecraft:cyan_dye)_
  static const ItemType cyan_dye = ItemType('minecraft:cyan_dye');

  /// [Cyan Glazed Terracotta](https://minecraft.gamepedia.com/cyan_glazed_terracotta)
  ///
  /// _(minecraft:cyan_glazed_terracotta)_
  static const ItemType cyan_glazed_terracotta =
      ItemType('minecraft:cyan_glazed_terracotta');

  /// [Cyan Shulker Box](https://minecraft.gamepedia.com/cyan_shulker_box)
  ///
  /// _(minecraft:cyan_shulker_box)_
  static const ItemType cyan_shulker_box =
      ItemType('minecraft:cyan_shulker_box');

  /// [Cyan Stained Glass](https://minecraft.gamepedia.com/cyan_stained_glass)
  ///
  /// _(minecraft:cyan_stained_glass)_
  static const ItemType cyan_stained_glass =
      ItemType('minecraft:cyan_stained_glass');

  /// [Cyan Stained Glass Pane](https://minecraft.gamepedia.com/cyan_stained_glass_pane)
  ///
  /// _(minecraft:cyan_stained_glass_pane)_
  static const ItemType cyan_stained_glass_pane =
      ItemType('minecraft:cyan_stained_glass_pane');

  /// [Cyan Terracotta](https://minecraft.gamepedia.com/cyan_terracotta)
  ///
  /// _(minecraft:cyan_terracotta)_
  static const ItemType cyan_terracotta = ItemType('minecraft:cyan_terracotta');

  /// [Cyan Wool](https://minecraft.gamepedia.com/cyan_wool)
  ///
  /// _(minecraft:cyan_wool)_
  static const ItemType cyan_wool = ItemType('minecraft:cyan_wool');

  /// [Damaged Anvil](https://minecraft.gamepedia.com/damaged_anvil)
  ///
  /// _(minecraft:damaged_anvil)_
  static const ItemType damaged_anvil = ItemType('minecraft:damaged_anvil');

  /// [Dandelion](https://minecraft.gamepedia.com/dandelion)
  ///
  /// _(minecraft:dandelion)_
  static const ItemType dandelion = ItemType('minecraft:dandelion');

  /// [Dark Oak Boat](https://minecraft.gamepedia.com/dark_oak_boat)
  ///
  /// _(minecraft:dark_oak_boat)_
  static const ItemType dark_oak_boat = ItemType('minecraft:dark_oak_boat');

  /// [Dark Oak Button](https://minecraft.gamepedia.com/dark_oak_button)
  ///
  /// _(minecraft:dark_oak_button)_
  static const ItemType dark_oak_button = ItemType('minecraft:dark_oak_button');

  /// [Dark Oak Door](https://minecraft.gamepedia.com/dark_oak_door)
  ///
  /// _(minecraft:dark_oak_door)_
  static const ItemType dark_oak_door = ItemType('minecraft:dark_oak_door');

  /// [Dark Oak Fence](https://minecraft.gamepedia.com/dark_oak_fence)
  ///
  /// _(minecraft:dark_oak_fence)_
  static const ItemType dark_oak_fence = ItemType('minecraft:dark_oak_fence');

  /// [Dark Oak Fence Gate](https://minecraft.gamepedia.com/dark_oak_fence_gate)
  ///
  /// _(minecraft:dark_oak_fence_gate)_
  static const ItemType dark_oak_fence_gate =
      ItemType('minecraft:dark_oak_fence_gate');

  /// [Dark Oak Leaves](https://minecraft.gamepedia.com/dark_oak_leaves)
  ///
  /// _(minecraft:dark_oak_leaves)_
  static const ItemType dark_oak_leaves = ItemType('minecraft:dark_oak_leaves');

  /// [Dark Oak Log](https://minecraft.gamepedia.com/dark_oak_log)
  ///
  /// _(minecraft:dark_oak_log)_
  static const ItemType dark_oak_log = ItemType('minecraft:dark_oak_log');

  /// [Dark Oak Planks](https://minecraft.gamepedia.com/dark_oak_planks)
  ///
  /// _(minecraft:dark_oak_planks)_
  static const ItemType dark_oak_planks = ItemType('minecraft:dark_oak_planks');

  /// [Dark Oak Pressure Plate](https://minecraft.gamepedia.com/dark_oak_pressure_plate)
  ///
  /// _(minecraft:dark_oak_pressure_plate)_
  static const ItemType dark_oak_pressure_plate =
      ItemType('minecraft:dark_oak_pressure_plate');

  /// [Dark Oak Sapling](https://minecraft.gamepedia.com/dark_oak_sapling)
  ///
  /// _(minecraft:dark_oak_sapling)_
  static const ItemType dark_oak_sapling =
      ItemType('minecraft:dark_oak_sapling');

  /// [Dark Oak Sign](https://minecraft.gamepedia.com/dark_oak_sign)
  ///
  /// _(minecraft:dark_oak_sign)_
  static const ItemType dark_oak_sign = ItemType('minecraft:dark_oak_sign');

  /// [Dark Oak Slab](https://minecraft.gamepedia.com/dark_oak_slab)
  ///
  /// _(minecraft:dark_oak_slab)_
  static const ItemType dark_oak_slab = ItemType('minecraft:dark_oak_slab');

  /// [Dark Oak Stairs](https://minecraft.gamepedia.com/dark_oak_stairs)
  ///
  /// _(minecraft:dark_oak_stairs)_
  static const ItemType dark_oak_stairs = ItemType('minecraft:dark_oak_stairs');

  /// [Dark Oak Trapdoor](https://minecraft.gamepedia.com/dark_oak_trapdoor)
  ///
  /// _(minecraft:dark_oak_trapdoor)_
  static const ItemType dark_oak_trapdoor =
      ItemType('minecraft:dark_oak_trapdoor');

  /// [Dark Oak Wood](https://minecraft.gamepedia.com/dark_oak_wood)
  ///
  /// _(minecraft:dark_oak_wood)_
  static const ItemType dark_oak_wood = ItemType('minecraft:dark_oak_wood');

  /// [Dark Prismarine](https://minecraft.gamepedia.com/dark_prismarine)
  ///
  /// _(minecraft:dark_prismarine)_
  static const ItemType dark_prismarine = ItemType('minecraft:dark_prismarine');

  /// [Dark Prismarine Slab](https://minecraft.gamepedia.com/dark_prismarine_slab)
  ///
  /// _(minecraft:dark_prismarine_slab)_
  static const ItemType dark_prismarine_slab =
      ItemType('minecraft:dark_prismarine_slab');

  /// [Dark Prismarine Stairs](https://minecraft.gamepedia.com/dark_prismarine_stairs)
  ///
  /// _(minecraft:dark_prismarine_stairs)_
  static const ItemType dark_prismarine_stairs =
      ItemType('minecraft:dark_prismarine_stairs');

  /// [Daylight Detector](https://minecraft.gamepedia.com/daylight_detector)
  ///
  /// _(minecraft:daylight_detector)_
  static const ItemType daylight_detector =
      ItemType('minecraft:daylight_detector');

  /// [Dead Brain Coral](https://minecraft.gamepedia.com/dead_brain_coral)
  ///
  /// _(minecraft:dead_brain_coral)_
  static const ItemType dead_brain_coral =
      ItemType('minecraft:dead_brain_coral');

  /// [Dead Brain Coral Block](https://minecraft.gamepedia.com/dead_brain_coral_block)
  ///
  /// _(minecraft:dead_brain_coral_block)_
  static const ItemType dead_brain_coral_block =
      ItemType('minecraft:dead_brain_coral_block');

  /// [Dead Brain Coral Fan](https://minecraft.gamepedia.com/dead_brain_coral_fan)
  ///
  /// _(minecraft:dead_brain_coral_fan)_
  static const ItemType dead_brain_coral_fan =
      ItemType('minecraft:dead_brain_coral_fan');

  /// [Dead Bubble Coral](https://minecraft.gamepedia.com/dead_bubble_coral)
  ///
  /// _(minecraft:dead_bubble_coral)_
  static const ItemType dead_bubble_coral =
      ItemType('minecraft:dead_bubble_coral');

  /// [Dead Bubble Coral Block](https://minecraft.gamepedia.com/dead_bubble_coral_block)
  ///
  /// _(minecraft:dead_bubble_coral_block)_
  static const ItemType dead_bubble_coral_block =
      ItemType('minecraft:dead_bubble_coral_block');

  /// [Dead Bubble Coral Fan](https://minecraft.gamepedia.com/dead_bubble_coral_fan)
  ///
  /// _(minecraft:dead_bubble_coral_fan)_
  static const ItemType dead_bubble_coral_fan =
      ItemType('minecraft:dead_bubble_coral_fan');

  /// [Dead Bush](https://minecraft.gamepedia.com/dead_bush)
  ///
  /// _(minecraft:dead_bush)_
  static const ItemType dead_bush = ItemType('minecraft:dead_bush');

  /// [Dead Fire Coral](https://minecraft.gamepedia.com/dead_fire_coral)
  ///
  /// _(minecraft:dead_fire_coral)_
  static const ItemType dead_fire_coral = ItemType('minecraft:dead_fire_coral');

  /// [Dead Fire Coral Block](https://minecraft.gamepedia.com/dead_fire_coral_block)
  ///
  /// _(minecraft:dead_fire_coral_block)_
  static const ItemType dead_fire_coral_block =
      ItemType('minecraft:dead_fire_coral_block');

  /// [Dead Fire Coral Fan](https://minecraft.gamepedia.com/dead_fire_coral_fan)
  ///
  /// _(minecraft:dead_fire_coral_fan)_
  static const ItemType dead_fire_coral_fan =
      ItemType('minecraft:dead_fire_coral_fan');

  /// [Dead Horn Coral](https://minecraft.gamepedia.com/dead_horn_coral)
  ///
  /// _(minecraft:dead_horn_coral)_
  static const ItemType dead_horn_coral = ItemType('minecraft:dead_horn_coral');

  /// [Dead Horn Coral Block](https://minecraft.gamepedia.com/dead_horn_coral_block)
  ///
  /// _(minecraft:dead_horn_coral_block)_
  static const ItemType dead_horn_coral_block =
      ItemType('minecraft:dead_horn_coral_block');

  /// [Dead Horn Coral Fan](https://minecraft.gamepedia.com/dead_horn_coral_fan)
  ///
  /// _(minecraft:dead_horn_coral_fan)_
  static const ItemType dead_horn_coral_fan =
      ItemType('minecraft:dead_horn_coral_fan');

  /// [Dead Tube Coral](https://minecraft.gamepedia.com/dead_tube_coral)
  ///
  /// _(minecraft:dead_tube_coral)_
  static const ItemType dead_tube_coral = ItemType('minecraft:dead_tube_coral');

  /// [Dead Tube Coral Block](https://minecraft.gamepedia.com/dead_tube_coral_block)
  ///
  /// _(minecraft:dead_tube_coral_block)_
  static const ItemType dead_tube_coral_block =
      ItemType('minecraft:dead_tube_coral_block');

  /// [Dead Tube Coral Fan](https://minecraft.gamepedia.com/dead_tube_coral_fan)
  ///
  /// _(minecraft:dead_tube_coral_fan)_
  static const ItemType dead_tube_coral_fan =
      ItemType('minecraft:dead_tube_coral_fan');

  /// [Debug Stick](https://minecraft.gamepedia.com/debug_stick)
  ///
  /// _(minecraft:debug_stick)_
  static const ItemType debug_stick = ItemType('minecraft:debug_stick');

  /// [Detector Rail](https://minecraft.gamepedia.com/detector_rail)
  ///
  /// _(minecraft:detector_rail)_
  static const ItemType detector_rail = ItemType('minecraft:detector_rail');

  /// [Diamond](https://minecraft.gamepedia.com/diamond)
  ///
  /// _(minecraft:diamond)_
  static const ItemType diamond = ItemType('minecraft:diamond');

  /// [Diamond Axe](https://minecraft.gamepedia.com/diamond_axe)
  ///
  /// _(minecraft:diamond_axe)_
  static const ItemType diamond_axe = ItemType('minecraft:diamond_axe');

  /// [Diamond Block](https://minecraft.gamepedia.com/diamond_block)
  ///
  /// _(minecraft:diamond_block)_
  static const ItemType diamond_block = ItemType('minecraft:diamond_block');

  /// [Diamond Boots](https://minecraft.gamepedia.com/diamond_boots)
  ///
  /// _(minecraft:diamond_boots)_
  static const ItemType diamond_boots = ItemType('minecraft:diamond_boots');

  /// [Diamond Chestplate](https://minecraft.gamepedia.com/diamond_chestplate)
  ///
  /// _(minecraft:diamond_chestplate)_
  static const ItemType diamond_chestplate =
      ItemType('minecraft:diamond_chestplate');

  /// [Diamond Helmet](https://minecraft.gamepedia.com/diamond_helmet)
  ///
  /// _(minecraft:diamond_helmet)_
  static const ItemType diamond_helmet = ItemType('minecraft:diamond_helmet');

  /// [Diamond Hoe](https://minecraft.gamepedia.com/diamond_hoe)
  ///
  /// _(minecraft:diamond_hoe)_
  static const ItemType diamond_hoe = ItemType('minecraft:diamond_hoe');

  /// [Diamond Horse Armor](https://minecraft.gamepedia.com/diamond_horse_armor)
  ///
  /// _(minecraft:diamond_horse_armor)_
  static const ItemType diamond_horse_armor =
      ItemType('minecraft:diamond_horse_armor');

  /// [Diamond Leggings](https://minecraft.gamepedia.com/diamond_leggings)
  ///
  /// _(minecraft:diamond_leggings)_
  static const ItemType diamond_leggings =
      ItemType('minecraft:diamond_leggings');

  /// [Diamond Ore](https://minecraft.gamepedia.com/diamond_ore)
  ///
  /// _(minecraft:diamond_ore)_
  static const ItemType diamond_ore = ItemType('minecraft:diamond_ore');

  /// [Diamond Pickaxe](https://minecraft.gamepedia.com/diamond_pickaxe)
  ///
  /// _(minecraft:diamond_pickaxe)_
  static const ItemType diamond_pickaxe = ItemType('minecraft:diamond_pickaxe');

  /// [Diamond Shovel](https://minecraft.gamepedia.com/diamond_shovel)
  ///
  /// _(minecraft:diamond_shovel)_
  static const ItemType diamond_shovel = ItemType('minecraft:diamond_shovel');

  /// [Diamond Sword](https://minecraft.gamepedia.com/diamond_sword)
  ///
  /// _(minecraft:diamond_sword)_
  static const ItemType diamond_sword = ItemType('minecraft:diamond_sword');

  /// [Diorite](https://minecraft.gamepedia.com/diorite)
  ///
  /// _(minecraft:diorite)_
  static const ItemType diorite = ItemType('minecraft:diorite');

  /// [Diorite Slab](https://minecraft.gamepedia.com/diorite_slab)
  ///
  /// _(minecraft:diorite_slab)_
  static const ItemType diorite_slab = ItemType('minecraft:diorite_slab');

  /// [Diorite Stairs](https://minecraft.gamepedia.com/diorite_stairs)
  ///
  /// _(minecraft:diorite_stairs)_
  static const ItemType diorite_stairs = ItemType('minecraft:diorite_stairs');

  /// [Diorite Wall](https://minecraft.gamepedia.com/diorite_wall)
  ///
  /// _(minecraft:diorite_wall)_
  static const ItemType diorite_wall = ItemType('minecraft:diorite_wall');

  /// [Dirt](https://minecraft.gamepedia.com/dirt)
  ///
  /// _(minecraft:dirt)_
  static const ItemType dirt = ItemType('minecraft:dirt');

  /// [Dispenser](https://minecraft.gamepedia.com/dispenser)
  ///
  /// _(minecraft:dispenser)_
  static const ItemType dispenser = ItemType('minecraft:dispenser');

  /// [Dolphin Spawn Egg](https://minecraft.gamepedia.com/dolphin_spawn_egg)
  ///
  /// _(minecraft:dolphin_spawn_egg)_
  static const ItemType dolphin_spawn_egg =
      ItemType('minecraft:dolphin_spawn_egg');

  /// [Donkey Spawn Egg](https://minecraft.gamepedia.com/donkey_spawn_egg)
  ///
  /// _(minecraft:donkey_spawn_egg)_
  static const ItemType donkey_spawn_egg =
      ItemType('minecraft:donkey_spawn_egg');

  /// [Dragon Breath](https://minecraft.gamepedia.com/dragon_breath)
  ///
  /// _(minecraft:dragon_breath)_
  static const ItemType dragon_breath = ItemType('minecraft:dragon_breath');

  /// [Dragon Egg](https://minecraft.gamepedia.com/dragon_egg)
  ///
  /// _(minecraft:dragon_egg)_
  static const ItemType dragon_egg = ItemType('minecraft:dragon_egg');

  /// [Dragon Head](https://minecraft.gamepedia.com/dragon_head)
  ///
  /// _(minecraft:dragon_head)_
  static const ItemType dragon_head = ItemType('minecraft:dragon_head');

  /// [Dried Kelp](https://minecraft.gamepedia.com/dried_kelp)
  ///
  /// _(minecraft:dried_kelp)_
  static const ItemType dried_kelp = ItemType('minecraft:dried_kelp');

  /// [Dried Kelp Block](https://minecraft.gamepedia.com/dried_kelp_block)
  ///
  /// _(minecraft:dried_kelp_block)_
  static const ItemType dried_kelp_block =
      ItemType('minecraft:dried_kelp_block');

  /// [Dropper](https://minecraft.gamepedia.com/dropper)
  ///
  /// _(minecraft:dropper)_
  static const ItemType dropper = ItemType('minecraft:dropper');

  /// [Drowned Spawn Egg](https://minecraft.gamepedia.com/drowned_spawn_egg)
  ///
  /// _(minecraft:drowned_spawn_egg)_
  static const ItemType drowned_spawn_egg =
      ItemType('minecraft:drowned_spawn_egg');

  /// [Egg](https://minecraft.gamepedia.com/egg)
  ///
  /// _(minecraft:egg)_
  static const ItemType egg = ItemType('minecraft:egg');

  /// [Elder Guardian Spawn Egg](https://minecraft.gamepedia.com/elder_guardian_spawn_egg)
  ///
  /// _(minecraft:elder_guardian_spawn_egg)_
  static const ItemType elder_guardian_spawn_egg =
      ItemType('minecraft:elder_guardian_spawn_egg');

  /// [Elytra](https://minecraft.gamepedia.com/elytra)
  ///
  /// _(minecraft:elytra)_
  static const ItemType elytra = ItemType('minecraft:elytra');

  /// [Emerald](https://minecraft.gamepedia.com/emerald)
  ///
  /// _(minecraft:emerald)_
  static const ItemType emerald = ItemType('minecraft:emerald');

  /// [Emerald Block](https://minecraft.gamepedia.com/emerald_block)
  ///
  /// _(minecraft:emerald_block)_
  static const ItemType emerald_block = ItemType('minecraft:emerald_block');

  /// [Emerald Ore](https://minecraft.gamepedia.com/emerald_ore)
  ///
  /// _(minecraft:emerald_ore)_
  static const ItemType emerald_ore = ItemType('minecraft:emerald_ore');

  /// [Enchanted Book](https://minecraft.gamepedia.com/enchanted_book)
  ///
  /// _(minecraft:enchanted_book)_
  static const ItemType enchanted_book = ItemType('minecraft:enchanted_book');

  /// [Enchanted Golden Apple](https://minecraft.gamepedia.com/enchanted_golden_apple)
  ///
  /// _(minecraft:enchanted_golden_apple)_
  static const ItemType enchanted_golden_apple =
      ItemType('minecraft:enchanted_golden_apple');

  /// [Enchanting Table](https://minecraft.gamepedia.com/enchanting_table)
  ///
  /// _(minecraft:enchanting_table)_
  static const ItemType enchanting_table =
      ItemType('minecraft:enchanting_table');

  /// [End Crystal](https://minecraft.gamepedia.com/end_crystal)
  ///
  /// _(minecraft:end_crystal)_
  static const ItemType end_crystal = ItemType('minecraft:end_crystal');

  /// [End Portal Frame](https://minecraft.gamepedia.com/end_portal_frame)
  ///
  /// _(minecraft:end_portal_frame)_
  static const ItemType end_portal_frame =
      ItemType('minecraft:end_portal_frame');

  /// [End Rod](https://minecraft.gamepedia.com/end_rod)
  ///
  /// _(minecraft:end_rod)_
  static const ItemType end_rod = ItemType('minecraft:end_rod');

  /// [End Stone](https://minecraft.gamepedia.com/end_stone)
  ///
  /// _(minecraft:end_stone)_
  static const ItemType end_stone = ItemType('minecraft:end_stone');

  /// [End Stone Brick Slab](https://minecraft.gamepedia.com/end_stone_brick_slab)
  ///
  /// _(minecraft:end_stone_brick_slab)_
  static const ItemType end_stone_brick_slab =
      ItemType('minecraft:end_stone_brick_slab');

  /// [End Stone Brick Stairs](https://minecraft.gamepedia.com/end_stone_brick_stairs)
  ///
  /// _(minecraft:end_stone_brick_stairs)_
  static const ItemType end_stone_brick_stairs =
      ItemType('minecraft:end_stone_brick_stairs');

  /// [End Stone Brick Wall](https://minecraft.gamepedia.com/end_stone_brick_wall)
  ///
  /// _(minecraft:end_stone_brick_wall)_
  static const ItemType end_stone_brick_wall =
      ItemType('minecraft:end_stone_brick_wall');

  /// [End Stone Bricks](https://minecraft.gamepedia.com/end_stone_bricks)
  ///
  /// _(minecraft:end_stone_bricks)_
  static const ItemType end_stone_bricks =
      ItemType('minecraft:end_stone_bricks');

  /// [Ender Chest](https://minecraft.gamepedia.com/ender_chest)
  ///
  /// _(minecraft:ender_chest)_
  static const ItemType ender_chest = ItemType('minecraft:ender_chest');

  /// [Ender Eye](https://minecraft.gamepedia.com/ender_eye)
  ///
  /// _(minecraft:ender_eye)_
  static const ItemType ender_eye = ItemType('minecraft:ender_eye');

  /// [Ender Pearl](https://minecraft.gamepedia.com/ender_pearl)
  ///
  /// _(minecraft:ender_pearl)_
  static const ItemType ender_pearl = ItemType('minecraft:ender_pearl');

  /// [Enderman Spawn Egg](https://minecraft.gamepedia.com/enderman_spawn_egg)
  ///
  /// _(minecraft:enderman_spawn_egg)_
  static const ItemType enderman_spawn_egg =
      ItemType('minecraft:enderman_spawn_egg');

  /// [Endermite Spawn Egg](https://minecraft.gamepedia.com/endermite_spawn_egg)
  ///
  /// _(minecraft:endermite_spawn_egg)_
  static const ItemType endermite_spawn_egg =
      ItemType('minecraft:endermite_spawn_egg');

  /// [Evoker Spawn Egg](https://minecraft.gamepedia.com/evoker_spawn_egg)
  ///
  /// _(minecraft:evoker_spawn_egg)_
  static const ItemType evoker_spawn_egg =
      ItemType('minecraft:evoker_spawn_egg');

  /// [Experience Bottle](https://minecraft.gamepedia.com/experience_bottle)
  ///
  /// _(minecraft:experience_bottle)_
  static const ItemType experience_bottle =
      ItemType('minecraft:experience_bottle');

  /// [Farmland](https://minecraft.gamepedia.com/farmland)
  ///
  /// _(minecraft:farmland)_
  static const ItemType farmland = ItemType('minecraft:farmland');

  /// [Feather](https://minecraft.gamepedia.com/feather)
  ///
  /// _(minecraft:feather)_
  static const ItemType feather = ItemType('minecraft:feather');

  /// [Fermented Spider Eye](https://minecraft.gamepedia.com/fermented_spider_eye)
  ///
  /// _(minecraft:fermented_spider_eye)_
  static const ItemType fermented_spider_eye =
      ItemType('minecraft:fermented_spider_eye');

  /// [Fern](https://minecraft.gamepedia.com/fern)
  ///
  /// _(minecraft:fern)_
  static const ItemType fern = ItemType('minecraft:fern');

  /// [Filled Map](https://minecraft.gamepedia.com/filled_map)
  ///
  /// _(minecraft:filled_map)_
  static const ItemType filled_map = ItemType('minecraft:filled_map');

  /// [Fire Charge](https://minecraft.gamepedia.com/fire_charge)
  ///
  /// _(minecraft:fire_charge)_
  static const ItemType fire_charge = ItemType('minecraft:fire_charge');

  /// [Fire Coral](https://minecraft.gamepedia.com/fire_coral)
  ///
  /// _(minecraft:fire_coral)_
  static const ItemType fire_coral = ItemType('minecraft:fire_coral');

  /// [Fire Coral Block](https://minecraft.gamepedia.com/fire_coral_block)
  ///
  /// _(minecraft:fire_coral_block)_
  static const ItemType fire_coral_block =
      ItemType('minecraft:fire_coral_block');

  /// [Fire Coral Fan](https://minecraft.gamepedia.com/fire_coral_fan)
  ///
  /// _(minecraft:fire_coral_fan)_
  static const ItemType fire_coral_fan = ItemType('minecraft:fire_coral_fan');

  /// [Firework Rocket](https://minecraft.gamepedia.com/firework_rocket)
  ///
  /// _(minecraft:firework_rocket)_
  static const ItemType firework_rocket = ItemType('minecraft:firework_rocket');

  /// [Firework Star](https://minecraft.gamepedia.com/firework_star)
  ///
  /// _(minecraft:firework_star)_
  static const ItemType firework_star = ItemType('minecraft:firework_star');

  /// [Fishing Rod](https://minecraft.gamepedia.com/fishing_rod)
  ///
  /// _(minecraft:fishing_rod)_
  static const ItemType fishing_rod = ItemType('minecraft:fishing_rod');

  /// [Fletching Table](https://minecraft.gamepedia.com/fletching_table)
  ///
  /// _(minecraft:fletching_table)_
  static const ItemType fletching_table = ItemType('minecraft:fletching_table');

  /// [Flint](https://minecraft.gamepedia.com/flint)
  ///
  /// _(minecraft:flint)_
  static const ItemType flint = ItemType('minecraft:flint');

  /// [Flint And Steel](https://minecraft.gamepedia.com/flint_and_steel)
  ///
  /// _(minecraft:flint_and_steel)_
  static const ItemType flint_and_steel = ItemType('minecraft:flint_and_steel');

  /// [Flower Banner Pattern](https://minecraft.gamepedia.com/flower_banner_pattern)
  ///
  /// _(minecraft:flower_banner_pattern)_
  static const ItemType flower_banner_pattern =
      ItemType('minecraft:flower_banner_pattern');

  /// [Flower Pot](https://minecraft.gamepedia.com/flower_pot)
  ///
  /// _(minecraft:flower_pot)_
  static const ItemType flower_pot = ItemType('minecraft:flower_pot');

  /// [Fox Spawn Egg](https://minecraft.gamepedia.com/fox_spawn_egg)
  ///
  /// _(minecraft:fox_spawn_egg)_
  static const ItemType fox_spawn_egg = ItemType('minecraft:fox_spawn_egg');

  /// [Furnace](https://minecraft.gamepedia.com/furnace)
  ///
  /// _(minecraft:furnace)_
  static const ItemType furnace = ItemType('minecraft:furnace');

  /// [Furnace Minecart](https://minecraft.gamepedia.com/furnace_minecart)
  ///
  /// _(minecraft:furnace_minecart)_
  static const ItemType furnace_minecart =
      ItemType('minecraft:furnace_minecart');

  /// [Ghast Spawn Egg](https://minecraft.gamepedia.com/ghast_spawn_egg)
  ///
  /// _(minecraft:ghast_spawn_egg)_
  static const ItemType ghast_spawn_egg = ItemType('minecraft:ghast_spawn_egg');

  /// [Ghast Tear](https://minecraft.gamepedia.com/ghast_tear)
  ///
  /// _(minecraft:ghast_tear)_
  static const ItemType ghast_tear = ItemType('minecraft:ghast_tear');

  /// [Glass](https://minecraft.gamepedia.com/glass)
  ///
  /// _(minecraft:glass)_
  static const ItemType glass = ItemType('minecraft:glass');

  /// [Glass Bottle](https://minecraft.gamepedia.com/glass_bottle)
  ///
  /// _(minecraft:glass_bottle)_
  static const ItemType glass_bottle = ItemType('minecraft:glass_bottle');

  /// [Glass Pane](https://minecraft.gamepedia.com/glass_pane)
  ///
  /// _(minecraft:glass_pane)_
  static const ItemType glass_pane = ItemType('minecraft:glass_pane');

  /// [Glistering Melon Slice](https://minecraft.gamepedia.com/glistering_melon_slice)
  ///
  /// _(minecraft:glistering_melon_slice)_
  static const ItemType glistering_melon_slice =
      ItemType('minecraft:glistering_melon_slice');

  /// [Globe Banner Pattern](https://minecraft.gamepedia.com/globe_banner_pattern)
  ///
  /// _(minecraft:globe_banner_pattern)_
  static const ItemType globe_banner_pattern =
      ItemType('minecraft:globe_banner_pattern');

  /// [Glowstone](https://minecraft.gamepedia.com/glowstone)
  ///
  /// _(minecraft:glowstone)_
  static const ItemType glowstone = ItemType('minecraft:glowstone');

  /// [Glowstone Dust](https://minecraft.gamepedia.com/glowstone_dust)
  ///
  /// _(minecraft:glowstone_dust)_
  static const ItemType glowstone_dust = ItemType('minecraft:glowstone_dust');

  /// [Gold Block](https://minecraft.gamepedia.com/gold_block)
  ///
  /// _(minecraft:gold_block)_
  static const ItemType gold_block = ItemType('minecraft:gold_block');

  /// [Gold Ingot](https://minecraft.gamepedia.com/gold_ingot)
  ///
  /// _(minecraft:gold_ingot)_
  static const ItemType gold_ingot = ItemType('minecraft:gold_ingot');

  /// [Gold Nugget](https://minecraft.gamepedia.com/gold_nugget)
  ///
  /// _(minecraft:gold_nugget)_
  static const ItemType gold_nugget = ItemType('minecraft:gold_nugget');

  /// [Gold Ore](https://minecraft.gamepedia.com/gold_ore)
  ///
  /// _(minecraft:gold_ore)_
  static const ItemType gold_ore = ItemType('minecraft:gold_ore');

  /// [Golden Apple](https://minecraft.gamepedia.com/golden_apple)
  ///
  /// _(minecraft:golden_apple)_
  static const ItemType golden_apple = ItemType('minecraft:golden_apple');

  /// [Golden Axe](https://minecraft.gamepedia.com/golden_axe)
  ///
  /// _(minecraft:golden_axe)_
  static const ItemType golden_axe = ItemType('minecraft:golden_axe');

  /// [Golden Boots](https://minecraft.gamepedia.com/golden_boots)
  ///
  /// _(minecraft:golden_boots)_
  static const ItemType golden_boots = ItemType('minecraft:golden_boots');

  /// [Golden Carrot](https://minecraft.gamepedia.com/golden_carrot)
  ///
  /// _(minecraft:golden_carrot)_
  static const ItemType golden_carrot = ItemType('minecraft:golden_carrot');

  /// [Golden Chestplate](https://minecraft.gamepedia.com/golden_chestplate)
  ///
  /// _(minecraft:golden_chestplate)_
  static const ItemType golden_chestplate =
      ItemType('minecraft:golden_chestplate');

  /// [Golden Helmet](https://minecraft.gamepedia.com/golden_helmet)
  ///
  /// _(minecraft:golden_helmet)_
  static const ItemType golden_helmet = ItemType('minecraft:golden_helmet');

  /// [Golden Hoe](https://minecraft.gamepedia.com/golden_hoe)
  ///
  /// _(minecraft:golden_hoe)_
  static const ItemType golden_hoe = ItemType('minecraft:golden_hoe');

  /// [Golden Horse Armor](https://minecraft.gamepedia.com/golden_horse_armor)
  ///
  /// _(minecraft:golden_horse_armor)_
  static const ItemType golden_horse_armor =
      ItemType('minecraft:golden_horse_armor');

  /// [Golden Leggings](https://minecraft.gamepedia.com/golden_leggings)
  ///
  /// _(minecraft:golden_leggings)_
  static const ItemType golden_leggings = ItemType('minecraft:golden_leggings');

  /// [Golden Pickaxe](https://minecraft.gamepedia.com/golden_pickaxe)
  ///
  /// _(minecraft:golden_pickaxe)_
  static const ItemType golden_pickaxe = ItemType('minecraft:golden_pickaxe');

  /// [Golden Shovel](https://minecraft.gamepedia.com/golden_shovel)
  ///
  /// _(minecraft:golden_shovel)_
  static const ItemType golden_shovel = ItemType('minecraft:golden_shovel');

  /// [Golden Sword](https://minecraft.gamepedia.com/golden_sword)
  ///
  /// _(minecraft:golden_sword)_
  static const ItemType golden_sword = ItemType('minecraft:golden_sword');

  /// [Granite](https://minecraft.gamepedia.com/granite)
  ///
  /// _(minecraft:granite)_
  static const ItemType granite = ItemType('minecraft:granite');

  /// [Granite Slab](https://minecraft.gamepedia.com/granite_slab)
  ///
  /// _(minecraft:granite_slab)_
  static const ItemType granite_slab = ItemType('minecraft:granite_slab');

  /// [Granite Stairs](https://minecraft.gamepedia.com/granite_stairs)
  ///
  /// _(minecraft:granite_stairs)_
  static const ItemType granite_stairs = ItemType('minecraft:granite_stairs');

  /// [Granite Wall](https://minecraft.gamepedia.com/granite_wall)
  ///
  /// _(minecraft:granite_wall)_
  static const ItemType granite_wall = ItemType('minecraft:granite_wall');

  /// [Grass](https://minecraft.gamepedia.com/grass)
  ///
  /// _(minecraft:grass)_
  static const ItemType grass = ItemType('minecraft:grass');

  /// [Grass Block](https://minecraft.gamepedia.com/grass_block)
  ///
  /// _(minecraft:grass_block)_
  static const ItemType grass_block = ItemType('minecraft:grass_block');

  /// [Grass Path](https://minecraft.gamepedia.com/grass_path)
  ///
  /// _(minecraft:grass_path)_
  static const ItemType grass_path = ItemType('minecraft:grass_path');

  /// [Gravel](https://minecraft.gamepedia.com/gravel)
  ///
  /// _(minecraft:gravel)_
  static const ItemType gravel = ItemType('minecraft:gravel');

  /// [Gray Banner](https://minecraft.gamepedia.com/gray_banner)
  ///
  /// _(minecraft:gray_banner)_
  static const ItemType gray_banner = ItemType('minecraft:gray_banner');

  /// [Gray Bed](https://minecraft.gamepedia.com/gray_bed)
  ///
  /// _(minecraft:gray_bed)_
  static const ItemType gray_bed = ItemType('minecraft:gray_bed');

  /// [Gray Carpet](https://minecraft.gamepedia.com/gray_carpet)
  ///
  /// _(minecraft:gray_carpet)_
  static const ItemType gray_carpet = ItemType('minecraft:gray_carpet');

  /// [Gray Concrete](https://minecraft.gamepedia.com/gray_concrete)
  ///
  /// _(minecraft:gray_concrete)_
  static const ItemType gray_concrete = ItemType('minecraft:gray_concrete');

  /// [Gray Concrete Powder](https://minecraft.gamepedia.com/gray_concrete_powder)
  ///
  /// _(minecraft:gray_concrete_powder)_
  static const ItemType gray_concrete_powder =
      ItemType('minecraft:gray_concrete_powder');

  /// [Gray Dye](https://minecraft.gamepedia.com/gray_dye)
  ///
  /// _(minecraft:gray_dye)_
  static const ItemType gray_dye = ItemType('minecraft:gray_dye');

  /// [Gray Glazed Terracotta](https://minecraft.gamepedia.com/gray_glazed_terracotta)
  ///
  /// _(minecraft:gray_glazed_terracotta)_
  static const ItemType gray_glazed_terracotta =
      ItemType('minecraft:gray_glazed_terracotta');

  /// [Gray Shulker Box](https://minecraft.gamepedia.com/gray_shulker_box)
  ///
  /// _(minecraft:gray_shulker_box)_
  static const ItemType gray_shulker_box =
      ItemType('minecraft:gray_shulker_box');

  /// [Gray Stained Glass](https://minecraft.gamepedia.com/gray_stained_glass)
  ///
  /// _(minecraft:gray_stained_glass)_
  static const ItemType gray_stained_glass =
      ItemType('minecraft:gray_stained_glass');

  /// [Gray Stained Glass Pane](https://minecraft.gamepedia.com/gray_stained_glass_pane)
  ///
  /// _(minecraft:gray_stained_glass_pane)_
  static const ItemType gray_stained_glass_pane =
      ItemType('minecraft:gray_stained_glass_pane');

  /// [Gray Terracotta](https://minecraft.gamepedia.com/gray_terracotta)
  ///
  /// _(minecraft:gray_terracotta)_
  static const ItemType gray_terracotta = ItemType('minecraft:gray_terracotta');

  /// [Gray Wool](https://minecraft.gamepedia.com/gray_wool)
  ///
  /// _(minecraft:gray_wool)_
  static const ItemType gray_wool = ItemType('minecraft:gray_wool');

  /// [Green Banner](https://minecraft.gamepedia.com/green_banner)
  ///
  /// _(minecraft:green_banner)_
  static const ItemType green_banner = ItemType('minecraft:green_banner');

  /// [Green Bed](https://minecraft.gamepedia.com/green_bed)
  ///
  /// _(minecraft:green_bed)_
  static const ItemType green_bed = ItemType('minecraft:green_bed');

  /// [Green Carpet](https://minecraft.gamepedia.com/green_carpet)
  ///
  /// _(minecraft:green_carpet)_
  static const ItemType green_carpet = ItemType('minecraft:green_carpet');

  /// [Green Concrete](https://minecraft.gamepedia.com/green_concrete)
  ///
  /// _(minecraft:green_concrete)_
  static const ItemType green_concrete = ItemType('minecraft:green_concrete');

  /// [Green Concrete Powder](https://minecraft.gamepedia.com/green_concrete_powder)
  ///
  /// _(minecraft:green_concrete_powder)_
  static const ItemType green_concrete_powder =
      ItemType('minecraft:green_concrete_powder');

  /// [Green Dye](https://minecraft.gamepedia.com/green_dye)
  ///
  /// _(minecraft:green_dye)_
  static const ItemType green_dye = ItemType('minecraft:green_dye');

  /// [Green Glazed Terracotta](https://minecraft.gamepedia.com/green_glazed_terracotta)
  ///
  /// _(minecraft:green_glazed_terracotta)_
  static const ItemType green_glazed_terracotta =
      ItemType('minecraft:green_glazed_terracotta');

  /// [Green Shulker Box](https://minecraft.gamepedia.com/green_shulker_box)
  ///
  /// _(minecraft:green_shulker_box)_
  static const ItemType green_shulker_box =
      ItemType('minecraft:green_shulker_box');

  /// [Green Stained Glass](https://minecraft.gamepedia.com/green_stained_glass)
  ///
  /// _(minecraft:green_stained_glass)_
  static const ItemType green_stained_glass =
      ItemType('minecraft:green_stained_glass');

  /// [Green Stained Glass Pane](https://minecraft.gamepedia.com/green_stained_glass_pane)
  ///
  /// _(minecraft:green_stained_glass_pane)_
  static const ItemType green_stained_glass_pane =
      ItemType('minecraft:green_stained_glass_pane');

  /// [Green Terracotta](https://minecraft.gamepedia.com/green_terracotta)
  ///
  /// _(minecraft:green_terracotta)_
  static const ItemType green_terracotta =
      ItemType('minecraft:green_terracotta');

  /// [Green Wool](https://minecraft.gamepedia.com/green_wool)
  ///
  /// _(minecraft:green_wool)_
  static const ItemType green_wool = ItemType('minecraft:green_wool');

  /// [Grindstone](https://minecraft.gamepedia.com/grindstone)
  ///
  /// _(minecraft:grindstone)_
  static const ItemType grindstone = ItemType('minecraft:grindstone');

  /// [Guardian Spawn Egg](https://minecraft.gamepedia.com/guardian_spawn_egg)
  ///
  /// _(minecraft:guardian_spawn_egg)_
  static const ItemType guardian_spawn_egg =
      ItemType('minecraft:guardian_spawn_egg');

  /// [Gunpowder](https://minecraft.gamepedia.com/gunpowder)
  ///
  /// _(minecraft:gunpowder)_
  static const ItemType gunpowder = ItemType('minecraft:gunpowder');

  /// [Hay Block](https://minecraft.gamepedia.com/hay_block)
  ///
  /// _(minecraft:hay_block)_
  static const ItemType hay_block = ItemType('minecraft:hay_block');

  /// [Heart Of The Sea](https://minecraft.gamepedia.com/heart_of_the_sea)
  ///
  /// _(minecraft:heart_of_the_sea)_
  static const ItemType heart_of_the_sea =
      ItemType('minecraft:heart_of_the_sea');

  /// [Heavy Weighted Pressure Plate](https://minecraft.gamepedia.com/heavy_weighted_pressure_plate)
  ///
  /// _(minecraft:heavy_weighted_pressure_plate)_
  static const ItemType heavy_weighted_pressure_plate =
      ItemType('minecraft:heavy_weighted_pressure_plate');

  /// [Honey Block](https://minecraft.gamepedia.com/honey_block)
  ///
  /// _(minecraft:honey_block)_
  static const ItemType honey_block = ItemType('minecraft:honey_block');

  /// [Honey Bottle](https://minecraft.gamepedia.com/honey_bottle)
  ///
  /// _(minecraft:honey_bottle)_
  static const ItemType honey_bottle = ItemType('minecraft:honey_bottle');

  /// [Honeycomb](https://minecraft.gamepedia.com/honeycomb)
  ///
  /// _(minecraft:honeycomb)_
  static const ItemType honeycomb = ItemType('minecraft:honeycomb');

  /// [Honeycomb Block](https://minecraft.gamepedia.com/honeycomb_block)
  ///
  /// _(minecraft:honeycomb_block)_
  static const ItemType honeycomb_block = ItemType('minecraft:honeycomb_block');

  /// [Hopper](https://minecraft.gamepedia.com/hopper)
  ///
  /// _(minecraft:hopper)_
  static const ItemType hopper = ItemType('minecraft:hopper');

  /// [Hopper Minecart](https://minecraft.gamepedia.com/hopper_minecart)
  ///
  /// _(minecraft:hopper_minecart)_
  static const ItemType hopper_minecart = ItemType('minecraft:hopper_minecart');

  /// [Horn Coral](https://minecraft.gamepedia.com/horn_coral)
  ///
  /// _(minecraft:horn_coral)_
  static const ItemType horn_coral = ItemType('minecraft:horn_coral');

  /// [Horn Coral Block](https://minecraft.gamepedia.com/horn_coral_block)
  ///
  /// _(minecraft:horn_coral_block)_
  static const ItemType horn_coral_block =
      ItemType('minecraft:horn_coral_block');

  /// [Horn Coral Fan](https://minecraft.gamepedia.com/horn_coral_fan)
  ///
  /// _(minecraft:horn_coral_fan)_
  static const ItemType horn_coral_fan = ItemType('minecraft:horn_coral_fan');

  /// [Horse Spawn Egg](https://minecraft.gamepedia.com/horse_spawn_egg)
  ///
  /// _(minecraft:horse_spawn_egg)_
  static const ItemType horse_spawn_egg = ItemType('minecraft:horse_spawn_egg');

  /// [Husk Spawn Egg](https://minecraft.gamepedia.com/husk_spawn_egg)
  ///
  /// _(minecraft:husk_spawn_egg)_
  static const ItemType husk_spawn_egg = ItemType('minecraft:husk_spawn_egg');

  /// [Ice](https://minecraft.gamepedia.com/ice)
  ///
  /// _(minecraft:ice)_
  static const ItemType ice = ItemType('minecraft:ice');

  /// [Infested Chiseled Stone Bricks](https://minecraft.gamepedia.com/infested_chiseled_stone_bricks)
  ///
  /// _(minecraft:infested_chiseled_stone_bricks)_
  static const ItemType infested_chiseled_stone_bricks =
      ItemType('minecraft:infested_chiseled_stone_bricks');

  /// [Infested Cobblestone](https://minecraft.gamepedia.com/infested_cobblestone)
  ///
  /// _(minecraft:infested_cobblestone)_
  static const ItemType infested_cobblestone =
      ItemType('minecraft:infested_cobblestone');

  /// [Infested Cracked Stone Bricks](https://minecraft.gamepedia.com/infested_cracked_stone_bricks)
  ///
  /// _(minecraft:infested_cracked_stone_bricks)_
  static const ItemType infested_cracked_stone_bricks =
      ItemType('minecraft:infested_cracked_stone_bricks');

  /// [Infested Mossy Stone Bricks](https://minecraft.gamepedia.com/infested_mossy_stone_bricks)
  ///
  /// _(minecraft:infested_mossy_stone_bricks)_
  static const ItemType infested_mossy_stone_bricks =
      ItemType('minecraft:infested_mossy_stone_bricks');

  /// [Infested Stone](https://minecraft.gamepedia.com/infested_stone)
  ///
  /// _(minecraft:infested_stone)_
  static const ItemType infested_stone = ItemType('minecraft:infested_stone');

  /// [Infested Stone Bricks](https://minecraft.gamepedia.com/infested_stone_bricks)
  ///
  /// _(minecraft:infested_stone_bricks)_
  static const ItemType infested_stone_bricks =
      ItemType('minecraft:infested_stone_bricks');

  /// [Ink Sac](https://minecraft.gamepedia.com/ink_sac)
  ///
  /// _(minecraft:ink_sac)_
  static const ItemType ink_sac = ItemType('minecraft:ink_sac');

  /// [Iron Axe](https://minecraft.gamepedia.com/iron_axe)
  ///
  /// _(minecraft:iron_axe)_
  static const ItemType iron_axe = ItemType('minecraft:iron_axe');

  /// [Iron Bars](https://minecraft.gamepedia.com/iron_bars)
  ///
  /// _(minecraft:iron_bars)_
  static const ItemType iron_bars = ItemType('minecraft:iron_bars');

  /// [Iron Block](https://minecraft.gamepedia.com/iron_block)
  ///
  /// _(minecraft:iron_block)_
  static const ItemType iron_block = ItemType('minecraft:iron_block');

  /// [Iron Boots](https://minecraft.gamepedia.com/iron_boots)
  ///
  /// _(minecraft:iron_boots)_
  static const ItemType iron_boots = ItemType('minecraft:iron_boots');

  /// [Iron Chestplate](https://minecraft.gamepedia.com/iron_chestplate)
  ///
  /// _(minecraft:iron_chestplate)_
  static const ItemType iron_chestplate = ItemType('minecraft:iron_chestplate');

  /// [Iron Door](https://minecraft.gamepedia.com/iron_door)
  ///
  /// _(minecraft:iron_door)_
  static const ItemType iron_door = ItemType('minecraft:iron_door');

  /// [Iron Helmet](https://minecraft.gamepedia.com/iron_helmet)
  ///
  /// _(minecraft:iron_helmet)_
  static const ItemType iron_helmet = ItemType('minecraft:iron_helmet');

  /// [Iron Hoe](https://minecraft.gamepedia.com/iron_hoe)
  ///
  /// _(minecraft:iron_hoe)_
  static const ItemType iron_hoe = ItemType('minecraft:iron_hoe');

  /// [Iron Horse Armor](https://minecraft.gamepedia.com/iron_horse_armor)
  ///
  /// _(minecraft:iron_horse_armor)_
  static const ItemType iron_horse_armor =
      ItemType('minecraft:iron_horse_armor');

  /// [Iron Ingot](https://minecraft.gamepedia.com/iron_ingot)
  ///
  /// _(minecraft:iron_ingot)_
  static const ItemType iron_ingot = ItemType('minecraft:iron_ingot');

  /// [Iron Leggings](https://minecraft.gamepedia.com/iron_leggings)
  ///
  /// _(minecraft:iron_leggings)_
  static const ItemType iron_leggings = ItemType('minecraft:iron_leggings');

  /// [Iron Nugget](https://minecraft.gamepedia.com/iron_nugget)
  ///
  /// _(minecraft:iron_nugget)_
  static const ItemType iron_nugget = ItemType('minecraft:iron_nugget');

  /// [Iron Ore](https://minecraft.gamepedia.com/iron_ore)
  ///
  /// _(minecraft:iron_ore)_
  static const ItemType iron_ore = ItemType('minecraft:iron_ore');

  /// [Iron Pickaxe](https://minecraft.gamepedia.com/iron_pickaxe)
  ///
  /// _(minecraft:iron_pickaxe)_
  static const ItemType iron_pickaxe = ItemType('minecraft:iron_pickaxe');

  /// [Iron Shovel](https://minecraft.gamepedia.com/iron_shovel)
  ///
  /// _(minecraft:iron_shovel)_
  static const ItemType iron_shovel = ItemType('minecraft:iron_shovel');

  /// [Iron Sword](https://minecraft.gamepedia.com/iron_sword)
  ///
  /// _(minecraft:iron_sword)_
  static const ItemType iron_sword = ItemType('minecraft:iron_sword');

  /// [Iron Trapdoor](https://minecraft.gamepedia.com/iron_trapdoor)
  ///
  /// _(minecraft:iron_trapdoor)_
  static const ItemType iron_trapdoor = ItemType('minecraft:iron_trapdoor');

  /// [Item Frame](https://minecraft.gamepedia.com/item_frame)
  ///
  /// _(minecraft:item_frame)_
  static const ItemType item_frame = ItemType('minecraft:item_frame');

  /// [Jack O Lantern](https://minecraft.gamepedia.com/jack_o_lantern)
  ///
  /// _(minecraft:jack_o_lantern)_
  static const ItemType jack_o_lantern = ItemType('minecraft:jack_o_lantern');

  /// [Jigsaw](https://minecraft.gamepedia.com/jigsaw)
  ///
  /// _(minecraft:jigsaw)_
  static const ItemType jigsaw = ItemType('minecraft:jigsaw');

  /// [Jukebox](https://minecraft.gamepedia.com/jukebox)
  ///
  /// _(minecraft:jukebox)_
  static const ItemType jukebox = ItemType('minecraft:jukebox');

  /// [Jungle Boat](https://minecraft.gamepedia.com/jungle_boat)
  ///
  /// _(minecraft:jungle_boat)_
  static const ItemType jungle_boat = ItemType('minecraft:jungle_boat');

  /// [Jungle Button](https://minecraft.gamepedia.com/jungle_button)
  ///
  /// _(minecraft:jungle_button)_
  static const ItemType jungle_button = ItemType('minecraft:jungle_button');

  /// [Jungle Door](https://minecraft.gamepedia.com/jungle_door)
  ///
  /// _(minecraft:jungle_door)_
  static const ItemType jungle_door = ItemType('minecraft:jungle_door');

  /// [Jungle Fence](https://minecraft.gamepedia.com/jungle_fence)
  ///
  /// _(minecraft:jungle_fence)_
  static const ItemType jungle_fence = ItemType('minecraft:jungle_fence');

  /// [Jungle Fence Gate](https://minecraft.gamepedia.com/jungle_fence_gate)
  ///
  /// _(minecraft:jungle_fence_gate)_
  static const ItemType jungle_fence_gate =
      ItemType('minecraft:jungle_fence_gate');

  /// [Jungle Leaves](https://minecraft.gamepedia.com/jungle_leaves)
  ///
  /// _(minecraft:jungle_leaves)_
  static const ItemType jungle_leaves = ItemType('minecraft:jungle_leaves');

  /// [Jungle Log](https://minecraft.gamepedia.com/jungle_log)
  ///
  /// _(minecraft:jungle_log)_
  static const ItemType jungle_log = ItemType('minecraft:jungle_log');

  /// [Jungle Planks](https://minecraft.gamepedia.com/jungle_planks)
  ///
  /// _(minecraft:jungle_planks)_
  static const ItemType jungle_planks = ItemType('minecraft:jungle_planks');

  /// [Jungle Pressure Plate](https://minecraft.gamepedia.com/jungle_pressure_plate)
  ///
  /// _(minecraft:jungle_pressure_plate)_
  static const ItemType jungle_pressure_plate =
      ItemType('minecraft:jungle_pressure_plate');

  /// [Jungle Sapling](https://minecraft.gamepedia.com/jungle_sapling)
  ///
  /// _(minecraft:jungle_sapling)_
  static const ItemType jungle_sapling = ItemType('minecraft:jungle_sapling');

  /// [Jungle Sign](https://minecraft.gamepedia.com/jungle_sign)
  ///
  /// _(minecraft:jungle_sign)_
  static const ItemType jungle_sign = ItemType('minecraft:jungle_sign');

  /// [Jungle Slab](https://minecraft.gamepedia.com/jungle_slab)
  ///
  /// _(minecraft:jungle_slab)_
  static const ItemType jungle_slab = ItemType('minecraft:jungle_slab');

  /// [Jungle Stairs](https://minecraft.gamepedia.com/jungle_stairs)
  ///
  /// _(minecraft:jungle_stairs)_
  static const ItemType jungle_stairs = ItemType('minecraft:jungle_stairs');

  /// [Jungle Trapdoor](https://minecraft.gamepedia.com/jungle_trapdoor)
  ///
  /// _(minecraft:jungle_trapdoor)_
  static const ItemType jungle_trapdoor = ItemType('minecraft:jungle_trapdoor');

  /// [Jungle Wood](https://minecraft.gamepedia.com/jungle_wood)
  ///
  /// _(minecraft:jungle_wood)_
  static const ItemType jungle_wood = ItemType('minecraft:jungle_wood');

  /// [Kelp](https://minecraft.gamepedia.com/kelp)
  ///
  /// _(minecraft:kelp)_
  static const ItemType kelp = ItemType('minecraft:kelp');

  /// [Knowledge Book](https://minecraft.gamepedia.com/knowledge_book)
  ///
  /// _(minecraft:knowledge_book)_
  static const ItemType knowledge_book = ItemType('minecraft:knowledge_book');

  /// [Ladder](https://minecraft.gamepedia.com/ladder)
  ///
  /// _(minecraft:ladder)_
  static const ItemType ladder = ItemType('minecraft:ladder');

  /// [Lantern](https://minecraft.gamepedia.com/lantern)
  ///
  /// _(minecraft:lantern)_
  static const ItemType lantern = ItemType('minecraft:lantern');

  /// [Lapis Block](https://minecraft.gamepedia.com/lapis_block)
  ///
  /// _(minecraft:lapis_block)_
  static const ItemType lapis_block = ItemType('minecraft:lapis_block');

  /// [Lapis Lazuli](https://minecraft.gamepedia.com/lapis_lazuli)
  ///
  /// _(minecraft:lapis_lazuli)_
  static const ItemType lapis_lazuli = ItemType('minecraft:lapis_lazuli');

  /// [Lapis Ore](https://minecraft.gamepedia.com/lapis_ore)
  ///
  /// _(minecraft:lapis_ore)_
  static const ItemType lapis_ore = ItemType('minecraft:lapis_ore');

  /// [Large Fern](https://minecraft.gamepedia.com/large_fern)
  ///
  /// _(minecraft:large_fern)_
  static const ItemType large_fern = ItemType('minecraft:large_fern');

  /// [Lava Bucket](https://minecraft.gamepedia.com/lava_bucket)
  ///
  /// _(minecraft:lava_bucket)_
  static const ItemType lava_bucket = ItemType('minecraft:lava_bucket');

  /// [Lead](https://minecraft.gamepedia.com/lead)
  ///
  /// _(minecraft:lead)_
  static const ItemType lead = ItemType('minecraft:lead');

  /// [Leather](https://minecraft.gamepedia.com/leather)
  ///
  /// _(minecraft:leather)_
  static const ItemType leather = ItemType('minecraft:leather');

  /// [Leather Boots](https://minecraft.gamepedia.com/leather_boots)
  ///
  /// _(minecraft:leather_boots)_
  static const ItemType leather_boots = ItemType('minecraft:leather_boots');

  /// [Leather Chestplate](https://minecraft.gamepedia.com/leather_chestplate)
  ///
  /// _(minecraft:leather_chestplate)_
  static const ItemType leather_chestplate =
      ItemType('minecraft:leather_chestplate');

  /// [Leather Helmet](https://minecraft.gamepedia.com/leather_helmet)
  ///
  /// _(minecraft:leather_helmet)_
  static const ItemType leather_helmet = ItemType('minecraft:leather_helmet');

  /// [Leather Horse Armor](https://minecraft.gamepedia.com/leather_horse_armor)
  ///
  /// _(minecraft:leather_horse_armor)_
  static const ItemType leather_horse_armor =
      ItemType('minecraft:leather_horse_armor');

  /// [Leather Leggings](https://minecraft.gamepedia.com/leather_leggings)
  ///
  /// _(minecraft:leather_leggings)_
  static const ItemType leather_leggings =
      ItemType('minecraft:leather_leggings');

  /// [Lectern](https://minecraft.gamepedia.com/lectern)
  ///
  /// _(minecraft:lectern)_
  static const ItemType lectern = ItemType('minecraft:lectern');

  /// [Lever](https://minecraft.gamepedia.com/lever)
  ///
  /// _(minecraft:lever)_
  static const ItemType lever = ItemType('minecraft:lever');

  /// [Light Blue Banner](https://minecraft.gamepedia.com/light_blue_banner)
  ///
  /// _(minecraft:light_blue_banner)_
  static const ItemType light_blue_banner =
      ItemType('minecraft:light_blue_banner');

  /// [Light Blue Bed](https://minecraft.gamepedia.com/light_blue_bed)
  ///
  /// _(minecraft:light_blue_bed)_
  static const ItemType light_blue_bed = ItemType('minecraft:light_blue_bed');

  /// [Light Blue Carpet](https://minecraft.gamepedia.com/light_blue_carpet)
  ///
  /// _(minecraft:light_blue_carpet)_
  static const ItemType light_blue_carpet =
      ItemType('minecraft:light_blue_carpet');

  /// [Light Blue Concrete](https://minecraft.gamepedia.com/light_blue_concrete)
  ///
  /// _(minecraft:light_blue_concrete)_
  static const ItemType light_blue_concrete =
      ItemType('minecraft:light_blue_concrete');

  /// [Light Blue Concrete Powder](https://minecraft.gamepedia.com/light_blue_concrete_powder)
  ///
  /// _(minecraft:light_blue_concrete_powder)_
  static const ItemType light_blue_concrete_powder =
      ItemType('minecraft:light_blue_concrete_powder');

  /// [Light Blue Dye](https://minecraft.gamepedia.com/light_blue_dye)
  ///
  /// _(minecraft:light_blue_dye)_
  static const ItemType light_blue_dye = ItemType('minecraft:light_blue_dye');

  /// [Light Blue Glazed Terracotta](https://minecraft.gamepedia.com/light_blue_glazed_terracotta)
  ///
  /// _(minecraft:light_blue_glazed_terracotta)_
  static const ItemType light_blue_glazed_terracotta =
      ItemType('minecraft:light_blue_glazed_terracotta');

  /// [Light Blue Shulker Box](https://minecraft.gamepedia.com/light_blue_shulker_box)
  ///
  /// _(minecraft:light_blue_shulker_box)_
  static const ItemType light_blue_shulker_box =
      ItemType('minecraft:light_blue_shulker_box');

  /// [Light Blue Stained Glass](https://minecraft.gamepedia.com/light_blue_stained_glass)
  ///
  /// _(minecraft:light_blue_stained_glass)_
  static const ItemType light_blue_stained_glass =
      ItemType('minecraft:light_blue_stained_glass');

  /// [Light Blue Stained Glass Pane](https://minecraft.gamepedia.com/light_blue_stained_glass_pane)
  ///
  /// _(minecraft:light_blue_stained_glass_pane)_
  static const ItemType light_blue_stained_glass_pane =
      ItemType('minecraft:light_blue_stained_glass_pane');

  /// [Light Blue Terracotta](https://minecraft.gamepedia.com/light_blue_terracotta)
  ///
  /// _(minecraft:light_blue_terracotta)_
  static const ItemType light_blue_terracotta =
      ItemType('minecraft:light_blue_terracotta');

  /// [Light Blue Wool](https://minecraft.gamepedia.com/light_blue_wool)
  ///
  /// _(minecraft:light_blue_wool)_
  static const ItemType light_blue_wool = ItemType('minecraft:light_blue_wool');

  /// [Light Gray Banner](https://minecraft.gamepedia.com/light_gray_banner)
  ///
  /// _(minecraft:light_gray_banner)_
  static const ItemType light_gray_banner =
      ItemType('minecraft:light_gray_banner');

  /// [Light Gray Bed](https://minecraft.gamepedia.com/light_gray_bed)
  ///
  /// _(minecraft:light_gray_bed)_
  static const ItemType light_gray_bed = ItemType('minecraft:light_gray_bed');

  /// [Light Gray Carpet](https://minecraft.gamepedia.com/light_gray_carpet)
  ///
  /// _(minecraft:light_gray_carpet)_
  static const ItemType light_gray_carpet =
      ItemType('minecraft:light_gray_carpet');

  /// [Light Gray Concrete](https://minecraft.gamepedia.com/light_gray_concrete)
  ///
  /// _(minecraft:light_gray_concrete)_
  static const ItemType light_gray_concrete =
      ItemType('minecraft:light_gray_concrete');

  /// [Light Gray Concrete Powder](https://minecraft.gamepedia.com/light_gray_concrete_powder)
  ///
  /// _(minecraft:light_gray_concrete_powder)_
  static const ItemType light_gray_concrete_powder =
      ItemType('minecraft:light_gray_concrete_powder');

  /// [Light Gray Dye](https://minecraft.gamepedia.com/light_gray_dye)
  ///
  /// _(minecraft:light_gray_dye)_
  static const ItemType light_gray_dye = ItemType('minecraft:light_gray_dye');

  /// [Light Gray Glazed Terracotta](https://minecraft.gamepedia.com/light_gray_glazed_terracotta)
  ///
  /// _(minecraft:light_gray_glazed_terracotta)_
  static const ItemType light_gray_glazed_terracotta =
      ItemType('minecraft:light_gray_glazed_terracotta');

  /// [Light Gray Shulker Box](https://minecraft.gamepedia.com/light_gray_shulker_box)
  ///
  /// _(minecraft:light_gray_shulker_box)_
  static const ItemType light_gray_shulker_box =
      ItemType('minecraft:light_gray_shulker_box');

  /// [Light Gray Stained Glass](https://minecraft.gamepedia.com/light_gray_stained_glass)
  ///
  /// _(minecraft:light_gray_stained_glass)_
  static const ItemType light_gray_stained_glass =
      ItemType('minecraft:light_gray_stained_glass');

  /// [Light Gray Stained Glass Pane](https://minecraft.gamepedia.com/light_gray_stained_glass_pane)
  ///
  /// _(minecraft:light_gray_stained_glass_pane)_
  static const ItemType light_gray_stained_glass_pane =
      ItemType('minecraft:light_gray_stained_glass_pane');

  /// [Light Gray Terracotta](https://minecraft.gamepedia.com/light_gray_terracotta)
  ///
  /// _(minecraft:light_gray_terracotta)_
  static const ItemType light_gray_terracotta =
      ItemType('minecraft:light_gray_terracotta');

  /// [Light Gray Wool](https://minecraft.gamepedia.com/light_gray_wool)
  ///
  /// _(minecraft:light_gray_wool)_
  static const ItemType light_gray_wool = ItemType('minecraft:light_gray_wool');

  /// [Light Weighted Pressure Plate](https://minecraft.gamepedia.com/light_weighted_pressure_plate)
  ///
  /// _(minecraft:light_weighted_pressure_plate)_
  static const ItemType light_weighted_pressure_plate =
      ItemType('minecraft:light_weighted_pressure_plate');

  /// [Lilac](https://minecraft.gamepedia.com/lilac)
  ///
  /// _(minecraft:lilac)_
  static const ItemType lilac = ItemType('minecraft:lilac');

  /// [Lily Of The Valley](https://minecraft.gamepedia.com/lily_of_the_valley)
  ///
  /// _(minecraft:lily_of_the_valley)_
  static const ItemType lily_of_the_valley =
      ItemType('minecraft:lily_of_the_valley');

  /// [Lily Pad](https://minecraft.gamepedia.com/lily_pad)
  ///
  /// _(minecraft:lily_pad)_
  static const ItemType lily_pad = ItemType('minecraft:lily_pad');

  /// [Lime Banner](https://minecraft.gamepedia.com/lime_banner)
  ///
  /// _(minecraft:lime_banner)_
  static const ItemType lime_banner = ItemType('minecraft:lime_banner');

  /// [Lime Bed](https://minecraft.gamepedia.com/lime_bed)
  ///
  /// _(minecraft:lime_bed)_
  static const ItemType lime_bed = ItemType('minecraft:lime_bed');

  /// [Lime Carpet](https://minecraft.gamepedia.com/lime_carpet)
  ///
  /// _(minecraft:lime_carpet)_
  static const ItemType lime_carpet = ItemType('minecraft:lime_carpet');

  /// [Lime Concrete](https://minecraft.gamepedia.com/lime_concrete)
  ///
  /// _(minecraft:lime_concrete)_
  static const ItemType lime_concrete = ItemType('minecraft:lime_concrete');

  /// [Lime Concrete Powder](https://minecraft.gamepedia.com/lime_concrete_powder)
  ///
  /// _(minecraft:lime_concrete_powder)_
  static const ItemType lime_concrete_powder =
      ItemType('minecraft:lime_concrete_powder');

  /// [Lime Dye](https://minecraft.gamepedia.com/lime_dye)
  ///
  /// _(minecraft:lime_dye)_
  static const ItemType lime_dye = ItemType('minecraft:lime_dye');

  /// [Lime Glazed Terracotta](https://minecraft.gamepedia.com/lime_glazed_terracotta)
  ///
  /// _(minecraft:lime_glazed_terracotta)_
  static const ItemType lime_glazed_terracotta =
      ItemType('minecraft:lime_glazed_terracotta');

  /// [Lime Shulker Box](https://minecraft.gamepedia.com/lime_shulker_box)
  ///
  /// _(minecraft:lime_shulker_box)_
  static const ItemType lime_shulker_box =
      ItemType('minecraft:lime_shulker_box');

  /// [Lime Stained Glass](https://minecraft.gamepedia.com/lime_stained_glass)
  ///
  /// _(minecraft:lime_stained_glass)_
  static const ItemType lime_stained_glass =
      ItemType('minecraft:lime_stained_glass');

  /// [Lime Stained Glass Pane](https://minecraft.gamepedia.com/lime_stained_glass_pane)
  ///
  /// _(minecraft:lime_stained_glass_pane)_
  static const ItemType lime_stained_glass_pane =
      ItemType('minecraft:lime_stained_glass_pane');

  /// [Lime Terracotta](https://minecraft.gamepedia.com/lime_terracotta)
  ///
  /// _(minecraft:lime_terracotta)_
  static const ItemType lime_terracotta = ItemType('minecraft:lime_terracotta');

  /// [Lime Wool](https://minecraft.gamepedia.com/lime_wool)
  ///
  /// _(minecraft:lime_wool)_
  static const ItemType lime_wool = ItemType('minecraft:lime_wool');

  /// [Lingering Potion](https://minecraft.gamepedia.com/lingering_potion)
  ///
  /// _(minecraft:lingering_potion)_
  static const ItemType lingering_potion =
      ItemType('minecraft:lingering_potion');

  /// [Llama Spawn Egg](https://minecraft.gamepedia.com/llama_spawn_egg)
  ///
  /// _(minecraft:llama_spawn_egg)_
  static const ItemType llama_spawn_egg = ItemType('minecraft:llama_spawn_egg');

  /// [Loom](https://minecraft.gamepedia.com/loom)
  ///
  /// _(minecraft:loom)_
  static const ItemType loom = ItemType('minecraft:loom');

  /// [Magenta Banner](https://minecraft.gamepedia.com/magenta_banner)
  ///
  /// _(minecraft:magenta_banner)_
  static const ItemType magenta_banner = ItemType('minecraft:magenta_banner');

  /// [Magenta Bed](https://minecraft.gamepedia.com/magenta_bed)
  ///
  /// _(minecraft:magenta_bed)_
  static const ItemType magenta_bed = ItemType('minecraft:magenta_bed');

  /// [Magenta Carpet](https://minecraft.gamepedia.com/magenta_carpet)
  ///
  /// _(minecraft:magenta_carpet)_
  static const ItemType magenta_carpet = ItemType('minecraft:magenta_carpet');

  /// [Magenta Concrete](https://minecraft.gamepedia.com/magenta_concrete)
  ///
  /// _(minecraft:magenta_concrete)_
  static const ItemType magenta_concrete =
      ItemType('minecraft:magenta_concrete');

  /// [Magenta Concrete Powder](https://minecraft.gamepedia.com/magenta_concrete_powder)
  ///
  /// _(minecraft:magenta_concrete_powder)_
  static const ItemType magenta_concrete_powder =
      ItemType('minecraft:magenta_concrete_powder');

  /// [Magenta Dye](https://minecraft.gamepedia.com/magenta_dye)
  ///
  /// _(minecraft:magenta_dye)_
  static const ItemType magenta_dye = ItemType('minecraft:magenta_dye');

  /// [Magenta Glazed Terracotta](https://minecraft.gamepedia.com/magenta_glazed_terracotta)
  ///
  /// _(minecraft:magenta_glazed_terracotta)_
  static const ItemType magenta_glazed_terracotta =
      ItemType('minecraft:magenta_glazed_terracotta');

  /// [Magenta Shulker Box](https://minecraft.gamepedia.com/magenta_shulker_box)
  ///
  /// _(minecraft:magenta_shulker_box)_
  static const ItemType magenta_shulker_box =
      ItemType('minecraft:magenta_shulker_box');

  /// [Magenta Stained Glass](https://minecraft.gamepedia.com/magenta_stained_glass)
  ///
  /// _(minecraft:magenta_stained_glass)_
  static const ItemType magenta_stained_glass =
      ItemType('minecraft:magenta_stained_glass');

  /// [Magenta Stained Glass Pane](https://minecraft.gamepedia.com/magenta_stained_glass_pane)
  ///
  /// _(minecraft:magenta_stained_glass_pane)_
  static const ItemType magenta_stained_glass_pane =
      ItemType('minecraft:magenta_stained_glass_pane');

  /// [Magenta Terracotta](https://minecraft.gamepedia.com/magenta_terracotta)
  ///
  /// _(minecraft:magenta_terracotta)_
  static const ItemType magenta_terracotta =
      ItemType('minecraft:magenta_terracotta');

  /// [Magenta Wool](https://minecraft.gamepedia.com/magenta_wool)
  ///
  /// _(minecraft:magenta_wool)_
  static const ItemType magenta_wool = ItemType('minecraft:magenta_wool');

  /// [Magma Block](https://minecraft.gamepedia.com/magma_block)
  ///
  /// _(minecraft:magma_block)_
  static const ItemType magma_block = ItemType('minecraft:magma_block');

  /// [Magma Cream](https://minecraft.gamepedia.com/magma_cream)
  ///
  /// _(minecraft:magma_cream)_
  static const ItemType magma_cream = ItemType('minecraft:magma_cream');

  /// [Magma Cube Spawn Egg](https://minecraft.gamepedia.com/magma_cube_spawn_egg)
  ///
  /// _(minecraft:magma_cube_spawn_egg)_
  static const ItemType magma_cube_spawn_egg =
      ItemType('minecraft:magma_cube_spawn_egg');

  /// [Map](https://minecraft.gamepedia.com/map)
  ///
  /// _(minecraft:map)_
  static const ItemType map = ItemType('minecraft:map');

  /// [Melon](https://minecraft.gamepedia.com/melon)
  ///
  /// _(minecraft:melon)_
  static const ItemType melon = ItemType('minecraft:melon');

  /// [Melon Seeds](https://minecraft.gamepedia.com/melon_seeds)
  ///
  /// _(minecraft:melon_seeds)_
  static const ItemType melon_seeds = ItemType('minecraft:melon_seeds');

  /// [Melon Slice](https://minecraft.gamepedia.com/melon_slice)
  ///
  /// _(minecraft:melon_slice)_
  static const ItemType melon_slice = ItemType('minecraft:melon_slice');

  /// [Milk Bucket](https://minecraft.gamepedia.com/milk_bucket)
  ///
  /// _(minecraft:milk_bucket)_
  static const ItemType milk_bucket = ItemType('minecraft:milk_bucket');

  /// [Minecart](https://minecraft.gamepedia.com/minecart)
  ///
  /// _(minecraft:minecart)_
  static const ItemType minecart = ItemType('minecraft:minecart');

  /// [Mojang Banner Pattern](https://minecraft.gamepedia.com/mojang_banner_pattern)
  ///
  /// _(minecraft:mojang_banner_pattern)_
  static const ItemType mojang_banner_pattern =
      ItemType('minecraft:mojang_banner_pattern');

  /// [Mooshroom Spawn Egg](https://minecraft.gamepedia.com/mooshroom_spawn_egg)
  ///
  /// _(minecraft:mooshroom_spawn_egg)_
  static const ItemType mooshroom_spawn_egg =
      ItemType('minecraft:mooshroom_spawn_egg');

  /// [Mossy Cobblestone](https://minecraft.gamepedia.com/mossy_cobblestone)
  ///
  /// _(minecraft:mossy_cobblestone)_
  static const ItemType mossy_cobblestone =
      ItemType('minecraft:mossy_cobblestone');

  /// [Mossy Cobblestone Slab](https://minecraft.gamepedia.com/mossy_cobblestone_slab)
  ///
  /// _(minecraft:mossy_cobblestone_slab)_
  static const ItemType mossy_cobblestone_slab =
      ItemType('minecraft:mossy_cobblestone_slab');

  /// [Mossy Cobblestone Stairs](https://minecraft.gamepedia.com/mossy_cobblestone_stairs)
  ///
  /// _(minecraft:mossy_cobblestone_stairs)_
  static const ItemType mossy_cobblestone_stairs =
      ItemType('minecraft:mossy_cobblestone_stairs');

  /// [Mossy Cobblestone Wall](https://minecraft.gamepedia.com/mossy_cobblestone_wall)
  ///
  /// _(minecraft:mossy_cobblestone_wall)_
  static const ItemType mossy_cobblestone_wall =
      ItemType('minecraft:mossy_cobblestone_wall');

  /// [Mossy Stone Brick Slab](https://minecraft.gamepedia.com/mossy_stone_brick_slab)
  ///
  /// _(minecraft:mossy_stone_brick_slab)_
  static const ItemType mossy_stone_brick_slab =
      ItemType('minecraft:mossy_stone_brick_slab');

  /// [Mossy Stone Brick Stairs](https://minecraft.gamepedia.com/mossy_stone_brick_stairs)
  ///
  /// _(minecraft:mossy_stone_brick_stairs)_
  static const ItemType mossy_stone_brick_stairs =
      ItemType('minecraft:mossy_stone_brick_stairs');

  /// [Mossy Stone Brick Wall](https://minecraft.gamepedia.com/mossy_stone_brick_wall)
  ///
  /// _(minecraft:mossy_stone_brick_wall)_
  static const ItemType mossy_stone_brick_wall =
      ItemType('minecraft:mossy_stone_brick_wall');

  /// [Mossy Stone Bricks](https://minecraft.gamepedia.com/mossy_stone_bricks)
  ///
  /// _(minecraft:mossy_stone_bricks)_
  static const ItemType mossy_stone_bricks =
      ItemType('minecraft:mossy_stone_bricks');

  /// [Mule Spawn Egg](https://minecraft.gamepedia.com/mule_spawn_egg)
  ///
  /// _(minecraft:mule_spawn_egg)_
  static const ItemType mule_spawn_egg = ItemType('minecraft:mule_spawn_egg');

  /// [Mushroom Stem](https://minecraft.gamepedia.com/mushroom_stem)
  ///
  /// _(minecraft:mushroom_stem)_
  static const ItemType mushroom_stem = ItemType('minecraft:mushroom_stem');

  /// [Mushroom Stew](https://minecraft.gamepedia.com/mushroom_stew)
  ///
  /// _(minecraft:mushroom_stew)_
  static const ItemType mushroom_stew = ItemType('minecraft:mushroom_stew');

  /// [Music Disc 11](https://minecraft.gamepedia.com/music_disc_11)
  ///
  /// _(minecraft:music_disc_11)_
  static const ItemType music_disc_11 = ItemType('minecraft:music_disc_11');

  /// [Music Disc 13](https://minecraft.gamepedia.com/music_disc_13)
  ///
  /// _(minecraft:music_disc_13)_
  static const ItemType music_disc_13 = ItemType('minecraft:music_disc_13');

  /// [Music Disc Blocks](https://minecraft.gamepedia.com/music_disc_blocks)
  ///
  /// _(minecraft:music_disc_blocks)_
  static const ItemType music_disc_blocks =
      ItemType('minecraft:music_disc_blocks');

  /// [Music Disc Cat](https://minecraft.gamepedia.com/music_disc_cat)
  ///
  /// _(minecraft:music_disc_cat)_
  static const ItemType music_disc_cat = ItemType('minecraft:music_disc_cat');

  /// [Music Disc Chirp](https://minecraft.gamepedia.com/music_disc_chirp)
  ///
  /// _(minecraft:music_disc_chirp)_
  static const ItemType music_disc_chirp =
      ItemType('minecraft:music_disc_chirp');

  /// [Music Disc Far](https://minecraft.gamepedia.com/music_disc_far)
  ///
  /// _(minecraft:music_disc_far)_
  static const ItemType music_disc_far = ItemType('minecraft:music_disc_far');

  /// [Music Disc Mall](https://minecraft.gamepedia.com/music_disc_mall)
  ///
  /// _(minecraft:music_disc_mall)_
  static const ItemType music_disc_mall = ItemType('minecraft:music_disc_mall');

  /// [Music Disc Mellohi](https://minecraft.gamepedia.com/music_disc_mellohi)
  ///
  /// _(minecraft:music_disc_mellohi)_
  static const ItemType music_disc_mellohi =
      ItemType('minecraft:music_disc_mellohi');

  /// [Music Disc Stal](https://minecraft.gamepedia.com/music_disc_stal)
  ///
  /// _(minecraft:music_disc_stal)_
  static const ItemType music_disc_stal = ItemType('minecraft:music_disc_stal');

  /// [Music Disc Strad](https://minecraft.gamepedia.com/music_disc_strad)
  ///
  /// _(minecraft:music_disc_strad)_
  static const ItemType music_disc_strad =
      ItemType('minecraft:music_disc_strad');

  /// [Music Disc Wait](https://minecraft.gamepedia.com/music_disc_wait)
  ///
  /// _(minecraft:music_disc_wait)_
  static const ItemType music_disc_wait = ItemType('minecraft:music_disc_wait');

  /// [Music Disc Ward](https://minecraft.gamepedia.com/music_disc_ward)
  ///
  /// _(minecraft:music_disc_ward)_
  static const ItemType music_disc_ward = ItemType('minecraft:music_disc_ward');

  /// [Mutton](https://minecraft.gamepedia.com/mutton)
  ///
  /// _(minecraft:mutton)_
  static const ItemType mutton = ItemType('minecraft:mutton');

  /// [Mycelium](https://minecraft.gamepedia.com/mycelium)
  ///
  /// _(minecraft:mycelium)_
  static const ItemType mycelium = ItemType('minecraft:mycelium');

  /// [Name Tag](https://minecraft.gamepedia.com/name_tag)
  ///
  /// _(minecraft:name_tag)_
  static const ItemType name_tag = ItemType('minecraft:name_tag');

  /// [Nautilus Shell](https://minecraft.gamepedia.com/nautilus_shell)
  ///
  /// _(minecraft:nautilus_shell)_
  static const ItemType nautilus_shell = ItemType('minecraft:nautilus_shell');

  /// [Nether Brick](https://minecraft.gamepedia.com/nether_brick)
  ///
  /// _(minecraft:nether_brick)_
  static const ItemType nether_brick = ItemType('minecraft:nether_brick');

  /// [Nether Brick Fence](https://minecraft.gamepedia.com/nether_brick_fence)
  ///
  /// _(minecraft:nether_brick_fence)_
  static const ItemType nether_brick_fence =
      ItemType('minecraft:nether_brick_fence');

  /// [Nether Brick Slab](https://minecraft.gamepedia.com/nether_brick_slab)
  ///
  /// _(minecraft:nether_brick_slab)_
  static const ItemType nether_brick_slab =
      ItemType('minecraft:nether_brick_slab');

  /// [Nether Brick Stairs](https://minecraft.gamepedia.com/nether_brick_stairs)
  ///
  /// _(minecraft:nether_brick_stairs)_
  static const ItemType nether_brick_stairs =
      ItemType('minecraft:nether_brick_stairs');

  /// [Nether Brick Wall](https://minecraft.gamepedia.com/nether_brick_wall)
  ///
  /// _(minecraft:nether_brick_wall)_
  static const ItemType nether_brick_wall =
      ItemType('minecraft:nether_brick_wall');

  /// [Nether Bricks](https://minecraft.gamepedia.com/nether_bricks)
  ///
  /// _(minecraft:nether_bricks)_
  static const ItemType nether_bricks = ItemType('minecraft:nether_bricks');

  /// [Nether Quartz Ore](https://minecraft.gamepedia.com/nether_quartz_ore)
  ///
  /// _(minecraft:nether_quartz_ore)_
  static const ItemType nether_quartz_ore =
      ItemType('minecraft:nether_quartz_ore');

  /// [Nether Star](https://minecraft.gamepedia.com/nether_star)
  ///
  /// _(minecraft:nether_star)_
  static const ItemType nether_star = ItemType('minecraft:nether_star');

  /// [Nether Wart](https://minecraft.gamepedia.com/nether_wart)
  ///
  /// _(minecraft:nether_wart)_
  static const ItemType nether_wart = ItemType('minecraft:nether_wart');

  /// [Nether Wart Block](https://minecraft.gamepedia.com/nether_wart_block)
  ///
  /// _(minecraft:nether_wart_block)_
  static const ItemType nether_wart_block =
      ItemType('minecraft:nether_wart_block');

  /// [Netherrack](https://minecraft.gamepedia.com/netherrack)
  ///
  /// _(minecraft:netherrack)_
  static const ItemType netherrack = ItemType('minecraft:netherrack');

  /// [Note Block](https://minecraft.gamepedia.com/note_block)
  ///
  /// _(minecraft:note_block)_
  static const ItemType note_block = ItemType('minecraft:note_block');

  /// [Oak Boat](https://minecraft.gamepedia.com/oak_boat)
  ///
  /// _(minecraft:oak_boat)_
  static const ItemType oak_boat = ItemType('minecraft:oak_boat');

  /// [Oak Button](https://minecraft.gamepedia.com/oak_button)
  ///
  /// _(minecraft:oak_button)_
  static const ItemType oak_button = ItemType('minecraft:oak_button');

  /// [Oak Door](https://minecraft.gamepedia.com/oak_door)
  ///
  /// _(minecraft:oak_door)_
  static const ItemType oak_door = ItemType('minecraft:oak_door');

  /// [Oak Fence](https://minecraft.gamepedia.com/oak_fence)
  ///
  /// _(minecraft:oak_fence)_
  static const ItemType oak_fence = ItemType('minecraft:oak_fence');

  /// [Oak Fence Gate](https://minecraft.gamepedia.com/oak_fence_gate)
  ///
  /// _(minecraft:oak_fence_gate)_
  static const ItemType oak_fence_gate = ItemType('minecraft:oak_fence_gate');

  /// [Oak Leaves](https://minecraft.gamepedia.com/oak_leaves)
  ///
  /// _(minecraft:oak_leaves)_
  static const ItemType oak_leaves = ItemType('minecraft:oak_leaves');

  /// [Oak Log](https://minecraft.gamepedia.com/oak_log)
  ///
  /// _(minecraft:oak_log)_
  static const ItemType oak_log = ItemType('minecraft:oak_log');

  /// [Oak Planks](https://minecraft.gamepedia.com/oak_planks)
  ///
  /// _(minecraft:oak_planks)_
  static const ItemType oak_planks = ItemType('minecraft:oak_planks');

  /// [Oak Pressure Plate](https://minecraft.gamepedia.com/oak_pressure_plate)
  ///
  /// _(minecraft:oak_pressure_plate)_
  static const ItemType oak_pressure_plate =
      ItemType('minecraft:oak_pressure_plate');

  /// [Oak Sapling](https://minecraft.gamepedia.com/oak_sapling)
  ///
  /// _(minecraft:oak_sapling)_
  static const ItemType oak_sapling = ItemType('minecraft:oak_sapling');

  /// [Oak Sign](https://minecraft.gamepedia.com/oak_sign)
  ///
  /// _(minecraft:oak_sign)_
  static const ItemType oak_sign = ItemType('minecraft:oak_sign');

  /// [Oak Slab](https://minecraft.gamepedia.com/oak_slab)
  ///
  /// _(minecraft:oak_slab)_
  static const ItemType oak_slab = ItemType('minecraft:oak_slab');

  /// [Oak Stairs](https://minecraft.gamepedia.com/oak_stairs)
  ///
  /// _(minecraft:oak_stairs)_
  static const ItemType oak_stairs = ItemType('minecraft:oak_stairs');

  /// [Oak Trapdoor](https://minecraft.gamepedia.com/oak_trapdoor)
  ///
  /// _(minecraft:oak_trapdoor)_
  static const ItemType oak_trapdoor = ItemType('minecraft:oak_trapdoor');

  /// [Oak Wood](https://minecraft.gamepedia.com/oak_wood)
  ///
  /// _(minecraft:oak_wood)_
  static const ItemType oak_wood = ItemType('minecraft:oak_wood');

  /// [Observer](https://minecraft.gamepedia.com/observer)
  ///
  /// _(minecraft:observer)_
  static const ItemType observer = ItemType('minecraft:observer');

  /// [Obsidian](https://minecraft.gamepedia.com/obsidian)
  ///
  /// _(minecraft:obsidian)_
  static const ItemType obsidian = ItemType('minecraft:obsidian');

  /// [Ocelot Spawn Egg](https://minecraft.gamepedia.com/ocelot_spawn_egg)
  ///
  /// _(minecraft:ocelot_spawn_egg)_
  static const ItemType ocelot_spawn_egg =
      ItemType('minecraft:ocelot_spawn_egg');

  /// [Orange Banner](https://minecraft.gamepedia.com/orange_banner)
  ///
  /// _(minecraft:orange_banner)_
  static const ItemType orange_banner = ItemType('minecraft:orange_banner');

  /// [Orange Bed](https://minecraft.gamepedia.com/orange_bed)
  ///
  /// _(minecraft:orange_bed)_
  static const ItemType orange_bed = ItemType('minecraft:orange_bed');

  /// [Orange Carpet](https://minecraft.gamepedia.com/orange_carpet)
  ///
  /// _(minecraft:orange_carpet)_
  static const ItemType orange_carpet = ItemType('minecraft:orange_carpet');

  /// [Orange Concrete](https://minecraft.gamepedia.com/orange_concrete)
  ///
  /// _(minecraft:orange_concrete)_
  static const ItemType orange_concrete = ItemType('minecraft:orange_concrete');

  /// [Orange Concrete Powder](https://minecraft.gamepedia.com/orange_concrete_powder)
  ///
  /// _(minecraft:orange_concrete_powder)_
  static const ItemType orange_concrete_powder =
      ItemType('minecraft:orange_concrete_powder');

  /// [Orange Dye](https://minecraft.gamepedia.com/orange_dye)
  ///
  /// _(minecraft:orange_dye)_
  static const ItemType orange_dye = ItemType('minecraft:orange_dye');

  /// [Orange Glazed Terracotta](https://minecraft.gamepedia.com/orange_glazed_terracotta)
  ///
  /// _(minecraft:orange_glazed_terracotta)_
  static const ItemType orange_glazed_terracotta =
      ItemType('minecraft:orange_glazed_terracotta');

  /// [Orange Shulker Box](https://minecraft.gamepedia.com/orange_shulker_box)
  ///
  /// _(minecraft:orange_shulker_box)_
  static const ItemType orange_shulker_box =
      ItemType('minecraft:orange_shulker_box');

  /// [Orange Stained Glass](https://minecraft.gamepedia.com/orange_stained_glass)
  ///
  /// _(minecraft:orange_stained_glass)_
  static const ItemType orange_stained_glass =
      ItemType('minecraft:orange_stained_glass');

  /// [Orange Stained Glass Pane](https://minecraft.gamepedia.com/orange_stained_glass_pane)
  ///
  /// _(minecraft:orange_stained_glass_pane)_
  static const ItemType orange_stained_glass_pane =
      ItemType('minecraft:orange_stained_glass_pane');

  /// [Orange Terracotta](https://minecraft.gamepedia.com/orange_terracotta)
  ///
  /// _(minecraft:orange_terracotta)_
  static const ItemType orange_terracotta =
      ItemType('minecraft:orange_terracotta');

  /// [Orange Tulip](https://minecraft.gamepedia.com/orange_tulip)
  ///
  /// _(minecraft:orange_tulip)_
  static const ItemType orange_tulip = ItemType('minecraft:orange_tulip');

  /// [Orange Wool](https://minecraft.gamepedia.com/orange_wool)
  ///
  /// _(minecraft:orange_wool)_
  static const ItemType orange_wool = ItemType('minecraft:orange_wool');

  /// [Oxeye Daisy](https://minecraft.gamepedia.com/oxeye_daisy)
  ///
  /// _(minecraft:oxeye_daisy)_
  static const ItemType oxeye_daisy = ItemType('minecraft:oxeye_daisy');

  /// [Packed Ice](https://minecraft.gamepedia.com/packed_ice)
  ///
  /// _(minecraft:packed_ice)_
  static const ItemType packed_ice = ItemType('minecraft:packed_ice');

  /// [Painting](https://minecraft.gamepedia.com/painting)
  ///
  /// _(minecraft:painting)_
  static const ItemType painting = ItemType('minecraft:painting');

  /// [Panda Spawn Egg](https://minecraft.gamepedia.com/panda_spawn_egg)
  ///
  /// _(minecraft:panda_spawn_egg)_
  static const ItemType panda_spawn_egg = ItemType('minecraft:panda_spawn_egg');

  /// [Paper](https://minecraft.gamepedia.com/paper)
  ///
  /// _(minecraft:paper)_
  static const ItemType paper = ItemType('minecraft:paper');

  /// [Parrot Spawn Egg](https://minecraft.gamepedia.com/parrot_spawn_egg)
  ///
  /// _(minecraft:parrot_spawn_egg)_
  static const ItemType parrot_spawn_egg =
      ItemType('minecraft:parrot_spawn_egg');

  /// [Peony](https://minecraft.gamepedia.com/peony)
  ///
  /// _(minecraft:peony)_
  static const ItemType peony = ItemType('minecraft:peony');

  /// [Petrified Oak Slab](https://minecraft.gamepedia.com/petrified_oak_slab)
  ///
  /// _(minecraft:petrified_oak_slab)_
  static const ItemType petrified_oak_slab =
      ItemType('minecraft:petrified_oak_slab');

  /// [Phantom Membrane](https://minecraft.gamepedia.com/phantom_membrane)
  ///
  /// _(minecraft:phantom_membrane)_
  static const ItemType phantom_membrane =
      ItemType('minecraft:phantom_membrane');

  /// [Phantom Spawn Egg](https://minecraft.gamepedia.com/phantom_spawn_egg)
  ///
  /// _(minecraft:phantom_spawn_egg)_
  static const ItemType phantom_spawn_egg =
      ItemType('minecraft:phantom_spawn_egg');

  /// [Pig Spawn Egg](https://minecraft.gamepedia.com/pig_spawn_egg)
  ///
  /// _(minecraft:pig_spawn_egg)_
  static const ItemType pig_spawn_egg = ItemType('minecraft:pig_spawn_egg');

  /// [Pillager Spawn Egg](https://minecraft.gamepedia.com/pillager_spawn_egg)
  ///
  /// _(minecraft:pillager_spawn_egg)_
  static const ItemType pillager_spawn_egg =
      ItemType('minecraft:pillager_spawn_egg');

  /// [Pink Banner](https://minecraft.gamepedia.com/pink_banner)
  ///
  /// _(minecraft:pink_banner)_
  static const ItemType pink_banner = ItemType('minecraft:pink_banner');

  /// [Pink Bed](https://minecraft.gamepedia.com/pink_bed)
  ///
  /// _(minecraft:pink_bed)_
  static const ItemType pink_bed = ItemType('minecraft:pink_bed');

  /// [Pink Carpet](https://minecraft.gamepedia.com/pink_carpet)
  ///
  /// _(minecraft:pink_carpet)_
  static const ItemType pink_carpet = ItemType('minecraft:pink_carpet');

  /// [Pink Concrete](https://minecraft.gamepedia.com/pink_concrete)
  ///
  /// _(minecraft:pink_concrete)_
  static const ItemType pink_concrete = ItemType('minecraft:pink_concrete');

  /// [Pink Concrete Powder](https://minecraft.gamepedia.com/pink_concrete_powder)
  ///
  /// _(minecraft:pink_concrete_powder)_
  static const ItemType pink_concrete_powder =
      ItemType('minecraft:pink_concrete_powder');

  /// [Pink Dye](https://minecraft.gamepedia.com/pink_dye)
  ///
  /// _(minecraft:pink_dye)_
  static const ItemType pink_dye = ItemType('minecraft:pink_dye');

  /// [Pink Glazed Terracotta](https://minecraft.gamepedia.com/pink_glazed_terracotta)
  ///
  /// _(minecraft:pink_glazed_terracotta)_
  static const ItemType pink_glazed_terracotta =
      ItemType('minecraft:pink_glazed_terracotta');

  /// [Pink Shulker Box](https://minecraft.gamepedia.com/pink_shulker_box)
  ///
  /// _(minecraft:pink_shulker_box)_
  static const ItemType pink_shulker_box =
      ItemType('minecraft:pink_shulker_box');

  /// [Pink Stained Glass](https://minecraft.gamepedia.com/pink_stained_glass)
  ///
  /// _(minecraft:pink_stained_glass)_
  static const ItemType pink_stained_glass =
      ItemType('minecraft:pink_stained_glass');

  /// [Pink Stained Glass Pane](https://minecraft.gamepedia.com/pink_stained_glass_pane)
  ///
  /// _(minecraft:pink_stained_glass_pane)_
  static const ItemType pink_stained_glass_pane =
      ItemType('minecraft:pink_stained_glass_pane');

  /// [Pink Terracotta](https://minecraft.gamepedia.com/pink_terracotta)
  ///
  /// _(minecraft:pink_terracotta)_
  static const ItemType pink_terracotta = ItemType('minecraft:pink_terracotta');

  /// [Pink Tulip](https://minecraft.gamepedia.com/pink_tulip)
  ///
  /// _(minecraft:pink_tulip)_
  static const ItemType pink_tulip = ItemType('minecraft:pink_tulip');

  /// [Pink Wool](https://minecraft.gamepedia.com/pink_wool)
  ///
  /// _(minecraft:pink_wool)_
  static const ItemType pink_wool = ItemType('minecraft:pink_wool');

  /// [Piston](https://minecraft.gamepedia.com/piston)
  ///
  /// _(minecraft:piston)_
  static const ItemType piston = ItemType('minecraft:piston');

  /// [Player Head](https://minecraft.gamepedia.com/player_head)
  ///
  /// _(minecraft:player_head)_
  static const ItemType player_head = ItemType('minecraft:player_head');

  /// [Podzol](https://minecraft.gamepedia.com/podzol)
  ///
  /// _(minecraft:podzol)_
  static const ItemType podzol = ItemType('minecraft:podzol');

  /// [Poisonous Potato](https://minecraft.gamepedia.com/poisonous_potato)
  ///
  /// _(minecraft:poisonous_potato)_
  static const ItemType poisonous_potato =
      ItemType('minecraft:poisonous_potato');

  /// [Polar Bear Spawn Egg](https://minecraft.gamepedia.com/polar_bear_spawn_egg)
  ///
  /// _(minecraft:polar_bear_spawn_egg)_
  static const ItemType polar_bear_spawn_egg =
      ItemType('minecraft:polar_bear_spawn_egg');

  /// [Polished Andesite](https://minecraft.gamepedia.com/polished_andesite)
  ///
  /// _(minecraft:polished_andesite)_
  static const ItemType polished_andesite =
      ItemType('minecraft:polished_andesite');

  /// [Polished Andesite Slab](https://minecraft.gamepedia.com/polished_andesite_slab)
  ///
  /// _(minecraft:polished_andesite_slab)_
  static const ItemType polished_andesite_slab =
      ItemType('minecraft:polished_andesite_slab');

  /// [Polished Andesite Stairs](https://minecraft.gamepedia.com/polished_andesite_stairs)
  ///
  /// _(minecraft:polished_andesite_stairs)_
  static const ItemType polished_andesite_stairs =
      ItemType('minecraft:polished_andesite_stairs');

  /// [Polished Diorite](https://minecraft.gamepedia.com/polished_diorite)
  ///
  /// _(minecraft:polished_diorite)_
  static const ItemType polished_diorite =
      ItemType('minecraft:polished_diorite');

  /// [Polished Diorite Slab](https://minecraft.gamepedia.com/polished_diorite_slab)
  ///
  /// _(minecraft:polished_diorite_slab)_
  static const ItemType polished_diorite_slab =
      ItemType('minecraft:polished_diorite_slab');

  /// [Polished Diorite Stairs](https://minecraft.gamepedia.com/polished_diorite_stairs)
  ///
  /// _(minecraft:polished_diorite_stairs)_
  static const ItemType polished_diorite_stairs =
      ItemType('minecraft:polished_diorite_stairs');

  /// [Polished Granite](https://minecraft.gamepedia.com/polished_granite)
  ///
  /// _(minecraft:polished_granite)_
  static const ItemType polished_granite =
      ItemType('minecraft:polished_granite');

  /// [Polished Granite Slab](https://minecraft.gamepedia.com/polished_granite_slab)
  ///
  /// _(minecraft:polished_granite_slab)_
  static const ItemType polished_granite_slab =
      ItemType('minecraft:polished_granite_slab');

  /// [Polished Granite Stairs](https://minecraft.gamepedia.com/polished_granite_stairs)
  ///
  /// _(minecraft:polished_granite_stairs)_
  static const ItemType polished_granite_stairs =
      ItemType('minecraft:polished_granite_stairs');

  /// [Popped Chorus Fruit](https://minecraft.gamepedia.com/popped_chorus_fruit)
  ///
  /// _(minecraft:popped_chorus_fruit)_
  static const ItemType popped_chorus_fruit =
      ItemType('minecraft:popped_chorus_fruit');

  /// [Poppy](https://minecraft.gamepedia.com/poppy)
  ///
  /// _(minecraft:poppy)_
  static const ItemType poppy = ItemType('minecraft:poppy');

  /// [Porkchop](https://minecraft.gamepedia.com/porkchop)
  ///
  /// _(minecraft:porkchop)_
  static const ItemType porkchop = ItemType('minecraft:porkchop');

  /// [Potato](https://minecraft.gamepedia.com/potato)
  ///
  /// _(minecraft:potato)_
  static const ItemType potato = ItemType('minecraft:potato');

  /// [Potion](https://minecraft.gamepedia.com/potion)
  ///
  /// _(minecraft:potion)_
  static const ItemType potion = ItemType('minecraft:potion');

  /// [Powered Rail](https://minecraft.gamepedia.com/powered_rail)
  ///
  /// _(minecraft:powered_rail)_
  static const ItemType powered_rail = ItemType('minecraft:powered_rail');

  /// [Prismarine](https://minecraft.gamepedia.com/prismarine)
  ///
  /// _(minecraft:prismarine)_
  static const ItemType prismarine = ItemType('minecraft:prismarine');

  /// [Prismarine Brick Slab](https://minecraft.gamepedia.com/prismarine_brick_slab)
  ///
  /// _(minecraft:prismarine_brick_slab)_
  static const ItemType prismarine_brick_slab =
      ItemType('minecraft:prismarine_brick_slab');

  /// [Prismarine Brick Stairs](https://minecraft.gamepedia.com/prismarine_brick_stairs)
  ///
  /// _(minecraft:prismarine_brick_stairs)_
  static const ItemType prismarine_brick_stairs =
      ItemType('minecraft:prismarine_brick_stairs');

  /// [Prismarine Bricks](https://minecraft.gamepedia.com/prismarine_bricks)
  ///
  /// _(minecraft:prismarine_bricks)_
  static const ItemType prismarine_bricks =
      ItemType('minecraft:prismarine_bricks');

  /// [Prismarine Crystals](https://minecraft.gamepedia.com/prismarine_crystals)
  ///
  /// _(minecraft:prismarine_crystals)_
  static const ItemType prismarine_crystals =
      ItemType('minecraft:prismarine_crystals');

  /// [Prismarine Shard](https://minecraft.gamepedia.com/prismarine_shard)
  ///
  /// _(minecraft:prismarine_shard)_
  static const ItemType prismarine_shard =
      ItemType('minecraft:prismarine_shard');

  /// [Prismarine Slab](https://minecraft.gamepedia.com/prismarine_slab)
  ///
  /// _(minecraft:prismarine_slab)_
  static const ItemType prismarine_slab = ItemType('minecraft:prismarine_slab');

  /// [Prismarine Stairs](https://minecraft.gamepedia.com/prismarine_stairs)
  ///
  /// _(minecraft:prismarine_stairs)_
  static const ItemType prismarine_stairs =
      ItemType('minecraft:prismarine_stairs');

  /// [Prismarine Wall](https://minecraft.gamepedia.com/prismarine_wall)
  ///
  /// _(minecraft:prismarine_wall)_
  static const ItemType prismarine_wall = ItemType('minecraft:prismarine_wall');

  /// [Pufferfish](https://minecraft.gamepedia.com/pufferfish)
  ///
  /// _(minecraft:pufferfish)_
  static const ItemType pufferfish = ItemType('minecraft:pufferfish');

  /// [Pufferfish Bucket](https://minecraft.gamepedia.com/pufferfish_bucket)
  ///
  /// _(minecraft:pufferfish_bucket)_
  static const ItemType pufferfish_bucket =
      ItemType('minecraft:pufferfish_bucket');

  /// [Pufferfish Spawn Egg](https://minecraft.gamepedia.com/pufferfish_spawn_egg)
  ///
  /// _(minecraft:pufferfish_spawn_egg)_
  static const ItemType pufferfish_spawn_egg =
      ItemType('minecraft:pufferfish_spawn_egg');

  /// [Pumpkin](https://minecraft.gamepedia.com/pumpkin)
  ///
  /// _(minecraft:pumpkin)_
  static const ItemType pumpkin = ItemType('minecraft:pumpkin');

  /// [Pumpkin Pie](https://minecraft.gamepedia.com/pumpkin_pie)
  ///
  /// _(minecraft:pumpkin_pie)_
  static const ItemType pumpkin_pie = ItemType('minecraft:pumpkin_pie');

  /// [Pumpkin Seeds](https://minecraft.gamepedia.com/pumpkin_seeds)
  ///
  /// _(minecraft:pumpkin_seeds)_
  static const ItemType pumpkin_seeds = ItemType('minecraft:pumpkin_seeds');

  /// [Purple Banner](https://minecraft.gamepedia.com/purple_banner)
  ///
  /// _(minecraft:purple_banner)_
  static const ItemType purple_banner = ItemType('minecraft:purple_banner');

  /// [Purple Bed](https://minecraft.gamepedia.com/purple_bed)
  ///
  /// _(minecraft:purple_bed)_
  static const ItemType purple_bed = ItemType('minecraft:purple_bed');

  /// [Purple Carpet](https://minecraft.gamepedia.com/purple_carpet)
  ///
  /// _(minecraft:purple_carpet)_
  static const ItemType purple_carpet = ItemType('minecraft:purple_carpet');

  /// [Purple Concrete](https://minecraft.gamepedia.com/purple_concrete)
  ///
  /// _(minecraft:purple_concrete)_
  static const ItemType purple_concrete = ItemType('minecraft:purple_concrete');

  /// [Purple Concrete Powder](https://minecraft.gamepedia.com/purple_concrete_powder)
  ///
  /// _(minecraft:purple_concrete_powder)_
  static const ItemType purple_concrete_powder =
      ItemType('minecraft:purple_concrete_powder');

  /// [Purple Dye](https://minecraft.gamepedia.com/purple_dye)
  ///
  /// _(minecraft:purple_dye)_
  static const ItemType purple_dye = ItemType('minecraft:purple_dye');

  /// [Purple Glazed Terracotta](https://minecraft.gamepedia.com/purple_glazed_terracotta)
  ///
  /// _(minecraft:purple_glazed_terracotta)_
  static const ItemType purple_glazed_terracotta =
      ItemType('minecraft:purple_glazed_terracotta');

  /// [Purple Shulker Box](https://minecraft.gamepedia.com/purple_shulker_box)
  ///
  /// _(minecraft:purple_shulker_box)_
  static const ItemType purple_shulker_box =
      ItemType('minecraft:purple_shulker_box');

  /// [Purple Stained Glass](https://minecraft.gamepedia.com/purple_stained_glass)
  ///
  /// _(minecraft:purple_stained_glass)_
  static const ItemType purple_stained_glass =
      ItemType('minecraft:purple_stained_glass');

  /// [Purple Stained Glass Pane](https://minecraft.gamepedia.com/purple_stained_glass_pane)
  ///
  /// _(minecraft:purple_stained_glass_pane)_
  static const ItemType purple_stained_glass_pane =
      ItemType('minecraft:purple_stained_glass_pane');

  /// [Purple Terracotta](https://minecraft.gamepedia.com/purple_terracotta)
  ///
  /// _(minecraft:purple_terracotta)_
  static const ItemType purple_terracotta =
      ItemType('minecraft:purple_terracotta');

  /// [Purple Wool](https://minecraft.gamepedia.com/purple_wool)
  ///
  /// _(minecraft:purple_wool)_
  static const ItemType purple_wool = ItemType('minecraft:purple_wool');

  /// [Purpur Block](https://minecraft.gamepedia.com/purpur_block)
  ///
  /// _(minecraft:purpur_block)_
  static const ItemType purpur_block = ItemType('minecraft:purpur_block');

  /// [Purpur Pillar](https://minecraft.gamepedia.com/purpur_pillar)
  ///
  /// _(minecraft:purpur_pillar)_
  static const ItemType purpur_pillar = ItemType('minecraft:purpur_pillar');

  /// [Purpur Slab](https://minecraft.gamepedia.com/purpur_slab)
  ///
  /// _(minecraft:purpur_slab)_
  static const ItemType purpur_slab = ItemType('minecraft:purpur_slab');

  /// [Purpur Stairs](https://minecraft.gamepedia.com/purpur_stairs)
  ///
  /// _(minecraft:purpur_stairs)_
  static const ItemType purpur_stairs = ItemType('minecraft:purpur_stairs');

  /// [Quartz](https://minecraft.gamepedia.com/quartz)
  ///
  /// _(minecraft:quartz)_
  static const ItemType quartz = ItemType('minecraft:quartz');

  /// [Quartz Block](https://minecraft.gamepedia.com/quartz_block)
  ///
  /// _(minecraft:quartz_block)_
  static const ItemType quartz_block = ItemType('minecraft:quartz_block');

  /// [Quartz Pillar](https://minecraft.gamepedia.com/quartz_pillar)
  ///
  /// _(minecraft:quartz_pillar)_
  static const ItemType quartz_pillar = ItemType('minecraft:quartz_pillar');

  /// [Quartz Slab](https://minecraft.gamepedia.com/quartz_slab)
  ///
  /// _(minecraft:quartz_slab)_
  static const ItemType quartz_slab = ItemType('minecraft:quartz_slab');

  /// [Quartz Stairs](https://minecraft.gamepedia.com/quartz_stairs)
  ///
  /// _(minecraft:quartz_stairs)_
  static const ItemType quartz_stairs = ItemType('minecraft:quartz_stairs');

  /// [Rabbit](https://minecraft.gamepedia.com/rabbit)
  ///
  /// _(minecraft:rabbit)_
  static const ItemType rabbit = ItemType('minecraft:rabbit');

  /// [Rabbit Foot](https://minecraft.gamepedia.com/rabbit_foot)
  ///
  /// _(minecraft:rabbit_foot)_
  static const ItemType rabbit_foot = ItemType('minecraft:rabbit_foot');

  /// [Rabbit Hide](https://minecraft.gamepedia.com/rabbit_hide)
  ///
  /// _(minecraft:rabbit_hide)_
  static const ItemType rabbit_hide = ItemType('minecraft:rabbit_hide');

  /// [Rabbit Spawn Egg](https://minecraft.gamepedia.com/rabbit_spawn_egg)
  ///
  /// _(minecraft:rabbit_spawn_egg)_
  static const ItemType rabbit_spawn_egg =
      ItemType('minecraft:rabbit_spawn_egg');

  /// [Rabbit Stew](https://minecraft.gamepedia.com/rabbit_stew)
  ///
  /// _(minecraft:rabbit_stew)_
  static const ItemType rabbit_stew = ItemType('minecraft:rabbit_stew');

  /// [Rail](https://minecraft.gamepedia.com/rail)
  ///
  /// _(minecraft:rail)_
  static const ItemType rail = ItemType('minecraft:rail');

  /// [Ravager Spawn Egg](https://minecraft.gamepedia.com/ravager_spawn_egg)
  ///
  /// _(minecraft:ravager_spawn_egg)_
  static const ItemType ravager_spawn_egg =
      ItemType('minecraft:ravager_spawn_egg');

  /// [Red Banner](https://minecraft.gamepedia.com/red_banner)
  ///
  /// _(minecraft:red_banner)_
  static const ItemType red_banner = ItemType('minecraft:red_banner');

  /// [Red Bed](https://minecraft.gamepedia.com/red_bed)
  ///
  /// _(minecraft:red_bed)_
  static const ItemType red_bed = ItemType('minecraft:red_bed');

  /// [Red Carpet](https://minecraft.gamepedia.com/red_carpet)
  ///
  /// _(minecraft:red_carpet)_
  static const ItemType red_carpet = ItemType('minecraft:red_carpet');

  /// [Red Concrete](https://minecraft.gamepedia.com/red_concrete)
  ///
  /// _(minecraft:red_concrete)_
  static const ItemType red_concrete = ItemType('minecraft:red_concrete');

  /// [Red Concrete Powder](https://minecraft.gamepedia.com/red_concrete_powder)
  ///
  /// _(minecraft:red_concrete_powder)_
  static const ItemType red_concrete_powder =
      ItemType('minecraft:red_concrete_powder');

  /// [Red Dye](https://minecraft.gamepedia.com/red_dye)
  ///
  /// _(minecraft:red_dye)_
  static const ItemType red_dye = ItemType('minecraft:red_dye');

  /// [Red Glazed Terracotta](https://minecraft.gamepedia.com/red_glazed_terracotta)
  ///
  /// _(minecraft:red_glazed_terracotta)_
  static const ItemType red_glazed_terracotta =
      ItemType('minecraft:red_glazed_terracotta');

  /// [Red Mushroom](https://minecraft.gamepedia.com/red_mushroom)
  ///
  /// _(minecraft:red_mushroom)_
  static const ItemType red_mushroom = ItemType('minecraft:red_mushroom');

  /// [Red Mushroom Block](https://minecraft.gamepedia.com/red_mushroom_block)
  ///
  /// _(minecraft:red_mushroom_block)_
  static const ItemType red_mushroom_block =
      ItemType('minecraft:red_mushroom_block');

  /// [Red Nether Brick Slab](https://minecraft.gamepedia.com/red_nether_brick_slab)
  ///
  /// _(minecraft:red_nether_brick_slab)_
  static const ItemType red_nether_brick_slab =
      ItemType('minecraft:red_nether_brick_slab');

  /// [Red Nether Brick Stairs](https://minecraft.gamepedia.com/red_nether_brick_stairs)
  ///
  /// _(minecraft:red_nether_brick_stairs)_
  static const ItemType red_nether_brick_stairs =
      ItemType('minecraft:red_nether_brick_stairs');

  /// [Red Nether Brick Wall](https://minecraft.gamepedia.com/red_nether_brick_wall)
  ///
  /// _(minecraft:red_nether_brick_wall)_
  static const ItemType red_nether_brick_wall =
      ItemType('minecraft:red_nether_brick_wall');

  /// [Red Nether Bricks](https://minecraft.gamepedia.com/red_nether_bricks)
  ///
  /// _(minecraft:red_nether_bricks)_
  static const ItemType red_nether_bricks =
      ItemType('minecraft:red_nether_bricks');

  /// [Red Sand](https://minecraft.gamepedia.com/red_sand)
  ///
  /// _(minecraft:red_sand)_
  static const ItemType red_sand = ItemType('minecraft:red_sand');

  /// [Red Sandstone](https://minecraft.gamepedia.com/red_sandstone)
  ///
  /// _(minecraft:red_sandstone)_
  static const ItemType red_sandstone = ItemType('minecraft:red_sandstone');

  /// [Red Sandstone Slab](https://minecraft.gamepedia.com/red_sandstone_slab)
  ///
  /// _(minecraft:red_sandstone_slab)_
  static const ItemType red_sandstone_slab =
      ItemType('minecraft:red_sandstone_slab');

  /// [Red Sandstone Stairs](https://minecraft.gamepedia.com/red_sandstone_stairs)
  ///
  /// _(minecraft:red_sandstone_stairs)_
  static const ItemType red_sandstone_stairs =
      ItemType('minecraft:red_sandstone_stairs');

  /// [Red Sandstone Wall](https://minecraft.gamepedia.com/red_sandstone_wall)
  ///
  /// _(minecraft:red_sandstone_wall)_
  static const ItemType red_sandstone_wall =
      ItemType('minecraft:red_sandstone_wall');

  /// [Red Shulker Box](https://minecraft.gamepedia.com/red_shulker_box)
  ///
  /// _(minecraft:red_shulker_box)_
  static const ItemType red_shulker_box = ItemType('minecraft:red_shulker_box');

  /// [Red Stained Glass](https://minecraft.gamepedia.com/red_stained_glass)
  ///
  /// _(minecraft:red_stained_glass)_
  static const ItemType red_stained_glass =
      ItemType('minecraft:red_stained_glass');

  /// [Red Stained Glass Pane](https://minecraft.gamepedia.com/red_stained_glass_pane)
  ///
  /// _(minecraft:red_stained_glass_pane)_
  static const ItemType red_stained_glass_pane =
      ItemType('minecraft:red_stained_glass_pane');

  /// [Red Terracotta](https://minecraft.gamepedia.com/red_terracotta)
  ///
  /// _(minecraft:red_terracotta)_
  static const ItemType red_terracotta = ItemType('minecraft:red_terracotta');

  /// [Red Tulip](https://minecraft.gamepedia.com/red_tulip)
  ///
  /// _(minecraft:red_tulip)_
  static const ItemType red_tulip = ItemType('minecraft:red_tulip');

  /// [Red Wool](https://minecraft.gamepedia.com/red_wool)
  ///
  /// _(minecraft:red_wool)_
  static const ItemType red_wool = ItemType('minecraft:red_wool');

  /// [Redstone](https://minecraft.gamepedia.com/redstone)
  ///
  /// _(minecraft:redstone)_
  static const ItemType redstone = ItemType('minecraft:redstone');

  /// [Redstone Block](https://minecraft.gamepedia.com/redstone_block)
  ///
  /// _(minecraft:redstone_block)_
  static const ItemType redstone_block = ItemType('minecraft:redstone_block');

  /// [Redstone Lamp](https://minecraft.gamepedia.com/redstone_lamp)
  ///
  /// _(minecraft:redstone_lamp)_
  static const ItemType redstone_lamp = ItemType('minecraft:redstone_lamp');

  /// [Redstone Ore](https://minecraft.gamepedia.com/redstone_ore)
  ///
  /// _(minecraft:redstone_ore)_
  static const ItemType redstone_ore = ItemType('minecraft:redstone_ore');

  /// [Redstone Torch](https://minecraft.gamepedia.com/redstone_torch)
  ///
  /// _(minecraft:redstone_torch)_
  static const ItemType redstone_torch = ItemType('minecraft:redstone_torch');

  /// [Repeater](https://minecraft.gamepedia.com/repeater)
  ///
  /// _(minecraft:repeater)_
  static const ItemType repeater = ItemType('minecraft:repeater');

  /// [Repeating Command Block](https://minecraft.gamepedia.com/repeating_command_block)
  ///
  /// _(minecraft:repeating_command_block)_
  static const ItemType repeating_command_block =
      ItemType('minecraft:repeating_command_block');

  /// [Rose Bush](https://minecraft.gamepedia.com/rose_bush)
  ///
  /// _(minecraft:rose_bush)_
  static const ItemType rose_bush = ItemType('minecraft:rose_bush');

  /// [Rotten Flesh](https://minecraft.gamepedia.com/rotten_flesh)
  ///
  /// _(minecraft:rotten_flesh)_
  static const ItemType rotten_flesh = ItemType('minecraft:rotten_flesh');

  /// [Saddle](https://minecraft.gamepedia.com/saddle)
  ///
  /// _(minecraft:saddle)_
  static const ItemType saddle = ItemType('minecraft:saddle');

  /// [Salmon](https://minecraft.gamepedia.com/salmon)
  ///
  /// _(minecraft:salmon)_
  static const ItemType salmon = ItemType('minecraft:salmon');

  /// [Salmon Bucket](https://minecraft.gamepedia.com/salmon_bucket)
  ///
  /// _(minecraft:salmon_bucket)_
  static const ItemType salmon_bucket = ItemType('minecraft:salmon_bucket');

  /// [Salmon Spawn Egg](https://minecraft.gamepedia.com/salmon_spawn_egg)
  ///
  /// _(minecraft:salmon_spawn_egg)_
  static const ItemType salmon_spawn_egg =
      ItemType('minecraft:salmon_spawn_egg');

  /// [Sand](https://minecraft.gamepedia.com/sand)
  ///
  /// _(minecraft:sand)_
  static const ItemType sand = ItemType('minecraft:sand');

  /// [Sandstone](https://minecraft.gamepedia.com/sandstone)
  ///
  /// _(minecraft:sandstone)_
  static const ItemType sandstone = ItemType('minecraft:sandstone');

  /// [Sandstone Slab](https://minecraft.gamepedia.com/sandstone_slab)
  ///
  /// _(minecraft:sandstone_slab)_
  static const ItemType sandstone_slab = ItemType('minecraft:sandstone_slab');

  /// [Sandstone Stairs](https://minecraft.gamepedia.com/sandstone_stairs)
  ///
  /// _(minecraft:sandstone_stairs)_
  static const ItemType sandstone_stairs =
      ItemType('minecraft:sandstone_stairs');

  /// [Sandstone Wall](https://minecraft.gamepedia.com/sandstone_wall)
  ///
  /// _(minecraft:sandstone_wall)_
  static const ItemType sandstone_wall = ItemType('minecraft:sandstone_wall');

  /// [Scaffolding](https://minecraft.gamepedia.com/scaffolding)
  ///
  /// _(minecraft:scaffolding)_
  static const ItemType scaffolding = ItemType('minecraft:scaffolding');

  /// [Scute](https://minecraft.gamepedia.com/scute)
  ///
  /// _(minecraft:scute)_
  static const ItemType scute = ItemType('minecraft:scute');

  /// [Sea Lantern](https://minecraft.gamepedia.com/sea_lantern)
  ///
  /// _(minecraft:sea_lantern)_
  static const ItemType sea_lantern = ItemType('minecraft:sea_lantern');

  /// [Sea Pickle](https://minecraft.gamepedia.com/sea_pickle)
  ///
  /// _(minecraft:sea_pickle)_
  static const ItemType sea_pickle = ItemType('minecraft:sea_pickle');

  /// [Seagrass](https://minecraft.gamepedia.com/seagrass)
  ///
  /// _(minecraft:seagrass)_
  static const ItemType seagrass = ItemType('minecraft:seagrass');

  /// [Shears](https://minecraft.gamepedia.com/shears)
  ///
  /// _(minecraft:shears)_
  static const ItemType shears = ItemType('minecraft:shears');

  /// [Sheep Spawn Egg](https://minecraft.gamepedia.com/sheep_spawn_egg)
  ///
  /// _(minecraft:sheep_spawn_egg)_
  static const ItemType sheep_spawn_egg = ItemType('minecraft:sheep_spawn_egg');

  /// [Shield](https://minecraft.gamepedia.com/shield)
  ///
  /// _(minecraft:shield)_
  static const ItemType shield = ItemType('minecraft:shield');

  /// [Shulker Box](https://minecraft.gamepedia.com/shulker_box)
  ///
  /// _(minecraft:shulker_box)_
  static const ItemType shulker_box = ItemType('minecraft:shulker_box');

  /// [Shulker Shell](https://minecraft.gamepedia.com/shulker_shell)
  ///
  /// _(minecraft:shulker_shell)_
  static const ItemType shulker_shell = ItemType('minecraft:shulker_shell');

  /// [Shulker Spawn Egg](https://minecraft.gamepedia.com/shulker_spawn_egg)
  ///
  /// _(minecraft:shulker_spawn_egg)_
  static const ItemType shulker_spawn_egg =
      ItemType('minecraft:shulker_spawn_egg');

  /// [Silverfish Spawn Egg](https://minecraft.gamepedia.com/silverfish_spawn_egg)
  ///
  /// _(minecraft:silverfish_spawn_egg)_
  static const ItemType silverfish_spawn_egg =
      ItemType('minecraft:silverfish_spawn_egg');

  /// [Skeleton Horse Spawn Egg](https://minecraft.gamepedia.com/skeleton_horse_spawn_egg)
  ///
  /// _(minecraft:skeleton_horse_spawn_egg)_
  static const ItemType skeleton_horse_spawn_egg =
      ItemType('minecraft:skeleton_horse_spawn_egg');

  /// [Skeleton Skull](https://minecraft.gamepedia.com/skeleton_skull)
  ///
  /// _(minecraft:skeleton_skull)_
  static const ItemType skeleton_skull = ItemType('minecraft:skeleton_skull');

  /// [Skeleton Spawn Egg](https://minecraft.gamepedia.com/skeleton_spawn_egg)
  ///
  /// _(minecraft:skeleton_spawn_egg)_
  static const ItemType skeleton_spawn_egg =
      ItemType('minecraft:skeleton_spawn_egg');

  /// [Skull Banner Pattern](https://minecraft.gamepedia.com/skull_banner_pattern)
  ///
  /// _(minecraft:skull_banner_pattern)_
  static const ItemType skull_banner_pattern =
      ItemType('minecraft:skull_banner_pattern');

  /// [Slime Ball](https://minecraft.gamepedia.com/slime_ball)
  ///
  /// _(minecraft:slime_ball)_
  static const ItemType slime_ball = ItemType('minecraft:slime_ball');

  /// [Slime Block](https://minecraft.gamepedia.com/slime_block)
  ///
  /// _(minecraft:slime_block)_
  static const ItemType slime_block = ItemType('minecraft:slime_block');

  /// [Slime Spawn Egg](https://minecraft.gamepedia.com/slime_spawn_egg)
  ///
  /// _(minecraft:slime_spawn_egg)_
  static const ItemType slime_spawn_egg = ItemType('minecraft:slime_spawn_egg');

  /// [Smithing Table](https://minecraft.gamepedia.com/smithing_table)
  ///
  /// _(minecraft:smithing_table)_
  static const ItemType smithing_table = ItemType('minecraft:smithing_table');

  /// [Smoker](https://minecraft.gamepedia.com/smoker)
  ///
  /// _(minecraft:smoker)_
  static const ItemType smoker = ItemType('minecraft:smoker');

  /// [Smooth Quartz](https://minecraft.gamepedia.com/smooth_quartz)
  ///
  /// _(minecraft:smooth_quartz)_
  static const ItemType smooth_quartz = ItemType('minecraft:smooth_quartz');

  /// [Smooth Quartz Slab](https://minecraft.gamepedia.com/smooth_quartz_slab)
  ///
  /// _(minecraft:smooth_quartz_slab)_
  static const ItemType smooth_quartz_slab =
      ItemType('minecraft:smooth_quartz_slab');

  /// [Smooth Quartz Stairs](https://minecraft.gamepedia.com/smooth_quartz_stairs)
  ///
  /// _(minecraft:smooth_quartz_stairs)_
  static const ItemType smooth_quartz_stairs =
      ItemType('minecraft:smooth_quartz_stairs');

  /// [Smooth Red Sandstone](https://minecraft.gamepedia.com/smooth_red_sandstone)
  ///
  /// _(minecraft:smooth_red_sandstone)_
  static const ItemType smooth_red_sandstone =
      ItemType('minecraft:smooth_red_sandstone');

  /// [Smooth Red Sandstone Slab](https://minecraft.gamepedia.com/smooth_red_sandstone_slab)
  ///
  /// _(minecraft:smooth_red_sandstone_slab)_
  static const ItemType smooth_red_sandstone_slab =
      ItemType('minecraft:smooth_red_sandstone_slab');

  /// [Smooth Red Sandstone Stairs](https://minecraft.gamepedia.com/smooth_red_sandstone_stairs)
  ///
  /// _(minecraft:smooth_red_sandstone_stairs)_
  static const ItemType smooth_red_sandstone_stairs =
      ItemType('minecraft:smooth_red_sandstone_stairs');

  /// [Smooth Sandstone](https://minecraft.gamepedia.com/smooth_sandstone)
  ///
  /// _(minecraft:smooth_sandstone)_
  static const ItemType smooth_sandstone =
      ItemType('minecraft:smooth_sandstone');

  /// [Smooth Sandstone Slab](https://minecraft.gamepedia.com/smooth_sandstone_slab)
  ///
  /// _(minecraft:smooth_sandstone_slab)_
  static const ItemType smooth_sandstone_slab =
      ItemType('minecraft:smooth_sandstone_slab');

  /// [Smooth Sandstone Stairs](https://minecraft.gamepedia.com/smooth_sandstone_stairs)
  ///
  /// _(minecraft:smooth_sandstone_stairs)_
  static const ItemType smooth_sandstone_stairs =
      ItemType('minecraft:smooth_sandstone_stairs');

  /// [Smooth Stone](https://minecraft.gamepedia.com/smooth_stone)
  ///
  /// _(minecraft:smooth_stone)_
  static const ItemType smooth_stone = ItemType('minecraft:smooth_stone');

  /// [Smooth Stone Slab](https://minecraft.gamepedia.com/smooth_stone_slab)
  ///
  /// _(minecraft:smooth_stone_slab)_
  static const ItemType smooth_stone_slab =
      ItemType('minecraft:smooth_stone_slab');

  /// [Snow](https://minecraft.gamepedia.com/snow)
  ///
  /// _(minecraft:snow)_
  static const ItemType snow = ItemType('minecraft:snow');

  /// [Snow Block](https://minecraft.gamepedia.com/snow_block)
  ///
  /// _(minecraft:snow_block)_
  static const ItemType snow_block = ItemType('minecraft:snow_block');

  /// [Snowball](https://minecraft.gamepedia.com/snowball)
  ///
  /// _(minecraft:snowball)_
  static const ItemType snowball = ItemType('minecraft:snowball');

  /// [Soul Sand](https://minecraft.gamepedia.com/soul_sand)
  ///
  /// _(minecraft:soul_sand)_
  static const ItemType soul_sand = ItemType('minecraft:soul_sand');

  /// [Spawner](https://minecraft.gamepedia.com/spawner)
  ///
  /// _(minecraft:spawner)_
  static const ItemType spawner = ItemType('minecraft:spawner');

  /// [Spectral Arrow](https://minecraft.gamepedia.com/spectral_arrow)
  ///
  /// _(minecraft:spectral_arrow)_
  static const ItemType spectral_arrow = ItemType('minecraft:spectral_arrow');

  /// [Spider Eye](https://minecraft.gamepedia.com/spider_eye)
  ///
  /// _(minecraft:spider_eye)_
  static const ItemType spider_eye = ItemType('minecraft:spider_eye');

  /// [Spider Spawn Egg](https://minecraft.gamepedia.com/spider_spawn_egg)
  ///
  /// _(minecraft:spider_spawn_egg)_
  static const ItemType spider_spawn_egg =
      ItemType('minecraft:spider_spawn_egg');

  /// [Splash Potion](https://minecraft.gamepedia.com/splash_potion)
  ///
  /// _(minecraft:splash_potion)_
  static const ItemType splash_potion = ItemType('minecraft:splash_potion');

  /// [Sponge](https://minecraft.gamepedia.com/sponge)
  ///
  /// _(minecraft:sponge)_
  static const ItemType sponge = ItemType('minecraft:sponge');

  /// [Spruce Boat](https://minecraft.gamepedia.com/spruce_boat)
  ///
  /// _(minecraft:spruce_boat)_
  static const ItemType spruce_boat = ItemType('minecraft:spruce_boat');

  /// [Spruce Button](https://minecraft.gamepedia.com/spruce_button)
  ///
  /// _(minecraft:spruce_button)_
  static const ItemType spruce_button = ItemType('minecraft:spruce_button');

  /// [Spruce Door](https://minecraft.gamepedia.com/spruce_door)
  ///
  /// _(minecraft:spruce_door)_
  static const ItemType spruce_door = ItemType('minecraft:spruce_door');

  /// [Spruce Fence](https://minecraft.gamepedia.com/spruce_fence)
  ///
  /// _(minecraft:spruce_fence)_
  static const ItemType spruce_fence = ItemType('minecraft:spruce_fence');

  /// [Spruce Fence Gate](https://minecraft.gamepedia.com/spruce_fence_gate)
  ///
  /// _(minecraft:spruce_fence_gate)_
  static const ItemType spruce_fence_gate =
      ItemType('minecraft:spruce_fence_gate');

  /// [Spruce Leaves](https://minecraft.gamepedia.com/spruce_leaves)
  ///
  /// _(minecraft:spruce_leaves)_
  static const ItemType spruce_leaves = ItemType('minecraft:spruce_leaves');

  /// [Spruce Log](https://minecraft.gamepedia.com/spruce_log)
  ///
  /// _(minecraft:spruce_log)_
  static const ItemType spruce_log = ItemType('minecraft:spruce_log');

  /// [Spruce Planks](https://minecraft.gamepedia.com/spruce_planks)
  ///
  /// _(minecraft:spruce_planks)_
  static const ItemType spruce_planks = ItemType('minecraft:spruce_planks');

  /// [Spruce Pressure Plate](https://minecraft.gamepedia.com/spruce_pressure_plate)
  ///
  /// _(minecraft:spruce_pressure_plate)_
  static const ItemType spruce_pressure_plate =
      ItemType('minecraft:spruce_pressure_plate');

  /// [Spruce Sapling](https://minecraft.gamepedia.com/spruce_sapling)
  ///
  /// _(minecraft:spruce_sapling)_
  static const ItemType spruce_sapling = ItemType('minecraft:spruce_sapling');

  /// [Spruce Sign](https://minecraft.gamepedia.com/spruce_sign)
  ///
  /// _(minecraft:spruce_sign)_
  static const ItemType spruce_sign = ItemType('minecraft:spruce_sign');

  /// [Spruce Slab](https://minecraft.gamepedia.com/spruce_slab)
  ///
  /// _(minecraft:spruce_slab)_
  static const ItemType spruce_slab = ItemType('minecraft:spruce_slab');

  /// [Spruce Stairs](https://minecraft.gamepedia.com/spruce_stairs)
  ///
  /// _(minecraft:spruce_stairs)_
  static const ItemType spruce_stairs = ItemType('minecraft:spruce_stairs');

  /// [Spruce Trapdoor](https://minecraft.gamepedia.com/spruce_trapdoor)
  ///
  /// _(minecraft:spruce_trapdoor)_
  static const ItemType spruce_trapdoor = ItemType('minecraft:spruce_trapdoor');

  /// [Spruce Wood](https://minecraft.gamepedia.com/spruce_wood)
  ///
  /// _(minecraft:spruce_wood)_
  static const ItemType spruce_wood = ItemType('minecraft:spruce_wood');

  /// [Squid Spawn Egg](https://minecraft.gamepedia.com/squid_spawn_egg)
  ///
  /// _(minecraft:squid_spawn_egg)_
  static const ItemType squid_spawn_egg = ItemType('minecraft:squid_spawn_egg');

  /// [Stick](https://minecraft.gamepedia.com/stick)
  ///
  /// _(minecraft:stick)_
  static const ItemType stick = ItemType('minecraft:stick');

  /// [Sticky Piston](https://minecraft.gamepedia.com/sticky_piston)
  ///
  /// _(minecraft:sticky_piston)_
  static const ItemType sticky_piston = ItemType('minecraft:sticky_piston');

  /// [Stone](https://minecraft.gamepedia.com/stone)
  ///
  /// _(minecraft:stone)_
  static const ItemType stone = ItemType('minecraft:stone');

  /// [Stone Axe](https://minecraft.gamepedia.com/stone_axe)
  ///
  /// _(minecraft:stone_axe)_
  static const ItemType stone_axe = ItemType('minecraft:stone_axe');

  /// [Stone Brick Slab](https://minecraft.gamepedia.com/stone_brick_slab)
  ///
  /// _(minecraft:stone_brick_slab)_
  static const ItemType stone_brick_slab =
      ItemType('minecraft:stone_brick_slab');

  /// [Stone Brick Stairs](https://minecraft.gamepedia.com/stone_brick_stairs)
  ///
  /// _(minecraft:stone_brick_stairs)_
  static const ItemType stone_brick_stairs =
      ItemType('minecraft:stone_brick_stairs');

  /// [Stone Brick Wall](https://minecraft.gamepedia.com/stone_brick_wall)
  ///
  /// _(minecraft:stone_brick_wall)_
  static const ItemType stone_brick_wall =
      ItemType('minecraft:stone_brick_wall');

  /// [Stone Bricks](https://minecraft.gamepedia.com/stone_bricks)
  ///
  /// _(minecraft:stone_bricks)_
  static const ItemType stone_bricks = ItemType('minecraft:stone_bricks');

  /// [Stone Button](https://minecraft.gamepedia.com/stone_button)
  ///
  /// _(minecraft:stone_button)_
  static const ItemType stone_button = ItemType('minecraft:stone_button');

  /// [Stone Hoe](https://minecraft.gamepedia.com/stone_hoe)
  ///
  /// _(minecraft:stone_hoe)_
  static const ItemType stone_hoe = ItemType('minecraft:stone_hoe');

  /// [Stone Pickaxe](https://minecraft.gamepedia.com/stone_pickaxe)
  ///
  /// _(minecraft:stone_pickaxe)_
  static const ItemType stone_pickaxe = ItemType('minecraft:stone_pickaxe');

  /// [Stone Pressure Plate](https://minecraft.gamepedia.com/stone_pressure_plate)
  ///
  /// _(minecraft:stone_pressure_plate)_
  static const ItemType stone_pressure_plate =
      ItemType('minecraft:stone_pressure_plate');

  /// [Stone Shovel](https://minecraft.gamepedia.com/stone_shovel)
  ///
  /// _(minecraft:stone_shovel)_
  static const ItemType stone_shovel = ItemType('minecraft:stone_shovel');

  /// [Stone Slab](https://minecraft.gamepedia.com/stone_slab)
  ///
  /// _(minecraft:stone_slab)_
  static const ItemType stone_slab = ItemType('minecraft:stone_slab');

  /// [Stone Stairs](https://minecraft.gamepedia.com/stone_stairs)
  ///
  /// _(minecraft:stone_stairs)_
  static const ItemType stone_stairs = ItemType('minecraft:stone_stairs');

  /// [Stone Sword](https://minecraft.gamepedia.com/stone_sword)
  ///
  /// _(minecraft:stone_sword)_
  static const ItemType stone_sword = ItemType('minecraft:stone_sword');

  /// [Stonecutter](https://minecraft.gamepedia.com/stonecutter)
  ///
  /// _(minecraft:stonecutter)_
  static const ItemType stonecutter = ItemType('minecraft:stonecutter');

  /// [Stray Spawn Egg](https://minecraft.gamepedia.com/stray_spawn_egg)
  ///
  /// _(minecraft:stray_spawn_egg)_
  static const ItemType stray_spawn_egg = ItemType('minecraft:stray_spawn_egg');

  /// [String](https://minecraft.gamepedia.com/string)
  ///
  /// _(minecraft:string)_
  static const ItemType string = ItemType('minecraft:string');

  /// [Stripped Acacia Log](https://minecraft.gamepedia.com/stripped_acacia_log)
  ///
  /// _(minecraft:stripped_acacia_log)_
  static const ItemType stripped_acacia_log =
      ItemType('minecraft:stripped_acacia_log');

  /// [Stripped Acacia Wood](https://minecraft.gamepedia.com/stripped_acacia_wood)
  ///
  /// _(minecraft:stripped_acacia_wood)_
  static const ItemType stripped_acacia_wood =
      ItemType('minecraft:stripped_acacia_wood');

  /// [Stripped Birch Log](https://minecraft.gamepedia.com/stripped_birch_log)
  ///
  /// _(minecraft:stripped_birch_log)_
  static const ItemType stripped_birch_log =
      ItemType('minecraft:stripped_birch_log');

  /// [Stripped Birch Wood](https://minecraft.gamepedia.com/stripped_birch_wood)
  ///
  /// _(minecraft:stripped_birch_wood)_
  static const ItemType stripped_birch_wood =
      ItemType('minecraft:stripped_birch_wood');

  /// [Stripped Dark Oak Log](https://minecraft.gamepedia.com/stripped_dark_oak_log)
  ///
  /// _(minecraft:stripped_dark_oak_log)_
  static const ItemType stripped_dark_oak_log =
      ItemType('minecraft:stripped_dark_oak_log');

  /// [Stripped Dark Oak Wood](https://minecraft.gamepedia.com/stripped_dark_oak_wood)
  ///
  /// _(minecraft:stripped_dark_oak_wood)_
  static const ItemType stripped_dark_oak_wood =
      ItemType('minecraft:stripped_dark_oak_wood');

  /// [Stripped Jungle Log](https://minecraft.gamepedia.com/stripped_jungle_log)
  ///
  /// _(minecraft:stripped_jungle_log)_
  static const ItemType stripped_jungle_log =
      ItemType('minecraft:stripped_jungle_log');

  /// [Stripped Jungle Wood](https://minecraft.gamepedia.com/stripped_jungle_wood)
  ///
  /// _(minecraft:stripped_jungle_wood)_
  static const ItemType stripped_jungle_wood =
      ItemType('minecraft:stripped_jungle_wood');

  /// [Stripped Oak Log](https://minecraft.gamepedia.com/stripped_oak_log)
  ///
  /// _(minecraft:stripped_oak_log)_
  static const ItemType stripped_oak_log =
      ItemType('minecraft:stripped_oak_log');

  /// [Stripped Oak Wood](https://minecraft.gamepedia.com/stripped_oak_wood)
  ///
  /// _(minecraft:stripped_oak_wood)_
  static const ItemType stripped_oak_wood =
      ItemType('minecraft:stripped_oak_wood');

  /// [Stripped Spruce Log](https://minecraft.gamepedia.com/stripped_spruce_log)
  ///
  /// _(minecraft:stripped_spruce_log)_
  static const ItemType stripped_spruce_log =
      ItemType('minecraft:stripped_spruce_log');

  /// [Stripped Spruce Wood](https://minecraft.gamepedia.com/stripped_spruce_wood)
  ///
  /// _(minecraft:stripped_spruce_wood)_
  static const ItemType stripped_spruce_wood =
      ItemType('minecraft:stripped_spruce_wood');

  /// [Structure Block](https://minecraft.gamepedia.com/structure_block)
  ///
  /// _(minecraft:structure_block)_
  static const ItemType structure_block = ItemType('minecraft:structure_block');

  /// [Structure Void](https://minecraft.gamepedia.com/structure_void)
  ///
  /// _(minecraft:structure_void)_
  static const ItemType structure_void = ItemType('minecraft:structure_void');

  /// [Sugar](https://minecraft.gamepedia.com/sugar)
  ///
  /// _(minecraft:sugar)_
  static const ItemType sugar = ItemType('minecraft:sugar');

  /// [Sugar Cane](https://minecraft.gamepedia.com/sugar_cane)
  ///
  /// _(minecraft:sugar_cane)_
  static const ItemType sugar_cane = ItemType('minecraft:sugar_cane');

  /// [Sunflower](https://minecraft.gamepedia.com/sunflower)
  ///
  /// _(minecraft:sunflower)_
  static const ItemType sunflower = ItemType('minecraft:sunflower');

  /// [Suspicious Stew](https://minecraft.gamepedia.com/suspicious_stew)
  ///
  /// _(minecraft:suspicious_stew)_
  static const ItemType suspicious_stew = ItemType('minecraft:suspicious_stew');

  /// [Sweet Berries](https://minecraft.gamepedia.com/sweet_berries)
  ///
  /// _(minecraft:sweet_berries)_
  static const ItemType sweet_berries = ItemType('minecraft:sweet_berries');

  /// [Tall Grass](https://minecraft.gamepedia.com/tall_grass)
  ///
  /// _(minecraft:tall_grass)_
  static const ItemType tall_grass = ItemType('minecraft:tall_grass');

  /// [Terracotta](https://minecraft.gamepedia.com/terracotta)
  ///
  /// _(minecraft:terracotta)_
  static const ItemType terracotta = ItemType('minecraft:terracotta');

  /// [Tipped Arrow](https://minecraft.gamepedia.com/tipped_arrow)
  ///
  /// _(minecraft:tipped_arrow)_
  static const ItemType tipped_arrow = ItemType('minecraft:tipped_arrow');

  /// [Tnt](https://minecraft.gamepedia.com/tnt)
  ///
  /// _(minecraft:tnt)_
  static const ItemType tnt = ItemType('minecraft:tnt');

  /// [Tnt Minecart](https://minecraft.gamepedia.com/tnt_minecart)
  ///
  /// _(minecraft:tnt_minecart)_
  static const ItemType tnt_minecart = ItemType('minecraft:tnt_minecart');

  /// [Torch](https://minecraft.gamepedia.com/torch)
  ///
  /// _(minecraft:torch)_
  static const ItemType torch = ItemType('minecraft:torch');

  /// [Totem Of Undying](https://minecraft.gamepedia.com/totem_of_undying)
  ///
  /// _(minecraft:totem_of_undying)_
  static const ItemType totem_of_undying =
      ItemType('minecraft:totem_of_undying');

  /// [Trader Llama Spawn Egg](https://minecraft.gamepedia.com/trader_llama_spawn_egg)
  ///
  /// _(minecraft:trader_llama_spawn_egg)_
  static const ItemType trader_llama_spawn_egg =
      ItemType('minecraft:trader_llama_spawn_egg');

  /// [Trapped Chest](https://minecraft.gamepedia.com/trapped_chest)
  ///
  /// _(minecraft:trapped_chest)_
  static const ItemType trapped_chest = ItemType('minecraft:trapped_chest');

  /// [Trident](https://minecraft.gamepedia.com/trident)
  ///
  /// _(minecraft:trident)_
  static const ItemType trident = ItemType('minecraft:trident');

  /// [Tripwire Hook](https://minecraft.gamepedia.com/tripwire_hook)
  ///
  /// _(minecraft:tripwire_hook)_
  static const ItemType tripwire_hook = ItemType('minecraft:tripwire_hook');

  /// [Tropical Fish](https://minecraft.gamepedia.com/tropical_fish)
  ///
  /// _(minecraft:tropical_fish)_
  static const ItemType tropical_fish = ItemType('minecraft:tropical_fish');

  /// [Tropical Fish Bucket](https://minecraft.gamepedia.com/tropical_fish_bucket)
  ///
  /// _(minecraft:tropical_fish_bucket)_
  static const ItemType tropical_fish_bucket =
      ItemType('minecraft:tropical_fish_bucket');

  /// [Tropical Fish Spawn Egg](https://minecraft.gamepedia.com/tropical_fish_spawn_egg)
  ///
  /// _(minecraft:tropical_fish_spawn_egg)_
  static const ItemType tropical_fish_spawn_egg =
      ItemType('minecraft:tropical_fish_spawn_egg');

  /// [Tube Coral](https://minecraft.gamepedia.com/tube_coral)
  ///
  /// _(minecraft:tube_coral)_
  static const ItemType tube_coral = ItemType('minecraft:tube_coral');

  /// [Tube Coral Block](https://minecraft.gamepedia.com/tube_coral_block)
  ///
  /// _(minecraft:tube_coral_block)_
  static const ItemType tube_coral_block =
      ItemType('minecraft:tube_coral_block');

  /// [Tube Coral Fan](https://minecraft.gamepedia.com/tube_coral_fan)
  ///
  /// _(minecraft:tube_coral_fan)_
  static const ItemType tube_coral_fan = ItemType('minecraft:tube_coral_fan');

  /// [Turtle Egg](https://minecraft.gamepedia.com/turtle_egg)
  ///
  /// _(minecraft:turtle_egg)_
  static const ItemType turtle_egg = ItemType('minecraft:turtle_egg');

  /// [Turtle Helmet](https://minecraft.gamepedia.com/turtle_helmet)
  ///
  /// _(minecraft:turtle_helmet)_
  static const ItemType turtle_helmet = ItemType('minecraft:turtle_helmet');

  /// [Turtle Spawn Egg](https://minecraft.gamepedia.com/turtle_spawn_egg)
  ///
  /// _(minecraft:turtle_spawn_egg)_
  static const ItemType turtle_spawn_egg =
      ItemType('minecraft:turtle_spawn_egg');

  /// [Vex Spawn Egg](https://minecraft.gamepedia.com/vex_spawn_egg)
  ///
  /// _(minecraft:vex_spawn_egg)_
  static const ItemType vex_spawn_egg = ItemType('minecraft:vex_spawn_egg');

  /// [Villager Spawn Egg](https://minecraft.gamepedia.com/villager_spawn_egg)
  ///
  /// _(minecraft:villager_spawn_egg)_
  static const ItemType villager_spawn_egg =
      ItemType('minecraft:villager_spawn_egg');

  /// [Vindicator Spawn Egg](https://minecraft.gamepedia.com/vindicator_spawn_egg)
  ///
  /// _(minecraft:vindicator_spawn_egg)_
  static const ItemType vindicator_spawn_egg =
      ItemType('minecraft:vindicator_spawn_egg');

  /// [Vine](https://minecraft.gamepedia.com/vine)
  ///
  /// _(minecraft:vine)_
  static const ItemType vine = ItemType('minecraft:vine');

  /// [Wandering Trader Spawn Egg](https://minecraft.gamepedia.com/wandering_trader_spawn_egg)
  ///
  /// _(minecraft:wandering_trader_spawn_egg)_
  static const ItemType wandering_trader_spawn_egg =
      ItemType('minecraft:wandering_trader_spawn_egg');

  /// [Water Bucket](https://minecraft.gamepedia.com/water_bucket)
  ///
  /// _(minecraft:water_bucket)_
  static const ItemType water_bucket = ItemType('minecraft:water_bucket');

  /// [Wet Sponge](https://minecraft.gamepedia.com/wet_sponge)
  ///
  /// _(minecraft:wet_sponge)_
  static const ItemType wet_sponge = ItemType('minecraft:wet_sponge');

  /// [Wheat](https://minecraft.gamepedia.com/wheat)
  ///
  /// _(minecraft:wheat)_
  static const ItemType wheat = ItemType('minecraft:wheat');

  /// [Wheat Seeds](https://minecraft.gamepedia.com/wheat_seeds)
  ///
  /// _(minecraft:wheat_seeds)_
  static const ItemType wheat_seeds = ItemType('minecraft:wheat_seeds');

  /// [White Banner](https://minecraft.gamepedia.com/white_banner)
  ///
  /// _(minecraft:white_banner)_
  static const ItemType white_banner = ItemType('minecraft:white_banner');

  /// [White Bed](https://minecraft.gamepedia.com/white_bed)
  ///
  /// _(minecraft:white_bed)_
  static const ItemType white_bed = ItemType('minecraft:white_bed');

  /// [White Carpet](https://minecraft.gamepedia.com/white_carpet)
  ///
  /// _(minecraft:white_carpet)_
  static const ItemType white_carpet = ItemType('minecraft:white_carpet');

  /// [White Concrete](https://minecraft.gamepedia.com/white_concrete)
  ///
  /// _(minecraft:white_concrete)_
  static const ItemType white_concrete = ItemType('minecraft:white_concrete');

  /// [White Concrete Powder](https://minecraft.gamepedia.com/white_concrete_powder)
  ///
  /// _(minecraft:white_concrete_powder)_
  static const ItemType white_concrete_powder =
      ItemType('minecraft:white_concrete_powder');

  /// [White Dye](https://minecraft.gamepedia.com/white_dye)
  ///
  /// _(minecraft:white_dye)_
  static const ItemType white_dye = ItemType('minecraft:white_dye');

  /// [White Glazed Terracotta](https://minecraft.gamepedia.com/white_glazed_terracotta)
  ///
  /// _(minecraft:white_glazed_terracotta)_
  static const ItemType white_glazed_terracotta =
      ItemType('minecraft:white_glazed_terracotta');

  /// [White Shulker Box](https://minecraft.gamepedia.com/white_shulker_box)
  ///
  /// _(minecraft:white_shulker_box)_
  static const ItemType white_shulker_box =
      ItemType('minecraft:white_shulker_box');

  /// [White Stained Glass](https://minecraft.gamepedia.com/white_stained_glass)
  ///
  /// _(minecraft:white_stained_glass)_
  static const ItemType white_stained_glass =
      ItemType('minecraft:white_stained_glass');

  /// [White Stained Glass Pane](https://minecraft.gamepedia.com/white_stained_glass_pane)
  ///
  /// _(minecraft:white_stained_glass_pane)_
  static const ItemType white_stained_glass_pane =
      ItemType('minecraft:white_stained_glass_pane');

  /// [White Terracotta](https://minecraft.gamepedia.com/white_terracotta)
  ///
  /// _(minecraft:white_terracotta)_
  static const ItemType white_terracotta =
      ItemType('minecraft:white_terracotta');

  /// [White Tulip](https://minecraft.gamepedia.com/white_tulip)
  ///
  /// _(minecraft:white_tulip)_
  static const ItemType white_tulip = ItemType('minecraft:white_tulip');

  /// [White Wool](https://minecraft.gamepedia.com/white_wool)
  ///
  /// _(minecraft:white_wool)_
  static const ItemType white_wool = ItemType('minecraft:white_wool');

  /// [Witch Spawn Egg](https://minecraft.gamepedia.com/witch_spawn_egg)
  ///
  /// _(minecraft:witch_spawn_egg)_
  static const ItemType witch_spawn_egg = ItemType('minecraft:witch_spawn_egg');

  /// [Wither Rose](https://minecraft.gamepedia.com/wither_rose)
  ///
  /// _(minecraft:wither_rose)_
  static const ItemType wither_rose = ItemType('minecraft:wither_rose');

  /// [Wither Skeleton Skull](https://minecraft.gamepedia.com/wither_skeleton_skull)
  ///
  /// _(minecraft:wither_skeleton_skull)_
  static const ItemType wither_skeleton_skull =
      ItemType('minecraft:wither_skeleton_skull');

  /// [Wither Skeleton Spawn Egg](https://minecraft.gamepedia.com/wither_skeleton_spawn_egg)
  ///
  /// _(minecraft:wither_skeleton_spawn_egg)_
  static const ItemType wither_skeleton_spawn_egg =
      ItemType('minecraft:wither_skeleton_spawn_egg');

  /// [Wolf Spawn Egg](https://minecraft.gamepedia.com/wolf_spawn_egg)
  ///
  /// _(minecraft:wolf_spawn_egg)_
  static const ItemType wolf_spawn_egg = ItemType('minecraft:wolf_spawn_egg');

  /// [Wooden Axe](https://minecraft.gamepedia.com/wooden_axe)
  ///
  /// _(minecraft:wooden_axe)_
  static const ItemType wooden_axe = ItemType('minecraft:wooden_axe');

  /// [Wooden Hoe](https://minecraft.gamepedia.com/wooden_hoe)
  ///
  /// _(minecraft:wooden_hoe)_
  static const ItemType wooden_hoe = ItemType('minecraft:wooden_hoe');

  /// [Wooden Pickaxe](https://minecraft.gamepedia.com/wooden_pickaxe)
  ///
  /// _(minecraft:wooden_pickaxe)_
  static const ItemType wooden_pickaxe = ItemType('minecraft:wooden_pickaxe');

  /// [Wooden Shovel](https://minecraft.gamepedia.com/wooden_shovel)
  ///
  /// _(minecraft:wooden_shovel)_
  static const ItemType wooden_shovel = ItemType('minecraft:wooden_shovel');

  /// [Wooden Sword](https://minecraft.gamepedia.com/wooden_sword)
  ///
  /// _(minecraft:wooden_sword)_
  static const ItemType wooden_sword = ItemType('minecraft:wooden_sword');

  /// [Writable Book](https://minecraft.gamepedia.com/writable_book)
  ///
  /// _(minecraft:writable_book)_
  static const ItemType writable_book = ItemType('minecraft:writable_book');

  /// [Written Book](https://minecraft.gamepedia.com/written_book)
  ///
  /// _(minecraft:written_book)_
  static const ItemType written_book = ItemType('minecraft:written_book');

  /// [Yellow Banner](https://minecraft.gamepedia.com/yellow_banner)
  ///
  /// _(minecraft:yellow_banner)_
  static const ItemType yellow_banner = ItemType('minecraft:yellow_banner');

  /// [Yellow Bed](https://minecraft.gamepedia.com/yellow_bed)
  ///
  /// _(minecraft:yellow_bed)_
  static const ItemType yellow_bed = ItemType('minecraft:yellow_bed');

  /// [Yellow Carpet](https://minecraft.gamepedia.com/yellow_carpet)
  ///
  /// _(minecraft:yellow_carpet)_
  static const ItemType yellow_carpet = ItemType('minecraft:yellow_carpet');

  /// [Yellow Concrete](https://minecraft.gamepedia.com/yellow_concrete)
  ///
  /// _(minecraft:yellow_concrete)_
  static const ItemType yellow_concrete = ItemType('minecraft:yellow_concrete');

  /// [Yellow Concrete Powder](https://minecraft.gamepedia.com/yellow_concrete_powder)
  ///
  /// _(minecraft:yellow_concrete_powder)_
  static const ItemType yellow_concrete_powder =
      ItemType('minecraft:yellow_concrete_powder');

  /// [Yellow Dye](https://minecraft.gamepedia.com/yellow_dye)
  ///
  /// _(minecraft:yellow_dye)_
  static const ItemType yellow_dye = ItemType('minecraft:yellow_dye');

  /// [Yellow Glazed Terracotta](https://minecraft.gamepedia.com/yellow_glazed_terracotta)
  ///
  /// _(minecraft:yellow_glazed_terracotta)_
  static const ItemType yellow_glazed_terracotta =
      ItemType('minecraft:yellow_glazed_terracotta');

  /// [Yellow Shulker Box](https://minecraft.gamepedia.com/yellow_shulker_box)
  ///
  /// _(minecraft:yellow_shulker_box)_
  static const ItemType yellow_shulker_box =
      ItemType('minecraft:yellow_shulker_box');

  /// [Yellow Stained Glass](https://minecraft.gamepedia.com/yellow_stained_glass)
  ///
  /// _(minecraft:yellow_stained_glass)_
  static const ItemType yellow_stained_glass =
      ItemType('minecraft:yellow_stained_glass');

  /// [Yellow Stained Glass Pane](https://minecraft.gamepedia.com/yellow_stained_glass_pane)
  ///
  /// _(minecraft:yellow_stained_glass_pane)_
  static const ItemType yellow_stained_glass_pane =
      ItemType('minecraft:yellow_stained_glass_pane');

  /// [Yellow Terracotta](https://minecraft.gamepedia.com/yellow_terracotta)
  ///
  /// _(minecraft:yellow_terracotta)_
  static const ItemType yellow_terracotta =
      ItemType('minecraft:yellow_terracotta');

  /// [Yellow Wool](https://minecraft.gamepedia.com/yellow_wool)
  ///
  /// _(minecraft:yellow_wool)_
  static const ItemType yellow_wool = ItemType('minecraft:yellow_wool');

  /// [Zombie Head](https://minecraft.gamepedia.com/zombie_head)
  ///
  /// _(minecraft:zombie_head)_
  static const ItemType zombie_head = ItemType('minecraft:zombie_head');

  /// [Zombie Horse Spawn Egg](https://minecraft.gamepedia.com/zombie_horse_spawn_egg)
  ///
  /// _(minecraft:zombie_horse_spawn_egg)_
  static const ItemType zombie_horse_spawn_egg =
      ItemType('minecraft:zombie_horse_spawn_egg');

  /// [Zombie Pigman Spawn Egg](https://minecraft.gamepedia.com/zombie_pigman_spawn_egg)
  ///
  /// _(minecraft:zombie_pigman_spawn_egg)_
  static const ItemType zombie_pigman_spawn_egg =
      ItemType('minecraft:zombie_pigman_spawn_egg');

  /// [Zombie Spawn Egg](https://minecraft.gamepedia.com/zombie_spawn_egg)
  ///
  /// _(minecraft:zombie_spawn_egg)_
  static const ItemType zombie_spawn_egg =
      ItemType('minecraft:zombie_spawn_egg');

  /// [Zombie Villager Spawn Egg](https://minecraft.gamepedia.com/zombie_villager_spawn_egg)
  ///
  /// _(minecraft:zombie_villager_spawn_egg)_
  static const ItemType zombie_villager_spawn_egg =
      ItemType('minecraft:zombie_villager_spawn_egg');

  /// [Ancient Debris](https://minecraft.gamepedia.com/ancient_debris)
  ///
  /// _(minecraft:ancient_debris)_
  static const ItemType ancient_debris = ItemType('minecraft:ancient_debris');

  /// [Basalt](https://minecraft.gamepedia.com/basalt)
  ///
  /// _(minecraft:basalt)_
  static const ItemType basalt = ItemType('minecraft:basalt');

  /// [Blackstone](https://minecraft.gamepedia.com/blackstone)
  ///
  /// _(minecraft:blackstone)_
  static const ItemType blackstone = ItemType('minecraft:blackstone');

  /// [Blackstone Slab](https://minecraft.gamepedia.com/blackstone_slab)
  ///
  /// _(minecraft:blackstone_slab)_
  static const ItemType blackstone_slab = ItemType('minecraft:blackstone_slab');

  /// [Blackstone Stairs](https://minecraft.gamepedia.com/blackstone_stairs)
  ///
  /// _(minecraft:blackstone_stairs)_
  static const ItemType blackstone_stairs =
      ItemType('minecraft:blackstone_stairs');

  /// [Blackstone Wall](https://minecraft.gamepedia.com/blackstone_wall)
  ///
  /// _(minecraft:blackstone_wall)_
  static const ItemType blackstone_wall = ItemType('minecraft:blackstone_wall');

  /// [Chain](https://minecraft.gamepedia.com/chain)
  ///
  /// _(minecraft:chain)_
  static const ItemType chain = ItemType('minecraft:chain');

  /// [Chiseled Nether Bricks](https://minecraft.gamepedia.com/chiseled_nether_bricks)
  ///
  /// _(minecraft:chiseled_nether_bricks)_
  static const ItemType chiseled_nether_bricks =
      ItemType('minecraft:chiseled_nether_bricks');

  /// [Chiseled Polished Blackstone](https://minecraft.gamepedia.com/chiseled_polished_blackstone)
  ///
  /// _(minecraft:chiseled_polished_blackstone)_
  static const ItemType chiseled_polished_blackstone =
      ItemType('minecraft:chiseled_polished_blackstone');

  /// [Cracked Nether Bricks](https://minecraft.gamepedia.com/cracked_nether_bricks)
  ///
  /// _(minecraft:cracked_nether_bricks)_
  static const ItemType cracked_nether_bricks =
      ItemType('minecraft:cracked_nether_bricks');

  /// [Cracked Polished Blackstone Bricks](https://minecraft.gamepedia.com/cracked_polished_blackstone_bricks)
  ///
  /// _(minecraft:cracked_polished_blackstone_bricks)_
  static const ItemType cracked_polished_blackstone_bricks =
      ItemType('minecraft:cracked_polished_blackstone_bricks');

  /// [Crimson Button](https://minecraft.gamepedia.com/crimson_button)
  ///
  /// _(minecraft:crimson_button)_
  static const ItemType crimson_button = ItemType('minecraft:crimson_button');

  /// [Crimson Door](https://minecraft.gamepedia.com/crimson_door)
  ///
  /// _(minecraft:crimson_door)_
  static const ItemType crimson_door = ItemType('minecraft:crimson_door');

  /// [Crimson Fence](https://minecraft.gamepedia.com/crimson_fence)
  ///
  /// _(minecraft:crimson_fence)_
  static const ItemType crimson_fence = ItemType('minecraft:crimson_fence');

  /// [Crimson Fence Gate](https://minecraft.gamepedia.com/crimson_fence_gate)
  ///
  /// _(minecraft:crimson_fence_gate)_
  static const ItemType crimson_fence_gate =
      ItemType('minecraft:crimson_fence_gate');

  /// [Crimson Fungus](https://minecraft.gamepedia.com/crimson_fungus)
  ///
  /// _(minecraft:crimson_fungus)_
  static const ItemType crimson_fungus = ItemType('minecraft:crimson_fungus');

  /// [Crimson Hyphae](https://minecraft.gamepedia.com/crimson_hyphae)
  ///
  /// _(minecraft:crimson_hyphae)_
  static const ItemType crimson_hyphae = ItemType('minecraft:crimson_hyphae');

  /// [Crimson Nylium](https://minecraft.gamepedia.com/crimson_nylium)
  ///
  /// _(minecraft:crimson_nylium)_
  static const ItemType crimson_nylium = ItemType('minecraft:crimson_nylium');

  /// [Crimson Planks](https://minecraft.gamepedia.com/crimson_planks)
  ///
  /// _(minecraft:crimson_planks)_
  static const ItemType crimson_planks = ItemType('minecraft:crimson_planks');

  /// [Crimson Pressure Plate](https://minecraft.gamepedia.com/crimson_pressure_plate)
  ///
  /// _(minecraft:crimson_pressure_plate)_
  static const ItemType crimson_pressure_plate =
      ItemType('minecraft:crimson_pressure_plate');

  /// [Crimson Roots](https://minecraft.gamepedia.com/crimson_roots)
  ///
  /// _(minecraft:crimson_roots)_
  static const ItemType crimson_roots = ItemType('minecraft:crimson_roots');

  /// [Crimson Sign](https://minecraft.gamepedia.com/crimson_sign)
  ///
  /// _(minecraft:crimson_sign)_
  static const ItemType crimson_sign = ItemType('minecraft:crimson_sign');

  /// [Crimson Slab](https://minecraft.gamepedia.com/crimson_slab)
  ///
  /// _(minecraft:crimson_slab)_
  static const ItemType crimson_slab = ItemType('minecraft:crimson_slab');

  /// [Crimson Stairs](https://minecraft.gamepedia.com/crimson_stairs)
  ///
  /// _(minecraft:crimson_stairs)_
  static const ItemType crimson_stairs = ItemType('minecraft:crimson_stairs');

  /// [Crimson Stem](https://minecraft.gamepedia.com/crimson_stem)
  ///
  /// _(minecraft:crimson_stem)_
  static const ItemType crimson_stem = ItemType('minecraft:crimson_stem');

  /// [Crimson Trapdoor](https://minecraft.gamepedia.com/crimson_trapdoor)
  ///
  /// _(minecraft:crimson_trapdoor)_
  static const ItemType crimson_trapdoor =
      ItemType('minecraft:crimson_trapdoor');

  /// [Crying Obsidian](https://minecraft.gamepedia.com/crying_obsidian)
  ///
  /// _(minecraft:crying_obsidian)_
  static const ItemType crying_obsidian = ItemType('minecraft:crying_obsidian');

  /// [Gilded Blackstone](https://minecraft.gamepedia.com/gilded_blackstone)
  ///
  /// _(minecraft:gilded_blackstone)_
  static const ItemType gilded_blackstone =
      ItemType('minecraft:gilded_blackstone');

  /// [Hoglin Spawn Egg](https://minecraft.gamepedia.com/hoglin_spawn_egg)
  ///
  /// _(minecraft:hoglin_spawn_egg)_
  static const ItemType hoglin_spawn_egg =
      ItemType('minecraft:hoglin_spawn_egg');

  /// [Lodestone](https://minecraft.gamepedia.com/lodestone)
  ///
  /// _(minecraft:lodestone)_
  static const ItemType lodestone = ItemType('minecraft:lodestone');

  /// [Music Disc Pigstep](https://minecraft.gamepedia.com/music_disc_pigstep)
  ///
  /// _(minecraft:music_disc_pigstep)_
  static const ItemType music_disc_pigstep =
      ItemType('minecraft:music_disc_pigstep');

  /// [Nether Gold Ore](https://minecraft.gamepedia.com/nether_gold_ore)
  ///
  /// _(minecraft:nether_gold_ore)_
  static const ItemType nether_gold_ore = ItemType('minecraft:nether_gold_ore');

  /// [Nether Sprouts](https://minecraft.gamepedia.com/nether_sprouts)
  ///
  /// _(minecraft:nether_sprouts)_
  static const ItemType nether_sprouts = ItemType('minecraft:nether_sprouts');

  /// [Netherite Axe](https://minecraft.gamepedia.com/netherite_axe)
  ///
  /// _(minecraft:netherite_axe)_
  static const ItemType netherite_axe = ItemType('minecraft:netherite_axe');

  /// [Netherite Block](https://minecraft.gamepedia.com/netherite_block)
  ///
  /// _(minecraft:netherite_block)_
  static const ItemType netherite_block = ItemType('minecraft:netherite_block');

  /// [Netherite Boots](https://minecraft.gamepedia.com/netherite_boots)
  ///
  /// _(minecraft:netherite_boots)_
  static const ItemType netherite_boots = ItemType('minecraft:netherite_boots');

  /// [Netherite Chestplate](https://minecraft.gamepedia.com/netherite_chestplate)
  ///
  /// _(minecraft:netherite_chestplate)_
  static const ItemType netherite_chestplate =
      ItemType('minecraft:netherite_chestplate');

  /// [Netherite Helmet](https://minecraft.gamepedia.com/netherite_helmet)
  ///
  /// _(minecraft:netherite_helmet)_
  static const ItemType netherite_helmet =
      ItemType('minecraft:netherite_helmet');

  /// [Netherite Hoe](https://minecraft.gamepedia.com/netherite_hoe)
  ///
  /// _(minecraft:netherite_hoe)_
  static const ItemType netherite_hoe = ItemType('minecraft:netherite_hoe');

  /// [Netherite Ingot](https://minecraft.gamepedia.com/netherite_ingot)
  ///
  /// _(minecraft:netherite_ingot)_
  static const ItemType netherite_ingot = ItemType('minecraft:netherite_ingot');

  /// [Netherite Leggings](https://minecraft.gamepedia.com/netherite_leggings)
  ///
  /// _(minecraft:netherite_leggings)_
  static const ItemType netherite_leggings =
      ItemType('minecraft:netherite_leggings');

  /// [Netherite Pickaxe](https://minecraft.gamepedia.com/netherite_pickaxe)
  ///
  /// _(minecraft:netherite_pickaxe)_
  static const ItemType netherite_pickaxe =
      ItemType('minecraft:netherite_pickaxe');

  /// [Netherite Scrap](https://minecraft.gamepedia.com/netherite_scrap)
  ///
  /// _(minecraft:netherite_scrap)_
  static const ItemType netherite_scrap = ItemType('minecraft:netherite_scrap');

  /// [Netherite Shovel](https://minecraft.gamepedia.com/netherite_shovel)
  ///
  /// _(minecraft:netherite_shovel)_
  static const ItemType netherite_shovel =
      ItemType('minecraft:netherite_shovel');

  /// [Netherite Sword](https://minecraft.gamepedia.com/netherite_sword)
  ///
  /// _(minecraft:netherite_sword)_
  static const ItemType netherite_sword = ItemType('minecraft:netherite_sword');

  /// [Piglin Banner Pattern](https://minecraft.gamepedia.com/piglin_banner_pattern)
  ///
  /// _(minecraft:piglin_banner_pattern)_
  static const ItemType piglin_banner_pattern =
      ItemType('minecraft:piglin_banner_pattern');

  /// [Piglin Spawn Egg](https://minecraft.gamepedia.com/piglin_spawn_egg)
  ///
  /// _(minecraft:piglin_spawn_egg)_
  static const ItemType piglin_spawn_egg =
      ItemType('minecraft:piglin_spawn_egg');

  /// [Polished Basalt](https://minecraft.gamepedia.com/polished_basalt)
  ///
  /// _(minecraft:polished_basalt)_
  static const ItemType polished_basalt = ItemType('minecraft:polished_basalt');

  /// [Polished Blackstone](https://minecraft.gamepedia.com/polished_blackstone)
  ///
  /// _(minecraft:polished_blackstone)_
  static const ItemType polished_blackstone =
      ItemType('minecraft:polished_blackstone');

  /// [Polished Blackstone Brick Slab](https://minecraft.gamepedia.com/polished_blackstone_brick_slab)
  ///
  /// _(minecraft:polished_blackstone_brick_slab)_
  static const ItemType polished_blackstone_brick_slab =
      ItemType('minecraft:polished_blackstone_brick_slab');

  /// [Polished Blackstone Brick Stairs](https://minecraft.gamepedia.com/polished_blackstone_brick_stairs)
  ///
  /// _(minecraft:polished_blackstone_brick_stairs)_
  static const ItemType polished_blackstone_brick_stairs =
      ItemType('minecraft:polished_blackstone_brick_stairs');

  /// [Polished Blackstone Brick Wall](https://minecraft.gamepedia.com/polished_blackstone_brick_wall)
  ///
  /// _(minecraft:polished_blackstone_brick_wall)_
  static const ItemType polished_blackstone_brick_wall =
      ItemType('minecraft:polished_blackstone_brick_wall');

  /// [Polished Blackstone Bricks](https://minecraft.gamepedia.com/polished_blackstone_bricks)
  ///
  /// _(minecraft:polished_blackstone_bricks)_
  static const ItemType polished_blackstone_bricks =
      ItemType('minecraft:polished_blackstone_bricks');

  /// [Polished Blackstone Button](https://minecraft.gamepedia.com/polished_blackstone_button)
  ///
  /// _(minecraft:polished_blackstone_button)_
  static const ItemType polished_blackstone_button =
      ItemType('minecraft:polished_blackstone_button');

  /// [Polished Blackstone Pressure Plate](https://minecraft.gamepedia.com/polished_blackstone_pressure_plate)
  ///
  /// _(minecraft:polished_blackstone_pressure_plate)_
  static const ItemType polished_blackstone_pressure_plate =
      ItemType('minecraft:polished_blackstone_pressure_plate');

  /// [Polished Blackstone Slab](https://minecraft.gamepedia.com/polished_blackstone_slab)
  ///
  /// _(minecraft:polished_blackstone_slab)_
  static const ItemType polished_blackstone_slab =
      ItemType('minecraft:polished_blackstone_slab');

  /// [Polished Blackstone Stairs](https://minecraft.gamepedia.com/polished_blackstone_stairs)
  ///
  /// _(minecraft:polished_blackstone_stairs)_
  static const ItemType polished_blackstone_stairs =
      ItemType('minecraft:polished_blackstone_stairs');

  /// [Polished Blackstone Wall](https://minecraft.gamepedia.com/polished_blackstone_wall)
  ///
  /// _(minecraft:polished_blackstone_wall)_
  static const ItemType polished_blackstone_wall =
      ItemType('minecraft:polished_blackstone_wall');

  /// [Quartz Bricks](https://minecraft.gamepedia.com/quartz_bricks)
  ///
  /// _(minecraft:quartz_bricks)_
  static const ItemType quartz_bricks = ItemType('minecraft:quartz_bricks');

  /// [Respawn Anchor](https://minecraft.gamepedia.com/respawn_anchor)
  ///
  /// _(minecraft:respawn_anchor)_
  static const ItemType respawn_anchor = ItemType('minecraft:respawn_anchor');

  /// [Shroomlight](https://minecraft.gamepedia.com/shroomlight)
  ///
  /// _(minecraft:shroomlight)_
  static const ItemType shroomlight = ItemType('minecraft:shroomlight');

  /// [Soul Campfire](https://minecraft.gamepedia.com/soul_campfire)
  ///
  /// _(minecraft:soul_campfire)_
  static const ItemType soul_campfire = ItemType('minecraft:soul_campfire');

  /// [Soul Lantern](https://minecraft.gamepedia.com/soul_lantern)
  ///
  /// _(minecraft:soul_lantern)_
  static const ItemType soul_lantern = ItemType('minecraft:soul_lantern');

  /// [Soul Soil](https://minecraft.gamepedia.com/soul_soil)
  ///
  /// _(minecraft:soul_soil)_
  static const ItemType soul_soil = ItemType('minecraft:soul_soil');

  /// [Soul Torch](https://minecraft.gamepedia.com/soul_torch)
  ///
  /// _(minecraft:soul_torch)_
  static const ItemType soul_torch = ItemType('minecraft:soul_torch');

  /// [Strider Spawn Egg](https://minecraft.gamepedia.com/strider_spawn_egg)
  ///
  /// _(minecraft:strider_spawn_egg)_
  static const ItemType strider_spawn_egg =
      ItemType('minecraft:strider_spawn_egg');

  /// [Stripped Crimson Hyphae](https://minecraft.gamepedia.com/stripped_crimson_hyphae)
  ///
  /// _(minecraft:stripped_crimson_hyphae)_
  static const ItemType stripped_crimson_hyphae =
      ItemType('minecraft:stripped_crimson_hyphae');

  /// [Stripped Crimson Stem](https://minecraft.gamepedia.com/stripped_crimson_stem)
  ///
  /// _(minecraft:stripped_crimson_stem)_
  static const ItemType stripped_crimson_stem =
      ItemType('minecraft:stripped_crimson_stem');

  /// [Stripped Warped Hyphae](https://minecraft.gamepedia.com/stripped_warped_hyphae)
  ///
  /// _(minecraft:stripped_warped_hyphae)_
  static const ItemType stripped_warped_hyphae =
      ItemType('minecraft:stripped_warped_hyphae');

  /// [Stripped Warped Stem](https://minecraft.gamepedia.com/stripped_warped_stem)
  ///
  /// _(minecraft:stripped_warped_stem)_
  static const ItemType stripped_warped_stem =
      ItemType('minecraft:stripped_warped_stem');

  /// [Target](https://minecraft.gamepedia.com/target)
  ///
  /// _(minecraft:target)_
  static const ItemType target = ItemType('minecraft:target');

  /// [Twisting Vines](https://minecraft.gamepedia.com/twisting_vines)
  ///
  /// _(minecraft:twisting_vines)_
  static const ItemType twisting_vines = ItemType('minecraft:twisting_vines');

  /// [Warped Button](https://minecraft.gamepedia.com/warped_button)
  ///
  /// _(minecraft:warped_button)_
  static const ItemType warped_button = ItemType('minecraft:warped_button');

  /// [Warped Door](https://minecraft.gamepedia.com/warped_door)
  ///
  /// _(minecraft:warped_door)_
  static const ItemType warped_door = ItemType('minecraft:warped_door');

  /// [Warped Fence](https://minecraft.gamepedia.com/warped_fence)
  ///
  /// _(minecraft:warped_fence)_
  static const ItemType warped_fence = ItemType('minecraft:warped_fence');

  /// [Warped Fence Gate](https://minecraft.gamepedia.com/warped_fence_gate)
  ///
  /// _(minecraft:warped_fence_gate)_
  static const ItemType warped_fence_gate =
      ItemType('minecraft:warped_fence_gate');

  /// [Warped Fungus](https://minecraft.gamepedia.com/warped_fungus)
  ///
  /// _(minecraft:warped_fungus)_
  static const ItemType warped_fungus = ItemType('minecraft:warped_fungus');

  /// [Warped Fungus On A Stick](https://minecraft.gamepedia.com/warped_fungus_on_a_stick)
  ///
  /// _(minecraft:warped_fungus_on_a_stick)_
  static const ItemType warped_fungus_on_a_stick =
      ItemType('minecraft:warped_fungus_on_a_stick');

  /// [Warped Hyphae](https://minecraft.gamepedia.com/warped_hyphae)
  ///
  /// _(minecraft:warped_hyphae)_
  static const ItemType warped_hyphae = ItemType('minecraft:warped_hyphae');

  /// [Warped Nylium](https://minecraft.gamepedia.com/warped_nylium)
  ///
  /// _(minecraft:warped_nylium)_
  static const ItemType warped_nylium = ItemType('minecraft:warped_nylium');

  /// [Warped Planks](https://minecraft.gamepedia.com/warped_planks)
  ///
  /// _(minecraft:warped_planks)_
  static const ItemType warped_planks = ItemType('minecraft:warped_planks');

  /// [Warped Pressure Plate](https://minecraft.gamepedia.com/warped_pressure_plate)
  ///
  /// _(minecraft:warped_pressure_plate)_
  static const ItemType warped_pressure_plate =
      ItemType('minecraft:warped_pressure_plate');

  /// [Warped Roots](https://minecraft.gamepedia.com/warped_roots)
  ///
  /// _(minecraft:warped_roots)_
  static const ItemType warped_roots = ItemType('minecraft:warped_roots');

  /// [Warped Sign](https://minecraft.gamepedia.com/warped_sign)
  ///
  /// _(minecraft:warped_sign)_
  static const ItemType warped_sign = ItemType('minecraft:warped_sign');

  /// [Warped Slab](https://minecraft.gamepedia.com/warped_slab)
  ///
  /// _(minecraft:warped_slab)_
  static const ItemType warped_slab = ItemType('minecraft:warped_slab');

  /// [Warped Stairs](https://minecraft.gamepedia.com/warped_stairs)
  ///
  /// _(minecraft:warped_stairs)_
  static const ItemType warped_stairs = ItemType('minecraft:warped_stairs');

  /// [Warped Stem](https://minecraft.gamepedia.com/warped_stem)
  ///
  /// _(minecraft:warped_stem)_
  static const ItemType warped_stem = ItemType('minecraft:warped_stem');

  /// [Warped Trapdoor](https://minecraft.gamepedia.com/warped_trapdoor)
  ///
  /// _(minecraft:warped_trapdoor)_
  static const ItemType warped_trapdoor = ItemType('minecraft:warped_trapdoor');

  /// [Warped Wart Block](https://minecraft.gamepedia.com/warped_wart_block)
  ///
  /// _(minecraft:warped_wart_block)_
  static const ItemType warped_wart_block =
      ItemType('minecraft:warped_wart_block');

  /// [Weeping Vines](https://minecraft.gamepedia.com/weeping_vines)
  ///
  /// _(minecraft:weeping_vines)_
  static const ItemType weeping_vines = ItemType('minecraft:weeping_vines');

  /// [Zoglin Spawn Egg](https://minecraft.gamepedia.com/zoglin_spawn_egg)
  ///
  /// _(minecraft:zoglin_spawn_egg)_
  static const ItemType zoglin_spawn_egg =
      ItemType('minecraft:zoglin_spawn_egg');

  /// [Zombified Piglin Spawn Egg](https://minecraft.gamepedia.com/zombified_piglin_spawn_egg)
  ///
  /// _(minecraft:zombified_piglin_spawn_egg)_
  static const ItemType zombified_piglin_spawn_egg =
      ItemType('minecraft:zombified_piglin_spawn_egg');
}
