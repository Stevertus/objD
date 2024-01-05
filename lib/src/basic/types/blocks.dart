import 'block.dart';

class Blocks {
  // using cog generation tool to fetch blocks
  /*[[[cog
  import cog
  import requests

  version = '1.20/releases/1.20.4'
  snapshot = '1.20/snapshots/23w51b'

  res = requests.get(f'https://raw.githubusercontent.com/PixiGeko/Minecraft-generated-data/master/{snapshot}/custom-generated/registries/block.txt')
  res_release = requests.get(f'https://raw.githubusercontent.com/PixiGeko/Minecraft-generated-data/master/{version}/custom-generated/registries/block.txt')
  release_lines = set(res_release.iter_lines())
  blocks = []
  next_blocks = []
  for l in res.iter_lines():
      full = l.decode('UTF-8')
      id = full.split(':')[1]
      if l in release_lines:
        blocks.append(id)
      else:
        next_blocks.append(id)
      cog.outl(f'/// ![{id}](https://minecraftitemids.com/item/32/{id}.png) \ ')
      cog.outl(f"/// [{' '.join(s.capitalize() for s in id.split('_'))}](https://minecraft.wiki/w/{id}) \ ")
      cog.outl(f'/// _{full}_')
      cog.outl(f"static const Block {id} = Block('{full}');\n")
  ]]]*/
  /// ![acacia_button](https://minecraftitemids.com/item/32/acacia_button.png) \ 
  /// [Acacia Button](https://minecraft.wiki/w/acacia_button) \ 
  /// _minecraft:acacia_button_
  static const Block acacia_button = Block('minecraft:acacia_button');

  /// ![acacia_door](https://minecraftitemids.com/item/32/acacia_door.png) \ 
  /// [Acacia Door](https://minecraft.wiki/w/acacia_door) \ 
  /// _minecraft:acacia_door_
  static const Block acacia_door = Block('minecraft:acacia_door');

  /// ![acacia_fence](https://minecraftitemids.com/item/32/acacia_fence.png) \ 
  /// [Acacia Fence](https://minecraft.wiki/w/acacia_fence) \ 
  /// _minecraft:acacia_fence_
  static const Block acacia_fence = Block('minecraft:acacia_fence');

  /// ![acacia_fence_gate](https://minecraftitemids.com/item/32/acacia_fence_gate.png) \ 
  /// [Acacia Fence Gate](https://minecraft.wiki/w/acacia_fence_gate) \ 
  /// _minecraft:acacia_fence_gate_
  static const Block acacia_fence_gate = Block('minecraft:acacia_fence_gate');

  /// ![acacia_hanging_sign](https://minecraftitemids.com/item/32/acacia_hanging_sign.png) \ 
  /// [Acacia Hanging Sign](https://minecraft.wiki/w/acacia_hanging_sign) \ 
  /// _minecraft:acacia_hanging_sign_
  static const Block acacia_hanging_sign = Block('minecraft:acacia_hanging_sign');

  /// ![acacia_leaves](https://minecraftitemids.com/item/32/acacia_leaves.png) \ 
  /// [Acacia Leaves](https://minecraft.wiki/w/acacia_leaves) \ 
  /// _minecraft:acacia_leaves_
  static const Block acacia_leaves = Block('minecraft:acacia_leaves');

  /// ![acacia_log](https://minecraftitemids.com/item/32/acacia_log.png) \ 
  /// [Acacia Log](https://minecraft.wiki/w/acacia_log) \ 
  /// _minecraft:acacia_log_
  static const Block acacia_log = Block('minecraft:acacia_log');

  /// ![acacia_planks](https://minecraftitemids.com/item/32/acacia_planks.png) \ 
  /// [Acacia Planks](https://minecraft.wiki/w/acacia_planks) \ 
  /// _minecraft:acacia_planks_
  static const Block acacia_planks = Block('minecraft:acacia_planks');

  /// ![acacia_pressure_plate](https://minecraftitemids.com/item/32/acacia_pressure_plate.png) \ 
  /// [Acacia Pressure Plate](https://minecraft.wiki/w/acacia_pressure_plate) \ 
  /// _minecraft:acacia_pressure_plate_
  static const Block acacia_pressure_plate = Block('minecraft:acacia_pressure_plate');

  /// ![acacia_sapling](https://minecraftitemids.com/item/32/acacia_sapling.png) \ 
  /// [Acacia Sapling](https://minecraft.wiki/w/acacia_sapling) \ 
  /// _minecraft:acacia_sapling_
  static const Block acacia_sapling = Block('minecraft:acacia_sapling');

  /// ![acacia_sign](https://minecraftitemids.com/item/32/acacia_sign.png) \ 
  /// [Acacia Sign](https://minecraft.wiki/w/acacia_sign) \ 
  /// _minecraft:acacia_sign_
  static const Block acacia_sign = Block('minecraft:acacia_sign');

  /// ![acacia_slab](https://minecraftitemids.com/item/32/acacia_slab.png) \ 
  /// [Acacia Slab](https://minecraft.wiki/w/acacia_slab) \ 
  /// _minecraft:acacia_slab_
  static const Block acacia_slab = Block('minecraft:acacia_slab');

  /// ![acacia_stairs](https://minecraftitemids.com/item/32/acacia_stairs.png) \ 
  /// [Acacia Stairs](https://minecraft.wiki/w/acacia_stairs) \ 
  /// _minecraft:acacia_stairs_
  static const Block acacia_stairs = Block('minecraft:acacia_stairs');

  /// ![acacia_trapdoor](https://minecraftitemids.com/item/32/acacia_trapdoor.png) \ 
  /// [Acacia Trapdoor](https://minecraft.wiki/w/acacia_trapdoor) \ 
  /// _minecraft:acacia_trapdoor_
  static const Block acacia_trapdoor = Block('minecraft:acacia_trapdoor');

  /// ![acacia_wall_hanging_sign](https://minecraftitemids.com/item/32/acacia_wall_hanging_sign.png) \ 
  /// [Acacia Wall Hanging Sign](https://minecraft.wiki/w/acacia_wall_hanging_sign) \ 
  /// _minecraft:acacia_wall_hanging_sign_
  static const Block acacia_wall_hanging_sign = Block('minecraft:acacia_wall_hanging_sign');

  /// ![acacia_wall_sign](https://minecraftitemids.com/item/32/acacia_wall_sign.png) \ 
  /// [Acacia Wall Sign](https://minecraft.wiki/w/acacia_wall_sign) \ 
  /// _minecraft:acacia_wall_sign_
  static const Block acacia_wall_sign = Block('minecraft:acacia_wall_sign');

  /// ![acacia_wood](https://minecraftitemids.com/item/32/acacia_wood.png) \ 
  /// [Acacia Wood](https://minecraft.wiki/w/acacia_wood) \ 
  /// _minecraft:acacia_wood_
  static const Block acacia_wood = Block('minecraft:acacia_wood');

  /// ![activator_rail](https://minecraftitemids.com/item/32/activator_rail.png) \ 
  /// [Activator Rail](https://minecraft.wiki/w/activator_rail) \ 
  /// _minecraft:activator_rail_
  static const Block activator_rail = Block('minecraft:activator_rail');

  /// ![air](https://minecraftitemids.com/item/32/air.png) \ 
  /// [Air](https://minecraft.wiki/w/air) \ 
  /// _minecraft:air_
  static const Block air = Block('minecraft:air');

  /// ![allium](https://minecraftitemids.com/item/32/allium.png) \ 
  /// [Allium](https://minecraft.wiki/w/allium) \ 
  /// _minecraft:allium_
  static const Block allium = Block('minecraft:allium');

  /// ![amethyst_block](https://minecraftitemids.com/item/32/amethyst_block.png) \ 
  /// [Amethyst Block](https://minecraft.wiki/w/amethyst_block) \ 
  /// _minecraft:amethyst_block_
  static const Block amethyst_block = Block('minecraft:amethyst_block');

  /// ![amethyst_cluster](https://minecraftitemids.com/item/32/amethyst_cluster.png) \ 
  /// [Amethyst Cluster](https://minecraft.wiki/w/amethyst_cluster) \ 
  /// _minecraft:amethyst_cluster_
  static const Block amethyst_cluster = Block('minecraft:amethyst_cluster');

  /// ![ancient_debris](https://minecraftitemids.com/item/32/ancient_debris.png) \ 
  /// [Ancient Debris](https://minecraft.wiki/w/ancient_debris) \ 
  /// _minecraft:ancient_debris_
  static const Block ancient_debris = Block('minecraft:ancient_debris');

  /// ![andesite](https://minecraftitemids.com/item/32/andesite.png) \ 
  /// [Andesite](https://minecraft.wiki/w/andesite) \ 
  /// _minecraft:andesite_
  static const Block andesite = Block('minecraft:andesite');

  /// ![andesite_slab](https://minecraftitemids.com/item/32/andesite_slab.png) \ 
  /// [Andesite Slab](https://minecraft.wiki/w/andesite_slab) \ 
  /// _minecraft:andesite_slab_
  static const Block andesite_slab = Block('minecraft:andesite_slab');

  /// ![andesite_stairs](https://minecraftitemids.com/item/32/andesite_stairs.png) \ 
  /// [Andesite Stairs](https://minecraft.wiki/w/andesite_stairs) \ 
  /// _minecraft:andesite_stairs_
  static const Block andesite_stairs = Block('minecraft:andesite_stairs');

  /// ![andesite_wall](https://minecraftitemids.com/item/32/andesite_wall.png) \ 
  /// [Andesite Wall](https://minecraft.wiki/w/andesite_wall) \ 
  /// _minecraft:andesite_wall_
  static const Block andesite_wall = Block('minecraft:andesite_wall');

  /// ![anvil](https://minecraftitemids.com/item/32/anvil.png) \ 
  /// [Anvil](https://minecraft.wiki/w/anvil) \ 
  /// _minecraft:anvil_
  static const Block anvil = Block('minecraft:anvil');

  /// ![attached_melon_stem](https://minecraftitemids.com/item/32/attached_melon_stem.png) \ 
  /// [Attached Melon Stem](https://minecraft.wiki/w/attached_melon_stem) \ 
  /// _minecraft:attached_melon_stem_
  static const Block attached_melon_stem = Block('minecraft:attached_melon_stem');

  /// ![attached_pumpkin_stem](https://minecraftitemids.com/item/32/attached_pumpkin_stem.png) \ 
  /// [Attached Pumpkin Stem](https://minecraft.wiki/w/attached_pumpkin_stem) \ 
  /// _minecraft:attached_pumpkin_stem_
  static const Block attached_pumpkin_stem = Block('minecraft:attached_pumpkin_stem');

  /// ![azalea](https://minecraftitemids.com/item/32/azalea.png) \ 
  /// [Azalea](https://minecraft.wiki/w/azalea) \ 
  /// _minecraft:azalea_
  static const Block azalea = Block('minecraft:azalea');

  /// ![azalea_leaves](https://minecraftitemids.com/item/32/azalea_leaves.png) \ 
  /// [Azalea Leaves](https://minecraft.wiki/w/azalea_leaves) \ 
  /// _minecraft:azalea_leaves_
  static const Block azalea_leaves = Block('minecraft:azalea_leaves');

  /// ![azure_bluet](https://minecraftitemids.com/item/32/azure_bluet.png) \ 
  /// [Azure Bluet](https://minecraft.wiki/w/azure_bluet) \ 
  /// _minecraft:azure_bluet_
  static const Block azure_bluet = Block('minecraft:azure_bluet');

  /// ![bamboo](https://minecraftitemids.com/item/32/bamboo.png) \ 
  /// [Bamboo](https://minecraft.wiki/w/bamboo) \ 
  /// _minecraft:bamboo_
  static const Block bamboo = Block('minecraft:bamboo');

  /// ![bamboo_block](https://minecraftitemids.com/item/32/bamboo_block.png) \ 
  /// [Bamboo Block](https://minecraft.wiki/w/bamboo_block) \ 
  /// _minecraft:bamboo_block_
  static const Block bamboo_block = Block('minecraft:bamboo_block');

  /// ![bamboo_button](https://minecraftitemids.com/item/32/bamboo_button.png) \ 
  /// [Bamboo Button](https://minecraft.wiki/w/bamboo_button) \ 
  /// _minecraft:bamboo_button_
  static const Block bamboo_button = Block('minecraft:bamboo_button');

  /// ![bamboo_door](https://minecraftitemids.com/item/32/bamboo_door.png) \ 
  /// [Bamboo Door](https://minecraft.wiki/w/bamboo_door) \ 
  /// _minecraft:bamboo_door_
  static const Block bamboo_door = Block('minecraft:bamboo_door');

  /// ![bamboo_fence](https://minecraftitemids.com/item/32/bamboo_fence.png) \ 
  /// [Bamboo Fence](https://minecraft.wiki/w/bamboo_fence) \ 
  /// _minecraft:bamboo_fence_
  static const Block bamboo_fence = Block('minecraft:bamboo_fence');

  /// ![bamboo_fence_gate](https://minecraftitemids.com/item/32/bamboo_fence_gate.png) \ 
  /// [Bamboo Fence Gate](https://minecraft.wiki/w/bamboo_fence_gate) \ 
  /// _minecraft:bamboo_fence_gate_
  static const Block bamboo_fence_gate = Block('minecraft:bamboo_fence_gate');

  /// ![bamboo_hanging_sign](https://minecraftitemids.com/item/32/bamboo_hanging_sign.png) \ 
  /// [Bamboo Hanging Sign](https://minecraft.wiki/w/bamboo_hanging_sign) \ 
  /// _minecraft:bamboo_hanging_sign_
  static const Block bamboo_hanging_sign = Block('minecraft:bamboo_hanging_sign');

  /// ![bamboo_mosaic](https://minecraftitemids.com/item/32/bamboo_mosaic.png) \ 
  /// [Bamboo Mosaic](https://minecraft.wiki/w/bamboo_mosaic) \ 
  /// _minecraft:bamboo_mosaic_
  static const Block bamboo_mosaic = Block('minecraft:bamboo_mosaic');

  /// ![bamboo_mosaic_slab](https://minecraftitemids.com/item/32/bamboo_mosaic_slab.png) \ 
  /// [Bamboo Mosaic Slab](https://minecraft.wiki/w/bamboo_mosaic_slab) \ 
  /// _minecraft:bamboo_mosaic_slab_
  static const Block bamboo_mosaic_slab = Block('minecraft:bamboo_mosaic_slab');

  /// ![bamboo_mosaic_stairs](https://minecraftitemids.com/item/32/bamboo_mosaic_stairs.png) \ 
  /// [Bamboo Mosaic Stairs](https://minecraft.wiki/w/bamboo_mosaic_stairs) \ 
  /// _minecraft:bamboo_mosaic_stairs_
  static const Block bamboo_mosaic_stairs = Block('minecraft:bamboo_mosaic_stairs');

  /// ![bamboo_planks](https://minecraftitemids.com/item/32/bamboo_planks.png) \ 
  /// [Bamboo Planks](https://minecraft.wiki/w/bamboo_planks) \ 
  /// _minecraft:bamboo_planks_
  static const Block bamboo_planks = Block('minecraft:bamboo_planks');

  /// ![bamboo_pressure_plate](https://minecraftitemids.com/item/32/bamboo_pressure_plate.png) \ 
  /// [Bamboo Pressure Plate](https://minecraft.wiki/w/bamboo_pressure_plate) \ 
  /// _minecraft:bamboo_pressure_plate_
  static const Block bamboo_pressure_plate = Block('minecraft:bamboo_pressure_plate');

  /// ![bamboo_sapling](https://minecraftitemids.com/item/32/bamboo_sapling.png) \ 
  /// [Bamboo Sapling](https://minecraft.wiki/w/bamboo_sapling) \ 
  /// _minecraft:bamboo_sapling_
  static const Block bamboo_sapling = Block('minecraft:bamboo_sapling');

  /// ![bamboo_sign](https://minecraftitemids.com/item/32/bamboo_sign.png) \ 
  /// [Bamboo Sign](https://minecraft.wiki/w/bamboo_sign) \ 
  /// _minecraft:bamboo_sign_
  static const Block bamboo_sign = Block('minecraft:bamboo_sign');

  /// ![bamboo_slab](https://minecraftitemids.com/item/32/bamboo_slab.png) \ 
  /// [Bamboo Slab](https://minecraft.wiki/w/bamboo_slab) \ 
  /// _minecraft:bamboo_slab_
  static const Block bamboo_slab = Block('minecraft:bamboo_slab');

  /// ![bamboo_stairs](https://minecraftitemids.com/item/32/bamboo_stairs.png) \ 
  /// [Bamboo Stairs](https://minecraft.wiki/w/bamboo_stairs) \ 
  /// _minecraft:bamboo_stairs_
  static const Block bamboo_stairs = Block('minecraft:bamboo_stairs');

  /// ![bamboo_trapdoor](https://minecraftitemids.com/item/32/bamboo_trapdoor.png) \ 
  /// [Bamboo Trapdoor](https://minecraft.wiki/w/bamboo_trapdoor) \ 
  /// _minecraft:bamboo_trapdoor_
  static const Block bamboo_trapdoor = Block('minecraft:bamboo_trapdoor');

  /// ![bamboo_wall_hanging_sign](https://minecraftitemids.com/item/32/bamboo_wall_hanging_sign.png) \ 
  /// [Bamboo Wall Hanging Sign](https://minecraft.wiki/w/bamboo_wall_hanging_sign) \ 
  /// _minecraft:bamboo_wall_hanging_sign_
  static const Block bamboo_wall_hanging_sign = Block('minecraft:bamboo_wall_hanging_sign');

  /// ![bamboo_wall_sign](https://minecraftitemids.com/item/32/bamboo_wall_sign.png) \ 
  /// [Bamboo Wall Sign](https://minecraft.wiki/w/bamboo_wall_sign) \ 
  /// _minecraft:bamboo_wall_sign_
  static const Block bamboo_wall_sign = Block('minecraft:bamboo_wall_sign');

  /// ![barrel](https://minecraftitemids.com/item/32/barrel.png) \ 
  /// [Barrel](https://minecraft.wiki/w/barrel) \ 
  /// _minecraft:barrel_
  static const Block barrel = Block('minecraft:barrel');

  /// ![barrier](https://minecraftitemids.com/item/32/barrier.png) \ 
  /// [Barrier](https://minecraft.wiki/w/barrier) \ 
  /// _minecraft:barrier_
  static const Block barrier = Block('minecraft:barrier');

  /// ![basalt](https://minecraftitemids.com/item/32/basalt.png) \ 
  /// [Basalt](https://minecraft.wiki/w/basalt) \ 
  /// _minecraft:basalt_
  static const Block basalt = Block('minecraft:basalt');

  /// ![beacon](https://minecraftitemids.com/item/32/beacon.png) \ 
  /// [Beacon](https://minecraft.wiki/w/beacon) \ 
  /// _minecraft:beacon_
  static const Block beacon = Block('minecraft:beacon');

  /// ![bedrock](https://minecraftitemids.com/item/32/bedrock.png) \ 
  /// [Bedrock](https://minecraft.wiki/w/bedrock) \ 
  /// _minecraft:bedrock_
  static const Block bedrock = Block('minecraft:bedrock');

  /// ![bee_nest](https://minecraftitemids.com/item/32/bee_nest.png) \ 
  /// [Bee Nest](https://minecraft.wiki/w/bee_nest) \ 
  /// _minecraft:bee_nest_
  static const Block bee_nest = Block('minecraft:bee_nest');

  /// ![beehive](https://minecraftitemids.com/item/32/beehive.png) \ 
  /// [Beehive](https://minecraft.wiki/w/beehive) \ 
  /// _minecraft:beehive_
  static const Block beehive = Block('minecraft:beehive');

  /// ![beetroots](https://minecraftitemids.com/item/32/beetroots.png) \ 
  /// [Beetroots](https://minecraft.wiki/w/beetroots) \ 
  /// _minecraft:beetroots_
  static const Block beetroots = Block('minecraft:beetroots');

  /// ![bell](https://minecraftitemids.com/item/32/bell.png) \ 
  /// [Bell](https://minecraft.wiki/w/bell) \ 
  /// _minecraft:bell_
  static const Block bell = Block('minecraft:bell');

  /// ![big_dripleaf](https://minecraftitemids.com/item/32/big_dripleaf.png) \ 
  /// [Big Dripleaf](https://minecraft.wiki/w/big_dripleaf) \ 
  /// _minecraft:big_dripleaf_
  static const Block big_dripleaf = Block('minecraft:big_dripleaf');

  /// ![big_dripleaf_stem](https://minecraftitemids.com/item/32/big_dripleaf_stem.png) \ 
  /// [Big Dripleaf Stem](https://minecraft.wiki/w/big_dripleaf_stem) \ 
  /// _minecraft:big_dripleaf_stem_
  static const Block big_dripleaf_stem = Block('minecraft:big_dripleaf_stem');

  /// ![birch_button](https://minecraftitemids.com/item/32/birch_button.png) \ 
  /// [Birch Button](https://minecraft.wiki/w/birch_button) \ 
  /// _minecraft:birch_button_
  static const Block birch_button = Block('minecraft:birch_button');

  /// ![birch_door](https://minecraftitemids.com/item/32/birch_door.png) \ 
  /// [Birch Door](https://minecraft.wiki/w/birch_door) \ 
  /// _minecraft:birch_door_
  static const Block birch_door = Block('minecraft:birch_door');

  /// ![birch_fence](https://minecraftitemids.com/item/32/birch_fence.png) \ 
  /// [Birch Fence](https://minecraft.wiki/w/birch_fence) \ 
  /// _minecraft:birch_fence_
  static const Block birch_fence = Block('minecraft:birch_fence');

  /// ![birch_fence_gate](https://minecraftitemids.com/item/32/birch_fence_gate.png) \ 
  /// [Birch Fence Gate](https://minecraft.wiki/w/birch_fence_gate) \ 
  /// _minecraft:birch_fence_gate_
  static const Block birch_fence_gate = Block('minecraft:birch_fence_gate');

  /// ![birch_hanging_sign](https://minecraftitemids.com/item/32/birch_hanging_sign.png) \ 
  /// [Birch Hanging Sign](https://minecraft.wiki/w/birch_hanging_sign) \ 
  /// _minecraft:birch_hanging_sign_
  static const Block birch_hanging_sign = Block('minecraft:birch_hanging_sign');

  /// ![birch_leaves](https://minecraftitemids.com/item/32/birch_leaves.png) \ 
  /// [Birch Leaves](https://minecraft.wiki/w/birch_leaves) \ 
  /// _minecraft:birch_leaves_
  static const Block birch_leaves = Block('minecraft:birch_leaves');

  /// ![birch_log](https://minecraftitemids.com/item/32/birch_log.png) \ 
  /// [Birch Log](https://minecraft.wiki/w/birch_log) \ 
  /// _minecraft:birch_log_
  static const Block birch_log = Block('minecraft:birch_log');

  /// ![birch_planks](https://minecraftitemids.com/item/32/birch_planks.png) \ 
  /// [Birch Planks](https://minecraft.wiki/w/birch_planks) \ 
  /// _minecraft:birch_planks_
  static const Block birch_planks = Block('minecraft:birch_planks');

  /// ![birch_pressure_plate](https://minecraftitemids.com/item/32/birch_pressure_plate.png) \ 
  /// [Birch Pressure Plate](https://minecraft.wiki/w/birch_pressure_plate) \ 
  /// _minecraft:birch_pressure_plate_
  static const Block birch_pressure_plate = Block('minecraft:birch_pressure_plate');

  /// ![birch_sapling](https://minecraftitemids.com/item/32/birch_sapling.png) \ 
  /// [Birch Sapling](https://minecraft.wiki/w/birch_sapling) \ 
  /// _minecraft:birch_sapling_
  static const Block birch_sapling = Block('minecraft:birch_sapling');

  /// ![birch_sign](https://minecraftitemids.com/item/32/birch_sign.png) \ 
  /// [Birch Sign](https://minecraft.wiki/w/birch_sign) \ 
  /// _minecraft:birch_sign_
  static const Block birch_sign = Block('minecraft:birch_sign');

  /// ![birch_slab](https://minecraftitemids.com/item/32/birch_slab.png) \ 
  /// [Birch Slab](https://minecraft.wiki/w/birch_slab) \ 
  /// _minecraft:birch_slab_
  static const Block birch_slab = Block('minecraft:birch_slab');

  /// ![birch_stairs](https://minecraftitemids.com/item/32/birch_stairs.png) \ 
  /// [Birch Stairs](https://minecraft.wiki/w/birch_stairs) \ 
  /// _minecraft:birch_stairs_
  static const Block birch_stairs = Block('minecraft:birch_stairs');

  /// ![birch_trapdoor](https://minecraftitemids.com/item/32/birch_trapdoor.png) \ 
  /// [Birch Trapdoor](https://minecraft.wiki/w/birch_trapdoor) \ 
  /// _minecraft:birch_trapdoor_
  static const Block birch_trapdoor = Block('minecraft:birch_trapdoor');

  /// ![birch_wall_hanging_sign](https://minecraftitemids.com/item/32/birch_wall_hanging_sign.png) \ 
  /// [Birch Wall Hanging Sign](https://minecraft.wiki/w/birch_wall_hanging_sign) \ 
  /// _minecraft:birch_wall_hanging_sign_
  static const Block birch_wall_hanging_sign = Block('minecraft:birch_wall_hanging_sign');

  /// ![birch_wall_sign](https://minecraftitemids.com/item/32/birch_wall_sign.png) \ 
  /// [Birch Wall Sign](https://minecraft.wiki/w/birch_wall_sign) \ 
  /// _minecraft:birch_wall_sign_
  static const Block birch_wall_sign = Block('minecraft:birch_wall_sign');

  /// ![birch_wood](https://minecraftitemids.com/item/32/birch_wood.png) \ 
  /// [Birch Wood](https://minecraft.wiki/w/birch_wood) \ 
  /// _minecraft:birch_wood_
  static const Block birch_wood = Block('minecraft:birch_wood');

  /// ![black_banner](https://minecraftitemids.com/item/32/black_banner.png) \ 
  /// [Black Banner](https://minecraft.wiki/w/black_banner) \ 
  /// _minecraft:black_banner_
  static const Block black_banner = Block('minecraft:black_banner');

  /// ![black_bed](https://minecraftitemids.com/item/32/black_bed.png) \ 
  /// [Black Bed](https://minecraft.wiki/w/black_bed) \ 
  /// _minecraft:black_bed_
  static const Block black_bed = Block('minecraft:black_bed');

  /// ![black_candle](https://minecraftitemids.com/item/32/black_candle.png) \ 
  /// [Black Candle](https://minecraft.wiki/w/black_candle) \ 
  /// _minecraft:black_candle_
  static const Block black_candle = Block('minecraft:black_candle');

  /// ![black_candle_cake](https://minecraftitemids.com/item/32/black_candle_cake.png) \ 
  /// [Black Candle Cake](https://minecraft.wiki/w/black_candle_cake) \ 
  /// _minecraft:black_candle_cake_
  static const Block black_candle_cake = Block('minecraft:black_candle_cake');

  /// ![black_carpet](https://minecraftitemids.com/item/32/black_carpet.png) \ 
  /// [Black Carpet](https://minecraft.wiki/w/black_carpet) \ 
  /// _minecraft:black_carpet_
  static const Block black_carpet = Block('minecraft:black_carpet');

  /// ![black_concrete](https://minecraftitemids.com/item/32/black_concrete.png) \ 
  /// [Black Concrete](https://minecraft.wiki/w/black_concrete) \ 
  /// _minecraft:black_concrete_
  static const Block black_concrete = Block('minecraft:black_concrete');

  /// ![black_concrete_powder](https://minecraftitemids.com/item/32/black_concrete_powder.png) \ 
  /// [Black Concrete Powder](https://minecraft.wiki/w/black_concrete_powder) \ 
  /// _minecraft:black_concrete_powder_
  static const Block black_concrete_powder = Block('minecraft:black_concrete_powder');

  /// ![black_glazed_terracotta](https://minecraftitemids.com/item/32/black_glazed_terracotta.png) \ 
  /// [Black Glazed Terracotta](https://minecraft.wiki/w/black_glazed_terracotta) \ 
  /// _minecraft:black_glazed_terracotta_
  static const Block black_glazed_terracotta = Block('minecraft:black_glazed_terracotta');

  /// ![black_shulker_box](https://minecraftitemids.com/item/32/black_shulker_box.png) \ 
  /// [Black Shulker Box](https://minecraft.wiki/w/black_shulker_box) \ 
  /// _minecraft:black_shulker_box_
  static const Block black_shulker_box = Block('minecraft:black_shulker_box');

  /// ![black_stained_glass](https://minecraftitemids.com/item/32/black_stained_glass.png) \ 
  /// [Black Stained Glass](https://minecraft.wiki/w/black_stained_glass) \ 
  /// _minecraft:black_stained_glass_
  static const Block black_stained_glass = Block('minecraft:black_stained_glass');

  /// ![black_stained_glass_pane](https://minecraftitemids.com/item/32/black_stained_glass_pane.png) \ 
  /// [Black Stained Glass Pane](https://minecraft.wiki/w/black_stained_glass_pane) \ 
  /// _minecraft:black_stained_glass_pane_
  static const Block black_stained_glass_pane = Block('minecraft:black_stained_glass_pane');

  /// ![black_terracotta](https://minecraftitemids.com/item/32/black_terracotta.png) \ 
  /// [Black Terracotta](https://minecraft.wiki/w/black_terracotta) \ 
  /// _minecraft:black_terracotta_
  static const Block black_terracotta = Block('minecraft:black_terracotta');

  /// ![black_wall_banner](https://minecraftitemids.com/item/32/black_wall_banner.png) \ 
  /// [Black Wall Banner](https://minecraft.wiki/w/black_wall_banner) \ 
  /// _minecraft:black_wall_banner_
  static const Block black_wall_banner = Block('minecraft:black_wall_banner');

  /// ![black_wool](https://minecraftitemids.com/item/32/black_wool.png) \ 
  /// [Black Wool](https://minecraft.wiki/w/black_wool) \ 
  /// _minecraft:black_wool_
  static const Block black_wool = Block('minecraft:black_wool');

  /// ![blackstone](https://minecraftitemids.com/item/32/blackstone.png) \ 
  /// [Blackstone](https://minecraft.wiki/w/blackstone) \ 
  /// _minecraft:blackstone_
  static const Block blackstone = Block('minecraft:blackstone');

  /// ![blackstone_slab](https://minecraftitemids.com/item/32/blackstone_slab.png) \ 
  /// [Blackstone Slab](https://minecraft.wiki/w/blackstone_slab) \ 
  /// _minecraft:blackstone_slab_
  static const Block blackstone_slab = Block('minecraft:blackstone_slab');

  /// ![blackstone_stairs](https://minecraftitemids.com/item/32/blackstone_stairs.png) \ 
  /// [Blackstone Stairs](https://minecraft.wiki/w/blackstone_stairs) \ 
  /// _minecraft:blackstone_stairs_
  static const Block blackstone_stairs = Block('minecraft:blackstone_stairs');

  /// ![blackstone_wall](https://minecraftitemids.com/item/32/blackstone_wall.png) \ 
  /// [Blackstone Wall](https://minecraft.wiki/w/blackstone_wall) \ 
  /// _minecraft:blackstone_wall_
  static const Block blackstone_wall = Block('minecraft:blackstone_wall');

  /// ![blast_furnace](https://minecraftitemids.com/item/32/blast_furnace.png) \ 
  /// [Blast Furnace](https://minecraft.wiki/w/blast_furnace) \ 
  /// _minecraft:blast_furnace_
  static const Block blast_furnace = Block('minecraft:blast_furnace');

  /// ![blue_banner](https://minecraftitemids.com/item/32/blue_banner.png) \ 
  /// [Blue Banner](https://minecraft.wiki/w/blue_banner) \ 
  /// _minecraft:blue_banner_
  static const Block blue_banner = Block('minecraft:blue_banner');

  /// ![blue_bed](https://minecraftitemids.com/item/32/blue_bed.png) \ 
  /// [Blue Bed](https://minecraft.wiki/w/blue_bed) \ 
  /// _minecraft:blue_bed_
  static const Block blue_bed = Block('minecraft:blue_bed');

  /// ![blue_candle](https://minecraftitemids.com/item/32/blue_candle.png) \ 
  /// [Blue Candle](https://minecraft.wiki/w/blue_candle) \ 
  /// _minecraft:blue_candle_
  static const Block blue_candle = Block('minecraft:blue_candle');

  /// ![blue_candle_cake](https://minecraftitemids.com/item/32/blue_candle_cake.png) \ 
  /// [Blue Candle Cake](https://minecraft.wiki/w/blue_candle_cake) \ 
  /// _minecraft:blue_candle_cake_
  static const Block blue_candle_cake = Block('minecraft:blue_candle_cake');

  /// ![blue_carpet](https://minecraftitemids.com/item/32/blue_carpet.png) \ 
  /// [Blue Carpet](https://minecraft.wiki/w/blue_carpet) \ 
  /// _minecraft:blue_carpet_
  static const Block blue_carpet = Block('minecraft:blue_carpet');

  /// ![blue_concrete](https://minecraftitemids.com/item/32/blue_concrete.png) \ 
  /// [Blue Concrete](https://minecraft.wiki/w/blue_concrete) \ 
  /// _minecraft:blue_concrete_
  static const Block blue_concrete = Block('minecraft:blue_concrete');

  /// ![blue_concrete_powder](https://minecraftitemids.com/item/32/blue_concrete_powder.png) \ 
  /// [Blue Concrete Powder](https://minecraft.wiki/w/blue_concrete_powder) \ 
  /// _minecraft:blue_concrete_powder_
  static const Block blue_concrete_powder = Block('minecraft:blue_concrete_powder');

  /// ![blue_glazed_terracotta](https://minecraftitemids.com/item/32/blue_glazed_terracotta.png) \ 
  /// [Blue Glazed Terracotta](https://minecraft.wiki/w/blue_glazed_terracotta) \ 
  /// _minecraft:blue_glazed_terracotta_
  static const Block blue_glazed_terracotta = Block('minecraft:blue_glazed_terracotta');

  /// ![blue_ice](https://minecraftitemids.com/item/32/blue_ice.png) \ 
  /// [Blue Ice](https://minecraft.wiki/w/blue_ice) \ 
  /// _minecraft:blue_ice_
  static const Block blue_ice = Block('minecraft:blue_ice');

  /// ![blue_orchid](https://minecraftitemids.com/item/32/blue_orchid.png) \ 
  /// [Blue Orchid](https://minecraft.wiki/w/blue_orchid) \ 
  /// _minecraft:blue_orchid_
  static const Block blue_orchid = Block('minecraft:blue_orchid');

  /// ![blue_shulker_box](https://minecraftitemids.com/item/32/blue_shulker_box.png) \ 
  /// [Blue Shulker Box](https://minecraft.wiki/w/blue_shulker_box) \ 
  /// _minecraft:blue_shulker_box_
  static const Block blue_shulker_box = Block('minecraft:blue_shulker_box');

  /// ![blue_stained_glass](https://minecraftitemids.com/item/32/blue_stained_glass.png) \ 
  /// [Blue Stained Glass](https://minecraft.wiki/w/blue_stained_glass) \ 
  /// _minecraft:blue_stained_glass_
  static const Block blue_stained_glass = Block('minecraft:blue_stained_glass');

  /// ![blue_stained_glass_pane](https://minecraftitemids.com/item/32/blue_stained_glass_pane.png) \ 
  /// [Blue Stained Glass Pane](https://minecraft.wiki/w/blue_stained_glass_pane) \ 
  /// _minecraft:blue_stained_glass_pane_
  static const Block blue_stained_glass_pane = Block('minecraft:blue_stained_glass_pane');

  /// ![blue_terracotta](https://minecraftitemids.com/item/32/blue_terracotta.png) \ 
  /// [Blue Terracotta](https://minecraft.wiki/w/blue_terracotta) \ 
  /// _minecraft:blue_terracotta_
  static const Block blue_terracotta = Block('minecraft:blue_terracotta');

  /// ![blue_wall_banner](https://minecraftitemids.com/item/32/blue_wall_banner.png) \ 
  /// [Blue Wall Banner](https://minecraft.wiki/w/blue_wall_banner) \ 
  /// _minecraft:blue_wall_banner_
  static const Block blue_wall_banner = Block('minecraft:blue_wall_banner');

  /// ![blue_wool](https://minecraftitemids.com/item/32/blue_wool.png) \ 
  /// [Blue Wool](https://minecraft.wiki/w/blue_wool) \ 
  /// _minecraft:blue_wool_
  static const Block blue_wool = Block('minecraft:blue_wool');

  /// ![bone_block](https://minecraftitemids.com/item/32/bone_block.png) \ 
  /// [Bone Block](https://minecraft.wiki/w/bone_block) \ 
  /// _minecraft:bone_block_
  static const Block bone_block = Block('minecraft:bone_block');

  /// ![bookshelf](https://minecraftitemids.com/item/32/bookshelf.png) \ 
  /// [Bookshelf](https://minecraft.wiki/w/bookshelf) \ 
  /// _minecraft:bookshelf_
  static const Block bookshelf = Block('minecraft:bookshelf');

  /// ![brain_coral](https://minecraftitemids.com/item/32/brain_coral.png) \ 
  /// [Brain Coral](https://minecraft.wiki/w/brain_coral) \ 
  /// _minecraft:brain_coral_
  static const Block brain_coral = Block('minecraft:brain_coral');

  /// ![brain_coral_block](https://minecraftitemids.com/item/32/brain_coral_block.png) \ 
  /// [Brain Coral Block](https://minecraft.wiki/w/brain_coral_block) \ 
  /// _minecraft:brain_coral_block_
  static const Block brain_coral_block = Block('minecraft:brain_coral_block');

  /// ![brain_coral_fan](https://minecraftitemids.com/item/32/brain_coral_fan.png) \ 
  /// [Brain Coral Fan](https://minecraft.wiki/w/brain_coral_fan) \ 
  /// _minecraft:brain_coral_fan_
  static const Block brain_coral_fan = Block('minecraft:brain_coral_fan');

  /// ![brain_coral_wall_fan](https://minecraftitemids.com/item/32/brain_coral_wall_fan.png) \ 
  /// [Brain Coral Wall Fan](https://minecraft.wiki/w/brain_coral_wall_fan) \ 
  /// _minecraft:brain_coral_wall_fan_
  static const Block brain_coral_wall_fan = Block('minecraft:brain_coral_wall_fan');

  /// ![brewing_stand](https://minecraftitemids.com/item/32/brewing_stand.png) \ 
  /// [Brewing Stand](https://minecraft.wiki/w/brewing_stand) \ 
  /// _minecraft:brewing_stand_
  static const Block brewing_stand = Block('minecraft:brewing_stand');

  /// ![brick_slab](https://minecraftitemids.com/item/32/brick_slab.png) \ 
  /// [Brick Slab](https://minecraft.wiki/w/brick_slab) \ 
  /// _minecraft:brick_slab_
  static const Block brick_slab = Block('minecraft:brick_slab');

  /// ![brick_stairs](https://minecraftitemids.com/item/32/brick_stairs.png) \ 
  /// [Brick Stairs](https://minecraft.wiki/w/brick_stairs) \ 
  /// _minecraft:brick_stairs_
  static const Block brick_stairs = Block('minecraft:brick_stairs');

  /// ![brick_wall](https://minecraftitemids.com/item/32/brick_wall.png) \ 
  /// [Brick Wall](https://minecraft.wiki/w/brick_wall) \ 
  /// _minecraft:brick_wall_
  static const Block brick_wall = Block('minecraft:brick_wall');

  /// ![bricks](https://minecraftitemids.com/item/32/bricks.png) \ 
  /// [Bricks](https://minecraft.wiki/w/bricks) \ 
  /// _minecraft:bricks_
  static const Block bricks = Block('minecraft:bricks');

  /// ![brown_banner](https://minecraftitemids.com/item/32/brown_banner.png) \ 
  /// [Brown Banner](https://minecraft.wiki/w/brown_banner) \ 
  /// _minecraft:brown_banner_
  static const Block brown_banner = Block('minecraft:brown_banner');

  /// ![brown_bed](https://minecraftitemids.com/item/32/brown_bed.png) \ 
  /// [Brown Bed](https://minecraft.wiki/w/brown_bed) \ 
  /// _minecraft:brown_bed_
  static const Block brown_bed = Block('minecraft:brown_bed');

  /// ![brown_candle](https://minecraftitemids.com/item/32/brown_candle.png) \ 
  /// [Brown Candle](https://minecraft.wiki/w/brown_candle) \ 
  /// _minecraft:brown_candle_
  static const Block brown_candle = Block('minecraft:brown_candle');

  /// ![brown_candle_cake](https://minecraftitemids.com/item/32/brown_candle_cake.png) \ 
  /// [Brown Candle Cake](https://minecraft.wiki/w/brown_candle_cake) \ 
  /// _minecraft:brown_candle_cake_
  static const Block brown_candle_cake = Block('minecraft:brown_candle_cake');

  /// ![brown_carpet](https://minecraftitemids.com/item/32/brown_carpet.png) \ 
  /// [Brown Carpet](https://minecraft.wiki/w/brown_carpet) \ 
  /// _minecraft:brown_carpet_
  static const Block brown_carpet = Block('minecraft:brown_carpet');

  /// ![brown_concrete](https://minecraftitemids.com/item/32/brown_concrete.png) \ 
  /// [Brown Concrete](https://minecraft.wiki/w/brown_concrete) \ 
  /// _minecraft:brown_concrete_
  static const Block brown_concrete = Block('minecraft:brown_concrete');

  /// ![brown_concrete_powder](https://minecraftitemids.com/item/32/brown_concrete_powder.png) \ 
  /// [Brown Concrete Powder](https://minecraft.wiki/w/brown_concrete_powder) \ 
  /// _minecraft:brown_concrete_powder_
  static const Block brown_concrete_powder = Block('minecraft:brown_concrete_powder');

  /// ![brown_glazed_terracotta](https://minecraftitemids.com/item/32/brown_glazed_terracotta.png) \ 
  /// [Brown Glazed Terracotta](https://minecraft.wiki/w/brown_glazed_terracotta) \ 
  /// _minecraft:brown_glazed_terracotta_
  static const Block brown_glazed_terracotta = Block('minecraft:brown_glazed_terracotta');

  /// ![brown_mushroom](https://minecraftitemids.com/item/32/brown_mushroom.png) \ 
  /// [Brown Mushroom](https://minecraft.wiki/w/brown_mushroom) \ 
  /// _minecraft:brown_mushroom_
  static const Block brown_mushroom = Block('minecraft:brown_mushroom');

  /// ![brown_mushroom_block](https://minecraftitemids.com/item/32/brown_mushroom_block.png) \ 
  /// [Brown Mushroom Block](https://minecraft.wiki/w/brown_mushroom_block) \ 
  /// _minecraft:brown_mushroom_block_
  static const Block brown_mushroom_block = Block('minecraft:brown_mushroom_block');

  /// ![brown_shulker_box](https://minecraftitemids.com/item/32/brown_shulker_box.png) \ 
  /// [Brown Shulker Box](https://minecraft.wiki/w/brown_shulker_box) \ 
  /// _minecraft:brown_shulker_box_
  static const Block brown_shulker_box = Block('minecraft:brown_shulker_box');

  /// ![brown_stained_glass](https://minecraftitemids.com/item/32/brown_stained_glass.png) \ 
  /// [Brown Stained Glass](https://minecraft.wiki/w/brown_stained_glass) \ 
  /// _minecraft:brown_stained_glass_
  static const Block brown_stained_glass = Block('minecraft:brown_stained_glass');

  /// ![brown_stained_glass_pane](https://minecraftitemids.com/item/32/brown_stained_glass_pane.png) \ 
  /// [Brown Stained Glass Pane](https://minecraft.wiki/w/brown_stained_glass_pane) \ 
  /// _minecraft:brown_stained_glass_pane_
  static const Block brown_stained_glass_pane = Block('minecraft:brown_stained_glass_pane');

  /// ![brown_terracotta](https://minecraftitemids.com/item/32/brown_terracotta.png) \ 
  /// [Brown Terracotta](https://minecraft.wiki/w/brown_terracotta) \ 
  /// _minecraft:brown_terracotta_
  static const Block brown_terracotta = Block('minecraft:brown_terracotta');

  /// ![brown_wall_banner](https://minecraftitemids.com/item/32/brown_wall_banner.png) \ 
  /// [Brown Wall Banner](https://minecraft.wiki/w/brown_wall_banner) \ 
  /// _minecraft:brown_wall_banner_
  static const Block brown_wall_banner = Block('minecraft:brown_wall_banner');

  /// ![brown_wool](https://minecraftitemids.com/item/32/brown_wool.png) \ 
  /// [Brown Wool](https://minecraft.wiki/w/brown_wool) \ 
  /// _minecraft:brown_wool_
  static const Block brown_wool = Block('minecraft:brown_wool');

  /// ![bubble_column](https://minecraftitemids.com/item/32/bubble_column.png) \ 
  /// [Bubble Column](https://minecraft.wiki/w/bubble_column) \ 
  /// _minecraft:bubble_column_
  static const Block bubble_column = Block('minecraft:bubble_column');

  /// ![bubble_coral](https://minecraftitemids.com/item/32/bubble_coral.png) \ 
  /// [Bubble Coral](https://minecraft.wiki/w/bubble_coral) \ 
  /// _minecraft:bubble_coral_
  static const Block bubble_coral = Block('minecraft:bubble_coral');

  /// ![bubble_coral_block](https://minecraftitemids.com/item/32/bubble_coral_block.png) \ 
  /// [Bubble Coral Block](https://minecraft.wiki/w/bubble_coral_block) \ 
  /// _minecraft:bubble_coral_block_
  static const Block bubble_coral_block = Block('minecraft:bubble_coral_block');

  /// ![bubble_coral_fan](https://minecraftitemids.com/item/32/bubble_coral_fan.png) \ 
  /// [Bubble Coral Fan](https://minecraft.wiki/w/bubble_coral_fan) \ 
  /// _minecraft:bubble_coral_fan_
  static const Block bubble_coral_fan = Block('minecraft:bubble_coral_fan');

  /// ![bubble_coral_wall_fan](https://minecraftitemids.com/item/32/bubble_coral_wall_fan.png) \ 
  /// [Bubble Coral Wall Fan](https://minecraft.wiki/w/bubble_coral_wall_fan) \ 
  /// _minecraft:bubble_coral_wall_fan_
  static const Block bubble_coral_wall_fan = Block('minecraft:bubble_coral_wall_fan');

  /// ![budding_amethyst](https://minecraftitemids.com/item/32/budding_amethyst.png) \ 
  /// [Budding Amethyst](https://minecraft.wiki/w/budding_amethyst) \ 
  /// _minecraft:budding_amethyst_
  static const Block budding_amethyst = Block('minecraft:budding_amethyst');

  /// ![cactus](https://minecraftitemids.com/item/32/cactus.png) \ 
  /// [Cactus](https://minecraft.wiki/w/cactus) \ 
  /// _minecraft:cactus_
  static const Block cactus = Block('minecraft:cactus');

  /// ![cake](https://minecraftitemids.com/item/32/cake.png) \ 
  /// [Cake](https://minecraft.wiki/w/cake) \ 
  /// _minecraft:cake_
  static const Block cake = Block('minecraft:cake');

  /// ![calcite](https://minecraftitemids.com/item/32/calcite.png) \ 
  /// [Calcite](https://minecraft.wiki/w/calcite) \ 
  /// _minecraft:calcite_
  static const Block calcite = Block('minecraft:calcite');

  /// ![calibrated_sculk_sensor](https://minecraftitemids.com/item/32/calibrated_sculk_sensor.png) \ 
  /// [Calibrated Sculk Sensor](https://minecraft.wiki/w/calibrated_sculk_sensor) \ 
  /// _minecraft:calibrated_sculk_sensor_
  static const Block calibrated_sculk_sensor = Block('minecraft:calibrated_sculk_sensor');

  /// ![campfire](https://minecraftitemids.com/item/32/campfire.png) \ 
  /// [Campfire](https://minecraft.wiki/w/campfire) \ 
  /// _minecraft:campfire_
  static const Block campfire = Block('minecraft:campfire');

  /// ![candle](https://minecraftitemids.com/item/32/candle.png) \ 
  /// [Candle](https://minecraft.wiki/w/candle) \ 
  /// _minecraft:candle_
  static const Block candle = Block('minecraft:candle');

  /// ![candle_cake](https://minecraftitemids.com/item/32/candle_cake.png) \ 
  /// [Candle Cake](https://minecraft.wiki/w/candle_cake) \ 
  /// _minecraft:candle_cake_
  static const Block candle_cake = Block('minecraft:candle_cake');

  /// ![carrots](https://minecraftitemids.com/item/32/carrots.png) \ 
  /// [Carrots](https://minecraft.wiki/w/carrots) \ 
  /// _minecraft:carrots_
  static const Block carrots = Block('minecraft:carrots');

  /// ![cartography_table](https://minecraftitemids.com/item/32/cartography_table.png) \ 
  /// [Cartography Table](https://minecraft.wiki/w/cartography_table) \ 
  /// _minecraft:cartography_table_
  static const Block cartography_table = Block('minecraft:cartography_table');

  /// ![carved_pumpkin](https://minecraftitemids.com/item/32/carved_pumpkin.png) \ 
  /// [Carved Pumpkin](https://minecraft.wiki/w/carved_pumpkin) \ 
  /// _minecraft:carved_pumpkin_
  static const Block carved_pumpkin = Block('minecraft:carved_pumpkin');

  /// ![cauldron](https://minecraftitemids.com/item/32/cauldron.png) \ 
  /// [Cauldron](https://minecraft.wiki/w/cauldron) \ 
  /// _minecraft:cauldron_
  static const Block cauldron = Block('minecraft:cauldron');

  /// ![cave_air](https://minecraftitemids.com/item/32/cave_air.png) \ 
  /// [Cave Air](https://minecraft.wiki/w/cave_air) \ 
  /// _minecraft:cave_air_
  static const Block cave_air = Block('minecraft:cave_air');

  /// ![cave_vines](https://minecraftitemids.com/item/32/cave_vines.png) \ 
  /// [Cave Vines](https://minecraft.wiki/w/cave_vines) \ 
  /// _minecraft:cave_vines_
  static const Block cave_vines = Block('minecraft:cave_vines');

  /// ![cave_vines_plant](https://minecraftitemids.com/item/32/cave_vines_plant.png) \ 
  /// [Cave Vines Plant](https://minecraft.wiki/w/cave_vines_plant) \ 
  /// _minecraft:cave_vines_plant_
  static const Block cave_vines_plant = Block('minecraft:cave_vines_plant');

  /// ![chain](https://minecraftitemids.com/item/32/chain.png) \ 
  /// [Chain](https://minecraft.wiki/w/chain) \ 
  /// _minecraft:chain_
  static const Block chain = Block('minecraft:chain');

  /// ![chain_command_block](https://minecraftitemids.com/item/32/chain_command_block.png) \ 
  /// [Chain Command Block](https://minecraft.wiki/w/chain_command_block) \ 
  /// _minecraft:chain_command_block_
  static const Block chain_command_block = Block('minecraft:chain_command_block');

  /// ![cherry_button](https://minecraftitemids.com/item/32/cherry_button.png) \ 
  /// [Cherry Button](https://minecraft.wiki/w/cherry_button) \ 
  /// _minecraft:cherry_button_
  static const Block cherry_button = Block('minecraft:cherry_button');

  /// ![cherry_door](https://minecraftitemids.com/item/32/cherry_door.png) \ 
  /// [Cherry Door](https://minecraft.wiki/w/cherry_door) \ 
  /// _minecraft:cherry_door_
  static const Block cherry_door = Block('minecraft:cherry_door');

  /// ![cherry_fence](https://minecraftitemids.com/item/32/cherry_fence.png) \ 
  /// [Cherry Fence](https://minecraft.wiki/w/cherry_fence) \ 
  /// _minecraft:cherry_fence_
  static const Block cherry_fence = Block('minecraft:cherry_fence');

  /// ![cherry_fence_gate](https://minecraftitemids.com/item/32/cherry_fence_gate.png) \ 
  /// [Cherry Fence Gate](https://minecraft.wiki/w/cherry_fence_gate) \ 
  /// _minecraft:cherry_fence_gate_
  static const Block cherry_fence_gate = Block('minecraft:cherry_fence_gate');

  /// ![cherry_hanging_sign](https://minecraftitemids.com/item/32/cherry_hanging_sign.png) \ 
  /// [Cherry Hanging Sign](https://minecraft.wiki/w/cherry_hanging_sign) \ 
  /// _minecraft:cherry_hanging_sign_
  static const Block cherry_hanging_sign = Block('minecraft:cherry_hanging_sign');

  /// ![cherry_leaves](https://minecraftitemids.com/item/32/cherry_leaves.png) \ 
  /// [Cherry Leaves](https://minecraft.wiki/w/cherry_leaves) \ 
  /// _minecraft:cherry_leaves_
  static const Block cherry_leaves = Block('minecraft:cherry_leaves');

  /// ![cherry_log](https://minecraftitemids.com/item/32/cherry_log.png) \ 
  /// [Cherry Log](https://minecraft.wiki/w/cherry_log) \ 
  /// _minecraft:cherry_log_
  static const Block cherry_log = Block('minecraft:cherry_log');

  /// ![cherry_planks](https://minecraftitemids.com/item/32/cherry_planks.png) \ 
  /// [Cherry Planks](https://minecraft.wiki/w/cherry_planks) \ 
  /// _minecraft:cherry_planks_
  static const Block cherry_planks = Block('minecraft:cherry_planks');

  /// ![cherry_pressure_plate](https://minecraftitemids.com/item/32/cherry_pressure_plate.png) \ 
  /// [Cherry Pressure Plate](https://minecraft.wiki/w/cherry_pressure_plate) \ 
  /// _minecraft:cherry_pressure_plate_
  static const Block cherry_pressure_plate = Block('minecraft:cherry_pressure_plate');

  /// ![cherry_sapling](https://minecraftitemids.com/item/32/cherry_sapling.png) \ 
  /// [Cherry Sapling](https://minecraft.wiki/w/cherry_sapling) \ 
  /// _minecraft:cherry_sapling_
  static const Block cherry_sapling = Block('minecraft:cherry_sapling');

  /// ![cherry_sign](https://minecraftitemids.com/item/32/cherry_sign.png) \ 
  /// [Cherry Sign](https://minecraft.wiki/w/cherry_sign) \ 
  /// _minecraft:cherry_sign_
  static const Block cherry_sign = Block('minecraft:cherry_sign');

  /// ![cherry_slab](https://minecraftitemids.com/item/32/cherry_slab.png) \ 
  /// [Cherry Slab](https://minecraft.wiki/w/cherry_slab) \ 
  /// _minecraft:cherry_slab_
  static const Block cherry_slab = Block('minecraft:cherry_slab');

  /// ![cherry_stairs](https://minecraftitemids.com/item/32/cherry_stairs.png) \ 
  /// [Cherry Stairs](https://minecraft.wiki/w/cherry_stairs) \ 
  /// _minecraft:cherry_stairs_
  static const Block cherry_stairs = Block('minecraft:cherry_stairs');

  /// ![cherry_trapdoor](https://minecraftitemids.com/item/32/cherry_trapdoor.png) \ 
  /// [Cherry Trapdoor](https://minecraft.wiki/w/cherry_trapdoor) \ 
  /// _minecraft:cherry_trapdoor_
  static const Block cherry_trapdoor = Block('minecraft:cherry_trapdoor');

  /// ![cherry_wall_hanging_sign](https://minecraftitemids.com/item/32/cherry_wall_hanging_sign.png) \ 
  /// [Cherry Wall Hanging Sign](https://minecraft.wiki/w/cherry_wall_hanging_sign) \ 
  /// _minecraft:cherry_wall_hanging_sign_
  static const Block cherry_wall_hanging_sign = Block('minecraft:cherry_wall_hanging_sign');

  /// ![cherry_wall_sign](https://minecraftitemids.com/item/32/cherry_wall_sign.png) \ 
  /// [Cherry Wall Sign](https://minecraft.wiki/w/cherry_wall_sign) \ 
  /// _minecraft:cherry_wall_sign_
  static const Block cherry_wall_sign = Block('minecraft:cherry_wall_sign');

  /// ![cherry_wood](https://minecraftitemids.com/item/32/cherry_wood.png) \ 
  /// [Cherry Wood](https://minecraft.wiki/w/cherry_wood) \ 
  /// _minecraft:cherry_wood_
  static const Block cherry_wood = Block('minecraft:cherry_wood');

  /// ![chest](https://minecraftitemids.com/item/32/chest.png) \ 
  /// [Chest](https://minecraft.wiki/w/chest) \ 
  /// _minecraft:chest_
  static const Block chest = Block('minecraft:chest');

  /// ![chipped_anvil](https://minecraftitemids.com/item/32/chipped_anvil.png) \ 
  /// [Chipped Anvil](https://minecraft.wiki/w/chipped_anvil) \ 
  /// _minecraft:chipped_anvil_
  static const Block chipped_anvil = Block('minecraft:chipped_anvil');

  /// ![chiseled_bookshelf](https://minecraftitemids.com/item/32/chiseled_bookshelf.png) \ 
  /// [Chiseled Bookshelf](https://minecraft.wiki/w/chiseled_bookshelf) \ 
  /// _minecraft:chiseled_bookshelf_
  static const Block chiseled_bookshelf = Block('minecraft:chiseled_bookshelf');

  /// ![chiseled_copper](https://minecraftitemids.com/item/32/chiseled_copper.png) \ 
  /// [Chiseled Copper](https://minecraft.wiki/w/chiseled_copper) \ 
  /// _minecraft:chiseled_copper_
  static const Block chiseled_copper = Block('minecraft:chiseled_copper');

  /// ![chiseled_deepslate](https://minecraftitemids.com/item/32/chiseled_deepslate.png) \ 
  /// [Chiseled Deepslate](https://minecraft.wiki/w/chiseled_deepslate) \ 
  /// _minecraft:chiseled_deepslate_
  static const Block chiseled_deepslate = Block('minecraft:chiseled_deepslate');

  /// ![chiseled_nether_bricks](https://minecraftitemids.com/item/32/chiseled_nether_bricks.png) \ 
  /// [Chiseled Nether Bricks](https://minecraft.wiki/w/chiseled_nether_bricks) \ 
  /// _minecraft:chiseled_nether_bricks_
  static const Block chiseled_nether_bricks = Block('minecraft:chiseled_nether_bricks');

  /// ![chiseled_polished_blackstone](https://minecraftitemids.com/item/32/chiseled_polished_blackstone.png) \ 
  /// [Chiseled Polished Blackstone](https://minecraft.wiki/w/chiseled_polished_blackstone) \ 
  /// _minecraft:chiseled_polished_blackstone_
  static const Block chiseled_polished_blackstone = Block('minecraft:chiseled_polished_blackstone');

  /// ![chiseled_quartz_block](https://minecraftitemids.com/item/32/chiseled_quartz_block.png) \ 
  /// [Chiseled Quartz Block](https://minecraft.wiki/w/chiseled_quartz_block) \ 
  /// _minecraft:chiseled_quartz_block_
  static const Block chiseled_quartz_block = Block('minecraft:chiseled_quartz_block');

  /// ![chiseled_red_sandstone](https://minecraftitemids.com/item/32/chiseled_red_sandstone.png) \ 
  /// [Chiseled Red Sandstone](https://minecraft.wiki/w/chiseled_red_sandstone) \ 
  /// _minecraft:chiseled_red_sandstone_
  static const Block chiseled_red_sandstone = Block('minecraft:chiseled_red_sandstone');

  /// ![chiseled_sandstone](https://minecraftitemids.com/item/32/chiseled_sandstone.png) \ 
  /// [Chiseled Sandstone](https://minecraft.wiki/w/chiseled_sandstone) \ 
  /// _minecraft:chiseled_sandstone_
  static const Block chiseled_sandstone = Block('minecraft:chiseled_sandstone');

  /// ![chiseled_stone_bricks](https://minecraftitemids.com/item/32/chiseled_stone_bricks.png) \ 
  /// [Chiseled Stone Bricks](https://minecraft.wiki/w/chiseled_stone_bricks) \ 
  /// _minecraft:chiseled_stone_bricks_
  static const Block chiseled_stone_bricks = Block('minecraft:chiseled_stone_bricks');

  /// ![chiseled_tuff](https://minecraftitemids.com/item/32/chiseled_tuff.png) \ 
  /// [Chiseled Tuff](https://minecraft.wiki/w/chiseled_tuff) \ 
  /// _minecraft:chiseled_tuff_
  static const Block chiseled_tuff = Block('minecraft:chiseled_tuff');

  /// ![chiseled_tuff_bricks](https://minecraftitemids.com/item/32/chiseled_tuff_bricks.png) \ 
  /// [Chiseled Tuff Bricks](https://minecraft.wiki/w/chiseled_tuff_bricks) \ 
  /// _minecraft:chiseled_tuff_bricks_
  static const Block chiseled_tuff_bricks = Block('minecraft:chiseled_tuff_bricks');

  /// ![chorus_flower](https://minecraftitemids.com/item/32/chorus_flower.png) \ 
  /// [Chorus Flower](https://minecraft.wiki/w/chorus_flower) \ 
  /// _minecraft:chorus_flower_
  static const Block chorus_flower = Block('minecraft:chorus_flower');

  /// ![chorus_plant](https://minecraftitemids.com/item/32/chorus_plant.png) \ 
  /// [Chorus Plant](https://minecraft.wiki/w/chorus_plant) \ 
  /// _minecraft:chorus_plant_
  static const Block chorus_plant = Block('minecraft:chorus_plant');

  /// ![clay](https://minecraftitemids.com/item/32/clay.png) \ 
  /// [Clay](https://minecraft.wiki/w/clay) \ 
  /// _minecraft:clay_
  static const Block clay = Block('minecraft:clay');

  /// ![coal_block](https://minecraftitemids.com/item/32/coal_block.png) \ 
  /// [Coal Block](https://minecraft.wiki/w/coal_block) \ 
  /// _minecraft:coal_block_
  static const Block coal_block = Block('minecraft:coal_block');

  /// ![coal_ore](https://minecraftitemids.com/item/32/coal_ore.png) \ 
  /// [Coal Ore](https://minecraft.wiki/w/coal_ore) \ 
  /// _minecraft:coal_ore_
  static const Block coal_ore = Block('minecraft:coal_ore');

  /// ![coarse_dirt](https://minecraftitemids.com/item/32/coarse_dirt.png) \ 
  /// [Coarse Dirt](https://minecraft.wiki/w/coarse_dirt) \ 
  /// _minecraft:coarse_dirt_
  static const Block coarse_dirt = Block('minecraft:coarse_dirt');

  /// ![cobbled_deepslate](https://minecraftitemids.com/item/32/cobbled_deepslate.png) \ 
  /// [Cobbled Deepslate](https://minecraft.wiki/w/cobbled_deepslate) \ 
  /// _minecraft:cobbled_deepslate_
  static const Block cobbled_deepslate = Block('minecraft:cobbled_deepslate');

  /// ![cobbled_deepslate_slab](https://minecraftitemids.com/item/32/cobbled_deepslate_slab.png) \ 
  /// [Cobbled Deepslate Slab](https://minecraft.wiki/w/cobbled_deepslate_slab) \ 
  /// _minecraft:cobbled_deepslate_slab_
  static const Block cobbled_deepslate_slab = Block('minecraft:cobbled_deepslate_slab');

  /// ![cobbled_deepslate_stairs](https://minecraftitemids.com/item/32/cobbled_deepslate_stairs.png) \ 
  /// [Cobbled Deepslate Stairs](https://minecraft.wiki/w/cobbled_deepslate_stairs) \ 
  /// _minecraft:cobbled_deepslate_stairs_
  static const Block cobbled_deepslate_stairs = Block('minecraft:cobbled_deepslate_stairs');

  /// ![cobbled_deepslate_wall](https://minecraftitemids.com/item/32/cobbled_deepslate_wall.png) \ 
  /// [Cobbled Deepslate Wall](https://minecraft.wiki/w/cobbled_deepslate_wall) \ 
  /// _minecraft:cobbled_deepslate_wall_
  static const Block cobbled_deepslate_wall = Block('minecraft:cobbled_deepslate_wall');

  /// ![cobblestone](https://minecraftitemids.com/item/32/cobblestone.png) \ 
  /// [Cobblestone](https://minecraft.wiki/w/cobblestone) \ 
  /// _minecraft:cobblestone_
  static const Block cobblestone = Block('minecraft:cobblestone');

  /// ![cobblestone_slab](https://minecraftitemids.com/item/32/cobblestone_slab.png) \ 
  /// [Cobblestone Slab](https://minecraft.wiki/w/cobblestone_slab) \ 
  /// _minecraft:cobblestone_slab_
  static const Block cobblestone_slab = Block('minecraft:cobblestone_slab');

  /// ![cobblestone_stairs](https://minecraftitemids.com/item/32/cobblestone_stairs.png) \ 
  /// [Cobblestone Stairs](https://minecraft.wiki/w/cobblestone_stairs) \ 
  /// _minecraft:cobblestone_stairs_
  static const Block cobblestone_stairs = Block('minecraft:cobblestone_stairs');

  /// ![cobblestone_wall](https://minecraftitemids.com/item/32/cobblestone_wall.png) \ 
  /// [Cobblestone Wall](https://minecraft.wiki/w/cobblestone_wall) \ 
  /// _minecraft:cobblestone_wall_
  static const Block cobblestone_wall = Block('minecraft:cobblestone_wall');

  /// ![cobweb](https://minecraftitemids.com/item/32/cobweb.png) \ 
  /// [Cobweb](https://minecraft.wiki/w/cobweb) \ 
  /// _minecraft:cobweb_
  static const Block cobweb = Block('minecraft:cobweb');

  /// ![cocoa](https://minecraftitemids.com/item/32/cocoa.png) \ 
  /// [Cocoa](https://minecraft.wiki/w/cocoa) \ 
  /// _minecraft:cocoa_
  static const Block cocoa = Block('minecraft:cocoa');

  /// ![command_block](https://minecraftitemids.com/item/32/command_block.png) \ 
  /// [Command Block](https://minecraft.wiki/w/command_block) \ 
  /// _minecraft:command_block_
  static const Block command_block = Block('minecraft:command_block');

  /// ![comparator](https://minecraftitemids.com/item/32/comparator.png) \ 
  /// [Comparator](https://minecraft.wiki/w/comparator) \ 
  /// _minecraft:comparator_
  static const Block comparator = Block('minecraft:comparator');

  /// ![composter](https://minecraftitemids.com/item/32/composter.png) \ 
  /// [Composter](https://minecraft.wiki/w/composter) \ 
  /// _minecraft:composter_
  static const Block composter = Block('minecraft:composter');

  /// ![conduit](https://minecraftitemids.com/item/32/conduit.png) \ 
  /// [Conduit](https://minecraft.wiki/w/conduit) \ 
  /// _minecraft:conduit_
  static const Block conduit = Block('minecraft:conduit');

  /// ![copper_block](https://minecraftitemids.com/item/32/copper_block.png) \ 
  /// [Copper Block](https://minecraft.wiki/w/copper_block) \ 
  /// _minecraft:copper_block_
  static const Block copper_block = Block('minecraft:copper_block');

  /// ![copper_bulb](https://minecraftitemids.com/item/32/copper_bulb.png) \ 
  /// [Copper Bulb](https://minecraft.wiki/w/copper_bulb) \ 
  /// _minecraft:copper_bulb_
  static const Block copper_bulb = Block('minecraft:copper_bulb');

  /// ![copper_door](https://minecraftitemids.com/item/32/copper_door.png) \ 
  /// [Copper Door](https://minecraft.wiki/w/copper_door) \ 
  /// _minecraft:copper_door_
  static const Block copper_door = Block('minecraft:copper_door');

  /// ![copper_grate](https://minecraftitemids.com/item/32/copper_grate.png) \ 
  /// [Copper Grate](https://minecraft.wiki/w/copper_grate) \ 
  /// _minecraft:copper_grate_
  static const Block copper_grate = Block('minecraft:copper_grate');

  /// ![copper_ore](https://minecraftitemids.com/item/32/copper_ore.png) \ 
  /// [Copper Ore](https://minecraft.wiki/w/copper_ore) \ 
  /// _minecraft:copper_ore_
  static const Block copper_ore = Block('minecraft:copper_ore');

  /// ![copper_trapdoor](https://minecraftitemids.com/item/32/copper_trapdoor.png) \ 
  /// [Copper Trapdoor](https://minecraft.wiki/w/copper_trapdoor) \ 
  /// _minecraft:copper_trapdoor_
  static const Block copper_trapdoor = Block('minecraft:copper_trapdoor');

  /// ![cornflower](https://minecraftitemids.com/item/32/cornflower.png) \ 
  /// [Cornflower](https://minecraft.wiki/w/cornflower) \ 
  /// _minecraft:cornflower_
  static const Block cornflower = Block('minecraft:cornflower');

  /// ![cracked_deepslate_bricks](https://minecraftitemids.com/item/32/cracked_deepslate_bricks.png) \ 
  /// [Cracked Deepslate Bricks](https://minecraft.wiki/w/cracked_deepslate_bricks) \ 
  /// _minecraft:cracked_deepslate_bricks_
  static const Block cracked_deepslate_bricks = Block('minecraft:cracked_deepslate_bricks');

  /// ![cracked_deepslate_tiles](https://minecraftitemids.com/item/32/cracked_deepslate_tiles.png) \ 
  /// [Cracked Deepslate Tiles](https://minecraft.wiki/w/cracked_deepslate_tiles) \ 
  /// _minecraft:cracked_deepslate_tiles_
  static const Block cracked_deepslate_tiles = Block('minecraft:cracked_deepslate_tiles');

  /// ![cracked_nether_bricks](https://minecraftitemids.com/item/32/cracked_nether_bricks.png) \ 
  /// [Cracked Nether Bricks](https://minecraft.wiki/w/cracked_nether_bricks) \ 
  /// _minecraft:cracked_nether_bricks_
  static const Block cracked_nether_bricks = Block('minecraft:cracked_nether_bricks');

  /// ![cracked_polished_blackstone_bricks](https://minecraftitemids.com/item/32/cracked_polished_blackstone_bricks.png) \ 
  /// [Cracked Polished Blackstone Bricks](https://minecraft.wiki/w/cracked_polished_blackstone_bricks) \ 
  /// _minecraft:cracked_polished_blackstone_bricks_
  static const Block cracked_polished_blackstone_bricks = Block('minecraft:cracked_polished_blackstone_bricks');

  /// ![cracked_stone_bricks](https://minecraftitemids.com/item/32/cracked_stone_bricks.png) \ 
  /// [Cracked Stone Bricks](https://minecraft.wiki/w/cracked_stone_bricks) \ 
  /// _minecraft:cracked_stone_bricks_
  static const Block cracked_stone_bricks = Block('minecraft:cracked_stone_bricks');

  /// ![crafter](https://minecraftitemids.com/item/32/crafter.png) \ 
  /// [Crafter](https://minecraft.wiki/w/crafter) \ 
  /// _minecraft:crafter_
  static const Block crafter = Block('minecraft:crafter');

  /// ![crafting_table](https://minecraftitemids.com/item/32/crafting_table.png) \ 
  /// [Crafting Table](https://minecraft.wiki/w/crafting_table) \ 
  /// _minecraft:crafting_table_
  static const Block crafting_table = Block('minecraft:crafting_table');

  /// ![creeper_head](https://minecraftitemids.com/item/32/creeper_head.png) \ 
  /// [Creeper Head](https://minecraft.wiki/w/creeper_head) \ 
  /// _minecraft:creeper_head_
  static const Block creeper_head = Block('minecraft:creeper_head');

  /// ![creeper_wall_head](https://minecraftitemids.com/item/32/creeper_wall_head.png) \ 
  /// [Creeper Wall Head](https://minecraft.wiki/w/creeper_wall_head) \ 
  /// _minecraft:creeper_wall_head_
  static const Block creeper_wall_head = Block('minecraft:creeper_wall_head');

  /// ![crimson_button](https://minecraftitemids.com/item/32/crimson_button.png) \ 
  /// [Crimson Button](https://minecraft.wiki/w/crimson_button) \ 
  /// _minecraft:crimson_button_
  static const Block crimson_button = Block('minecraft:crimson_button');

  /// ![crimson_door](https://minecraftitemids.com/item/32/crimson_door.png) \ 
  /// [Crimson Door](https://minecraft.wiki/w/crimson_door) \ 
  /// _minecraft:crimson_door_
  static const Block crimson_door = Block('minecraft:crimson_door');

  /// ![crimson_fence](https://minecraftitemids.com/item/32/crimson_fence.png) \ 
  /// [Crimson Fence](https://minecraft.wiki/w/crimson_fence) \ 
  /// _minecraft:crimson_fence_
  static const Block crimson_fence = Block('minecraft:crimson_fence');

  /// ![crimson_fence_gate](https://minecraftitemids.com/item/32/crimson_fence_gate.png) \ 
  /// [Crimson Fence Gate](https://minecraft.wiki/w/crimson_fence_gate) \ 
  /// _minecraft:crimson_fence_gate_
  static const Block crimson_fence_gate = Block('minecraft:crimson_fence_gate');

  /// ![crimson_fungus](https://minecraftitemids.com/item/32/crimson_fungus.png) \ 
  /// [Crimson Fungus](https://minecraft.wiki/w/crimson_fungus) \ 
  /// _minecraft:crimson_fungus_
  static const Block crimson_fungus = Block('minecraft:crimson_fungus');

  /// ![crimson_hanging_sign](https://minecraftitemids.com/item/32/crimson_hanging_sign.png) \ 
  /// [Crimson Hanging Sign](https://minecraft.wiki/w/crimson_hanging_sign) \ 
  /// _minecraft:crimson_hanging_sign_
  static const Block crimson_hanging_sign = Block('minecraft:crimson_hanging_sign');

  /// ![crimson_hyphae](https://minecraftitemids.com/item/32/crimson_hyphae.png) \ 
  /// [Crimson Hyphae](https://minecraft.wiki/w/crimson_hyphae) \ 
  /// _minecraft:crimson_hyphae_
  static const Block crimson_hyphae = Block('minecraft:crimson_hyphae');

  /// ![crimson_nylium](https://minecraftitemids.com/item/32/crimson_nylium.png) \ 
  /// [Crimson Nylium](https://minecraft.wiki/w/crimson_nylium) \ 
  /// _minecraft:crimson_nylium_
  static const Block crimson_nylium = Block('minecraft:crimson_nylium');

  /// ![crimson_planks](https://minecraftitemids.com/item/32/crimson_planks.png) \ 
  /// [Crimson Planks](https://minecraft.wiki/w/crimson_planks) \ 
  /// _minecraft:crimson_planks_
  static const Block crimson_planks = Block('minecraft:crimson_planks');

  /// ![crimson_pressure_plate](https://minecraftitemids.com/item/32/crimson_pressure_plate.png) \ 
  /// [Crimson Pressure Plate](https://minecraft.wiki/w/crimson_pressure_plate) \ 
  /// _minecraft:crimson_pressure_plate_
  static const Block crimson_pressure_plate = Block('minecraft:crimson_pressure_plate');

  /// ![crimson_roots](https://minecraftitemids.com/item/32/crimson_roots.png) \ 
  /// [Crimson Roots](https://minecraft.wiki/w/crimson_roots) \ 
  /// _minecraft:crimson_roots_
  static const Block crimson_roots = Block('minecraft:crimson_roots');

  /// ![crimson_sign](https://minecraftitemids.com/item/32/crimson_sign.png) \ 
  /// [Crimson Sign](https://minecraft.wiki/w/crimson_sign) \ 
  /// _minecraft:crimson_sign_
  static const Block crimson_sign = Block('minecraft:crimson_sign');

  /// ![crimson_slab](https://minecraftitemids.com/item/32/crimson_slab.png) \ 
  /// [Crimson Slab](https://minecraft.wiki/w/crimson_slab) \ 
  /// _minecraft:crimson_slab_
  static const Block crimson_slab = Block('minecraft:crimson_slab');

  /// ![crimson_stairs](https://minecraftitemids.com/item/32/crimson_stairs.png) \ 
  /// [Crimson Stairs](https://minecraft.wiki/w/crimson_stairs) \ 
  /// _minecraft:crimson_stairs_
  static const Block crimson_stairs = Block('minecraft:crimson_stairs');

  /// ![crimson_stem](https://minecraftitemids.com/item/32/crimson_stem.png) \ 
  /// [Crimson Stem](https://minecraft.wiki/w/crimson_stem) \ 
  /// _minecraft:crimson_stem_
  static const Block crimson_stem = Block('minecraft:crimson_stem');

  /// ![crimson_trapdoor](https://minecraftitemids.com/item/32/crimson_trapdoor.png) \ 
  /// [Crimson Trapdoor](https://minecraft.wiki/w/crimson_trapdoor) \ 
  /// _minecraft:crimson_trapdoor_
  static const Block crimson_trapdoor = Block('minecraft:crimson_trapdoor');

  /// ![crimson_wall_hanging_sign](https://minecraftitemids.com/item/32/crimson_wall_hanging_sign.png) \ 
  /// [Crimson Wall Hanging Sign](https://minecraft.wiki/w/crimson_wall_hanging_sign) \ 
  /// _minecraft:crimson_wall_hanging_sign_
  static const Block crimson_wall_hanging_sign = Block('minecraft:crimson_wall_hanging_sign');

  /// ![crimson_wall_sign](https://minecraftitemids.com/item/32/crimson_wall_sign.png) \ 
  /// [Crimson Wall Sign](https://minecraft.wiki/w/crimson_wall_sign) \ 
  /// _minecraft:crimson_wall_sign_
  static const Block crimson_wall_sign = Block('minecraft:crimson_wall_sign');

  /// ![crying_obsidian](https://minecraftitemids.com/item/32/crying_obsidian.png) \ 
  /// [Crying Obsidian](https://minecraft.wiki/w/crying_obsidian) \ 
  /// _minecraft:crying_obsidian_
  static const Block crying_obsidian = Block('minecraft:crying_obsidian');

  /// ![cut_copper](https://minecraftitemids.com/item/32/cut_copper.png) \ 
  /// [Cut Copper](https://minecraft.wiki/w/cut_copper) \ 
  /// _minecraft:cut_copper_
  static const Block cut_copper = Block('minecraft:cut_copper');

  /// ![cut_copper_slab](https://minecraftitemids.com/item/32/cut_copper_slab.png) \ 
  /// [Cut Copper Slab](https://minecraft.wiki/w/cut_copper_slab) \ 
  /// _minecraft:cut_copper_slab_
  static const Block cut_copper_slab = Block('minecraft:cut_copper_slab');

  /// ![cut_copper_stairs](https://minecraftitemids.com/item/32/cut_copper_stairs.png) \ 
  /// [Cut Copper Stairs](https://minecraft.wiki/w/cut_copper_stairs) \ 
  /// _minecraft:cut_copper_stairs_
  static const Block cut_copper_stairs = Block('minecraft:cut_copper_stairs');

  /// ![cut_red_sandstone](https://minecraftitemids.com/item/32/cut_red_sandstone.png) \ 
  /// [Cut Red Sandstone](https://minecraft.wiki/w/cut_red_sandstone) \ 
  /// _minecraft:cut_red_sandstone_
  static const Block cut_red_sandstone = Block('minecraft:cut_red_sandstone');

  /// ![cut_red_sandstone_slab](https://minecraftitemids.com/item/32/cut_red_sandstone_slab.png) \ 
  /// [Cut Red Sandstone Slab](https://minecraft.wiki/w/cut_red_sandstone_slab) \ 
  /// _minecraft:cut_red_sandstone_slab_
  static const Block cut_red_sandstone_slab = Block('minecraft:cut_red_sandstone_slab');

  /// ![cut_sandstone](https://minecraftitemids.com/item/32/cut_sandstone.png) \ 
  /// [Cut Sandstone](https://minecraft.wiki/w/cut_sandstone) \ 
  /// _minecraft:cut_sandstone_
  static const Block cut_sandstone = Block('minecraft:cut_sandstone');

  /// ![cut_sandstone_slab](https://minecraftitemids.com/item/32/cut_sandstone_slab.png) \ 
  /// [Cut Sandstone Slab](https://minecraft.wiki/w/cut_sandstone_slab) \ 
  /// _minecraft:cut_sandstone_slab_
  static const Block cut_sandstone_slab = Block('minecraft:cut_sandstone_slab');

  /// ![cyan_banner](https://minecraftitemids.com/item/32/cyan_banner.png) \ 
  /// [Cyan Banner](https://minecraft.wiki/w/cyan_banner) \ 
  /// _minecraft:cyan_banner_
  static const Block cyan_banner = Block('minecraft:cyan_banner');

  /// ![cyan_bed](https://minecraftitemids.com/item/32/cyan_bed.png) \ 
  /// [Cyan Bed](https://minecraft.wiki/w/cyan_bed) \ 
  /// _minecraft:cyan_bed_
  static const Block cyan_bed = Block('minecraft:cyan_bed');

  /// ![cyan_candle](https://minecraftitemids.com/item/32/cyan_candle.png) \ 
  /// [Cyan Candle](https://minecraft.wiki/w/cyan_candle) \ 
  /// _minecraft:cyan_candle_
  static const Block cyan_candle = Block('minecraft:cyan_candle');

  /// ![cyan_candle_cake](https://minecraftitemids.com/item/32/cyan_candle_cake.png) \ 
  /// [Cyan Candle Cake](https://minecraft.wiki/w/cyan_candle_cake) \ 
  /// _minecraft:cyan_candle_cake_
  static const Block cyan_candle_cake = Block('minecraft:cyan_candle_cake');

  /// ![cyan_carpet](https://minecraftitemids.com/item/32/cyan_carpet.png) \ 
  /// [Cyan Carpet](https://minecraft.wiki/w/cyan_carpet) \ 
  /// _minecraft:cyan_carpet_
  static const Block cyan_carpet = Block('minecraft:cyan_carpet');

  /// ![cyan_concrete](https://minecraftitemids.com/item/32/cyan_concrete.png) \ 
  /// [Cyan Concrete](https://minecraft.wiki/w/cyan_concrete) \ 
  /// _minecraft:cyan_concrete_
  static const Block cyan_concrete = Block('minecraft:cyan_concrete');

  /// ![cyan_concrete_powder](https://minecraftitemids.com/item/32/cyan_concrete_powder.png) \ 
  /// [Cyan Concrete Powder](https://minecraft.wiki/w/cyan_concrete_powder) \ 
  /// _minecraft:cyan_concrete_powder_
  static const Block cyan_concrete_powder = Block('minecraft:cyan_concrete_powder');

  /// ![cyan_glazed_terracotta](https://minecraftitemids.com/item/32/cyan_glazed_terracotta.png) \ 
  /// [Cyan Glazed Terracotta](https://minecraft.wiki/w/cyan_glazed_terracotta) \ 
  /// _minecraft:cyan_glazed_terracotta_
  static const Block cyan_glazed_terracotta = Block('minecraft:cyan_glazed_terracotta');

  /// ![cyan_shulker_box](https://minecraftitemids.com/item/32/cyan_shulker_box.png) \ 
  /// [Cyan Shulker Box](https://minecraft.wiki/w/cyan_shulker_box) \ 
  /// _minecraft:cyan_shulker_box_
  static const Block cyan_shulker_box = Block('minecraft:cyan_shulker_box');

  /// ![cyan_stained_glass](https://minecraftitemids.com/item/32/cyan_stained_glass.png) \ 
  /// [Cyan Stained Glass](https://minecraft.wiki/w/cyan_stained_glass) \ 
  /// _minecraft:cyan_stained_glass_
  static const Block cyan_stained_glass = Block('minecraft:cyan_stained_glass');

  /// ![cyan_stained_glass_pane](https://minecraftitemids.com/item/32/cyan_stained_glass_pane.png) \ 
  /// [Cyan Stained Glass Pane](https://minecraft.wiki/w/cyan_stained_glass_pane) \ 
  /// _minecraft:cyan_stained_glass_pane_
  static const Block cyan_stained_glass_pane = Block('minecraft:cyan_stained_glass_pane');

  /// ![cyan_terracotta](https://minecraftitemids.com/item/32/cyan_terracotta.png) \ 
  /// [Cyan Terracotta](https://minecraft.wiki/w/cyan_terracotta) \ 
  /// _minecraft:cyan_terracotta_
  static const Block cyan_terracotta = Block('minecraft:cyan_terracotta');

  /// ![cyan_wall_banner](https://minecraftitemids.com/item/32/cyan_wall_banner.png) \ 
  /// [Cyan Wall Banner](https://minecraft.wiki/w/cyan_wall_banner) \ 
  /// _minecraft:cyan_wall_banner_
  static const Block cyan_wall_banner = Block('minecraft:cyan_wall_banner');

  /// ![cyan_wool](https://minecraftitemids.com/item/32/cyan_wool.png) \ 
  /// [Cyan Wool](https://minecraft.wiki/w/cyan_wool) \ 
  /// _minecraft:cyan_wool_
  static const Block cyan_wool = Block('minecraft:cyan_wool');

  /// ![damaged_anvil](https://minecraftitemids.com/item/32/damaged_anvil.png) \ 
  /// [Damaged Anvil](https://minecraft.wiki/w/damaged_anvil) \ 
  /// _minecraft:damaged_anvil_
  static const Block damaged_anvil = Block('minecraft:damaged_anvil');

  /// ![dandelion](https://minecraftitemids.com/item/32/dandelion.png) \ 
  /// [Dandelion](https://minecraft.wiki/w/dandelion) \ 
  /// _minecraft:dandelion_
  static const Block dandelion = Block('minecraft:dandelion');

  /// ![dark_oak_button](https://minecraftitemids.com/item/32/dark_oak_button.png) \ 
  /// [Dark Oak Button](https://minecraft.wiki/w/dark_oak_button) \ 
  /// _minecraft:dark_oak_button_
  static const Block dark_oak_button = Block('minecraft:dark_oak_button');

  /// ![dark_oak_door](https://minecraftitemids.com/item/32/dark_oak_door.png) \ 
  /// [Dark Oak Door](https://minecraft.wiki/w/dark_oak_door) \ 
  /// _minecraft:dark_oak_door_
  static const Block dark_oak_door = Block('minecraft:dark_oak_door');

  /// ![dark_oak_fence](https://minecraftitemids.com/item/32/dark_oak_fence.png) \ 
  /// [Dark Oak Fence](https://minecraft.wiki/w/dark_oak_fence) \ 
  /// _minecraft:dark_oak_fence_
  static const Block dark_oak_fence = Block('minecraft:dark_oak_fence');

  /// ![dark_oak_fence_gate](https://minecraftitemids.com/item/32/dark_oak_fence_gate.png) \ 
  /// [Dark Oak Fence Gate](https://minecraft.wiki/w/dark_oak_fence_gate) \ 
  /// _minecraft:dark_oak_fence_gate_
  static const Block dark_oak_fence_gate = Block('minecraft:dark_oak_fence_gate');

  /// ![dark_oak_hanging_sign](https://minecraftitemids.com/item/32/dark_oak_hanging_sign.png) \ 
  /// [Dark Oak Hanging Sign](https://minecraft.wiki/w/dark_oak_hanging_sign) \ 
  /// _minecraft:dark_oak_hanging_sign_
  static const Block dark_oak_hanging_sign = Block('minecraft:dark_oak_hanging_sign');

  /// ![dark_oak_leaves](https://minecraftitemids.com/item/32/dark_oak_leaves.png) \ 
  /// [Dark Oak Leaves](https://minecraft.wiki/w/dark_oak_leaves) \ 
  /// _minecraft:dark_oak_leaves_
  static const Block dark_oak_leaves = Block('minecraft:dark_oak_leaves');

  /// ![dark_oak_log](https://minecraftitemids.com/item/32/dark_oak_log.png) \ 
  /// [Dark Oak Log](https://minecraft.wiki/w/dark_oak_log) \ 
  /// _minecraft:dark_oak_log_
  static const Block dark_oak_log = Block('minecraft:dark_oak_log');

  /// ![dark_oak_planks](https://minecraftitemids.com/item/32/dark_oak_planks.png) \ 
  /// [Dark Oak Planks](https://minecraft.wiki/w/dark_oak_planks) \ 
  /// _minecraft:dark_oak_planks_
  static const Block dark_oak_planks = Block('minecraft:dark_oak_planks');

  /// ![dark_oak_pressure_plate](https://minecraftitemids.com/item/32/dark_oak_pressure_plate.png) \ 
  /// [Dark Oak Pressure Plate](https://minecraft.wiki/w/dark_oak_pressure_plate) \ 
  /// _minecraft:dark_oak_pressure_plate_
  static const Block dark_oak_pressure_plate = Block('minecraft:dark_oak_pressure_plate');

  /// ![dark_oak_sapling](https://minecraftitemids.com/item/32/dark_oak_sapling.png) \ 
  /// [Dark Oak Sapling](https://minecraft.wiki/w/dark_oak_sapling) \ 
  /// _minecraft:dark_oak_sapling_
  static const Block dark_oak_sapling = Block('minecraft:dark_oak_sapling');

  /// ![dark_oak_sign](https://minecraftitemids.com/item/32/dark_oak_sign.png) \ 
  /// [Dark Oak Sign](https://minecraft.wiki/w/dark_oak_sign) \ 
  /// _minecraft:dark_oak_sign_
  static const Block dark_oak_sign = Block('minecraft:dark_oak_sign');

  /// ![dark_oak_slab](https://minecraftitemids.com/item/32/dark_oak_slab.png) \ 
  /// [Dark Oak Slab](https://minecraft.wiki/w/dark_oak_slab) \ 
  /// _minecraft:dark_oak_slab_
  static const Block dark_oak_slab = Block('minecraft:dark_oak_slab');

  /// ![dark_oak_stairs](https://minecraftitemids.com/item/32/dark_oak_stairs.png) \ 
  /// [Dark Oak Stairs](https://minecraft.wiki/w/dark_oak_stairs) \ 
  /// _minecraft:dark_oak_stairs_
  static const Block dark_oak_stairs = Block('minecraft:dark_oak_stairs');

  /// ![dark_oak_trapdoor](https://minecraftitemids.com/item/32/dark_oak_trapdoor.png) \ 
  /// [Dark Oak Trapdoor](https://minecraft.wiki/w/dark_oak_trapdoor) \ 
  /// _minecraft:dark_oak_trapdoor_
  static const Block dark_oak_trapdoor = Block('minecraft:dark_oak_trapdoor');

  /// ![dark_oak_wall_hanging_sign](https://minecraftitemids.com/item/32/dark_oak_wall_hanging_sign.png) \ 
  /// [Dark Oak Wall Hanging Sign](https://minecraft.wiki/w/dark_oak_wall_hanging_sign) \ 
  /// _minecraft:dark_oak_wall_hanging_sign_
  static const Block dark_oak_wall_hanging_sign = Block('minecraft:dark_oak_wall_hanging_sign');

  /// ![dark_oak_wall_sign](https://minecraftitemids.com/item/32/dark_oak_wall_sign.png) \ 
  /// [Dark Oak Wall Sign](https://minecraft.wiki/w/dark_oak_wall_sign) \ 
  /// _minecraft:dark_oak_wall_sign_
  static const Block dark_oak_wall_sign = Block('minecraft:dark_oak_wall_sign');

  /// ![dark_oak_wood](https://minecraftitemids.com/item/32/dark_oak_wood.png) \ 
  /// [Dark Oak Wood](https://minecraft.wiki/w/dark_oak_wood) \ 
  /// _minecraft:dark_oak_wood_
  static const Block dark_oak_wood = Block('minecraft:dark_oak_wood');

  /// ![dark_prismarine](https://minecraftitemids.com/item/32/dark_prismarine.png) \ 
  /// [Dark Prismarine](https://minecraft.wiki/w/dark_prismarine) \ 
  /// _minecraft:dark_prismarine_
  static const Block dark_prismarine = Block('minecraft:dark_prismarine');

  /// ![dark_prismarine_slab](https://minecraftitemids.com/item/32/dark_prismarine_slab.png) \ 
  /// [Dark Prismarine Slab](https://minecraft.wiki/w/dark_prismarine_slab) \ 
  /// _minecraft:dark_prismarine_slab_
  static const Block dark_prismarine_slab = Block('minecraft:dark_prismarine_slab');

  /// ![dark_prismarine_stairs](https://minecraftitemids.com/item/32/dark_prismarine_stairs.png) \ 
  /// [Dark Prismarine Stairs](https://minecraft.wiki/w/dark_prismarine_stairs) \ 
  /// _minecraft:dark_prismarine_stairs_
  static const Block dark_prismarine_stairs = Block('minecraft:dark_prismarine_stairs');

  /// ![daylight_detector](https://minecraftitemids.com/item/32/daylight_detector.png) \ 
  /// [Daylight Detector](https://minecraft.wiki/w/daylight_detector) \ 
  /// _minecraft:daylight_detector_
  static const Block daylight_detector = Block('minecraft:daylight_detector');

  /// ![dead_brain_coral](https://minecraftitemids.com/item/32/dead_brain_coral.png) \ 
  /// [Dead Brain Coral](https://minecraft.wiki/w/dead_brain_coral) \ 
  /// _minecraft:dead_brain_coral_
  static const Block dead_brain_coral = Block('minecraft:dead_brain_coral');

  /// ![dead_brain_coral_block](https://minecraftitemids.com/item/32/dead_brain_coral_block.png) \ 
  /// [Dead Brain Coral Block](https://minecraft.wiki/w/dead_brain_coral_block) \ 
  /// _minecraft:dead_brain_coral_block_
  static const Block dead_brain_coral_block = Block('minecraft:dead_brain_coral_block');

  /// ![dead_brain_coral_fan](https://minecraftitemids.com/item/32/dead_brain_coral_fan.png) \ 
  /// [Dead Brain Coral Fan](https://minecraft.wiki/w/dead_brain_coral_fan) \ 
  /// _minecraft:dead_brain_coral_fan_
  static const Block dead_brain_coral_fan = Block('minecraft:dead_brain_coral_fan');

  /// ![dead_brain_coral_wall_fan](https://minecraftitemids.com/item/32/dead_brain_coral_wall_fan.png) \ 
  /// [Dead Brain Coral Wall Fan](https://minecraft.wiki/w/dead_brain_coral_wall_fan) \ 
  /// _minecraft:dead_brain_coral_wall_fan_
  static const Block dead_brain_coral_wall_fan = Block('minecraft:dead_brain_coral_wall_fan');

  /// ![dead_bubble_coral](https://minecraftitemids.com/item/32/dead_bubble_coral.png) \ 
  /// [Dead Bubble Coral](https://minecraft.wiki/w/dead_bubble_coral) \ 
  /// _minecraft:dead_bubble_coral_
  static const Block dead_bubble_coral = Block('minecraft:dead_bubble_coral');

  /// ![dead_bubble_coral_block](https://minecraftitemids.com/item/32/dead_bubble_coral_block.png) \ 
  /// [Dead Bubble Coral Block](https://minecraft.wiki/w/dead_bubble_coral_block) \ 
  /// _minecraft:dead_bubble_coral_block_
  static const Block dead_bubble_coral_block = Block('minecraft:dead_bubble_coral_block');

  /// ![dead_bubble_coral_fan](https://minecraftitemids.com/item/32/dead_bubble_coral_fan.png) \ 
  /// [Dead Bubble Coral Fan](https://minecraft.wiki/w/dead_bubble_coral_fan) \ 
  /// _minecraft:dead_bubble_coral_fan_
  static const Block dead_bubble_coral_fan = Block('minecraft:dead_bubble_coral_fan');

  /// ![dead_bubble_coral_wall_fan](https://minecraftitemids.com/item/32/dead_bubble_coral_wall_fan.png) \ 
  /// [Dead Bubble Coral Wall Fan](https://minecraft.wiki/w/dead_bubble_coral_wall_fan) \ 
  /// _minecraft:dead_bubble_coral_wall_fan_
  static const Block dead_bubble_coral_wall_fan = Block('minecraft:dead_bubble_coral_wall_fan');

  /// ![dead_bush](https://minecraftitemids.com/item/32/dead_bush.png) \ 
  /// [Dead Bush](https://minecraft.wiki/w/dead_bush) \ 
  /// _minecraft:dead_bush_
  static const Block dead_bush = Block('minecraft:dead_bush');

  /// ![dead_fire_coral](https://minecraftitemids.com/item/32/dead_fire_coral.png) \ 
  /// [Dead Fire Coral](https://minecraft.wiki/w/dead_fire_coral) \ 
  /// _minecraft:dead_fire_coral_
  static const Block dead_fire_coral = Block('minecraft:dead_fire_coral');

  /// ![dead_fire_coral_block](https://minecraftitemids.com/item/32/dead_fire_coral_block.png) \ 
  /// [Dead Fire Coral Block](https://minecraft.wiki/w/dead_fire_coral_block) \ 
  /// _minecraft:dead_fire_coral_block_
  static const Block dead_fire_coral_block = Block('minecraft:dead_fire_coral_block');

  /// ![dead_fire_coral_fan](https://minecraftitemids.com/item/32/dead_fire_coral_fan.png) \ 
  /// [Dead Fire Coral Fan](https://minecraft.wiki/w/dead_fire_coral_fan) \ 
  /// _minecraft:dead_fire_coral_fan_
  static const Block dead_fire_coral_fan = Block('minecraft:dead_fire_coral_fan');

  /// ![dead_fire_coral_wall_fan](https://minecraftitemids.com/item/32/dead_fire_coral_wall_fan.png) \ 
  /// [Dead Fire Coral Wall Fan](https://minecraft.wiki/w/dead_fire_coral_wall_fan) \ 
  /// _minecraft:dead_fire_coral_wall_fan_
  static const Block dead_fire_coral_wall_fan = Block('minecraft:dead_fire_coral_wall_fan');

  /// ![dead_horn_coral](https://minecraftitemids.com/item/32/dead_horn_coral.png) \ 
  /// [Dead Horn Coral](https://minecraft.wiki/w/dead_horn_coral) \ 
  /// _minecraft:dead_horn_coral_
  static const Block dead_horn_coral = Block('minecraft:dead_horn_coral');

  /// ![dead_horn_coral_block](https://minecraftitemids.com/item/32/dead_horn_coral_block.png) \ 
  /// [Dead Horn Coral Block](https://minecraft.wiki/w/dead_horn_coral_block) \ 
  /// _minecraft:dead_horn_coral_block_
  static const Block dead_horn_coral_block = Block('minecraft:dead_horn_coral_block');

  /// ![dead_horn_coral_fan](https://minecraftitemids.com/item/32/dead_horn_coral_fan.png) \ 
  /// [Dead Horn Coral Fan](https://minecraft.wiki/w/dead_horn_coral_fan) \ 
  /// _minecraft:dead_horn_coral_fan_
  static const Block dead_horn_coral_fan = Block('minecraft:dead_horn_coral_fan');

  /// ![dead_horn_coral_wall_fan](https://minecraftitemids.com/item/32/dead_horn_coral_wall_fan.png) \ 
  /// [Dead Horn Coral Wall Fan](https://minecraft.wiki/w/dead_horn_coral_wall_fan) \ 
  /// _minecraft:dead_horn_coral_wall_fan_
  static const Block dead_horn_coral_wall_fan = Block('minecraft:dead_horn_coral_wall_fan');

  /// ![dead_tube_coral](https://minecraftitemids.com/item/32/dead_tube_coral.png) \ 
  /// [Dead Tube Coral](https://minecraft.wiki/w/dead_tube_coral) \ 
  /// _minecraft:dead_tube_coral_
  static const Block dead_tube_coral = Block('minecraft:dead_tube_coral');

  /// ![dead_tube_coral_block](https://minecraftitemids.com/item/32/dead_tube_coral_block.png) \ 
  /// [Dead Tube Coral Block](https://minecraft.wiki/w/dead_tube_coral_block) \ 
  /// _minecraft:dead_tube_coral_block_
  static const Block dead_tube_coral_block = Block('minecraft:dead_tube_coral_block');

  /// ![dead_tube_coral_fan](https://minecraftitemids.com/item/32/dead_tube_coral_fan.png) \ 
  /// [Dead Tube Coral Fan](https://minecraft.wiki/w/dead_tube_coral_fan) \ 
  /// _minecraft:dead_tube_coral_fan_
  static const Block dead_tube_coral_fan = Block('minecraft:dead_tube_coral_fan');

  /// ![dead_tube_coral_wall_fan](https://minecraftitemids.com/item/32/dead_tube_coral_wall_fan.png) \ 
  /// [Dead Tube Coral Wall Fan](https://minecraft.wiki/w/dead_tube_coral_wall_fan) \ 
  /// _minecraft:dead_tube_coral_wall_fan_
  static const Block dead_tube_coral_wall_fan = Block('minecraft:dead_tube_coral_wall_fan');

  /// ![decorated_pot](https://minecraftitemids.com/item/32/decorated_pot.png) \ 
  /// [Decorated Pot](https://minecraft.wiki/w/decorated_pot) \ 
  /// _minecraft:decorated_pot_
  static const Block decorated_pot = Block('minecraft:decorated_pot');

  /// ![deepslate](https://minecraftitemids.com/item/32/deepslate.png) \ 
  /// [Deepslate](https://minecraft.wiki/w/deepslate) \ 
  /// _minecraft:deepslate_
  static const Block deepslate = Block('minecraft:deepslate');

  /// ![deepslate_brick_slab](https://minecraftitemids.com/item/32/deepslate_brick_slab.png) \ 
  /// [Deepslate Brick Slab](https://minecraft.wiki/w/deepslate_brick_slab) \ 
  /// _minecraft:deepslate_brick_slab_
  static const Block deepslate_brick_slab = Block('minecraft:deepslate_brick_slab');

  /// ![deepslate_brick_stairs](https://minecraftitemids.com/item/32/deepslate_brick_stairs.png) \ 
  /// [Deepslate Brick Stairs](https://minecraft.wiki/w/deepslate_brick_stairs) \ 
  /// _minecraft:deepslate_brick_stairs_
  static const Block deepslate_brick_stairs = Block('minecraft:deepslate_brick_stairs');

  /// ![deepslate_brick_wall](https://minecraftitemids.com/item/32/deepslate_brick_wall.png) \ 
  /// [Deepslate Brick Wall](https://minecraft.wiki/w/deepslate_brick_wall) \ 
  /// _minecraft:deepslate_brick_wall_
  static const Block deepslate_brick_wall = Block('minecraft:deepslate_brick_wall');

  /// ![deepslate_bricks](https://minecraftitemids.com/item/32/deepslate_bricks.png) \ 
  /// [Deepslate Bricks](https://minecraft.wiki/w/deepslate_bricks) \ 
  /// _minecraft:deepslate_bricks_
  static const Block deepslate_bricks = Block('minecraft:deepslate_bricks');

  /// ![deepslate_coal_ore](https://minecraftitemids.com/item/32/deepslate_coal_ore.png) \ 
  /// [Deepslate Coal Ore](https://minecraft.wiki/w/deepslate_coal_ore) \ 
  /// _minecraft:deepslate_coal_ore_
  static const Block deepslate_coal_ore = Block('minecraft:deepslate_coal_ore');

  /// ![deepslate_copper_ore](https://minecraftitemids.com/item/32/deepslate_copper_ore.png) \ 
  /// [Deepslate Copper Ore](https://minecraft.wiki/w/deepslate_copper_ore) \ 
  /// _minecraft:deepslate_copper_ore_
  static const Block deepslate_copper_ore = Block('minecraft:deepslate_copper_ore');

  /// ![deepslate_diamond_ore](https://minecraftitemids.com/item/32/deepslate_diamond_ore.png) \ 
  /// [Deepslate Diamond Ore](https://minecraft.wiki/w/deepslate_diamond_ore) \ 
  /// _minecraft:deepslate_diamond_ore_
  static const Block deepslate_diamond_ore = Block('minecraft:deepslate_diamond_ore');

  /// ![deepslate_emerald_ore](https://minecraftitemids.com/item/32/deepslate_emerald_ore.png) \ 
  /// [Deepslate Emerald Ore](https://minecraft.wiki/w/deepslate_emerald_ore) \ 
  /// _minecraft:deepslate_emerald_ore_
  static const Block deepslate_emerald_ore = Block('minecraft:deepslate_emerald_ore');

  /// ![deepslate_gold_ore](https://minecraftitemids.com/item/32/deepslate_gold_ore.png) \ 
  /// [Deepslate Gold Ore](https://minecraft.wiki/w/deepslate_gold_ore) \ 
  /// _minecraft:deepslate_gold_ore_
  static const Block deepslate_gold_ore = Block('minecraft:deepslate_gold_ore');

  /// ![deepslate_iron_ore](https://minecraftitemids.com/item/32/deepslate_iron_ore.png) \ 
  /// [Deepslate Iron Ore](https://minecraft.wiki/w/deepslate_iron_ore) \ 
  /// _minecraft:deepslate_iron_ore_
  static const Block deepslate_iron_ore = Block('minecraft:deepslate_iron_ore');

  /// ![deepslate_lapis_ore](https://minecraftitemids.com/item/32/deepslate_lapis_ore.png) \ 
  /// [Deepslate Lapis Ore](https://minecraft.wiki/w/deepslate_lapis_ore) \ 
  /// _minecraft:deepslate_lapis_ore_
  static const Block deepslate_lapis_ore = Block('minecraft:deepslate_lapis_ore');

  /// ![deepslate_redstone_ore](https://minecraftitemids.com/item/32/deepslate_redstone_ore.png) \ 
  /// [Deepslate Redstone Ore](https://minecraft.wiki/w/deepslate_redstone_ore) \ 
  /// _minecraft:deepslate_redstone_ore_
  static const Block deepslate_redstone_ore = Block('minecraft:deepslate_redstone_ore');

  /// ![deepslate_tile_slab](https://minecraftitemids.com/item/32/deepslate_tile_slab.png) \ 
  /// [Deepslate Tile Slab](https://minecraft.wiki/w/deepslate_tile_slab) \ 
  /// _minecraft:deepslate_tile_slab_
  static const Block deepslate_tile_slab = Block('minecraft:deepslate_tile_slab');

  /// ![deepslate_tile_stairs](https://minecraftitemids.com/item/32/deepslate_tile_stairs.png) \ 
  /// [Deepslate Tile Stairs](https://minecraft.wiki/w/deepslate_tile_stairs) \ 
  /// _minecraft:deepslate_tile_stairs_
  static const Block deepslate_tile_stairs = Block('minecraft:deepslate_tile_stairs');

  /// ![deepslate_tile_wall](https://minecraftitemids.com/item/32/deepslate_tile_wall.png) \ 
  /// [Deepslate Tile Wall](https://minecraft.wiki/w/deepslate_tile_wall) \ 
  /// _minecraft:deepslate_tile_wall_
  static const Block deepslate_tile_wall = Block('minecraft:deepslate_tile_wall');

  /// ![deepslate_tiles](https://minecraftitemids.com/item/32/deepslate_tiles.png) \ 
  /// [Deepslate Tiles](https://minecraft.wiki/w/deepslate_tiles) \ 
  /// _minecraft:deepslate_tiles_
  static const Block deepslate_tiles = Block('minecraft:deepslate_tiles');

  /// ![detector_rail](https://minecraftitemids.com/item/32/detector_rail.png) \ 
  /// [Detector Rail](https://minecraft.wiki/w/detector_rail) \ 
  /// _minecraft:detector_rail_
  static const Block detector_rail = Block('minecraft:detector_rail');

  /// ![diamond_block](https://minecraftitemids.com/item/32/diamond_block.png) \ 
  /// [Diamond Block](https://minecraft.wiki/w/diamond_block) \ 
  /// _minecraft:diamond_block_
  static const Block diamond_block = Block('minecraft:diamond_block');

  /// ![diamond_ore](https://minecraftitemids.com/item/32/diamond_ore.png) \ 
  /// [Diamond Ore](https://minecraft.wiki/w/diamond_ore) \ 
  /// _minecraft:diamond_ore_
  static const Block diamond_ore = Block('minecraft:diamond_ore');

  /// ![diorite](https://minecraftitemids.com/item/32/diorite.png) \ 
  /// [Diorite](https://minecraft.wiki/w/diorite) \ 
  /// _minecraft:diorite_
  static const Block diorite = Block('minecraft:diorite');

  /// ![diorite_slab](https://minecraftitemids.com/item/32/diorite_slab.png) \ 
  /// [Diorite Slab](https://minecraft.wiki/w/diorite_slab) \ 
  /// _minecraft:diorite_slab_
  static const Block diorite_slab = Block('minecraft:diorite_slab');

  /// ![diorite_stairs](https://minecraftitemids.com/item/32/diorite_stairs.png) \ 
  /// [Diorite Stairs](https://minecraft.wiki/w/diorite_stairs) \ 
  /// _minecraft:diorite_stairs_
  static const Block diorite_stairs = Block('minecraft:diorite_stairs');

  /// ![diorite_wall](https://minecraftitemids.com/item/32/diorite_wall.png) \ 
  /// [Diorite Wall](https://minecraft.wiki/w/diorite_wall) \ 
  /// _minecraft:diorite_wall_
  static const Block diorite_wall = Block('minecraft:diorite_wall');

  /// ![dirt](https://minecraftitemids.com/item/32/dirt.png) \ 
  /// [Dirt](https://minecraft.wiki/w/dirt) \ 
  /// _minecraft:dirt_
  static const Block dirt = Block('minecraft:dirt');

  /// ![dirt_path](https://minecraftitemids.com/item/32/dirt_path.png) \ 
  /// [Dirt Path](https://minecraft.wiki/w/dirt_path) \ 
  /// _minecraft:dirt_path_
  static const Block dirt_path = Block('minecraft:dirt_path');

  /// ![dispenser](https://minecraftitemids.com/item/32/dispenser.png) \ 
  /// [Dispenser](https://minecraft.wiki/w/dispenser) \ 
  /// _minecraft:dispenser_
  static const Block dispenser = Block('minecraft:dispenser');

  /// ![dragon_egg](https://minecraftitemids.com/item/32/dragon_egg.png) \ 
  /// [Dragon Egg](https://minecraft.wiki/w/dragon_egg) \ 
  /// _minecraft:dragon_egg_
  static const Block dragon_egg = Block('minecraft:dragon_egg');

  /// ![dragon_head](https://minecraftitemids.com/item/32/dragon_head.png) \ 
  /// [Dragon Head](https://minecraft.wiki/w/dragon_head) \ 
  /// _minecraft:dragon_head_
  static const Block dragon_head = Block('minecraft:dragon_head');

  /// ![dragon_wall_head](https://minecraftitemids.com/item/32/dragon_wall_head.png) \ 
  /// [Dragon Wall Head](https://minecraft.wiki/w/dragon_wall_head) \ 
  /// _minecraft:dragon_wall_head_
  static const Block dragon_wall_head = Block('minecraft:dragon_wall_head');

  /// ![dried_kelp_block](https://minecraftitemids.com/item/32/dried_kelp_block.png) \ 
  /// [Dried Kelp Block](https://minecraft.wiki/w/dried_kelp_block) \ 
  /// _minecraft:dried_kelp_block_
  static const Block dried_kelp_block = Block('minecraft:dried_kelp_block');

  /// ![dripstone_block](https://minecraftitemids.com/item/32/dripstone_block.png) \ 
  /// [Dripstone Block](https://minecraft.wiki/w/dripstone_block) \ 
  /// _minecraft:dripstone_block_
  static const Block dripstone_block = Block('minecraft:dripstone_block');

  /// ![dropper](https://minecraftitemids.com/item/32/dropper.png) \ 
  /// [Dropper](https://minecraft.wiki/w/dropper) \ 
  /// _minecraft:dropper_
  static const Block dropper = Block('minecraft:dropper');

  /// ![emerald_block](https://minecraftitemids.com/item/32/emerald_block.png) \ 
  /// [Emerald Block](https://minecraft.wiki/w/emerald_block) \ 
  /// _minecraft:emerald_block_
  static const Block emerald_block = Block('minecraft:emerald_block');

  /// ![emerald_ore](https://minecraftitemids.com/item/32/emerald_ore.png) \ 
  /// [Emerald Ore](https://minecraft.wiki/w/emerald_ore) \ 
  /// _minecraft:emerald_ore_
  static const Block emerald_ore = Block('minecraft:emerald_ore');

  /// ![enchanting_table](https://minecraftitemids.com/item/32/enchanting_table.png) \ 
  /// [Enchanting Table](https://minecraft.wiki/w/enchanting_table) \ 
  /// _minecraft:enchanting_table_
  static const Block enchanting_table = Block('minecraft:enchanting_table');

  /// ![end_gateway](https://minecraftitemids.com/item/32/end_gateway.png) \ 
  /// [End Gateway](https://minecraft.wiki/w/end_gateway) \ 
  /// _minecraft:end_gateway_
  static const Block end_gateway = Block('minecraft:end_gateway');

  /// ![end_portal](https://minecraftitemids.com/item/32/end_portal.png) \ 
  /// [End Portal](https://minecraft.wiki/w/end_portal) \ 
  /// _minecraft:end_portal_
  static const Block end_portal = Block('minecraft:end_portal');

  /// ![end_portal_frame](https://minecraftitemids.com/item/32/end_portal_frame.png) \ 
  /// [End Portal Frame](https://minecraft.wiki/w/end_portal_frame) \ 
  /// _minecraft:end_portal_frame_
  static const Block end_portal_frame = Block('minecraft:end_portal_frame');

  /// ![end_rod](https://minecraftitemids.com/item/32/end_rod.png) \ 
  /// [End Rod](https://minecraft.wiki/w/end_rod) \ 
  /// _minecraft:end_rod_
  static const Block end_rod = Block('minecraft:end_rod');

  /// ![end_stone](https://minecraftitemids.com/item/32/end_stone.png) \ 
  /// [End Stone](https://minecraft.wiki/w/end_stone) \ 
  /// _minecraft:end_stone_
  static const Block end_stone = Block('minecraft:end_stone');

  /// ![end_stone_brick_slab](https://minecraftitemids.com/item/32/end_stone_brick_slab.png) \ 
  /// [End Stone Brick Slab](https://minecraft.wiki/w/end_stone_brick_slab) \ 
  /// _minecraft:end_stone_brick_slab_
  static const Block end_stone_brick_slab = Block('minecraft:end_stone_brick_slab');

  /// ![end_stone_brick_stairs](https://minecraftitemids.com/item/32/end_stone_brick_stairs.png) \ 
  /// [End Stone Brick Stairs](https://minecraft.wiki/w/end_stone_brick_stairs) \ 
  /// _minecraft:end_stone_brick_stairs_
  static const Block end_stone_brick_stairs = Block('minecraft:end_stone_brick_stairs');

  /// ![end_stone_brick_wall](https://minecraftitemids.com/item/32/end_stone_brick_wall.png) \ 
  /// [End Stone Brick Wall](https://minecraft.wiki/w/end_stone_brick_wall) \ 
  /// _minecraft:end_stone_brick_wall_
  static const Block end_stone_brick_wall = Block('minecraft:end_stone_brick_wall');

  /// ![end_stone_bricks](https://minecraftitemids.com/item/32/end_stone_bricks.png) \ 
  /// [End Stone Bricks](https://minecraft.wiki/w/end_stone_bricks) \ 
  /// _minecraft:end_stone_bricks_
  static const Block end_stone_bricks = Block('minecraft:end_stone_bricks');

  /// ![ender_chest](https://minecraftitemids.com/item/32/ender_chest.png) \ 
  /// [Ender Chest](https://minecraft.wiki/w/ender_chest) \ 
  /// _minecraft:ender_chest_
  static const Block ender_chest = Block('minecraft:ender_chest');

  /// ![exposed_chiseled_copper](https://minecraftitemids.com/item/32/exposed_chiseled_copper.png) \ 
  /// [Exposed Chiseled Copper](https://minecraft.wiki/w/exposed_chiseled_copper) \ 
  /// _minecraft:exposed_chiseled_copper_
  static const Block exposed_chiseled_copper = Block('minecraft:exposed_chiseled_copper');

  /// ![exposed_copper](https://minecraftitemids.com/item/32/exposed_copper.png) \ 
  /// [Exposed Copper](https://minecraft.wiki/w/exposed_copper) \ 
  /// _minecraft:exposed_copper_
  static const Block exposed_copper = Block('minecraft:exposed_copper');

  /// ![exposed_copper_bulb](https://minecraftitemids.com/item/32/exposed_copper_bulb.png) \ 
  /// [Exposed Copper Bulb](https://minecraft.wiki/w/exposed_copper_bulb) \ 
  /// _minecraft:exposed_copper_bulb_
  static const Block exposed_copper_bulb = Block('minecraft:exposed_copper_bulb');

  /// ![exposed_copper_door](https://minecraftitemids.com/item/32/exposed_copper_door.png) \ 
  /// [Exposed Copper Door](https://minecraft.wiki/w/exposed_copper_door) \ 
  /// _minecraft:exposed_copper_door_
  static const Block exposed_copper_door = Block('minecraft:exposed_copper_door');

  /// ![exposed_copper_grate](https://minecraftitemids.com/item/32/exposed_copper_grate.png) \ 
  /// [Exposed Copper Grate](https://minecraft.wiki/w/exposed_copper_grate) \ 
  /// _minecraft:exposed_copper_grate_
  static const Block exposed_copper_grate = Block('minecraft:exposed_copper_grate');

  /// ![exposed_copper_trapdoor](https://minecraftitemids.com/item/32/exposed_copper_trapdoor.png) \ 
  /// [Exposed Copper Trapdoor](https://minecraft.wiki/w/exposed_copper_trapdoor) \ 
  /// _minecraft:exposed_copper_trapdoor_
  static const Block exposed_copper_trapdoor = Block('minecraft:exposed_copper_trapdoor');

  /// ![exposed_cut_copper](https://minecraftitemids.com/item/32/exposed_cut_copper.png) \ 
  /// [Exposed Cut Copper](https://minecraft.wiki/w/exposed_cut_copper) \ 
  /// _minecraft:exposed_cut_copper_
  static const Block exposed_cut_copper = Block('minecraft:exposed_cut_copper');

  /// ![exposed_cut_copper_slab](https://minecraftitemids.com/item/32/exposed_cut_copper_slab.png) \ 
  /// [Exposed Cut Copper Slab](https://minecraft.wiki/w/exposed_cut_copper_slab) \ 
  /// _minecraft:exposed_cut_copper_slab_
  static const Block exposed_cut_copper_slab = Block('minecraft:exposed_cut_copper_slab');

  /// ![exposed_cut_copper_stairs](https://minecraftitemids.com/item/32/exposed_cut_copper_stairs.png) \ 
  /// [Exposed Cut Copper Stairs](https://minecraft.wiki/w/exposed_cut_copper_stairs) \ 
  /// _minecraft:exposed_cut_copper_stairs_
  static const Block exposed_cut_copper_stairs = Block('minecraft:exposed_cut_copper_stairs');

  /// ![farmland](https://minecraftitemids.com/item/32/farmland.png) \ 
  /// [Farmland](https://minecraft.wiki/w/farmland) \ 
  /// _minecraft:farmland_
  static const Block farmland = Block('minecraft:farmland');

  /// ![fern](https://minecraftitemids.com/item/32/fern.png) \ 
  /// [Fern](https://minecraft.wiki/w/fern) \ 
  /// _minecraft:fern_
  static const Block fern = Block('minecraft:fern');

  /// ![fire](https://minecraftitemids.com/item/32/fire.png) \ 
  /// [Fire](https://minecraft.wiki/w/fire) \ 
  /// _minecraft:fire_
  static const Block fire = Block('minecraft:fire');

  /// ![fire_coral](https://minecraftitemids.com/item/32/fire_coral.png) \ 
  /// [Fire Coral](https://minecraft.wiki/w/fire_coral) \ 
  /// _minecraft:fire_coral_
  static const Block fire_coral = Block('minecraft:fire_coral');

  /// ![fire_coral_block](https://minecraftitemids.com/item/32/fire_coral_block.png) \ 
  /// [Fire Coral Block](https://minecraft.wiki/w/fire_coral_block) \ 
  /// _minecraft:fire_coral_block_
  static const Block fire_coral_block = Block('minecraft:fire_coral_block');

  /// ![fire_coral_fan](https://minecraftitemids.com/item/32/fire_coral_fan.png) \ 
  /// [Fire Coral Fan](https://minecraft.wiki/w/fire_coral_fan) \ 
  /// _minecraft:fire_coral_fan_
  static const Block fire_coral_fan = Block('minecraft:fire_coral_fan');

  /// ![fire_coral_wall_fan](https://minecraftitemids.com/item/32/fire_coral_wall_fan.png) \ 
  /// [Fire Coral Wall Fan](https://minecraft.wiki/w/fire_coral_wall_fan) \ 
  /// _minecraft:fire_coral_wall_fan_
  static const Block fire_coral_wall_fan = Block('minecraft:fire_coral_wall_fan');

  /// ![fletching_table](https://minecraftitemids.com/item/32/fletching_table.png) \ 
  /// [Fletching Table](https://minecraft.wiki/w/fletching_table) \ 
  /// _minecraft:fletching_table_
  static const Block fletching_table = Block('minecraft:fletching_table');

  /// ![flower_pot](https://minecraftitemids.com/item/32/flower_pot.png) \ 
  /// [Flower Pot](https://minecraft.wiki/w/flower_pot) \ 
  /// _minecraft:flower_pot_
  static const Block flower_pot = Block('minecraft:flower_pot');

  /// ![flowering_azalea](https://minecraftitemids.com/item/32/flowering_azalea.png) \ 
  /// [Flowering Azalea](https://minecraft.wiki/w/flowering_azalea) \ 
  /// _minecraft:flowering_azalea_
  static const Block flowering_azalea = Block('minecraft:flowering_azalea');

  /// ![flowering_azalea_leaves](https://minecraftitemids.com/item/32/flowering_azalea_leaves.png) \ 
  /// [Flowering Azalea Leaves](https://minecraft.wiki/w/flowering_azalea_leaves) \ 
  /// _minecraft:flowering_azalea_leaves_
  static const Block flowering_azalea_leaves = Block('minecraft:flowering_azalea_leaves');

  /// ![frogspawn](https://minecraftitemids.com/item/32/frogspawn.png) \ 
  /// [Frogspawn](https://minecraft.wiki/w/frogspawn) \ 
  /// _minecraft:frogspawn_
  static const Block frogspawn = Block('minecraft:frogspawn');

  /// ![frosted_ice](https://minecraftitemids.com/item/32/frosted_ice.png) \ 
  /// [Frosted Ice](https://minecraft.wiki/w/frosted_ice) \ 
  /// _minecraft:frosted_ice_
  static const Block frosted_ice = Block('minecraft:frosted_ice');

  /// ![furnace](https://minecraftitemids.com/item/32/furnace.png) \ 
  /// [Furnace](https://minecraft.wiki/w/furnace) \ 
  /// _minecraft:furnace_
  static const Block furnace = Block('minecraft:furnace');

  /// ![gilded_blackstone](https://minecraftitemids.com/item/32/gilded_blackstone.png) \ 
  /// [Gilded Blackstone](https://minecraft.wiki/w/gilded_blackstone) \ 
  /// _minecraft:gilded_blackstone_
  static const Block gilded_blackstone = Block('minecraft:gilded_blackstone');

  /// ![glass](https://minecraftitemids.com/item/32/glass.png) \ 
  /// [Glass](https://minecraft.wiki/w/glass) \ 
  /// _minecraft:glass_
  static const Block glass = Block('minecraft:glass');

  /// ![glass_pane](https://minecraftitemids.com/item/32/glass_pane.png) \ 
  /// [Glass Pane](https://minecraft.wiki/w/glass_pane) \ 
  /// _minecraft:glass_pane_
  static const Block glass_pane = Block('minecraft:glass_pane');

  /// ![glow_lichen](https://minecraftitemids.com/item/32/glow_lichen.png) \ 
  /// [Glow Lichen](https://minecraft.wiki/w/glow_lichen) \ 
  /// _minecraft:glow_lichen_
  static const Block glow_lichen = Block('minecraft:glow_lichen');

  /// ![glowstone](https://minecraftitemids.com/item/32/glowstone.png) \ 
  /// [Glowstone](https://minecraft.wiki/w/glowstone) \ 
  /// _minecraft:glowstone_
  static const Block glowstone = Block('minecraft:glowstone');

  /// ![gold_block](https://minecraftitemids.com/item/32/gold_block.png) \ 
  /// [Gold Block](https://minecraft.wiki/w/gold_block) \ 
  /// _minecraft:gold_block_
  static const Block gold_block = Block('minecraft:gold_block');

  /// ![gold_ore](https://minecraftitemids.com/item/32/gold_ore.png) \ 
  /// [Gold Ore](https://minecraft.wiki/w/gold_ore) \ 
  /// _minecraft:gold_ore_
  static const Block gold_ore = Block('minecraft:gold_ore');

  /// ![granite](https://minecraftitemids.com/item/32/granite.png) \ 
  /// [Granite](https://minecraft.wiki/w/granite) \ 
  /// _minecraft:granite_
  static const Block granite = Block('minecraft:granite');

  /// ![granite_slab](https://minecraftitemids.com/item/32/granite_slab.png) \ 
  /// [Granite Slab](https://minecraft.wiki/w/granite_slab) \ 
  /// _minecraft:granite_slab_
  static const Block granite_slab = Block('minecraft:granite_slab');

  /// ![granite_stairs](https://minecraftitemids.com/item/32/granite_stairs.png) \ 
  /// [Granite Stairs](https://minecraft.wiki/w/granite_stairs) \ 
  /// _minecraft:granite_stairs_
  static const Block granite_stairs = Block('minecraft:granite_stairs');

  /// ![granite_wall](https://minecraftitemids.com/item/32/granite_wall.png) \ 
  /// [Granite Wall](https://minecraft.wiki/w/granite_wall) \ 
  /// _minecraft:granite_wall_
  static const Block granite_wall = Block('minecraft:granite_wall');

  /// ![grass_block](https://minecraftitemids.com/item/32/grass_block.png) \ 
  /// [Grass Block](https://minecraft.wiki/w/grass_block) \ 
  /// _minecraft:grass_block_
  static const Block grass_block = Block('minecraft:grass_block');

  /// ![gravel](https://minecraftitemids.com/item/32/gravel.png) \ 
  /// [Gravel](https://minecraft.wiki/w/gravel) \ 
  /// _minecraft:gravel_
  static const Block gravel = Block('minecraft:gravel');

  /// ![gray_banner](https://minecraftitemids.com/item/32/gray_banner.png) \ 
  /// [Gray Banner](https://minecraft.wiki/w/gray_banner) \ 
  /// _minecraft:gray_banner_
  static const Block gray_banner = Block('minecraft:gray_banner');

  /// ![gray_bed](https://minecraftitemids.com/item/32/gray_bed.png) \ 
  /// [Gray Bed](https://minecraft.wiki/w/gray_bed) \ 
  /// _minecraft:gray_bed_
  static const Block gray_bed = Block('minecraft:gray_bed');

  /// ![gray_candle](https://minecraftitemids.com/item/32/gray_candle.png) \ 
  /// [Gray Candle](https://minecraft.wiki/w/gray_candle) \ 
  /// _minecraft:gray_candle_
  static const Block gray_candle = Block('minecraft:gray_candle');

  /// ![gray_candle_cake](https://minecraftitemids.com/item/32/gray_candle_cake.png) \ 
  /// [Gray Candle Cake](https://minecraft.wiki/w/gray_candle_cake) \ 
  /// _minecraft:gray_candle_cake_
  static const Block gray_candle_cake = Block('minecraft:gray_candle_cake');

  /// ![gray_carpet](https://minecraftitemids.com/item/32/gray_carpet.png) \ 
  /// [Gray Carpet](https://minecraft.wiki/w/gray_carpet) \ 
  /// _minecraft:gray_carpet_
  static const Block gray_carpet = Block('minecraft:gray_carpet');

  /// ![gray_concrete](https://minecraftitemids.com/item/32/gray_concrete.png) \ 
  /// [Gray Concrete](https://minecraft.wiki/w/gray_concrete) \ 
  /// _minecraft:gray_concrete_
  static const Block gray_concrete = Block('minecraft:gray_concrete');

  /// ![gray_concrete_powder](https://minecraftitemids.com/item/32/gray_concrete_powder.png) \ 
  /// [Gray Concrete Powder](https://minecraft.wiki/w/gray_concrete_powder) \ 
  /// _minecraft:gray_concrete_powder_
  static const Block gray_concrete_powder = Block('minecraft:gray_concrete_powder');

  /// ![gray_glazed_terracotta](https://minecraftitemids.com/item/32/gray_glazed_terracotta.png) \ 
  /// [Gray Glazed Terracotta](https://minecraft.wiki/w/gray_glazed_terracotta) \ 
  /// _minecraft:gray_glazed_terracotta_
  static const Block gray_glazed_terracotta = Block('minecraft:gray_glazed_terracotta');

  /// ![gray_shulker_box](https://minecraftitemids.com/item/32/gray_shulker_box.png) \ 
  /// [Gray Shulker Box](https://minecraft.wiki/w/gray_shulker_box) \ 
  /// _minecraft:gray_shulker_box_
  static const Block gray_shulker_box = Block('minecraft:gray_shulker_box');

  /// ![gray_stained_glass](https://minecraftitemids.com/item/32/gray_stained_glass.png) \ 
  /// [Gray Stained Glass](https://minecraft.wiki/w/gray_stained_glass) \ 
  /// _minecraft:gray_stained_glass_
  static const Block gray_stained_glass = Block('minecraft:gray_stained_glass');

  /// ![gray_stained_glass_pane](https://minecraftitemids.com/item/32/gray_stained_glass_pane.png) \ 
  /// [Gray Stained Glass Pane](https://minecraft.wiki/w/gray_stained_glass_pane) \ 
  /// _minecraft:gray_stained_glass_pane_
  static const Block gray_stained_glass_pane = Block('minecraft:gray_stained_glass_pane');

  /// ![gray_terracotta](https://minecraftitemids.com/item/32/gray_terracotta.png) \ 
  /// [Gray Terracotta](https://minecraft.wiki/w/gray_terracotta) \ 
  /// _minecraft:gray_terracotta_
  static const Block gray_terracotta = Block('minecraft:gray_terracotta');

  /// ![gray_wall_banner](https://minecraftitemids.com/item/32/gray_wall_banner.png) \ 
  /// [Gray Wall Banner](https://minecraft.wiki/w/gray_wall_banner) \ 
  /// _minecraft:gray_wall_banner_
  static const Block gray_wall_banner = Block('minecraft:gray_wall_banner');

  /// ![gray_wool](https://minecraftitemids.com/item/32/gray_wool.png) \ 
  /// [Gray Wool](https://minecraft.wiki/w/gray_wool) \ 
  /// _minecraft:gray_wool_
  static const Block gray_wool = Block('minecraft:gray_wool');

  /// ![green_banner](https://minecraftitemids.com/item/32/green_banner.png) \ 
  /// [Green Banner](https://minecraft.wiki/w/green_banner) \ 
  /// _minecraft:green_banner_
  static const Block green_banner = Block('minecraft:green_banner');

  /// ![green_bed](https://minecraftitemids.com/item/32/green_bed.png) \ 
  /// [Green Bed](https://minecraft.wiki/w/green_bed) \ 
  /// _minecraft:green_bed_
  static const Block green_bed = Block('minecraft:green_bed');

  /// ![green_candle](https://minecraftitemids.com/item/32/green_candle.png) \ 
  /// [Green Candle](https://minecraft.wiki/w/green_candle) \ 
  /// _minecraft:green_candle_
  static const Block green_candle = Block('minecraft:green_candle');

  /// ![green_candle_cake](https://minecraftitemids.com/item/32/green_candle_cake.png) \ 
  /// [Green Candle Cake](https://minecraft.wiki/w/green_candle_cake) \ 
  /// _minecraft:green_candle_cake_
  static const Block green_candle_cake = Block('minecraft:green_candle_cake');

  /// ![green_carpet](https://minecraftitemids.com/item/32/green_carpet.png) \ 
  /// [Green Carpet](https://minecraft.wiki/w/green_carpet) \ 
  /// _minecraft:green_carpet_
  static const Block green_carpet = Block('minecraft:green_carpet');

  /// ![green_concrete](https://minecraftitemids.com/item/32/green_concrete.png) \ 
  /// [Green Concrete](https://minecraft.wiki/w/green_concrete) \ 
  /// _minecraft:green_concrete_
  static const Block green_concrete = Block('minecraft:green_concrete');

  /// ![green_concrete_powder](https://minecraftitemids.com/item/32/green_concrete_powder.png) \ 
  /// [Green Concrete Powder](https://minecraft.wiki/w/green_concrete_powder) \ 
  /// _minecraft:green_concrete_powder_
  static const Block green_concrete_powder = Block('minecraft:green_concrete_powder');

  /// ![green_glazed_terracotta](https://minecraftitemids.com/item/32/green_glazed_terracotta.png) \ 
  /// [Green Glazed Terracotta](https://minecraft.wiki/w/green_glazed_terracotta) \ 
  /// _minecraft:green_glazed_terracotta_
  static const Block green_glazed_terracotta = Block('minecraft:green_glazed_terracotta');

  /// ![green_shulker_box](https://minecraftitemids.com/item/32/green_shulker_box.png) \ 
  /// [Green Shulker Box](https://minecraft.wiki/w/green_shulker_box) \ 
  /// _minecraft:green_shulker_box_
  static const Block green_shulker_box = Block('minecraft:green_shulker_box');

  /// ![green_stained_glass](https://minecraftitemids.com/item/32/green_stained_glass.png) \ 
  /// [Green Stained Glass](https://minecraft.wiki/w/green_stained_glass) \ 
  /// _minecraft:green_stained_glass_
  static const Block green_stained_glass = Block('minecraft:green_stained_glass');

  /// ![green_stained_glass_pane](https://minecraftitemids.com/item/32/green_stained_glass_pane.png) \ 
  /// [Green Stained Glass Pane](https://minecraft.wiki/w/green_stained_glass_pane) \ 
  /// _minecraft:green_stained_glass_pane_
  static const Block green_stained_glass_pane = Block('minecraft:green_stained_glass_pane');

  /// ![green_terracotta](https://minecraftitemids.com/item/32/green_terracotta.png) \ 
  /// [Green Terracotta](https://minecraft.wiki/w/green_terracotta) \ 
  /// _minecraft:green_terracotta_
  static const Block green_terracotta = Block('minecraft:green_terracotta');

  /// ![green_wall_banner](https://minecraftitemids.com/item/32/green_wall_banner.png) \ 
  /// [Green Wall Banner](https://minecraft.wiki/w/green_wall_banner) \ 
  /// _minecraft:green_wall_banner_
  static const Block green_wall_banner = Block('minecraft:green_wall_banner');

  /// ![green_wool](https://minecraftitemids.com/item/32/green_wool.png) \ 
  /// [Green Wool](https://minecraft.wiki/w/green_wool) \ 
  /// _minecraft:green_wool_
  static const Block green_wool = Block('minecraft:green_wool');

  /// ![grindstone](https://minecraftitemids.com/item/32/grindstone.png) \ 
  /// [Grindstone](https://minecraft.wiki/w/grindstone) \ 
  /// _minecraft:grindstone_
  static const Block grindstone = Block('minecraft:grindstone');

  /// ![hanging_roots](https://minecraftitemids.com/item/32/hanging_roots.png) \ 
  /// [Hanging Roots](https://minecraft.wiki/w/hanging_roots) \ 
  /// _minecraft:hanging_roots_
  static const Block hanging_roots = Block('minecraft:hanging_roots');

  /// ![hay_block](https://minecraftitemids.com/item/32/hay_block.png) \ 
  /// [Hay Block](https://minecraft.wiki/w/hay_block) \ 
  /// _minecraft:hay_block_
  static const Block hay_block = Block('minecraft:hay_block');

  /// ![heavy_weighted_pressure_plate](https://minecraftitemids.com/item/32/heavy_weighted_pressure_plate.png) \ 
  /// [Heavy Weighted Pressure Plate](https://minecraft.wiki/w/heavy_weighted_pressure_plate) \ 
  /// _minecraft:heavy_weighted_pressure_plate_
  static const Block heavy_weighted_pressure_plate = Block('minecraft:heavy_weighted_pressure_plate');

  /// ![honey_block](https://minecraftitemids.com/item/32/honey_block.png) \ 
  /// [Honey Block](https://minecraft.wiki/w/honey_block) \ 
  /// _minecraft:honey_block_
  static const Block honey_block = Block('minecraft:honey_block');

  /// ![honeycomb_block](https://minecraftitemids.com/item/32/honeycomb_block.png) \ 
  /// [Honeycomb Block](https://minecraft.wiki/w/honeycomb_block) \ 
  /// _minecraft:honeycomb_block_
  static const Block honeycomb_block = Block('minecraft:honeycomb_block');

  /// ![hopper](https://minecraftitemids.com/item/32/hopper.png) \ 
  /// [Hopper](https://minecraft.wiki/w/hopper) \ 
  /// _minecraft:hopper_
  static const Block hopper = Block('minecraft:hopper');

  /// ![horn_coral](https://minecraftitemids.com/item/32/horn_coral.png) \ 
  /// [Horn Coral](https://minecraft.wiki/w/horn_coral) \ 
  /// _minecraft:horn_coral_
  static const Block horn_coral = Block('minecraft:horn_coral');

  /// ![horn_coral_block](https://minecraftitemids.com/item/32/horn_coral_block.png) \ 
  /// [Horn Coral Block](https://minecraft.wiki/w/horn_coral_block) \ 
  /// _minecraft:horn_coral_block_
  static const Block horn_coral_block = Block('minecraft:horn_coral_block');

  /// ![horn_coral_fan](https://minecraftitemids.com/item/32/horn_coral_fan.png) \ 
  /// [Horn Coral Fan](https://minecraft.wiki/w/horn_coral_fan) \ 
  /// _minecraft:horn_coral_fan_
  static const Block horn_coral_fan = Block('minecraft:horn_coral_fan');

  /// ![horn_coral_wall_fan](https://minecraftitemids.com/item/32/horn_coral_wall_fan.png) \ 
  /// [Horn Coral Wall Fan](https://minecraft.wiki/w/horn_coral_wall_fan) \ 
  /// _minecraft:horn_coral_wall_fan_
  static const Block horn_coral_wall_fan = Block('minecraft:horn_coral_wall_fan');

  /// ![ice](https://minecraftitemids.com/item/32/ice.png) \ 
  /// [Ice](https://minecraft.wiki/w/ice) \ 
  /// _minecraft:ice_
  static const Block ice = Block('minecraft:ice');

  /// ![infested_chiseled_stone_bricks](https://minecraftitemids.com/item/32/infested_chiseled_stone_bricks.png) \ 
  /// [Infested Chiseled Stone Bricks](https://minecraft.wiki/w/infested_chiseled_stone_bricks) \ 
  /// _minecraft:infested_chiseled_stone_bricks_
  static const Block infested_chiseled_stone_bricks = Block('minecraft:infested_chiseled_stone_bricks');

  /// ![infested_cobblestone](https://minecraftitemids.com/item/32/infested_cobblestone.png) \ 
  /// [Infested Cobblestone](https://minecraft.wiki/w/infested_cobblestone) \ 
  /// _minecraft:infested_cobblestone_
  static const Block infested_cobblestone = Block('minecraft:infested_cobblestone');

  /// ![infested_cracked_stone_bricks](https://minecraftitemids.com/item/32/infested_cracked_stone_bricks.png) \ 
  /// [Infested Cracked Stone Bricks](https://minecraft.wiki/w/infested_cracked_stone_bricks) \ 
  /// _minecraft:infested_cracked_stone_bricks_
  static const Block infested_cracked_stone_bricks = Block('minecraft:infested_cracked_stone_bricks');

  /// ![infested_deepslate](https://minecraftitemids.com/item/32/infested_deepslate.png) \ 
  /// [Infested Deepslate](https://minecraft.wiki/w/infested_deepslate) \ 
  /// _minecraft:infested_deepslate_
  static const Block infested_deepslate = Block('minecraft:infested_deepslate');

  /// ![infested_mossy_stone_bricks](https://minecraftitemids.com/item/32/infested_mossy_stone_bricks.png) \ 
  /// [Infested Mossy Stone Bricks](https://minecraft.wiki/w/infested_mossy_stone_bricks) \ 
  /// _minecraft:infested_mossy_stone_bricks_
  static const Block infested_mossy_stone_bricks = Block('minecraft:infested_mossy_stone_bricks');

  /// ![infested_stone](https://minecraftitemids.com/item/32/infested_stone.png) \ 
  /// [Infested Stone](https://minecraft.wiki/w/infested_stone) \ 
  /// _minecraft:infested_stone_
  static const Block infested_stone = Block('minecraft:infested_stone');

  /// ![infested_stone_bricks](https://minecraftitemids.com/item/32/infested_stone_bricks.png) \ 
  /// [Infested Stone Bricks](https://minecraft.wiki/w/infested_stone_bricks) \ 
  /// _minecraft:infested_stone_bricks_
  static const Block infested_stone_bricks = Block('minecraft:infested_stone_bricks');

  /// ![iron_bars](https://minecraftitemids.com/item/32/iron_bars.png) \ 
  /// [Iron Bars](https://minecraft.wiki/w/iron_bars) \ 
  /// _minecraft:iron_bars_
  static const Block iron_bars = Block('minecraft:iron_bars');

  /// ![iron_block](https://minecraftitemids.com/item/32/iron_block.png) \ 
  /// [Iron Block](https://minecraft.wiki/w/iron_block) \ 
  /// _minecraft:iron_block_
  static const Block iron_block = Block('minecraft:iron_block');

  /// ![iron_door](https://minecraftitemids.com/item/32/iron_door.png) \ 
  /// [Iron Door](https://minecraft.wiki/w/iron_door) \ 
  /// _minecraft:iron_door_
  static const Block iron_door = Block('minecraft:iron_door');

  /// ![iron_ore](https://minecraftitemids.com/item/32/iron_ore.png) \ 
  /// [Iron Ore](https://minecraft.wiki/w/iron_ore) \ 
  /// _minecraft:iron_ore_
  static const Block iron_ore = Block('minecraft:iron_ore');

  /// ![iron_trapdoor](https://minecraftitemids.com/item/32/iron_trapdoor.png) \ 
  /// [Iron Trapdoor](https://minecraft.wiki/w/iron_trapdoor) \ 
  /// _minecraft:iron_trapdoor_
  static const Block iron_trapdoor = Block('minecraft:iron_trapdoor');

  /// ![jack_o_lantern](https://minecraftitemids.com/item/32/jack_o_lantern.png) \ 
  /// [Jack O Lantern](https://minecraft.wiki/w/jack_o_lantern) \ 
  /// _minecraft:jack_o_lantern_
  static const Block jack_o_lantern = Block('minecraft:jack_o_lantern');

  /// ![jigsaw](https://minecraftitemids.com/item/32/jigsaw.png) \ 
  /// [Jigsaw](https://minecraft.wiki/w/jigsaw) \ 
  /// _minecraft:jigsaw_
  static const Block jigsaw = Block('minecraft:jigsaw');

  /// ![jukebox](https://minecraftitemids.com/item/32/jukebox.png) \ 
  /// [Jukebox](https://minecraft.wiki/w/jukebox) \ 
  /// _minecraft:jukebox_
  static const Block jukebox = Block('minecraft:jukebox');

  /// ![jungle_button](https://minecraftitemids.com/item/32/jungle_button.png) \ 
  /// [Jungle Button](https://minecraft.wiki/w/jungle_button) \ 
  /// _minecraft:jungle_button_
  static const Block jungle_button = Block('minecraft:jungle_button');

  /// ![jungle_door](https://minecraftitemids.com/item/32/jungle_door.png) \ 
  /// [Jungle Door](https://minecraft.wiki/w/jungle_door) \ 
  /// _minecraft:jungle_door_
  static const Block jungle_door = Block('minecraft:jungle_door');

  /// ![jungle_fence](https://minecraftitemids.com/item/32/jungle_fence.png) \ 
  /// [Jungle Fence](https://minecraft.wiki/w/jungle_fence) \ 
  /// _minecraft:jungle_fence_
  static const Block jungle_fence = Block('minecraft:jungle_fence');

  /// ![jungle_fence_gate](https://minecraftitemids.com/item/32/jungle_fence_gate.png) \ 
  /// [Jungle Fence Gate](https://minecraft.wiki/w/jungle_fence_gate) \ 
  /// _minecraft:jungle_fence_gate_
  static const Block jungle_fence_gate = Block('minecraft:jungle_fence_gate');

  /// ![jungle_hanging_sign](https://minecraftitemids.com/item/32/jungle_hanging_sign.png) \ 
  /// [Jungle Hanging Sign](https://minecraft.wiki/w/jungle_hanging_sign) \ 
  /// _minecraft:jungle_hanging_sign_
  static const Block jungle_hanging_sign = Block('minecraft:jungle_hanging_sign');

  /// ![jungle_leaves](https://minecraftitemids.com/item/32/jungle_leaves.png) \ 
  /// [Jungle Leaves](https://minecraft.wiki/w/jungle_leaves) \ 
  /// _minecraft:jungle_leaves_
  static const Block jungle_leaves = Block('minecraft:jungle_leaves');

  /// ![jungle_log](https://minecraftitemids.com/item/32/jungle_log.png) \ 
  /// [Jungle Log](https://minecraft.wiki/w/jungle_log) \ 
  /// _minecraft:jungle_log_
  static const Block jungle_log = Block('minecraft:jungle_log');

  /// ![jungle_planks](https://minecraftitemids.com/item/32/jungle_planks.png) \ 
  /// [Jungle Planks](https://minecraft.wiki/w/jungle_planks) \ 
  /// _minecraft:jungle_planks_
  static const Block jungle_planks = Block('minecraft:jungle_planks');

  /// ![jungle_pressure_plate](https://minecraftitemids.com/item/32/jungle_pressure_plate.png) \ 
  /// [Jungle Pressure Plate](https://minecraft.wiki/w/jungle_pressure_plate) \ 
  /// _minecraft:jungle_pressure_plate_
  static const Block jungle_pressure_plate = Block('minecraft:jungle_pressure_plate');

  /// ![jungle_sapling](https://minecraftitemids.com/item/32/jungle_sapling.png) \ 
  /// [Jungle Sapling](https://minecraft.wiki/w/jungle_sapling) \ 
  /// _minecraft:jungle_sapling_
  static const Block jungle_sapling = Block('minecraft:jungle_sapling');

  /// ![jungle_sign](https://minecraftitemids.com/item/32/jungle_sign.png) \ 
  /// [Jungle Sign](https://minecraft.wiki/w/jungle_sign) \ 
  /// _minecraft:jungle_sign_
  static const Block jungle_sign = Block('minecraft:jungle_sign');

  /// ![jungle_slab](https://minecraftitemids.com/item/32/jungle_slab.png) \ 
  /// [Jungle Slab](https://minecraft.wiki/w/jungle_slab) \ 
  /// _minecraft:jungle_slab_
  static const Block jungle_slab = Block('minecraft:jungle_slab');

  /// ![jungle_stairs](https://minecraftitemids.com/item/32/jungle_stairs.png) \ 
  /// [Jungle Stairs](https://minecraft.wiki/w/jungle_stairs) \ 
  /// _minecraft:jungle_stairs_
  static const Block jungle_stairs = Block('minecraft:jungle_stairs');

  /// ![jungle_trapdoor](https://minecraftitemids.com/item/32/jungle_trapdoor.png) \ 
  /// [Jungle Trapdoor](https://minecraft.wiki/w/jungle_trapdoor) \ 
  /// _minecraft:jungle_trapdoor_
  static const Block jungle_trapdoor = Block('minecraft:jungle_trapdoor');

  /// ![jungle_wall_hanging_sign](https://minecraftitemids.com/item/32/jungle_wall_hanging_sign.png) \ 
  /// [Jungle Wall Hanging Sign](https://minecraft.wiki/w/jungle_wall_hanging_sign) \ 
  /// _minecraft:jungle_wall_hanging_sign_
  static const Block jungle_wall_hanging_sign = Block('minecraft:jungle_wall_hanging_sign');

  /// ![jungle_wall_sign](https://minecraftitemids.com/item/32/jungle_wall_sign.png) \ 
  /// [Jungle Wall Sign](https://minecraft.wiki/w/jungle_wall_sign) \ 
  /// _minecraft:jungle_wall_sign_
  static const Block jungle_wall_sign = Block('minecraft:jungle_wall_sign');

  /// ![jungle_wood](https://minecraftitemids.com/item/32/jungle_wood.png) \ 
  /// [Jungle Wood](https://minecraft.wiki/w/jungle_wood) \ 
  /// _minecraft:jungle_wood_
  static const Block jungle_wood = Block('minecraft:jungle_wood');

  /// ![kelp](https://minecraftitemids.com/item/32/kelp.png) \ 
  /// [Kelp](https://minecraft.wiki/w/kelp) \ 
  /// _minecraft:kelp_
  static const Block kelp = Block('minecraft:kelp');

  /// ![kelp_plant](https://minecraftitemids.com/item/32/kelp_plant.png) \ 
  /// [Kelp Plant](https://minecraft.wiki/w/kelp_plant) \ 
  /// _minecraft:kelp_plant_
  static const Block kelp_plant = Block('minecraft:kelp_plant');

  /// ![ladder](https://minecraftitemids.com/item/32/ladder.png) \ 
  /// [Ladder](https://minecraft.wiki/w/ladder) \ 
  /// _minecraft:ladder_
  static const Block ladder = Block('minecraft:ladder');

  /// ![lantern](https://minecraftitemids.com/item/32/lantern.png) \ 
  /// [Lantern](https://minecraft.wiki/w/lantern) \ 
  /// _minecraft:lantern_
  static const Block lantern = Block('minecraft:lantern');

  /// ![lapis_block](https://minecraftitemids.com/item/32/lapis_block.png) \ 
  /// [Lapis Block](https://minecraft.wiki/w/lapis_block) \ 
  /// _minecraft:lapis_block_
  static const Block lapis_block = Block('minecraft:lapis_block');

  /// ![lapis_ore](https://minecraftitemids.com/item/32/lapis_ore.png) \ 
  /// [Lapis Ore](https://minecraft.wiki/w/lapis_ore) \ 
  /// _minecraft:lapis_ore_
  static const Block lapis_ore = Block('minecraft:lapis_ore');

  /// ![large_amethyst_bud](https://minecraftitemids.com/item/32/large_amethyst_bud.png) \ 
  /// [Large Amethyst Bud](https://minecraft.wiki/w/large_amethyst_bud) \ 
  /// _minecraft:large_amethyst_bud_
  static const Block large_amethyst_bud = Block('minecraft:large_amethyst_bud');

  /// ![large_fern](https://minecraftitemids.com/item/32/large_fern.png) \ 
  /// [Large Fern](https://minecraft.wiki/w/large_fern) \ 
  /// _minecraft:large_fern_
  static const Block large_fern = Block('minecraft:large_fern');

  /// ![lava](https://minecraftitemids.com/item/32/lava.png) \ 
  /// [Lava](https://minecraft.wiki/w/lava) \ 
  /// _minecraft:lava_
  static const Block lava = Block('minecraft:lava');

  /// ![lava_cauldron](https://minecraftitemids.com/item/32/lava_cauldron.png) \ 
  /// [Lava Cauldron](https://minecraft.wiki/w/lava_cauldron) \ 
  /// _minecraft:lava_cauldron_
  static const Block lava_cauldron = Block('minecraft:lava_cauldron');

  /// ![lectern](https://minecraftitemids.com/item/32/lectern.png) \ 
  /// [Lectern](https://minecraft.wiki/w/lectern) \ 
  /// _minecraft:lectern_
  static const Block lectern = Block('minecraft:lectern');

  /// ![lever](https://minecraftitemids.com/item/32/lever.png) \ 
  /// [Lever](https://minecraft.wiki/w/lever) \ 
  /// _minecraft:lever_
  static const Block lever = Block('minecraft:lever');

  /// ![light](https://minecraftitemids.com/item/32/light.png) \ 
  /// [Light](https://minecraft.wiki/w/light) \ 
  /// _minecraft:light_
  static const Block light = Block('minecraft:light');

  /// ![light_blue_banner](https://minecraftitemids.com/item/32/light_blue_banner.png) \ 
  /// [Light Blue Banner](https://minecraft.wiki/w/light_blue_banner) \ 
  /// _minecraft:light_blue_banner_
  static const Block light_blue_banner = Block('minecraft:light_blue_banner');

  /// ![light_blue_bed](https://minecraftitemids.com/item/32/light_blue_bed.png) \ 
  /// [Light Blue Bed](https://minecraft.wiki/w/light_blue_bed) \ 
  /// _minecraft:light_blue_bed_
  static const Block light_blue_bed = Block('minecraft:light_blue_bed');

  /// ![light_blue_candle](https://minecraftitemids.com/item/32/light_blue_candle.png) \ 
  /// [Light Blue Candle](https://minecraft.wiki/w/light_blue_candle) \ 
  /// _minecraft:light_blue_candle_
  static const Block light_blue_candle = Block('minecraft:light_blue_candle');

  /// ![light_blue_candle_cake](https://minecraftitemids.com/item/32/light_blue_candle_cake.png) \ 
  /// [Light Blue Candle Cake](https://minecraft.wiki/w/light_blue_candle_cake) \ 
  /// _minecraft:light_blue_candle_cake_
  static const Block light_blue_candle_cake = Block('minecraft:light_blue_candle_cake');

  /// ![light_blue_carpet](https://minecraftitemids.com/item/32/light_blue_carpet.png) \ 
  /// [Light Blue Carpet](https://minecraft.wiki/w/light_blue_carpet) \ 
  /// _minecraft:light_blue_carpet_
  static const Block light_blue_carpet = Block('minecraft:light_blue_carpet');

  /// ![light_blue_concrete](https://minecraftitemids.com/item/32/light_blue_concrete.png) \ 
  /// [Light Blue Concrete](https://minecraft.wiki/w/light_blue_concrete) \ 
  /// _minecraft:light_blue_concrete_
  static const Block light_blue_concrete = Block('minecraft:light_blue_concrete');

  /// ![light_blue_concrete_powder](https://minecraftitemids.com/item/32/light_blue_concrete_powder.png) \ 
  /// [Light Blue Concrete Powder](https://minecraft.wiki/w/light_blue_concrete_powder) \ 
  /// _minecraft:light_blue_concrete_powder_
  static const Block light_blue_concrete_powder = Block('minecraft:light_blue_concrete_powder');

  /// ![light_blue_glazed_terracotta](https://minecraftitemids.com/item/32/light_blue_glazed_terracotta.png) \ 
  /// [Light Blue Glazed Terracotta](https://minecraft.wiki/w/light_blue_glazed_terracotta) \ 
  /// _minecraft:light_blue_glazed_terracotta_
  static const Block light_blue_glazed_terracotta = Block('minecraft:light_blue_glazed_terracotta');

  /// ![light_blue_shulker_box](https://minecraftitemids.com/item/32/light_blue_shulker_box.png) \ 
  /// [Light Blue Shulker Box](https://minecraft.wiki/w/light_blue_shulker_box) \ 
  /// _minecraft:light_blue_shulker_box_
  static const Block light_blue_shulker_box = Block('minecraft:light_blue_shulker_box');

  /// ![light_blue_stained_glass](https://minecraftitemids.com/item/32/light_blue_stained_glass.png) \ 
  /// [Light Blue Stained Glass](https://minecraft.wiki/w/light_blue_stained_glass) \ 
  /// _minecraft:light_blue_stained_glass_
  static const Block light_blue_stained_glass = Block('minecraft:light_blue_stained_glass');

  /// ![light_blue_stained_glass_pane](https://minecraftitemids.com/item/32/light_blue_stained_glass_pane.png) \ 
  /// [Light Blue Stained Glass Pane](https://minecraft.wiki/w/light_blue_stained_glass_pane) \ 
  /// _minecraft:light_blue_stained_glass_pane_
  static const Block light_blue_stained_glass_pane = Block('minecraft:light_blue_stained_glass_pane');

  /// ![light_blue_terracotta](https://minecraftitemids.com/item/32/light_blue_terracotta.png) \ 
  /// [Light Blue Terracotta](https://minecraft.wiki/w/light_blue_terracotta) \ 
  /// _minecraft:light_blue_terracotta_
  static const Block light_blue_terracotta = Block('minecraft:light_blue_terracotta');

  /// ![light_blue_wall_banner](https://minecraftitemids.com/item/32/light_blue_wall_banner.png) \ 
  /// [Light Blue Wall Banner](https://minecraft.wiki/w/light_blue_wall_banner) \ 
  /// _minecraft:light_blue_wall_banner_
  static const Block light_blue_wall_banner = Block('minecraft:light_blue_wall_banner');

  /// ![light_blue_wool](https://minecraftitemids.com/item/32/light_blue_wool.png) \ 
  /// [Light Blue Wool](https://minecraft.wiki/w/light_blue_wool) \ 
  /// _minecraft:light_blue_wool_
  static const Block light_blue_wool = Block('minecraft:light_blue_wool');

  /// ![light_gray_banner](https://minecraftitemids.com/item/32/light_gray_banner.png) \ 
  /// [Light Gray Banner](https://minecraft.wiki/w/light_gray_banner) \ 
  /// _minecraft:light_gray_banner_
  static const Block light_gray_banner = Block('minecraft:light_gray_banner');

  /// ![light_gray_bed](https://minecraftitemids.com/item/32/light_gray_bed.png) \ 
  /// [Light Gray Bed](https://minecraft.wiki/w/light_gray_bed) \ 
  /// _minecraft:light_gray_bed_
  static const Block light_gray_bed = Block('minecraft:light_gray_bed');

  /// ![light_gray_candle](https://minecraftitemids.com/item/32/light_gray_candle.png) \ 
  /// [Light Gray Candle](https://minecraft.wiki/w/light_gray_candle) \ 
  /// _minecraft:light_gray_candle_
  static const Block light_gray_candle = Block('minecraft:light_gray_candle');

  /// ![light_gray_candle_cake](https://minecraftitemids.com/item/32/light_gray_candle_cake.png) \ 
  /// [Light Gray Candle Cake](https://minecraft.wiki/w/light_gray_candle_cake) \ 
  /// _minecraft:light_gray_candle_cake_
  static const Block light_gray_candle_cake = Block('minecraft:light_gray_candle_cake');

  /// ![light_gray_carpet](https://minecraftitemids.com/item/32/light_gray_carpet.png) \ 
  /// [Light Gray Carpet](https://minecraft.wiki/w/light_gray_carpet) \ 
  /// _minecraft:light_gray_carpet_
  static const Block light_gray_carpet = Block('minecraft:light_gray_carpet');

  /// ![light_gray_concrete](https://minecraftitemids.com/item/32/light_gray_concrete.png) \ 
  /// [Light Gray Concrete](https://minecraft.wiki/w/light_gray_concrete) \ 
  /// _minecraft:light_gray_concrete_
  static const Block light_gray_concrete = Block('minecraft:light_gray_concrete');

  /// ![light_gray_concrete_powder](https://minecraftitemids.com/item/32/light_gray_concrete_powder.png) \ 
  /// [Light Gray Concrete Powder](https://minecraft.wiki/w/light_gray_concrete_powder) \ 
  /// _minecraft:light_gray_concrete_powder_
  static const Block light_gray_concrete_powder = Block('minecraft:light_gray_concrete_powder');

  /// ![light_gray_glazed_terracotta](https://minecraftitemids.com/item/32/light_gray_glazed_terracotta.png) \ 
  /// [Light Gray Glazed Terracotta](https://minecraft.wiki/w/light_gray_glazed_terracotta) \ 
  /// _minecraft:light_gray_glazed_terracotta_
  static const Block light_gray_glazed_terracotta = Block('minecraft:light_gray_glazed_terracotta');

  /// ![light_gray_shulker_box](https://minecraftitemids.com/item/32/light_gray_shulker_box.png) \ 
  /// [Light Gray Shulker Box](https://minecraft.wiki/w/light_gray_shulker_box) \ 
  /// _minecraft:light_gray_shulker_box_
  static const Block light_gray_shulker_box = Block('minecraft:light_gray_shulker_box');

  /// ![light_gray_stained_glass](https://minecraftitemids.com/item/32/light_gray_stained_glass.png) \ 
  /// [Light Gray Stained Glass](https://minecraft.wiki/w/light_gray_stained_glass) \ 
  /// _minecraft:light_gray_stained_glass_
  static const Block light_gray_stained_glass = Block('minecraft:light_gray_stained_glass');

  /// ![light_gray_stained_glass_pane](https://minecraftitemids.com/item/32/light_gray_stained_glass_pane.png) \ 
  /// [Light Gray Stained Glass Pane](https://minecraft.wiki/w/light_gray_stained_glass_pane) \ 
  /// _minecraft:light_gray_stained_glass_pane_
  static const Block light_gray_stained_glass_pane = Block('minecraft:light_gray_stained_glass_pane');

  /// ![light_gray_terracotta](https://minecraftitemids.com/item/32/light_gray_terracotta.png) \ 
  /// [Light Gray Terracotta](https://minecraft.wiki/w/light_gray_terracotta) \ 
  /// _minecraft:light_gray_terracotta_
  static const Block light_gray_terracotta = Block('minecraft:light_gray_terracotta');

  /// ![light_gray_wall_banner](https://minecraftitemids.com/item/32/light_gray_wall_banner.png) \ 
  /// [Light Gray Wall Banner](https://minecraft.wiki/w/light_gray_wall_banner) \ 
  /// _minecraft:light_gray_wall_banner_
  static const Block light_gray_wall_banner = Block('minecraft:light_gray_wall_banner');

  /// ![light_gray_wool](https://minecraftitemids.com/item/32/light_gray_wool.png) \ 
  /// [Light Gray Wool](https://minecraft.wiki/w/light_gray_wool) \ 
  /// _minecraft:light_gray_wool_
  static const Block light_gray_wool = Block('minecraft:light_gray_wool');

  /// ![light_weighted_pressure_plate](https://minecraftitemids.com/item/32/light_weighted_pressure_plate.png) \ 
  /// [Light Weighted Pressure Plate](https://minecraft.wiki/w/light_weighted_pressure_plate) \ 
  /// _minecraft:light_weighted_pressure_plate_
  static const Block light_weighted_pressure_plate = Block('minecraft:light_weighted_pressure_plate');

  /// ![lightning_rod](https://minecraftitemids.com/item/32/lightning_rod.png) \ 
  /// [Lightning Rod](https://minecraft.wiki/w/lightning_rod) \ 
  /// _minecraft:lightning_rod_
  static const Block lightning_rod = Block('minecraft:lightning_rod');

  /// ![lilac](https://minecraftitemids.com/item/32/lilac.png) \ 
  /// [Lilac](https://minecraft.wiki/w/lilac) \ 
  /// _minecraft:lilac_
  static const Block lilac = Block('minecraft:lilac');

  /// ![lily_of_the_valley](https://minecraftitemids.com/item/32/lily_of_the_valley.png) \ 
  /// [Lily Of The Valley](https://minecraft.wiki/w/lily_of_the_valley) \ 
  /// _minecraft:lily_of_the_valley_
  static const Block lily_of_the_valley = Block('minecraft:lily_of_the_valley');

  /// ![lily_pad](https://minecraftitemids.com/item/32/lily_pad.png) \ 
  /// [Lily Pad](https://minecraft.wiki/w/lily_pad) \ 
  /// _minecraft:lily_pad_
  static const Block lily_pad = Block('minecraft:lily_pad');

  /// ![lime_banner](https://minecraftitemids.com/item/32/lime_banner.png) \ 
  /// [Lime Banner](https://minecraft.wiki/w/lime_banner) \ 
  /// _minecraft:lime_banner_
  static const Block lime_banner = Block('minecraft:lime_banner');

  /// ![lime_bed](https://minecraftitemids.com/item/32/lime_bed.png) \ 
  /// [Lime Bed](https://minecraft.wiki/w/lime_bed) \ 
  /// _minecraft:lime_bed_
  static const Block lime_bed = Block('minecraft:lime_bed');

  /// ![lime_candle](https://minecraftitemids.com/item/32/lime_candle.png) \ 
  /// [Lime Candle](https://minecraft.wiki/w/lime_candle) \ 
  /// _minecraft:lime_candle_
  static const Block lime_candle = Block('minecraft:lime_candle');

  /// ![lime_candle_cake](https://minecraftitemids.com/item/32/lime_candle_cake.png) \ 
  /// [Lime Candle Cake](https://minecraft.wiki/w/lime_candle_cake) \ 
  /// _minecraft:lime_candle_cake_
  static const Block lime_candle_cake = Block('minecraft:lime_candle_cake');

  /// ![lime_carpet](https://minecraftitemids.com/item/32/lime_carpet.png) \ 
  /// [Lime Carpet](https://minecraft.wiki/w/lime_carpet) \ 
  /// _minecraft:lime_carpet_
  static const Block lime_carpet = Block('minecraft:lime_carpet');

  /// ![lime_concrete](https://minecraftitemids.com/item/32/lime_concrete.png) \ 
  /// [Lime Concrete](https://minecraft.wiki/w/lime_concrete) \ 
  /// _minecraft:lime_concrete_
  static const Block lime_concrete = Block('minecraft:lime_concrete');

  /// ![lime_concrete_powder](https://minecraftitemids.com/item/32/lime_concrete_powder.png) \ 
  /// [Lime Concrete Powder](https://minecraft.wiki/w/lime_concrete_powder) \ 
  /// _minecraft:lime_concrete_powder_
  static const Block lime_concrete_powder = Block('minecraft:lime_concrete_powder');

  /// ![lime_glazed_terracotta](https://minecraftitemids.com/item/32/lime_glazed_terracotta.png) \ 
  /// [Lime Glazed Terracotta](https://minecraft.wiki/w/lime_glazed_terracotta) \ 
  /// _minecraft:lime_glazed_terracotta_
  static const Block lime_glazed_terracotta = Block('minecraft:lime_glazed_terracotta');

  /// ![lime_shulker_box](https://minecraftitemids.com/item/32/lime_shulker_box.png) \ 
  /// [Lime Shulker Box](https://minecraft.wiki/w/lime_shulker_box) \ 
  /// _minecraft:lime_shulker_box_
  static const Block lime_shulker_box = Block('minecraft:lime_shulker_box');

  /// ![lime_stained_glass](https://minecraftitemids.com/item/32/lime_stained_glass.png) \ 
  /// [Lime Stained Glass](https://minecraft.wiki/w/lime_stained_glass) \ 
  /// _minecraft:lime_stained_glass_
  static const Block lime_stained_glass = Block('minecraft:lime_stained_glass');

  /// ![lime_stained_glass_pane](https://minecraftitemids.com/item/32/lime_stained_glass_pane.png) \ 
  /// [Lime Stained Glass Pane](https://minecraft.wiki/w/lime_stained_glass_pane) \ 
  /// _minecraft:lime_stained_glass_pane_
  static const Block lime_stained_glass_pane = Block('minecraft:lime_stained_glass_pane');

  /// ![lime_terracotta](https://minecraftitemids.com/item/32/lime_terracotta.png) \ 
  /// [Lime Terracotta](https://minecraft.wiki/w/lime_terracotta) \ 
  /// _minecraft:lime_terracotta_
  static const Block lime_terracotta = Block('minecraft:lime_terracotta');

  /// ![lime_wall_banner](https://minecraftitemids.com/item/32/lime_wall_banner.png) \ 
  /// [Lime Wall Banner](https://minecraft.wiki/w/lime_wall_banner) \ 
  /// _minecraft:lime_wall_banner_
  static const Block lime_wall_banner = Block('minecraft:lime_wall_banner');

  /// ![lime_wool](https://minecraftitemids.com/item/32/lime_wool.png) \ 
  /// [Lime Wool](https://minecraft.wiki/w/lime_wool) \ 
  /// _minecraft:lime_wool_
  static const Block lime_wool = Block('minecraft:lime_wool');

  /// ![lodestone](https://minecraftitemids.com/item/32/lodestone.png) \ 
  /// [Lodestone](https://minecraft.wiki/w/lodestone) \ 
  /// _minecraft:lodestone_
  static const Block lodestone = Block('minecraft:lodestone');

  /// ![loom](https://minecraftitemids.com/item/32/loom.png) \ 
  /// [Loom](https://minecraft.wiki/w/loom) \ 
  /// _minecraft:loom_
  static const Block loom = Block('minecraft:loom');

  /// ![magenta_banner](https://minecraftitemids.com/item/32/magenta_banner.png) \ 
  /// [Magenta Banner](https://minecraft.wiki/w/magenta_banner) \ 
  /// _minecraft:magenta_banner_
  static const Block magenta_banner = Block('minecraft:magenta_banner');

  /// ![magenta_bed](https://minecraftitemids.com/item/32/magenta_bed.png) \ 
  /// [Magenta Bed](https://minecraft.wiki/w/magenta_bed) \ 
  /// _minecraft:magenta_bed_
  static const Block magenta_bed = Block('minecraft:magenta_bed');

  /// ![magenta_candle](https://minecraftitemids.com/item/32/magenta_candle.png) \ 
  /// [Magenta Candle](https://minecraft.wiki/w/magenta_candle) \ 
  /// _minecraft:magenta_candle_
  static const Block magenta_candle = Block('minecraft:magenta_candle');

  /// ![magenta_candle_cake](https://minecraftitemids.com/item/32/magenta_candle_cake.png) \ 
  /// [Magenta Candle Cake](https://minecraft.wiki/w/magenta_candle_cake) \ 
  /// _minecraft:magenta_candle_cake_
  static const Block magenta_candle_cake = Block('minecraft:magenta_candle_cake');

  /// ![magenta_carpet](https://minecraftitemids.com/item/32/magenta_carpet.png) \ 
  /// [Magenta Carpet](https://minecraft.wiki/w/magenta_carpet) \ 
  /// _minecraft:magenta_carpet_
  static const Block magenta_carpet = Block('minecraft:magenta_carpet');

  /// ![magenta_concrete](https://minecraftitemids.com/item/32/magenta_concrete.png) \ 
  /// [Magenta Concrete](https://minecraft.wiki/w/magenta_concrete) \ 
  /// _minecraft:magenta_concrete_
  static const Block magenta_concrete = Block('minecraft:magenta_concrete');

  /// ![magenta_concrete_powder](https://minecraftitemids.com/item/32/magenta_concrete_powder.png) \ 
  /// [Magenta Concrete Powder](https://minecraft.wiki/w/magenta_concrete_powder) \ 
  /// _minecraft:magenta_concrete_powder_
  static const Block magenta_concrete_powder = Block('minecraft:magenta_concrete_powder');

  /// ![magenta_glazed_terracotta](https://minecraftitemids.com/item/32/magenta_glazed_terracotta.png) \ 
  /// [Magenta Glazed Terracotta](https://minecraft.wiki/w/magenta_glazed_terracotta) \ 
  /// _minecraft:magenta_glazed_terracotta_
  static const Block magenta_glazed_terracotta = Block('minecraft:magenta_glazed_terracotta');

  /// ![magenta_shulker_box](https://minecraftitemids.com/item/32/magenta_shulker_box.png) \ 
  /// [Magenta Shulker Box](https://minecraft.wiki/w/magenta_shulker_box) \ 
  /// _minecraft:magenta_shulker_box_
  static const Block magenta_shulker_box = Block('minecraft:magenta_shulker_box');

  /// ![magenta_stained_glass](https://minecraftitemids.com/item/32/magenta_stained_glass.png) \ 
  /// [Magenta Stained Glass](https://minecraft.wiki/w/magenta_stained_glass) \ 
  /// _minecraft:magenta_stained_glass_
  static const Block magenta_stained_glass = Block('minecraft:magenta_stained_glass');

  /// ![magenta_stained_glass_pane](https://minecraftitemids.com/item/32/magenta_stained_glass_pane.png) \ 
  /// [Magenta Stained Glass Pane](https://minecraft.wiki/w/magenta_stained_glass_pane) \ 
  /// _minecraft:magenta_stained_glass_pane_
  static const Block magenta_stained_glass_pane = Block('minecraft:magenta_stained_glass_pane');

  /// ![magenta_terracotta](https://minecraftitemids.com/item/32/magenta_terracotta.png) \ 
  /// [Magenta Terracotta](https://minecraft.wiki/w/magenta_terracotta) \ 
  /// _minecraft:magenta_terracotta_
  static const Block magenta_terracotta = Block('minecraft:magenta_terracotta');

  /// ![magenta_wall_banner](https://minecraftitemids.com/item/32/magenta_wall_banner.png) \ 
  /// [Magenta Wall Banner](https://minecraft.wiki/w/magenta_wall_banner) \ 
  /// _minecraft:magenta_wall_banner_
  static const Block magenta_wall_banner = Block('minecraft:magenta_wall_banner');

  /// ![magenta_wool](https://minecraftitemids.com/item/32/magenta_wool.png) \ 
  /// [Magenta Wool](https://minecraft.wiki/w/magenta_wool) \ 
  /// _minecraft:magenta_wool_
  static const Block magenta_wool = Block('minecraft:magenta_wool');

  /// ![magma_block](https://minecraftitemids.com/item/32/magma_block.png) \ 
  /// [Magma Block](https://minecraft.wiki/w/magma_block) \ 
  /// _minecraft:magma_block_
  static const Block magma_block = Block('minecraft:magma_block');

  /// ![mangrove_button](https://minecraftitemids.com/item/32/mangrove_button.png) \ 
  /// [Mangrove Button](https://minecraft.wiki/w/mangrove_button) \ 
  /// _minecraft:mangrove_button_
  static const Block mangrove_button = Block('minecraft:mangrove_button');

  /// ![mangrove_door](https://minecraftitemids.com/item/32/mangrove_door.png) \ 
  /// [Mangrove Door](https://minecraft.wiki/w/mangrove_door) \ 
  /// _minecraft:mangrove_door_
  static const Block mangrove_door = Block('minecraft:mangrove_door');

  /// ![mangrove_fence](https://minecraftitemids.com/item/32/mangrove_fence.png) \ 
  /// [Mangrove Fence](https://minecraft.wiki/w/mangrove_fence) \ 
  /// _minecraft:mangrove_fence_
  static const Block mangrove_fence = Block('minecraft:mangrove_fence');

  /// ![mangrove_fence_gate](https://minecraftitemids.com/item/32/mangrove_fence_gate.png) \ 
  /// [Mangrove Fence Gate](https://minecraft.wiki/w/mangrove_fence_gate) \ 
  /// _minecraft:mangrove_fence_gate_
  static const Block mangrove_fence_gate = Block('minecraft:mangrove_fence_gate');

  /// ![mangrove_hanging_sign](https://minecraftitemids.com/item/32/mangrove_hanging_sign.png) \ 
  /// [Mangrove Hanging Sign](https://minecraft.wiki/w/mangrove_hanging_sign) \ 
  /// _minecraft:mangrove_hanging_sign_
  static const Block mangrove_hanging_sign = Block('minecraft:mangrove_hanging_sign');

  /// ![mangrove_leaves](https://minecraftitemids.com/item/32/mangrove_leaves.png) \ 
  /// [Mangrove Leaves](https://minecraft.wiki/w/mangrove_leaves) \ 
  /// _minecraft:mangrove_leaves_
  static const Block mangrove_leaves = Block('minecraft:mangrove_leaves');

  /// ![mangrove_log](https://minecraftitemids.com/item/32/mangrove_log.png) \ 
  /// [Mangrove Log](https://minecraft.wiki/w/mangrove_log) \ 
  /// _minecraft:mangrove_log_
  static const Block mangrove_log = Block('minecraft:mangrove_log');

  /// ![mangrove_planks](https://minecraftitemids.com/item/32/mangrove_planks.png) \ 
  /// [Mangrove Planks](https://minecraft.wiki/w/mangrove_planks) \ 
  /// _minecraft:mangrove_planks_
  static const Block mangrove_planks = Block('minecraft:mangrove_planks');

  /// ![mangrove_pressure_plate](https://minecraftitemids.com/item/32/mangrove_pressure_plate.png) \ 
  /// [Mangrove Pressure Plate](https://minecraft.wiki/w/mangrove_pressure_plate) \ 
  /// _minecraft:mangrove_pressure_plate_
  static const Block mangrove_pressure_plate = Block('minecraft:mangrove_pressure_plate');

  /// ![mangrove_propagule](https://minecraftitemids.com/item/32/mangrove_propagule.png) \ 
  /// [Mangrove Propagule](https://minecraft.wiki/w/mangrove_propagule) \ 
  /// _minecraft:mangrove_propagule_
  static const Block mangrove_propagule = Block('minecraft:mangrove_propagule');

  /// ![mangrove_roots](https://minecraftitemids.com/item/32/mangrove_roots.png) \ 
  /// [Mangrove Roots](https://minecraft.wiki/w/mangrove_roots) \ 
  /// _minecraft:mangrove_roots_
  static const Block mangrove_roots = Block('minecraft:mangrove_roots');

  /// ![mangrove_sign](https://minecraftitemids.com/item/32/mangrove_sign.png) \ 
  /// [Mangrove Sign](https://minecraft.wiki/w/mangrove_sign) \ 
  /// _minecraft:mangrove_sign_
  static const Block mangrove_sign = Block('minecraft:mangrove_sign');

  /// ![mangrove_slab](https://minecraftitemids.com/item/32/mangrove_slab.png) \ 
  /// [Mangrove Slab](https://minecraft.wiki/w/mangrove_slab) \ 
  /// _minecraft:mangrove_slab_
  static const Block mangrove_slab = Block('minecraft:mangrove_slab');

  /// ![mangrove_stairs](https://minecraftitemids.com/item/32/mangrove_stairs.png) \ 
  /// [Mangrove Stairs](https://minecraft.wiki/w/mangrove_stairs) \ 
  /// _minecraft:mangrove_stairs_
  static const Block mangrove_stairs = Block('minecraft:mangrove_stairs');

  /// ![mangrove_trapdoor](https://minecraftitemids.com/item/32/mangrove_trapdoor.png) \ 
  /// [Mangrove Trapdoor](https://minecraft.wiki/w/mangrove_trapdoor) \ 
  /// _minecraft:mangrove_trapdoor_
  static const Block mangrove_trapdoor = Block('minecraft:mangrove_trapdoor');

  /// ![mangrove_wall_hanging_sign](https://minecraftitemids.com/item/32/mangrove_wall_hanging_sign.png) \ 
  /// [Mangrove Wall Hanging Sign](https://minecraft.wiki/w/mangrove_wall_hanging_sign) \ 
  /// _minecraft:mangrove_wall_hanging_sign_
  static const Block mangrove_wall_hanging_sign = Block('minecraft:mangrove_wall_hanging_sign');

  /// ![mangrove_wall_sign](https://minecraftitemids.com/item/32/mangrove_wall_sign.png) \ 
  /// [Mangrove Wall Sign](https://minecraft.wiki/w/mangrove_wall_sign) \ 
  /// _minecraft:mangrove_wall_sign_
  static const Block mangrove_wall_sign = Block('minecraft:mangrove_wall_sign');

  /// ![mangrove_wood](https://minecraftitemids.com/item/32/mangrove_wood.png) \ 
  /// [Mangrove Wood](https://minecraft.wiki/w/mangrove_wood) \ 
  /// _minecraft:mangrove_wood_
  static const Block mangrove_wood = Block('minecraft:mangrove_wood');

  /// ![medium_amethyst_bud](https://minecraftitemids.com/item/32/medium_amethyst_bud.png) \ 
  /// [Medium Amethyst Bud](https://minecraft.wiki/w/medium_amethyst_bud) \ 
  /// _minecraft:medium_amethyst_bud_
  static const Block medium_amethyst_bud = Block('minecraft:medium_amethyst_bud');

  /// ![melon](https://minecraftitemids.com/item/32/melon.png) \ 
  /// [Melon](https://minecraft.wiki/w/melon) \ 
  /// _minecraft:melon_
  static const Block melon = Block('minecraft:melon');

  /// ![melon_stem](https://minecraftitemids.com/item/32/melon_stem.png) \ 
  /// [Melon Stem](https://minecraft.wiki/w/melon_stem) \ 
  /// _minecraft:melon_stem_
  static const Block melon_stem = Block('minecraft:melon_stem');

  /// ![moss_block](https://minecraftitemids.com/item/32/moss_block.png) \ 
  /// [Moss Block](https://minecraft.wiki/w/moss_block) \ 
  /// _minecraft:moss_block_
  static const Block moss_block = Block('minecraft:moss_block');

  /// ![moss_carpet](https://minecraftitemids.com/item/32/moss_carpet.png) \ 
  /// [Moss Carpet](https://minecraft.wiki/w/moss_carpet) \ 
  /// _minecraft:moss_carpet_
  static const Block moss_carpet = Block('minecraft:moss_carpet');

  /// ![mossy_cobblestone](https://minecraftitemids.com/item/32/mossy_cobblestone.png) \ 
  /// [Mossy Cobblestone](https://minecraft.wiki/w/mossy_cobblestone) \ 
  /// _minecraft:mossy_cobblestone_
  static const Block mossy_cobblestone = Block('minecraft:mossy_cobblestone');

  /// ![mossy_cobblestone_slab](https://minecraftitemids.com/item/32/mossy_cobblestone_slab.png) \ 
  /// [Mossy Cobblestone Slab](https://minecraft.wiki/w/mossy_cobblestone_slab) \ 
  /// _minecraft:mossy_cobblestone_slab_
  static const Block mossy_cobblestone_slab = Block('minecraft:mossy_cobblestone_slab');

  /// ![mossy_cobblestone_stairs](https://minecraftitemids.com/item/32/mossy_cobblestone_stairs.png) \ 
  /// [Mossy Cobblestone Stairs](https://minecraft.wiki/w/mossy_cobblestone_stairs) \ 
  /// _minecraft:mossy_cobblestone_stairs_
  static const Block mossy_cobblestone_stairs = Block('minecraft:mossy_cobblestone_stairs');

  /// ![mossy_cobblestone_wall](https://minecraftitemids.com/item/32/mossy_cobblestone_wall.png) \ 
  /// [Mossy Cobblestone Wall](https://minecraft.wiki/w/mossy_cobblestone_wall) \ 
  /// _minecraft:mossy_cobblestone_wall_
  static const Block mossy_cobblestone_wall = Block('minecraft:mossy_cobblestone_wall');

  /// ![mossy_stone_brick_slab](https://minecraftitemids.com/item/32/mossy_stone_brick_slab.png) \ 
  /// [Mossy Stone Brick Slab](https://minecraft.wiki/w/mossy_stone_brick_slab) \ 
  /// _minecraft:mossy_stone_brick_slab_
  static const Block mossy_stone_brick_slab = Block('minecraft:mossy_stone_brick_slab');

  /// ![mossy_stone_brick_stairs](https://minecraftitemids.com/item/32/mossy_stone_brick_stairs.png) \ 
  /// [Mossy Stone Brick Stairs](https://minecraft.wiki/w/mossy_stone_brick_stairs) \ 
  /// _minecraft:mossy_stone_brick_stairs_
  static const Block mossy_stone_brick_stairs = Block('minecraft:mossy_stone_brick_stairs');

  /// ![mossy_stone_brick_wall](https://minecraftitemids.com/item/32/mossy_stone_brick_wall.png) \ 
  /// [Mossy Stone Brick Wall](https://minecraft.wiki/w/mossy_stone_brick_wall) \ 
  /// _minecraft:mossy_stone_brick_wall_
  static const Block mossy_stone_brick_wall = Block('minecraft:mossy_stone_brick_wall');

  /// ![mossy_stone_bricks](https://minecraftitemids.com/item/32/mossy_stone_bricks.png) \ 
  /// [Mossy Stone Bricks](https://minecraft.wiki/w/mossy_stone_bricks) \ 
  /// _minecraft:mossy_stone_bricks_
  static const Block mossy_stone_bricks = Block('minecraft:mossy_stone_bricks');

  /// ![moving_piston](https://minecraftitemids.com/item/32/moving_piston.png) \ 
  /// [Moving Piston](https://minecraft.wiki/w/moving_piston) \ 
  /// _minecraft:moving_piston_
  static const Block moving_piston = Block('minecraft:moving_piston');

  /// ![mud](https://minecraftitemids.com/item/32/mud.png) \ 
  /// [Mud](https://minecraft.wiki/w/mud) \ 
  /// _minecraft:mud_
  static const Block mud = Block('minecraft:mud');

  /// ![mud_brick_slab](https://minecraftitemids.com/item/32/mud_brick_slab.png) \ 
  /// [Mud Brick Slab](https://minecraft.wiki/w/mud_brick_slab) \ 
  /// _minecraft:mud_brick_slab_
  static const Block mud_brick_slab = Block('minecraft:mud_brick_slab');

  /// ![mud_brick_stairs](https://minecraftitemids.com/item/32/mud_brick_stairs.png) \ 
  /// [Mud Brick Stairs](https://minecraft.wiki/w/mud_brick_stairs) \ 
  /// _minecraft:mud_brick_stairs_
  static const Block mud_brick_stairs = Block('minecraft:mud_brick_stairs');

  /// ![mud_brick_wall](https://minecraftitemids.com/item/32/mud_brick_wall.png) \ 
  /// [Mud Brick Wall](https://minecraft.wiki/w/mud_brick_wall) \ 
  /// _minecraft:mud_brick_wall_
  static const Block mud_brick_wall = Block('minecraft:mud_brick_wall');

  /// ![mud_bricks](https://minecraftitemids.com/item/32/mud_bricks.png) \ 
  /// [Mud Bricks](https://minecraft.wiki/w/mud_bricks) \ 
  /// _minecraft:mud_bricks_
  static const Block mud_bricks = Block('minecraft:mud_bricks');

  /// ![muddy_mangrove_roots](https://minecraftitemids.com/item/32/muddy_mangrove_roots.png) \ 
  /// [Muddy Mangrove Roots](https://minecraft.wiki/w/muddy_mangrove_roots) \ 
  /// _minecraft:muddy_mangrove_roots_
  static const Block muddy_mangrove_roots = Block('minecraft:muddy_mangrove_roots');

  /// ![mushroom_stem](https://minecraftitemids.com/item/32/mushroom_stem.png) \ 
  /// [Mushroom Stem](https://minecraft.wiki/w/mushroom_stem) \ 
  /// _minecraft:mushroom_stem_
  static const Block mushroom_stem = Block('minecraft:mushroom_stem');

  /// ![mycelium](https://minecraftitemids.com/item/32/mycelium.png) \ 
  /// [Mycelium](https://minecraft.wiki/w/mycelium) \ 
  /// _minecraft:mycelium_
  static const Block mycelium = Block('minecraft:mycelium');

  /// ![nether_brick_fence](https://minecraftitemids.com/item/32/nether_brick_fence.png) \ 
  /// [Nether Brick Fence](https://minecraft.wiki/w/nether_brick_fence) \ 
  /// _minecraft:nether_brick_fence_
  static const Block nether_brick_fence = Block('minecraft:nether_brick_fence');

  /// ![nether_brick_slab](https://minecraftitemids.com/item/32/nether_brick_slab.png) \ 
  /// [Nether Brick Slab](https://minecraft.wiki/w/nether_brick_slab) \ 
  /// _minecraft:nether_brick_slab_
  static const Block nether_brick_slab = Block('minecraft:nether_brick_slab');

  /// ![nether_brick_stairs](https://minecraftitemids.com/item/32/nether_brick_stairs.png) \ 
  /// [Nether Brick Stairs](https://minecraft.wiki/w/nether_brick_stairs) \ 
  /// _minecraft:nether_brick_stairs_
  static const Block nether_brick_stairs = Block('minecraft:nether_brick_stairs');

  /// ![nether_brick_wall](https://minecraftitemids.com/item/32/nether_brick_wall.png) \ 
  /// [Nether Brick Wall](https://minecraft.wiki/w/nether_brick_wall) \ 
  /// _minecraft:nether_brick_wall_
  static const Block nether_brick_wall = Block('minecraft:nether_brick_wall');

  /// ![nether_bricks](https://minecraftitemids.com/item/32/nether_bricks.png) \ 
  /// [Nether Bricks](https://minecraft.wiki/w/nether_bricks) \ 
  /// _minecraft:nether_bricks_
  static const Block nether_bricks = Block('minecraft:nether_bricks');

  /// ![nether_gold_ore](https://minecraftitemids.com/item/32/nether_gold_ore.png) \ 
  /// [Nether Gold Ore](https://minecraft.wiki/w/nether_gold_ore) \ 
  /// _minecraft:nether_gold_ore_
  static const Block nether_gold_ore = Block('minecraft:nether_gold_ore');

  /// ![nether_portal](https://minecraftitemids.com/item/32/nether_portal.png) \ 
  /// [Nether Portal](https://minecraft.wiki/w/nether_portal) \ 
  /// _minecraft:nether_portal_
  static const Block nether_portal = Block('minecraft:nether_portal');

  /// ![nether_quartz_ore](https://minecraftitemids.com/item/32/nether_quartz_ore.png) \ 
  /// [Nether Quartz Ore](https://minecraft.wiki/w/nether_quartz_ore) \ 
  /// _minecraft:nether_quartz_ore_
  static const Block nether_quartz_ore = Block('minecraft:nether_quartz_ore');

  /// ![nether_sprouts](https://minecraftitemids.com/item/32/nether_sprouts.png) \ 
  /// [Nether Sprouts](https://minecraft.wiki/w/nether_sprouts) \ 
  /// _minecraft:nether_sprouts_
  static const Block nether_sprouts = Block('minecraft:nether_sprouts');

  /// ![nether_wart](https://minecraftitemids.com/item/32/nether_wart.png) \ 
  /// [Nether Wart](https://minecraft.wiki/w/nether_wart) \ 
  /// _minecraft:nether_wart_
  static const Block nether_wart = Block('minecraft:nether_wart');

  /// ![nether_wart_block](https://minecraftitemids.com/item/32/nether_wart_block.png) \ 
  /// [Nether Wart Block](https://minecraft.wiki/w/nether_wart_block) \ 
  /// _minecraft:nether_wart_block_
  static const Block nether_wart_block = Block('minecraft:nether_wart_block');

  /// ![netherite_block](https://minecraftitemids.com/item/32/netherite_block.png) \ 
  /// [Netherite Block](https://minecraft.wiki/w/netherite_block) \ 
  /// _minecraft:netherite_block_
  static const Block netherite_block = Block('minecraft:netherite_block');

  /// ![netherrack](https://minecraftitemids.com/item/32/netherrack.png) \ 
  /// [Netherrack](https://minecraft.wiki/w/netherrack) \ 
  /// _minecraft:netherrack_
  static const Block netherrack = Block('minecraft:netherrack');

  /// ![note_block](https://minecraftitemids.com/item/32/note_block.png) \ 
  /// [Note Block](https://minecraft.wiki/w/note_block) \ 
  /// _minecraft:note_block_
  static const Block note_block = Block('minecraft:note_block');

  /// ![oak_button](https://minecraftitemids.com/item/32/oak_button.png) \ 
  /// [Oak Button](https://minecraft.wiki/w/oak_button) \ 
  /// _minecraft:oak_button_
  static const Block oak_button = Block('minecraft:oak_button');

  /// ![oak_door](https://minecraftitemids.com/item/32/oak_door.png) \ 
  /// [Oak Door](https://minecraft.wiki/w/oak_door) \ 
  /// _minecraft:oak_door_
  static const Block oak_door = Block('minecraft:oak_door');

  /// ![oak_fence](https://minecraftitemids.com/item/32/oak_fence.png) \ 
  /// [Oak Fence](https://minecraft.wiki/w/oak_fence) \ 
  /// _minecraft:oak_fence_
  static const Block oak_fence = Block('minecraft:oak_fence');

  /// ![oak_fence_gate](https://minecraftitemids.com/item/32/oak_fence_gate.png) \ 
  /// [Oak Fence Gate](https://minecraft.wiki/w/oak_fence_gate) \ 
  /// _minecraft:oak_fence_gate_
  static const Block oak_fence_gate = Block('minecraft:oak_fence_gate');

  /// ![oak_hanging_sign](https://minecraftitemids.com/item/32/oak_hanging_sign.png) \ 
  /// [Oak Hanging Sign](https://minecraft.wiki/w/oak_hanging_sign) \ 
  /// _minecraft:oak_hanging_sign_
  static const Block oak_hanging_sign = Block('minecraft:oak_hanging_sign');

  /// ![oak_leaves](https://minecraftitemids.com/item/32/oak_leaves.png) \ 
  /// [Oak Leaves](https://minecraft.wiki/w/oak_leaves) \ 
  /// _minecraft:oak_leaves_
  static const Block oak_leaves = Block('minecraft:oak_leaves');

  /// ![oak_log](https://minecraftitemids.com/item/32/oak_log.png) \ 
  /// [Oak Log](https://minecraft.wiki/w/oak_log) \ 
  /// _minecraft:oak_log_
  static const Block oak_log = Block('minecraft:oak_log');

  /// ![oak_planks](https://minecraftitemids.com/item/32/oak_planks.png) \ 
  /// [Oak Planks](https://minecraft.wiki/w/oak_planks) \ 
  /// _minecraft:oak_planks_
  static const Block oak_planks = Block('minecraft:oak_planks');

  /// ![oak_pressure_plate](https://minecraftitemids.com/item/32/oak_pressure_plate.png) \ 
  /// [Oak Pressure Plate](https://minecraft.wiki/w/oak_pressure_plate) \ 
  /// _minecraft:oak_pressure_plate_
  static const Block oak_pressure_plate = Block('minecraft:oak_pressure_plate');

  /// ![oak_sapling](https://minecraftitemids.com/item/32/oak_sapling.png) \ 
  /// [Oak Sapling](https://minecraft.wiki/w/oak_sapling) \ 
  /// _minecraft:oak_sapling_
  static const Block oak_sapling = Block('minecraft:oak_sapling');

  /// ![oak_sign](https://minecraftitemids.com/item/32/oak_sign.png) \ 
  /// [Oak Sign](https://minecraft.wiki/w/oak_sign) \ 
  /// _minecraft:oak_sign_
  static const Block oak_sign = Block('minecraft:oak_sign');

  /// ![oak_slab](https://minecraftitemids.com/item/32/oak_slab.png) \ 
  /// [Oak Slab](https://minecraft.wiki/w/oak_slab) \ 
  /// _minecraft:oak_slab_
  static const Block oak_slab = Block('minecraft:oak_slab');

  /// ![oak_stairs](https://minecraftitemids.com/item/32/oak_stairs.png) \ 
  /// [Oak Stairs](https://minecraft.wiki/w/oak_stairs) \ 
  /// _minecraft:oak_stairs_
  static const Block oak_stairs = Block('minecraft:oak_stairs');

  /// ![oak_trapdoor](https://minecraftitemids.com/item/32/oak_trapdoor.png) \ 
  /// [Oak Trapdoor](https://minecraft.wiki/w/oak_trapdoor) \ 
  /// _minecraft:oak_trapdoor_
  static const Block oak_trapdoor = Block('minecraft:oak_trapdoor');

  /// ![oak_wall_hanging_sign](https://minecraftitemids.com/item/32/oak_wall_hanging_sign.png) \ 
  /// [Oak Wall Hanging Sign](https://minecraft.wiki/w/oak_wall_hanging_sign) \ 
  /// _minecraft:oak_wall_hanging_sign_
  static const Block oak_wall_hanging_sign = Block('minecraft:oak_wall_hanging_sign');

  /// ![oak_wall_sign](https://minecraftitemids.com/item/32/oak_wall_sign.png) \ 
  /// [Oak Wall Sign](https://minecraft.wiki/w/oak_wall_sign) \ 
  /// _minecraft:oak_wall_sign_
  static const Block oak_wall_sign = Block('minecraft:oak_wall_sign');

  /// ![oak_wood](https://minecraftitemids.com/item/32/oak_wood.png) \ 
  /// [Oak Wood](https://minecraft.wiki/w/oak_wood) \ 
  /// _minecraft:oak_wood_
  static const Block oak_wood = Block('minecraft:oak_wood');

  /// ![observer](https://minecraftitemids.com/item/32/observer.png) \ 
  /// [Observer](https://minecraft.wiki/w/observer) \ 
  /// _minecraft:observer_
  static const Block observer = Block('minecraft:observer');

  /// ![obsidian](https://minecraftitemids.com/item/32/obsidian.png) \ 
  /// [Obsidian](https://minecraft.wiki/w/obsidian) \ 
  /// _minecraft:obsidian_
  static const Block obsidian = Block('minecraft:obsidian');

  /// ![ochre_froglight](https://minecraftitemids.com/item/32/ochre_froglight.png) \ 
  /// [Ochre Froglight](https://minecraft.wiki/w/ochre_froglight) \ 
  /// _minecraft:ochre_froglight_
  static const Block ochre_froglight = Block('minecraft:ochre_froglight');

  /// ![orange_banner](https://minecraftitemids.com/item/32/orange_banner.png) \ 
  /// [Orange Banner](https://minecraft.wiki/w/orange_banner) \ 
  /// _minecraft:orange_banner_
  static const Block orange_banner = Block('minecraft:orange_banner');

  /// ![orange_bed](https://minecraftitemids.com/item/32/orange_bed.png) \ 
  /// [Orange Bed](https://minecraft.wiki/w/orange_bed) \ 
  /// _minecraft:orange_bed_
  static const Block orange_bed = Block('minecraft:orange_bed');

  /// ![orange_candle](https://minecraftitemids.com/item/32/orange_candle.png) \ 
  /// [Orange Candle](https://minecraft.wiki/w/orange_candle) \ 
  /// _minecraft:orange_candle_
  static const Block orange_candle = Block('minecraft:orange_candle');

  /// ![orange_candle_cake](https://minecraftitemids.com/item/32/orange_candle_cake.png) \ 
  /// [Orange Candle Cake](https://minecraft.wiki/w/orange_candle_cake) \ 
  /// _minecraft:orange_candle_cake_
  static const Block orange_candle_cake = Block('minecraft:orange_candle_cake');

  /// ![orange_carpet](https://minecraftitemids.com/item/32/orange_carpet.png) \ 
  /// [Orange Carpet](https://minecraft.wiki/w/orange_carpet) \ 
  /// _minecraft:orange_carpet_
  static const Block orange_carpet = Block('minecraft:orange_carpet');

  /// ![orange_concrete](https://minecraftitemids.com/item/32/orange_concrete.png) \ 
  /// [Orange Concrete](https://minecraft.wiki/w/orange_concrete) \ 
  /// _minecraft:orange_concrete_
  static const Block orange_concrete = Block('minecraft:orange_concrete');

  /// ![orange_concrete_powder](https://minecraftitemids.com/item/32/orange_concrete_powder.png) \ 
  /// [Orange Concrete Powder](https://minecraft.wiki/w/orange_concrete_powder) \ 
  /// _minecraft:orange_concrete_powder_
  static const Block orange_concrete_powder = Block('minecraft:orange_concrete_powder');

  /// ![orange_glazed_terracotta](https://minecraftitemids.com/item/32/orange_glazed_terracotta.png) \ 
  /// [Orange Glazed Terracotta](https://minecraft.wiki/w/orange_glazed_terracotta) \ 
  /// _minecraft:orange_glazed_terracotta_
  static const Block orange_glazed_terracotta = Block('minecraft:orange_glazed_terracotta');

  /// ![orange_shulker_box](https://minecraftitemids.com/item/32/orange_shulker_box.png) \ 
  /// [Orange Shulker Box](https://minecraft.wiki/w/orange_shulker_box) \ 
  /// _minecraft:orange_shulker_box_
  static const Block orange_shulker_box = Block('minecraft:orange_shulker_box');

  /// ![orange_stained_glass](https://minecraftitemids.com/item/32/orange_stained_glass.png) \ 
  /// [Orange Stained Glass](https://minecraft.wiki/w/orange_stained_glass) \ 
  /// _minecraft:orange_stained_glass_
  static const Block orange_stained_glass = Block('minecraft:orange_stained_glass');

  /// ![orange_stained_glass_pane](https://minecraftitemids.com/item/32/orange_stained_glass_pane.png) \ 
  /// [Orange Stained Glass Pane](https://minecraft.wiki/w/orange_stained_glass_pane) \ 
  /// _minecraft:orange_stained_glass_pane_
  static const Block orange_stained_glass_pane = Block('minecraft:orange_stained_glass_pane');

  /// ![orange_terracotta](https://minecraftitemids.com/item/32/orange_terracotta.png) \ 
  /// [Orange Terracotta](https://minecraft.wiki/w/orange_terracotta) \ 
  /// _minecraft:orange_terracotta_
  static const Block orange_terracotta = Block('minecraft:orange_terracotta');

  /// ![orange_tulip](https://minecraftitemids.com/item/32/orange_tulip.png) \ 
  /// [Orange Tulip](https://minecraft.wiki/w/orange_tulip) \ 
  /// _minecraft:orange_tulip_
  static const Block orange_tulip = Block('minecraft:orange_tulip');

  /// ![orange_wall_banner](https://minecraftitemids.com/item/32/orange_wall_banner.png) \ 
  /// [Orange Wall Banner](https://minecraft.wiki/w/orange_wall_banner) \ 
  /// _minecraft:orange_wall_banner_
  static const Block orange_wall_banner = Block('minecraft:orange_wall_banner');

  /// ![orange_wool](https://minecraftitemids.com/item/32/orange_wool.png) \ 
  /// [Orange Wool](https://minecraft.wiki/w/orange_wool) \ 
  /// _minecraft:orange_wool_
  static const Block orange_wool = Block('minecraft:orange_wool');

  /// ![oxeye_daisy](https://minecraftitemids.com/item/32/oxeye_daisy.png) \ 
  /// [Oxeye Daisy](https://minecraft.wiki/w/oxeye_daisy) \ 
  /// _minecraft:oxeye_daisy_
  static const Block oxeye_daisy = Block('minecraft:oxeye_daisy');

  /// ![oxidized_chiseled_copper](https://minecraftitemids.com/item/32/oxidized_chiseled_copper.png) \ 
  /// [Oxidized Chiseled Copper](https://minecraft.wiki/w/oxidized_chiseled_copper) \ 
  /// _minecraft:oxidized_chiseled_copper_
  static const Block oxidized_chiseled_copper = Block('minecraft:oxidized_chiseled_copper');

  /// ![oxidized_copper](https://minecraftitemids.com/item/32/oxidized_copper.png) \ 
  /// [Oxidized Copper](https://minecraft.wiki/w/oxidized_copper) \ 
  /// _minecraft:oxidized_copper_
  static const Block oxidized_copper = Block('minecraft:oxidized_copper');

  /// ![oxidized_copper_bulb](https://minecraftitemids.com/item/32/oxidized_copper_bulb.png) \ 
  /// [Oxidized Copper Bulb](https://minecraft.wiki/w/oxidized_copper_bulb) \ 
  /// _minecraft:oxidized_copper_bulb_
  static const Block oxidized_copper_bulb = Block('minecraft:oxidized_copper_bulb');

  /// ![oxidized_copper_door](https://minecraftitemids.com/item/32/oxidized_copper_door.png) \ 
  /// [Oxidized Copper Door](https://minecraft.wiki/w/oxidized_copper_door) \ 
  /// _minecraft:oxidized_copper_door_
  static const Block oxidized_copper_door = Block('minecraft:oxidized_copper_door');

  /// ![oxidized_copper_grate](https://minecraftitemids.com/item/32/oxidized_copper_grate.png) \ 
  /// [Oxidized Copper Grate](https://minecraft.wiki/w/oxidized_copper_grate) \ 
  /// _minecraft:oxidized_copper_grate_
  static const Block oxidized_copper_grate = Block('minecraft:oxidized_copper_grate');

  /// ![oxidized_copper_trapdoor](https://minecraftitemids.com/item/32/oxidized_copper_trapdoor.png) \ 
  /// [Oxidized Copper Trapdoor](https://minecraft.wiki/w/oxidized_copper_trapdoor) \ 
  /// _minecraft:oxidized_copper_trapdoor_
  static const Block oxidized_copper_trapdoor = Block('minecraft:oxidized_copper_trapdoor');

  /// ![oxidized_cut_copper](https://minecraftitemids.com/item/32/oxidized_cut_copper.png) \ 
  /// [Oxidized Cut Copper](https://minecraft.wiki/w/oxidized_cut_copper) \ 
  /// _minecraft:oxidized_cut_copper_
  static const Block oxidized_cut_copper = Block('minecraft:oxidized_cut_copper');

  /// ![oxidized_cut_copper_slab](https://minecraftitemids.com/item/32/oxidized_cut_copper_slab.png) \ 
  /// [Oxidized Cut Copper Slab](https://minecraft.wiki/w/oxidized_cut_copper_slab) \ 
  /// _minecraft:oxidized_cut_copper_slab_
  static const Block oxidized_cut_copper_slab = Block('minecraft:oxidized_cut_copper_slab');

  /// ![oxidized_cut_copper_stairs](https://minecraftitemids.com/item/32/oxidized_cut_copper_stairs.png) \ 
  /// [Oxidized Cut Copper Stairs](https://minecraft.wiki/w/oxidized_cut_copper_stairs) \ 
  /// _minecraft:oxidized_cut_copper_stairs_
  static const Block oxidized_cut_copper_stairs = Block('minecraft:oxidized_cut_copper_stairs');

  /// ![packed_ice](https://minecraftitemids.com/item/32/packed_ice.png) \ 
  /// [Packed Ice](https://minecraft.wiki/w/packed_ice) \ 
  /// _minecraft:packed_ice_
  static const Block packed_ice = Block('minecraft:packed_ice');

  /// ![packed_mud](https://minecraftitemids.com/item/32/packed_mud.png) \ 
  /// [Packed Mud](https://minecraft.wiki/w/packed_mud) \ 
  /// _minecraft:packed_mud_
  static const Block packed_mud = Block('minecraft:packed_mud');

  /// ![pearlescent_froglight](https://minecraftitemids.com/item/32/pearlescent_froglight.png) \ 
  /// [Pearlescent Froglight](https://minecraft.wiki/w/pearlescent_froglight) \ 
  /// _minecraft:pearlescent_froglight_
  static const Block pearlescent_froglight = Block('minecraft:pearlescent_froglight');

  /// ![peony](https://minecraftitemids.com/item/32/peony.png) \ 
  /// [Peony](https://minecraft.wiki/w/peony) \ 
  /// _minecraft:peony_
  static const Block peony = Block('minecraft:peony');

  /// ![petrified_oak_slab](https://minecraftitemids.com/item/32/petrified_oak_slab.png) \ 
  /// [Petrified Oak Slab](https://minecraft.wiki/w/petrified_oak_slab) \ 
  /// _minecraft:petrified_oak_slab_
  static const Block petrified_oak_slab = Block('minecraft:petrified_oak_slab');

  /// ![piglin_head](https://minecraftitemids.com/item/32/piglin_head.png) \ 
  /// [Piglin Head](https://minecraft.wiki/w/piglin_head) \ 
  /// _minecraft:piglin_head_
  static const Block piglin_head = Block('minecraft:piglin_head');

  /// ![piglin_wall_head](https://minecraftitemids.com/item/32/piglin_wall_head.png) \ 
  /// [Piglin Wall Head](https://minecraft.wiki/w/piglin_wall_head) \ 
  /// _minecraft:piglin_wall_head_
  static const Block piglin_wall_head = Block('minecraft:piglin_wall_head');

  /// ![pink_banner](https://minecraftitemids.com/item/32/pink_banner.png) \ 
  /// [Pink Banner](https://minecraft.wiki/w/pink_banner) \ 
  /// _minecraft:pink_banner_
  static const Block pink_banner = Block('minecraft:pink_banner');

  /// ![pink_bed](https://minecraftitemids.com/item/32/pink_bed.png) \ 
  /// [Pink Bed](https://minecraft.wiki/w/pink_bed) \ 
  /// _minecraft:pink_bed_
  static const Block pink_bed = Block('minecraft:pink_bed');

  /// ![pink_candle](https://minecraftitemids.com/item/32/pink_candle.png) \ 
  /// [Pink Candle](https://minecraft.wiki/w/pink_candle) \ 
  /// _minecraft:pink_candle_
  static const Block pink_candle = Block('minecraft:pink_candle');

  /// ![pink_candle_cake](https://minecraftitemids.com/item/32/pink_candle_cake.png) \ 
  /// [Pink Candle Cake](https://minecraft.wiki/w/pink_candle_cake) \ 
  /// _minecraft:pink_candle_cake_
  static const Block pink_candle_cake = Block('minecraft:pink_candle_cake');

  /// ![pink_carpet](https://minecraftitemids.com/item/32/pink_carpet.png) \ 
  /// [Pink Carpet](https://minecraft.wiki/w/pink_carpet) \ 
  /// _minecraft:pink_carpet_
  static const Block pink_carpet = Block('minecraft:pink_carpet');

  /// ![pink_concrete](https://minecraftitemids.com/item/32/pink_concrete.png) \ 
  /// [Pink Concrete](https://minecraft.wiki/w/pink_concrete) \ 
  /// _minecraft:pink_concrete_
  static const Block pink_concrete = Block('minecraft:pink_concrete');

  /// ![pink_concrete_powder](https://minecraftitemids.com/item/32/pink_concrete_powder.png) \ 
  /// [Pink Concrete Powder](https://minecraft.wiki/w/pink_concrete_powder) \ 
  /// _minecraft:pink_concrete_powder_
  static const Block pink_concrete_powder = Block('minecraft:pink_concrete_powder');

  /// ![pink_glazed_terracotta](https://minecraftitemids.com/item/32/pink_glazed_terracotta.png) \ 
  /// [Pink Glazed Terracotta](https://minecraft.wiki/w/pink_glazed_terracotta) \ 
  /// _minecraft:pink_glazed_terracotta_
  static const Block pink_glazed_terracotta = Block('minecraft:pink_glazed_terracotta');

  /// ![pink_petals](https://minecraftitemids.com/item/32/pink_petals.png) \ 
  /// [Pink Petals](https://minecraft.wiki/w/pink_petals) \ 
  /// _minecraft:pink_petals_
  static const Block pink_petals = Block('minecraft:pink_petals');

  /// ![pink_shulker_box](https://minecraftitemids.com/item/32/pink_shulker_box.png) \ 
  /// [Pink Shulker Box](https://minecraft.wiki/w/pink_shulker_box) \ 
  /// _minecraft:pink_shulker_box_
  static const Block pink_shulker_box = Block('minecraft:pink_shulker_box');

  /// ![pink_stained_glass](https://minecraftitemids.com/item/32/pink_stained_glass.png) \ 
  /// [Pink Stained Glass](https://minecraft.wiki/w/pink_stained_glass) \ 
  /// _minecraft:pink_stained_glass_
  static const Block pink_stained_glass = Block('minecraft:pink_stained_glass');

  /// ![pink_stained_glass_pane](https://minecraftitemids.com/item/32/pink_stained_glass_pane.png) \ 
  /// [Pink Stained Glass Pane](https://minecraft.wiki/w/pink_stained_glass_pane) \ 
  /// _minecraft:pink_stained_glass_pane_
  static const Block pink_stained_glass_pane = Block('minecraft:pink_stained_glass_pane');

  /// ![pink_terracotta](https://minecraftitemids.com/item/32/pink_terracotta.png) \ 
  /// [Pink Terracotta](https://minecraft.wiki/w/pink_terracotta) \ 
  /// _minecraft:pink_terracotta_
  static const Block pink_terracotta = Block('minecraft:pink_terracotta');

  /// ![pink_tulip](https://minecraftitemids.com/item/32/pink_tulip.png) \ 
  /// [Pink Tulip](https://minecraft.wiki/w/pink_tulip) \ 
  /// _minecraft:pink_tulip_
  static const Block pink_tulip = Block('minecraft:pink_tulip');

  /// ![pink_wall_banner](https://minecraftitemids.com/item/32/pink_wall_banner.png) \ 
  /// [Pink Wall Banner](https://minecraft.wiki/w/pink_wall_banner) \ 
  /// _minecraft:pink_wall_banner_
  static const Block pink_wall_banner = Block('minecraft:pink_wall_banner');

  /// ![pink_wool](https://minecraftitemids.com/item/32/pink_wool.png) \ 
  /// [Pink Wool](https://minecraft.wiki/w/pink_wool) \ 
  /// _minecraft:pink_wool_
  static const Block pink_wool = Block('minecraft:pink_wool');

  /// ![piston](https://minecraftitemids.com/item/32/piston.png) \ 
  /// [Piston](https://minecraft.wiki/w/piston) \ 
  /// _minecraft:piston_
  static const Block piston = Block('minecraft:piston');

  /// ![piston_head](https://minecraftitemids.com/item/32/piston_head.png) \ 
  /// [Piston Head](https://minecraft.wiki/w/piston_head) \ 
  /// _minecraft:piston_head_
  static const Block piston_head = Block('minecraft:piston_head');

  /// ![pitcher_crop](https://minecraftitemids.com/item/32/pitcher_crop.png) \ 
  /// [Pitcher Crop](https://minecraft.wiki/w/pitcher_crop) \ 
  /// _minecraft:pitcher_crop_
  static const Block pitcher_crop = Block('minecraft:pitcher_crop');

  /// ![pitcher_plant](https://minecraftitemids.com/item/32/pitcher_plant.png) \ 
  /// [Pitcher Plant](https://minecraft.wiki/w/pitcher_plant) \ 
  /// _minecraft:pitcher_plant_
  static const Block pitcher_plant = Block('minecraft:pitcher_plant');

  /// ![player_head](https://minecraftitemids.com/item/32/player_head.png) \ 
  /// [Player Head](https://minecraft.wiki/w/player_head) \ 
  /// _minecraft:player_head_
  static const Block player_head = Block('minecraft:player_head');

  /// ![player_wall_head](https://minecraftitemids.com/item/32/player_wall_head.png) \ 
  /// [Player Wall Head](https://minecraft.wiki/w/player_wall_head) \ 
  /// _minecraft:player_wall_head_
  static const Block player_wall_head = Block('minecraft:player_wall_head');

  /// ![podzol](https://minecraftitemids.com/item/32/podzol.png) \ 
  /// [Podzol](https://minecraft.wiki/w/podzol) \ 
  /// _minecraft:podzol_
  static const Block podzol = Block('minecraft:podzol');

  /// ![pointed_dripstone](https://minecraftitemids.com/item/32/pointed_dripstone.png) \ 
  /// [Pointed Dripstone](https://minecraft.wiki/w/pointed_dripstone) \ 
  /// _minecraft:pointed_dripstone_
  static const Block pointed_dripstone = Block('minecraft:pointed_dripstone');

  /// ![polished_andesite](https://minecraftitemids.com/item/32/polished_andesite.png) \ 
  /// [Polished Andesite](https://minecraft.wiki/w/polished_andesite) \ 
  /// _minecraft:polished_andesite_
  static const Block polished_andesite = Block('minecraft:polished_andesite');

  /// ![polished_andesite_slab](https://minecraftitemids.com/item/32/polished_andesite_slab.png) \ 
  /// [Polished Andesite Slab](https://minecraft.wiki/w/polished_andesite_slab) \ 
  /// _minecraft:polished_andesite_slab_
  static const Block polished_andesite_slab = Block('minecraft:polished_andesite_slab');

  /// ![polished_andesite_stairs](https://minecraftitemids.com/item/32/polished_andesite_stairs.png) \ 
  /// [Polished Andesite Stairs](https://minecraft.wiki/w/polished_andesite_stairs) \ 
  /// _minecraft:polished_andesite_stairs_
  static const Block polished_andesite_stairs = Block('minecraft:polished_andesite_stairs');

  /// ![polished_basalt](https://minecraftitemids.com/item/32/polished_basalt.png) \ 
  /// [Polished Basalt](https://minecraft.wiki/w/polished_basalt) \ 
  /// _minecraft:polished_basalt_
  static const Block polished_basalt = Block('minecraft:polished_basalt');

  /// ![polished_blackstone](https://minecraftitemids.com/item/32/polished_blackstone.png) \ 
  /// [Polished Blackstone](https://minecraft.wiki/w/polished_blackstone) \ 
  /// _minecraft:polished_blackstone_
  static const Block polished_blackstone = Block('minecraft:polished_blackstone');

  /// ![polished_blackstone_brick_slab](https://minecraftitemids.com/item/32/polished_blackstone_brick_slab.png) \ 
  /// [Polished Blackstone Brick Slab](https://minecraft.wiki/w/polished_blackstone_brick_slab) \ 
  /// _minecraft:polished_blackstone_brick_slab_
  static const Block polished_blackstone_brick_slab = Block('minecraft:polished_blackstone_brick_slab');

  /// ![polished_blackstone_brick_stairs](https://minecraftitemids.com/item/32/polished_blackstone_brick_stairs.png) \ 
  /// [Polished Blackstone Brick Stairs](https://minecraft.wiki/w/polished_blackstone_brick_stairs) \ 
  /// _minecraft:polished_blackstone_brick_stairs_
  static const Block polished_blackstone_brick_stairs = Block('minecraft:polished_blackstone_brick_stairs');

  /// ![polished_blackstone_brick_wall](https://minecraftitemids.com/item/32/polished_blackstone_brick_wall.png) \ 
  /// [Polished Blackstone Brick Wall](https://minecraft.wiki/w/polished_blackstone_brick_wall) \ 
  /// _minecraft:polished_blackstone_brick_wall_
  static const Block polished_blackstone_brick_wall = Block('minecraft:polished_blackstone_brick_wall');

  /// ![polished_blackstone_bricks](https://minecraftitemids.com/item/32/polished_blackstone_bricks.png) \ 
  /// [Polished Blackstone Bricks](https://minecraft.wiki/w/polished_blackstone_bricks) \ 
  /// _minecraft:polished_blackstone_bricks_
  static const Block polished_blackstone_bricks = Block('minecraft:polished_blackstone_bricks');

  /// ![polished_blackstone_button](https://minecraftitemids.com/item/32/polished_blackstone_button.png) \ 
  /// [Polished Blackstone Button](https://minecraft.wiki/w/polished_blackstone_button) \ 
  /// _minecraft:polished_blackstone_button_
  static const Block polished_blackstone_button = Block('minecraft:polished_blackstone_button');

  /// ![polished_blackstone_pressure_plate](https://minecraftitemids.com/item/32/polished_blackstone_pressure_plate.png) \ 
  /// [Polished Blackstone Pressure Plate](https://minecraft.wiki/w/polished_blackstone_pressure_plate) \ 
  /// _minecraft:polished_blackstone_pressure_plate_
  static const Block polished_blackstone_pressure_plate = Block('minecraft:polished_blackstone_pressure_plate');

  /// ![polished_blackstone_slab](https://minecraftitemids.com/item/32/polished_blackstone_slab.png) \ 
  /// [Polished Blackstone Slab](https://minecraft.wiki/w/polished_blackstone_slab) \ 
  /// _minecraft:polished_blackstone_slab_
  static const Block polished_blackstone_slab = Block('minecraft:polished_blackstone_slab');

  /// ![polished_blackstone_stairs](https://minecraftitemids.com/item/32/polished_blackstone_stairs.png) \ 
  /// [Polished Blackstone Stairs](https://minecraft.wiki/w/polished_blackstone_stairs) \ 
  /// _minecraft:polished_blackstone_stairs_
  static const Block polished_blackstone_stairs = Block('minecraft:polished_blackstone_stairs');

  /// ![polished_blackstone_wall](https://minecraftitemids.com/item/32/polished_blackstone_wall.png) \ 
  /// [Polished Blackstone Wall](https://minecraft.wiki/w/polished_blackstone_wall) \ 
  /// _minecraft:polished_blackstone_wall_
  static const Block polished_blackstone_wall = Block('minecraft:polished_blackstone_wall');

  /// ![polished_deepslate](https://minecraftitemids.com/item/32/polished_deepslate.png) \ 
  /// [Polished Deepslate](https://minecraft.wiki/w/polished_deepslate) \ 
  /// _minecraft:polished_deepslate_
  static const Block polished_deepslate = Block('minecraft:polished_deepslate');

  /// ![polished_deepslate_slab](https://minecraftitemids.com/item/32/polished_deepslate_slab.png) \ 
  /// [Polished Deepslate Slab](https://minecraft.wiki/w/polished_deepslate_slab) \ 
  /// _minecraft:polished_deepslate_slab_
  static const Block polished_deepslate_slab = Block('minecraft:polished_deepslate_slab');

  /// ![polished_deepslate_stairs](https://minecraftitemids.com/item/32/polished_deepslate_stairs.png) \ 
  /// [Polished Deepslate Stairs](https://minecraft.wiki/w/polished_deepslate_stairs) \ 
  /// _minecraft:polished_deepslate_stairs_
  static const Block polished_deepslate_stairs = Block('minecraft:polished_deepslate_stairs');

  /// ![polished_deepslate_wall](https://minecraftitemids.com/item/32/polished_deepslate_wall.png) \ 
  /// [Polished Deepslate Wall](https://minecraft.wiki/w/polished_deepslate_wall) \ 
  /// _minecraft:polished_deepslate_wall_
  static const Block polished_deepslate_wall = Block('minecraft:polished_deepslate_wall');

  /// ![polished_diorite](https://minecraftitemids.com/item/32/polished_diorite.png) \ 
  /// [Polished Diorite](https://minecraft.wiki/w/polished_diorite) \ 
  /// _minecraft:polished_diorite_
  static const Block polished_diorite = Block('minecraft:polished_diorite');

  /// ![polished_diorite_slab](https://minecraftitemids.com/item/32/polished_diorite_slab.png) \ 
  /// [Polished Diorite Slab](https://minecraft.wiki/w/polished_diorite_slab) \ 
  /// _minecraft:polished_diorite_slab_
  static const Block polished_diorite_slab = Block('minecraft:polished_diorite_slab');

  /// ![polished_diorite_stairs](https://minecraftitemids.com/item/32/polished_diorite_stairs.png) \ 
  /// [Polished Diorite Stairs](https://minecraft.wiki/w/polished_diorite_stairs) \ 
  /// _minecraft:polished_diorite_stairs_
  static const Block polished_diorite_stairs = Block('minecraft:polished_diorite_stairs');

  /// ![polished_granite](https://minecraftitemids.com/item/32/polished_granite.png) \ 
  /// [Polished Granite](https://minecraft.wiki/w/polished_granite) \ 
  /// _minecraft:polished_granite_
  static const Block polished_granite = Block('minecraft:polished_granite');

  /// ![polished_granite_slab](https://minecraftitemids.com/item/32/polished_granite_slab.png) \ 
  /// [Polished Granite Slab](https://minecraft.wiki/w/polished_granite_slab) \ 
  /// _minecraft:polished_granite_slab_
  static const Block polished_granite_slab = Block('minecraft:polished_granite_slab');

  /// ![polished_granite_stairs](https://minecraftitemids.com/item/32/polished_granite_stairs.png) \ 
  /// [Polished Granite Stairs](https://minecraft.wiki/w/polished_granite_stairs) \ 
  /// _minecraft:polished_granite_stairs_
  static const Block polished_granite_stairs = Block('minecraft:polished_granite_stairs');

  /// ![polished_tuff](https://minecraftitemids.com/item/32/polished_tuff.png) \ 
  /// [Polished Tuff](https://minecraft.wiki/w/polished_tuff) \ 
  /// _minecraft:polished_tuff_
  static const Block polished_tuff = Block('minecraft:polished_tuff');

  /// ![polished_tuff_slab](https://minecraftitemids.com/item/32/polished_tuff_slab.png) \ 
  /// [Polished Tuff Slab](https://minecraft.wiki/w/polished_tuff_slab) \ 
  /// _minecraft:polished_tuff_slab_
  static const Block polished_tuff_slab = Block('minecraft:polished_tuff_slab');

  /// ![polished_tuff_stairs](https://minecraftitemids.com/item/32/polished_tuff_stairs.png) \ 
  /// [Polished Tuff Stairs](https://minecraft.wiki/w/polished_tuff_stairs) \ 
  /// _minecraft:polished_tuff_stairs_
  static const Block polished_tuff_stairs = Block('minecraft:polished_tuff_stairs');

  /// ![polished_tuff_wall](https://minecraftitemids.com/item/32/polished_tuff_wall.png) \ 
  /// [Polished Tuff Wall](https://minecraft.wiki/w/polished_tuff_wall) \ 
  /// _minecraft:polished_tuff_wall_
  static const Block polished_tuff_wall = Block('minecraft:polished_tuff_wall');

  /// ![poppy](https://minecraftitemids.com/item/32/poppy.png) \ 
  /// [Poppy](https://minecraft.wiki/w/poppy) \ 
  /// _minecraft:poppy_
  static const Block poppy = Block('minecraft:poppy');

  /// ![potatoes](https://minecraftitemids.com/item/32/potatoes.png) \ 
  /// [Potatoes](https://minecraft.wiki/w/potatoes) \ 
  /// _minecraft:potatoes_
  static const Block potatoes = Block('minecraft:potatoes');

  /// ![potted_acacia_sapling](https://minecraftitemids.com/item/32/potted_acacia_sapling.png) \ 
  /// [Potted Acacia Sapling](https://minecraft.wiki/w/potted_acacia_sapling) \ 
  /// _minecraft:potted_acacia_sapling_
  static const Block potted_acacia_sapling = Block('minecraft:potted_acacia_sapling');

  /// ![potted_allium](https://minecraftitemids.com/item/32/potted_allium.png) \ 
  /// [Potted Allium](https://minecraft.wiki/w/potted_allium) \ 
  /// _minecraft:potted_allium_
  static const Block potted_allium = Block('minecraft:potted_allium');

  /// ![potted_azalea_bush](https://minecraftitemids.com/item/32/potted_azalea_bush.png) \ 
  /// [Potted Azalea Bush](https://minecraft.wiki/w/potted_azalea_bush) \ 
  /// _minecraft:potted_azalea_bush_
  static const Block potted_azalea_bush = Block('minecraft:potted_azalea_bush');

  /// ![potted_azure_bluet](https://minecraftitemids.com/item/32/potted_azure_bluet.png) \ 
  /// [Potted Azure Bluet](https://minecraft.wiki/w/potted_azure_bluet) \ 
  /// _minecraft:potted_azure_bluet_
  static const Block potted_azure_bluet = Block('minecraft:potted_azure_bluet');

  /// ![potted_bamboo](https://minecraftitemids.com/item/32/potted_bamboo.png) \ 
  /// [Potted Bamboo](https://minecraft.wiki/w/potted_bamboo) \ 
  /// _minecraft:potted_bamboo_
  static const Block potted_bamboo = Block('minecraft:potted_bamboo');

  /// ![potted_birch_sapling](https://minecraftitemids.com/item/32/potted_birch_sapling.png) \ 
  /// [Potted Birch Sapling](https://minecraft.wiki/w/potted_birch_sapling) \ 
  /// _minecraft:potted_birch_sapling_
  static const Block potted_birch_sapling = Block('minecraft:potted_birch_sapling');

  /// ![potted_blue_orchid](https://minecraftitemids.com/item/32/potted_blue_orchid.png) \ 
  /// [Potted Blue Orchid](https://minecraft.wiki/w/potted_blue_orchid) \ 
  /// _minecraft:potted_blue_orchid_
  static const Block potted_blue_orchid = Block('minecraft:potted_blue_orchid');

  /// ![potted_brown_mushroom](https://minecraftitemids.com/item/32/potted_brown_mushroom.png) \ 
  /// [Potted Brown Mushroom](https://minecraft.wiki/w/potted_brown_mushroom) \ 
  /// _minecraft:potted_brown_mushroom_
  static const Block potted_brown_mushroom = Block('minecraft:potted_brown_mushroom');

  /// ![potted_cactus](https://minecraftitemids.com/item/32/potted_cactus.png) \ 
  /// [Potted Cactus](https://minecraft.wiki/w/potted_cactus) \ 
  /// _minecraft:potted_cactus_
  static const Block potted_cactus = Block('minecraft:potted_cactus');

  /// ![potted_cherry_sapling](https://minecraftitemids.com/item/32/potted_cherry_sapling.png) \ 
  /// [Potted Cherry Sapling](https://minecraft.wiki/w/potted_cherry_sapling) \ 
  /// _minecraft:potted_cherry_sapling_
  static const Block potted_cherry_sapling = Block('minecraft:potted_cherry_sapling');

  /// ![potted_cornflower](https://minecraftitemids.com/item/32/potted_cornflower.png) \ 
  /// [Potted Cornflower](https://minecraft.wiki/w/potted_cornflower) \ 
  /// _minecraft:potted_cornflower_
  static const Block potted_cornflower = Block('minecraft:potted_cornflower');

  /// ![potted_crimson_fungus](https://minecraftitemids.com/item/32/potted_crimson_fungus.png) \ 
  /// [Potted Crimson Fungus](https://minecraft.wiki/w/potted_crimson_fungus) \ 
  /// _minecraft:potted_crimson_fungus_
  static const Block potted_crimson_fungus = Block('minecraft:potted_crimson_fungus');

  /// ![potted_crimson_roots](https://minecraftitemids.com/item/32/potted_crimson_roots.png) \ 
  /// [Potted Crimson Roots](https://minecraft.wiki/w/potted_crimson_roots) \ 
  /// _minecraft:potted_crimson_roots_
  static const Block potted_crimson_roots = Block('minecraft:potted_crimson_roots');

  /// ![potted_dandelion](https://minecraftitemids.com/item/32/potted_dandelion.png) \ 
  /// [Potted Dandelion](https://minecraft.wiki/w/potted_dandelion) \ 
  /// _minecraft:potted_dandelion_
  static const Block potted_dandelion = Block('minecraft:potted_dandelion');

  /// ![potted_dark_oak_sapling](https://minecraftitemids.com/item/32/potted_dark_oak_sapling.png) \ 
  /// [Potted Dark Oak Sapling](https://minecraft.wiki/w/potted_dark_oak_sapling) \ 
  /// _minecraft:potted_dark_oak_sapling_
  static const Block potted_dark_oak_sapling = Block('minecraft:potted_dark_oak_sapling');

  /// ![potted_dead_bush](https://minecraftitemids.com/item/32/potted_dead_bush.png) \ 
  /// [Potted Dead Bush](https://minecraft.wiki/w/potted_dead_bush) \ 
  /// _minecraft:potted_dead_bush_
  static const Block potted_dead_bush = Block('minecraft:potted_dead_bush');

  /// ![potted_fern](https://minecraftitemids.com/item/32/potted_fern.png) \ 
  /// [Potted Fern](https://minecraft.wiki/w/potted_fern) \ 
  /// _minecraft:potted_fern_
  static const Block potted_fern = Block('minecraft:potted_fern');

  /// ![potted_flowering_azalea_bush](https://minecraftitemids.com/item/32/potted_flowering_azalea_bush.png) \ 
  /// [Potted Flowering Azalea Bush](https://minecraft.wiki/w/potted_flowering_azalea_bush) \ 
  /// _minecraft:potted_flowering_azalea_bush_
  static const Block potted_flowering_azalea_bush = Block('minecraft:potted_flowering_azalea_bush');

  /// ![potted_jungle_sapling](https://minecraftitemids.com/item/32/potted_jungle_sapling.png) \ 
  /// [Potted Jungle Sapling](https://minecraft.wiki/w/potted_jungle_sapling) \ 
  /// _minecraft:potted_jungle_sapling_
  static const Block potted_jungle_sapling = Block('minecraft:potted_jungle_sapling');

  /// ![potted_lily_of_the_valley](https://minecraftitemids.com/item/32/potted_lily_of_the_valley.png) \ 
  /// [Potted Lily Of The Valley](https://minecraft.wiki/w/potted_lily_of_the_valley) \ 
  /// _minecraft:potted_lily_of_the_valley_
  static const Block potted_lily_of_the_valley = Block('minecraft:potted_lily_of_the_valley');

  /// ![potted_mangrove_propagule](https://minecraftitemids.com/item/32/potted_mangrove_propagule.png) \ 
  /// [Potted Mangrove Propagule](https://minecraft.wiki/w/potted_mangrove_propagule) \ 
  /// _minecraft:potted_mangrove_propagule_
  static const Block potted_mangrove_propagule = Block('minecraft:potted_mangrove_propagule');

  /// ![potted_oak_sapling](https://minecraftitemids.com/item/32/potted_oak_sapling.png) \ 
  /// [Potted Oak Sapling](https://minecraft.wiki/w/potted_oak_sapling) \ 
  /// _minecraft:potted_oak_sapling_
  static const Block potted_oak_sapling = Block('minecraft:potted_oak_sapling');

  /// ![potted_orange_tulip](https://minecraftitemids.com/item/32/potted_orange_tulip.png) \ 
  /// [Potted Orange Tulip](https://minecraft.wiki/w/potted_orange_tulip) \ 
  /// _minecraft:potted_orange_tulip_
  static const Block potted_orange_tulip = Block('minecraft:potted_orange_tulip');

  /// ![potted_oxeye_daisy](https://minecraftitemids.com/item/32/potted_oxeye_daisy.png) \ 
  /// [Potted Oxeye Daisy](https://minecraft.wiki/w/potted_oxeye_daisy) \ 
  /// _minecraft:potted_oxeye_daisy_
  static const Block potted_oxeye_daisy = Block('minecraft:potted_oxeye_daisy');

  /// ![potted_pink_tulip](https://minecraftitemids.com/item/32/potted_pink_tulip.png) \ 
  /// [Potted Pink Tulip](https://minecraft.wiki/w/potted_pink_tulip) \ 
  /// _minecraft:potted_pink_tulip_
  static const Block potted_pink_tulip = Block('minecraft:potted_pink_tulip');

  /// ![potted_poppy](https://minecraftitemids.com/item/32/potted_poppy.png) \ 
  /// [Potted Poppy](https://minecraft.wiki/w/potted_poppy) \ 
  /// _minecraft:potted_poppy_
  static const Block potted_poppy = Block('minecraft:potted_poppy');

  /// ![potted_red_mushroom](https://minecraftitemids.com/item/32/potted_red_mushroom.png) \ 
  /// [Potted Red Mushroom](https://minecraft.wiki/w/potted_red_mushroom) \ 
  /// _minecraft:potted_red_mushroom_
  static const Block potted_red_mushroom = Block('minecraft:potted_red_mushroom');

  /// ![potted_red_tulip](https://minecraftitemids.com/item/32/potted_red_tulip.png) \ 
  /// [Potted Red Tulip](https://minecraft.wiki/w/potted_red_tulip) \ 
  /// _minecraft:potted_red_tulip_
  static const Block potted_red_tulip = Block('minecraft:potted_red_tulip');

  /// ![potted_spruce_sapling](https://minecraftitemids.com/item/32/potted_spruce_sapling.png) \ 
  /// [Potted Spruce Sapling](https://minecraft.wiki/w/potted_spruce_sapling) \ 
  /// _minecraft:potted_spruce_sapling_
  static const Block potted_spruce_sapling = Block('minecraft:potted_spruce_sapling');

  /// ![potted_torchflower](https://minecraftitemids.com/item/32/potted_torchflower.png) \ 
  /// [Potted Torchflower](https://minecraft.wiki/w/potted_torchflower) \ 
  /// _minecraft:potted_torchflower_
  static const Block potted_torchflower = Block('minecraft:potted_torchflower');

  /// ![potted_warped_fungus](https://minecraftitemids.com/item/32/potted_warped_fungus.png) \ 
  /// [Potted Warped Fungus](https://minecraft.wiki/w/potted_warped_fungus) \ 
  /// _minecraft:potted_warped_fungus_
  static const Block potted_warped_fungus = Block('minecraft:potted_warped_fungus');

  /// ![potted_warped_roots](https://minecraftitemids.com/item/32/potted_warped_roots.png) \ 
  /// [Potted Warped Roots](https://minecraft.wiki/w/potted_warped_roots) \ 
  /// _minecraft:potted_warped_roots_
  static const Block potted_warped_roots = Block('minecraft:potted_warped_roots');

  /// ![potted_white_tulip](https://minecraftitemids.com/item/32/potted_white_tulip.png) \ 
  /// [Potted White Tulip](https://minecraft.wiki/w/potted_white_tulip) \ 
  /// _minecraft:potted_white_tulip_
  static const Block potted_white_tulip = Block('minecraft:potted_white_tulip');

  /// ![potted_wither_rose](https://minecraftitemids.com/item/32/potted_wither_rose.png) \ 
  /// [Potted Wither Rose](https://minecraft.wiki/w/potted_wither_rose) \ 
  /// _minecraft:potted_wither_rose_
  static const Block potted_wither_rose = Block('minecraft:potted_wither_rose');

  /// ![powder_snow](https://minecraftitemids.com/item/32/powder_snow.png) \ 
  /// [Powder Snow](https://minecraft.wiki/w/powder_snow) \ 
  /// _minecraft:powder_snow_
  static const Block powder_snow = Block('minecraft:powder_snow');

  /// ![powder_snow_cauldron](https://minecraftitemids.com/item/32/powder_snow_cauldron.png) \ 
  /// [Powder Snow Cauldron](https://minecraft.wiki/w/powder_snow_cauldron) \ 
  /// _minecraft:powder_snow_cauldron_
  static const Block powder_snow_cauldron = Block('minecraft:powder_snow_cauldron');

  /// ![powered_rail](https://minecraftitemids.com/item/32/powered_rail.png) \ 
  /// [Powered Rail](https://minecraft.wiki/w/powered_rail) \ 
  /// _minecraft:powered_rail_
  static const Block powered_rail = Block('minecraft:powered_rail');

  /// ![prismarine](https://minecraftitemids.com/item/32/prismarine.png) \ 
  /// [Prismarine](https://minecraft.wiki/w/prismarine) \ 
  /// _minecraft:prismarine_
  static const Block prismarine = Block('minecraft:prismarine');

  /// ![prismarine_brick_slab](https://minecraftitemids.com/item/32/prismarine_brick_slab.png) \ 
  /// [Prismarine Brick Slab](https://minecraft.wiki/w/prismarine_brick_slab) \ 
  /// _minecraft:prismarine_brick_slab_
  static const Block prismarine_brick_slab = Block('minecraft:prismarine_brick_slab');

  /// ![prismarine_brick_stairs](https://minecraftitemids.com/item/32/prismarine_brick_stairs.png) \ 
  /// [Prismarine Brick Stairs](https://minecraft.wiki/w/prismarine_brick_stairs) \ 
  /// _minecraft:prismarine_brick_stairs_
  static const Block prismarine_brick_stairs = Block('minecraft:prismarine_brick_stairs');

  /// ![prismarine_bricks](https://minecraftitemids.com/item/32/prismarine_bricks.png) \ 
  /// [Prismarine Bricks](https://minecraft.wiki/w/prismarine_bricks) \ 
  /// _minecraft:prismarine_bricks_
  static const Block prismarine_bricks = Block('minecraft:prismarine_bricks');

  /// ![prismarine_slab](https://minecraftitemids.com/item/32/prismarine_slab.png) \ 
  /// [Prismarine Slab](https://minecraft.wiki/w/prismarine_slab) \ 
  /// _minecraft:prismarine_slab_
  static const Block prismarine_slab = Block('minecraft:prismarine_slab');

  /// ![prismarine_stairs](https://minecraftitemids.com/item/32/prismarine_stairs.png) \ 
  /// [Prismarine Stairs](https://minecraft.wiki/w/prismarine_stairs) \ 
  /// _minecraft:prismarine_stairs_
  static const Block prismarine_stairs = Block('minecraft:prismarine_stairs');

  /// ![prismarine_wall](https://minecraftitemids.com/item/32/prismarine_wall.png) \ 
  /// [Prismarine Wall](https://minecraft.wiki/w/prismarine_wall) \ 
  /// _minecraft:prismarine_wall_
  static const Block prismarine_wall = Block('minecraft:prismarine_wall');

  /// ![pumpkin](https://minecraftitemids.com/item/32/pumpkin.png) \ 
  /// [Pumpkin](https://minecraft.wiki/w/pumpkin) \ 
  /// _minecraft:pumpkin_
  static const Block pumpkin = Block('minecraft:pumpkin');

  /// ![pumpkin_stem](https://minecraftitemids.com/item/32/pumpkin_stem.png) \ 
  /// [Pumpkin Stem](https://minecraft.wiki/w/pumpkin_stem) \ 
  /// _minecraft:pumpkin_stem_
  static const Block pumpkin_stem = Block('minecraft:pumpkin_stem');

  /// ![purple_banner](https://minecraftitemids.com/item/32/purple_banner.png) \ 
  /// [Purple Banner](https://minecraft.wiki/w/purple_banner) \ 
  /// _minecraft:purple_banner_
  static const Block purple_banner = Block('minecraft:purple_banner');

  /// ![purple_bed](https://minecraftitemids.com/item/32/purple_bed.png) \ 
  /// [Purple Bed](https://minecraft.wiki/w/purple_bed) \ 
  /// _minecraft:purple_bed_
  static const Block purple_bed = Block('minecraft:purple_bed');

  /// ![purple_candle](https://minecraftitemids.com/item/32/purple_candle.png) \ 
  /// [Purple Candle](https://minecraft.wiki/w/purple_candle) \ 
  /// _minecraft:purple_candle_
  static const Block purple_candle = Block('minecraft:purple_candle');

  /// ![purple_candle_cake](https://minecraftitemids.com/item/32/purple_candle_cake.png) \ 
  /// [Purple Candle Cake](https://minecraft.wiki/w/purple_candle_cake) \ 
  /// _minecraft:purple_candle_cake_
  static const Block purple_candle_cake = Block('minecraft:purple_candle_cake');

  /// ![purple_carpet](https://minecraftitemids.com/item/32/purple_carpet.png) \ 
  /// [Purple Carpet](https://minecraft.wiki/w/purple_carpet) \ 
  /// _minecraft:purple_carpet_
  static const Block purple_carpet = Block('minecraft:purple_carpet');

  /// ![purple_concrete](https://minecraftitemids.com/item/32/purple_concrete.png) \ 
  /// [Purple Concrete](https://minecraft.wiki/w/purple_concrete) \ 
  /// _minecraft:purple_concrete_
  static const Block purple_concrete = Block('minecraft:purple_concrete');

  /// ![purple_concrete_powder](https://minecraftitemids.com/item/32/purple_concrete_powder.png) \ 
  /// [Purple Concrete Powder](https://minecraft.wiki/w/purple_concrete_powder) \ 
  /// _minecraft:purple_concrete_powder_
  static const Block purple_concrete_powder = Block('minecraft:purple_concrete_powder');

  /// ![purple_glazed_terracotta](https://minecraftitemids.com/item/32/purple_glazed_terracotta.png) \ 
  /// [Purple Glazed Terracotta](https://minecraft.wiki/w/purple_glazed_terracotta) \ 
  /// _minecraft:purple_glazed_terracotta_
  static const Block purple_glazed_terracotta = Block('minecraft:purple_glazed_terracotta');

  /// ![purple_shulker_box](https://minecraftitemids.com/item/32/purple_shulker_box.png) \ 
  /// [Purple Shulker Box](https://minecraft.wiki/w/purple_shulker_box) \ 
  /// _minecraft:purple_shulker_box_
  static const Block purple_shulker_box = Block('minecraft:purple_shulker_box');

  /// ![purple_stained_glass](https://minecraftitemids.com/item/32/purple_stained_glass.png) \ 
  /// [Purple Stained Glass](https://minecraft.wiki/w/purple_stained_glass) \ 
  /// _minecraft:purple_stained_glass_
  static const Block purple_stained_glass = Block('minecraft:purple_stained_glass');

  /// ![purple_stained_glass_pane](https://minecraftitemids.com/item/32/purple_stained_glass_pane.png) \ 
  /// [Purple Stained Glass Pane](https://minecraft.wiki/w/purple_stained_glass_pane) \ 
  /// _minecraft:purple_stained_glass_pane_
  static const Block purple_stained_glass_pane = Block('minecraft:purple_stained_glass_pane');

  /// ![purple_terracotta](https://minecraftitemids.com/item/32/purple_terracotta.png) \ 
  /// [Purple Terracotta](https://minecraft.wiki/w/purple_terracotta) \ 
  /// _minecraft:purple_terracotta_
  static const Block purple_terracotta = Block('minecraft:purple_terracotta');

  /// ![purple_wall_banner](https://minecraftitemids.com/item/32/purple_wall_banner.png) \ 
  /// [Purple Wall Banner](https://minecraft.wiki/w/purple_wall_banner) \ 
  /// _minecraft:purple_wall_banner_
  static const Block purple_wall_banner = Block('minecraft:purple_wall_banner');

  /// ![purple_wool](https://minecraftitemids.com/item/32/purple_wool.png) \ 
  /// [Purple Wool](https://minecraft.wiki/w/purple_wool) \ 
  /// _minecraft:purple_wool_
  static const Block purple_wool = Block('minecraft:purple_wool');

  /// ![purpur_block](https://minecraftitemids.com/item/32/purpur_block.png) \ 
  /// [Purpur Block](https://minecraft.wiki/w/purpur_block) \ 
  /// _minecraft:purpur_block_
  static const Block purpur_block = Block('minecraft:purpur_block');

  /// ![purpur_pillar](https://minecraftitemids.com/item/32/purpur_pillar.png) \ 
  /// [Purpur Pillar](https://minecraft.wiki/w/purpur_pillar) \ 
  /// _minecraft:purpur_pillar_
  static const Block purpur_pillar = Block('minecraft:purpur_pillar');

  /// ![purpur_slab](https://minecraftitemids.com/item/32/purpur_slab.png) \ 
  /// [Purpur Slab](https://minecraft.wiki/w/purpur_slab) \ 
  /// _minecraft:purpur_slab_
  static const Block purpur_slab = Block('minecraft:purpur_slab');

  /// ![purpur_stairs](https://minecraftitemids.com/item/32/purpur_stairs.png) \ 
  /// [Purpur Stairs](https://minecraft.wiki/w/purpur_stairs) \ 
  /// _minecraft:purpur_stairs_
  static const Block purpur_stairs = Block('minecraft:purpur_stairs');

  /// ![quartz_block](https://minecraftitemids.com/item/32/quartz_block.png) \ 
  /// [Quartz Block](https://minecraft.wiki/w/quartz_block) \ 
  /// _minecraft:quartz_block_
  static const Block quartz_block = Block('minecraft:quartz_block');

  /// ![quartz_bricks](https://minecraftitemids.com/item/32/quartz_bricks.png) \ 
  /// [Quartz Bricks](https://minecraft.wiki/w/quartz_bricks) \ 
  /// _minecraft:quartz_bricks_
  static const Block quartz_bricks = Block('minecraft:quartz_bricks');

  /// ![quartz_pillar](https://minecraftitemids.com/item/32/quartz_pillar.png) \ 
  /// [Quartz Pillar](https://minecraft.wiki/w/quartz_pillar) \ 
  /// _minecraft:quartz_pillar_
  static const Block quartz_pillar = Block('minecraft:quartz_pillar');

  /// ![quartz_slab](https://minecraftitemids.com/item/32/quartz_slab.png) \ 
  /// [Quartz Slab](https://minecraft.wiki/w/quartz_slab) \ 
  /// _minecraft:quartz_slab_
  static const Block quartz_slab = Block('minecraft:quartz_slab');

  /// ![quartz_stairs](https://minecraftitemids.com/item/32/quartz_stairs.png) \ 
  /// [Quartz Stairs](https://minecraft.wiki/w/quartz_stairs) \ 
  /// _minecraft:quartz_stairs_
  static const Block quartz_stairs = Block('minecraft:quartz_stairs');

  /// ![rail](https://minecraftitemids.com/item/32/rail.png) \ 
  /// [Rail](https://minecraft.wiki/w/rail) \ 
  /// _minecraft:rail_
  static const Block rail = Block('minecraft:rail');

  /// ![raw_copper_block](https://minecraftitemids.com/item/32/raw_copper_block.png) \ 
  /// [Raw Copper Block](https://minecraft.wiki/w/raw_copper_block) \ 
  /// _minecraft:raw_copper_block_
  static const Block raw_copper_block = Block('minecraft:raw_copper_block');

  /// ![raw_gold_block](https://minecraftitemids.com/item/32/raw_gold_block.png) \ 
  /// [Raw Gold Block](https://minecraft.wiki/w/raw_gold_block) \ 
  /// _minecraft:raw_gold_block_
  static const Block raw_gold_block = Block('minecraft:raw_gold_block');

  /// ![raw_iron_block](https://minecraftitemids.com/item/32/raw_iron_block.png) \ 
  /// [Raw Iron Block](https://minecraft.wiki/w/raw_iron_block) \ 
  /// _minecraft:raw_iron_block_
  static const Block raw_iron_block = Block('minecraft:raw_iron_block');

  /// ![red_banner](https://minecraftitemids.com/item/32/red_banner.png) \ 
  /// [Red Banner](https://minecraft.wiki/w/red_banner) \ 
  /// _minecraft:red_banner_
  static const Block red_banner = Block('minecraft:red_banner');

  /// ![red_bed](https://minecraftitemids.com/item/32/red_bed.png) \ 
  /// [Red Bed](https://minecraft.wiki/w/red_bed) \ 
  /// _minecraft:red_bed_
  static const Block red_bed = Block('minecraft:red_bed');

  /// ![red_candle](https://minecraftitemids.com/item/32/red_candle.png) \ 
  /// [Red Candle](https://minecraft.wiki/w/red_candle) \ 
  /// _minecraft:red_candle_
  static const Block red_candle = Block('minecraft:red_candle');

  /// ![red_candle_cake](https://minecraftitemids.com/item/32/red_candle_cake.png) \ 
  /// [Red Candle Cake](https://minecraft.wiki/w/red_candle_cake) \ 
  /// _minecraft:red_candle_cake_
  static const Block red_candle_cake = Block('minecraft:red_candle_cake');

  /// ![red_carpet](https://minecraftitemids.com/item/32/red_carpet.png) \ 
  /// [Red Carpet](https://minecraft.wiki/w/red_carpet) \ 
  /// _minecraft:red_carpet_
  static const Block red_carpet = Block('minecraft:red_carpet');

  /// ![red_concrete](https://minecraftitemids.com/item/32/red_concrete.png) \ 
  /// [Red Concrete](https://minecraft.wiki/w/red_concrete) \ 
  /// _minecraft:red_concrete_
  static const Block red_concrete = Block('minecraft:red_concrete');

  /// ![red_concrete_powder](https://minecraftitemids.com/item/32/red_concrete_powder.png) \ 
  /// [Red Concrete Powder](https://minecraft.wiki/w/red_concrete_powder) \ 
  /// _minecraft:red_concrete_powder_
  static const Block red_concrete_powder = Block('minecraft:red_concrete_powder');

  /// ![red_glazed_terracotta](https://minecraftitemids.com/item/32/red_glazed_terracotta.png) \ 
  /// [Red Glazed Terracotta](https://minecraft.wiki/w/red_glazed_terracotta) \ 
  /// _minecraft:red_glazed_terracotta_
  static const Block red_glazed_terracotta = Block('minecraft:red_glazed_terracotta');

  /// ![red_mushroom](https://minecraftitemids.com/item/32/red_mushroom.png) \ 
  /// [Red Mushroom](https://minecraft.wiki/w/red_mushroom) \ 
  /// _minecraft:red_mushroom_
  static const Block red_mushroom = Block('minecraft:red_mushroom');

  /// ![red_mushroom_block](https://minecraftitemids.com/item/32/red_mushroom_block.png) \ 
  /// [Red Mushroom Block](https://minecraft.wiki/w/red_mushroom_block) \ 
  /// _minecraft:red_mushroom_block_
  static const Block red_mushroom_block = Block('minecraft:red_mushroom_block');

  /// ![red_nether_brick_slab](https://minecraftitemids.com/item/32/red_nether_brick_slab.png) \ 
  /// [Red Nether Brick Slab](https://minecraft.wiki/w/red_nether_brick_slab) \ 
  /// _minecraft:red_nether_brick_slab_
  static const Block red_nether_brick_slab = Block('minecraft:red_nether_brick_slab');

  /// ![red_nether_brick_stairs](https://minecraftitemids.com/item/32/red_nether_brick_stairs.png) \ 
  /// [Red Nether Brick Stairs](https://minecraft.wiki/w/red_nether_brick_stairs) \ 
  /// _minecraft:red_nether_brick_stairs_
  static const Block red_nether_brick_stairs = Block('minecraft:red_nether_brick_stairs');

  /// ![red_nether_brick_wall](https://minecraftitemids.com/item/32/red_nether_brick_wall.png) \ 
  /// [Red Nether Brick Wall](https://minecraft.wiki/w/red_nether_brick_wall) \ 
  /// _minecraft:red_nether_brick_wall_
  static const Block red_nether_brick_wall = Block('minecraft:red_nether_brick_wall');

  /// ![red_nether_bricks](https://minecraftitemids.com/item/32/red_nether_bricks.png) \ 
  /// [Red Nether Bricks](https://minecraft.wiki/w/red_nether_bricks) \ 
  /// _minecraft:red_nether_bricks_
  static const Block red_nether_bricks = Block('minecraft:red_nether_bricks');

  /// ![red_sand](https://minecraftitemids.com/item/32/red_sand.png) \ 
  /// [Red Sand](https://minecraft.wiki/w/red_sand) \ 
  /// _minecraft:red_sand_
  static const Block red_sand = Block('minecraft:red_sand');

  /// ![red_sandstone](https://minecraftitemids.com/item/32/red_sandstone.png) \ 
  /// [Red Sandstone](https://minecraft.wiki/w/red_sandstone) \ 
  /// _minecraft:red_sandstone_
  static const Block red_sandstone = Block('minecraft:red_sandstone');

  /// ![red_sandstone_slab](https://minecraftitemids.com/item/32/red_sandstone_slab.png) \ 
  /// [Red Sandstone Slab](https://minecraft.wiki/w/red_sandstone_slab) \ 
  /// _minecraft:red_sandstone_slab_
  static const Block red_sandstone_slab = Block('minecraft:red_sandstone_slab');

  /// ![red_sandstone_stairs](https://minecraftitemids.com/item/32/red_sandstone_stairs.png) \ 
  /// [Red Sandstone Stairs](https://minecraft.wiki/w/red_sandstone_stairs) \ 
  /// _minecraft:red_sandstone_stairs_
  static const Block red_sandstone_stairs = Block('minecraft:red_sandstone_stairs');

  /// ![red_sandstone_wall](https://minecraftitemids.com/item/32/red_sandstone_wall.png) \ 
  /// [Red Sandstone Wall](https://minecraft.wiki/w/red_sandstone_wall) \ 
  /// _minecraft:red_sandstone_wall_
  static const Block red_sandstone_wall = Block('minecraft:red_sandstone_wall');

  /// ![red_shulker_box](https://minecraftitemids.com/item/32/red_shulker_box.png) \ 
  /// [Red Shulker Box](https://minecraft.wiki/w/red_shulker_box) \ 
  /// _minecraft:red_shulker_box_
  static const Block red_shulker_box = Block('minecraft:red_shulker_box');

  /// ![red_stained_glass](https://minecraftitemids.com/item/32/red_stained_glass.png) \ 
  /// [Red Stained Glass](https://minecraft.wiki/w/red_stained_glass) \ 
  /// _minecraft:red_stained_glass_
  static const Block red_stained_glass = Block('minecraft:red_stained_glass');

  /// ![red_stained_glass_pane](https://minecraftitemids.com/item/32/red_stained_glass_pane.png) \ 
  /// [Red Stained Glass Pane](https://minecraft.wiki/w/red_stained_glass_pane) \ 
  /// _minecraft:red_stained_glass_pane_
  static const Block red_stained_glass_pane = Block('minecraft:red_stained_glass_pane');

  /// ![red_terracotta](https://minecraftitemids.com/item/32/red_terracotta.png) \ 
  /// [Red Terracotta](https://minecraft.wiki/w/red_terracotta) \ 
  /// _minecraft:red_terracotta_
  static const Block red_terracotta = Block('minecraft:red_terracotta');

  /// ![red_tulip](https://minecraftitemids.com/item/32/red_tulip.png) \ 
  /// [Red Tulip](https://minecraft.wiki/w/red_tulip) \ 
  /// _minecraft:red_tulip_
  static const Block red_tulip = Block('minecraft:red_tulip');

  /// ![red_wall_banner](https://minecraftitemids.com/item/32/red_wall_banner.png) \ 
  /// [Red Wall Banner](https://minecraft.wiki/w/red_wall_banner) \ 
  /// _minecraft:red_wall_banner_
  static const Block red_wall_banner = Block('minecraft:red_wall_banner');

  /// ![red_wool](https://minecraftitemids.com/item/32/red_wool.png) \ 
  /// [Red Wool](https://minecraft.wiki/w/red_wool) \ 
  /// _minecraft:red_wool_
  static const Block red_wool = Block('minecraft:red_wool');

  /// ![redstone_block](https://minecraftitemids.com/item/32/redstone_block.png) \ 
  /// [Redstone Block](https://minecraft.wiki/w/redstone_block) \ 
  /// _minecraft:redstone_block_
  static const Block redstone_block = Block('minecraft:redstone_block');

  /// ![redstone_lamp](https://minecraftitemids.com/item/32/redstone_lamp.png) \ 
  /// [Redstone Lamp](https://minecraft.wiki/w/redstone_lamp) \ 
  /// _minecraft:redstone_lamp_
  static const Block redstone_lamp = Block('minecraft:redstone_lamp');

  /// ![redstone_ore](https://minecraftitemids.com/item/32/redstone_ore.png) \ 
  /// [Redstone Ore](https://minecraft.wiki/w/redstone_ore) \ 
  /// _minecraft:redstone_ore_
  static const Block redstone_ore = Block('minecraft:redstone_ore');

  /// ![redstone_torch](https://minecraftitemids.com/item/32/redstone_torch.png) \ 
  /// [Redstone Torch](https://minecraft.wiki/w/redstone_torch) \ 
  /// _minecraft:redstone_torch_
  static const Block redstone_torch = Block('minecraft:redstone_torch');

  /// ![redstone_wall_torch](https://minecraftitemids.com/item/32/redstone_wall_torch.png) \ 
  /// [Redstone Wall Torch](https://minecraft.wiki/w/redstone_wall_torch) \ 
  /// _minecraft:redstone_wall_torch_
  static const Block redstone_wall_torch = Block('minecraft:redstone_wall_torch');

  /// ![redstone_wire](https://minecraftitemids.com/item/32/redstone_wire.png) \ 
  /// [Redstone Wire](https://minecraft.wiki/w/redstone_wire) \ 
  /// _minecraft:redstone_wire_
  static const Block redstone_wire = Block('minecraft:redstone_wire');

  /// ![reinforced_deepslate](https://minecraftitemids.com/item/32/reinforced_deepslate.png) \ 
  /// [Reinforced Deepslate](https://minecraft.wiki/w/reinforced_deepslate) \ 
  /// _minecraft:reinforced_deepslate_
  static const Block reinforced_deepslate = Block('minecraft:reinforced_deepslate');

  /// ![repeater](https://minecraftitemids.com/item/32/repeater.png) \ 
  /// [Repeater](https://minecraft.wiki/w/repeater) \ 
  /// _minecraft:repeater_
  static const Block repeater = Block('minecraft:repeater');

  /// ![repeating_command_block](https://minecraftitemids.com/item/32/repeating_command_block.png) \ 
  /// [Repeating Command Block](https://minecraft.wiki/w/repeating_command_block) \ 
  /// _minecraft:repeating_command_block_
  static const Block repeating_command_block = Block('minecraft:repeating_command_block');

  /// ![respawn_anchor](https://minecraftitemids.com/item/32/respawn_anchor.png) \ 
  /// [Respawn Anchor](https://minecraft.wiki/w/respawn_anchor) \ 
  /// _minecraft:respawn_anchor_
  static const Block respawn_anchor = Block('minecraft:respawn_anchor');

  /// ![rooted_dirt](https://minecraftitemids.com/item/32/rooted_dirt.png) \ 
  /// [Rooted Dirt](https://minecraft.wiki/w/rooted_dirt) \ 
  /// _minecraft:rooted_dirt_
  static const Block rooted_dirt = Block('minecraft:rooted_dirt');

  /// ![rose_bush](https://minecraftitemids.com/item/32/rose_bush.png) \ 
  /// [Rose Bush](https://minecraft.wiki/w/rose_bush) \ 
  /// _minecraft:rose_bush_
  static const Block rose_bush = Block('minecraft:rose_bush');

  /// ![sand](https://minecraftitemids.com/item/32/sand.png) \ 
  /// [Sand](https://minecraft.wiki/w/sand) \ 
  /// _minecraft:sand_
  static const Block sand = Block('minecraft:sand');

  /// ![sandstone](https://minecraftitemids.com/item/32/sandstone.png) \ 
  /// [Sandstone](https://minecraft.wiki/w/sandstone) \ 
  /// _minecraft:sandstone_
  static const Block sandstone = Block('minecraft:sandstone');

  /// ![sandstone_slab](https://minecraftitemids.com/item/32/sandstone_slab.png) \ 
  /// [Sandstone Slab](https://minecraft.wiki/w/sandstone_slab) \ 
  /// _minecraft:sandstone_slab_
  static const Block sandstone_slab = Block('minecraft:sandstone_slab');

  /// ![sandstone_stairs](https://minecraftitemids.com/item/32/sandstone_stairs.png) \ 
  /// [Sandstone Stairs](https://minecraft.wiki/w/sandstone_stairs) \ 
  /// _minecraft:sandstone_stairs_
  static const Block sandstone_stairs = Block('minecraft:sandstone_stairs');

  /// ![sandstone_wall](https://minecraftitemids.com/item/32/sandstone_wall.png) \ 
  /// [Sandstone Wall](https://minecraft.wiki/w/sandstone_wall) \ 
  /// _minecraft:sandstone_wall_
  static const Block sandstone_wall = Block('minecraft:sandstone_wall');

  /// ![scaffolding](https://minecraftitemids.com/item/32/scaffolding.png) \ 
  /// [Scaffolding](https://minecraft.wiki/w/scaffolding) \ 
  /// _minecraft:scaffolding_
  static const Block scaffolding = Block('minecraft:scaffolding');

  /// ![sculk](https://minecraftitemids.com/item/32/sculk.png) \ 
  /// [Sculk](https://minecraft.wiki/w/sculk) \ 
  /// _minecraft:sculk_
  static const Block sculk = Block('minecraft:sculk');

  /// ![sculk_catalyst](https://minecraftitemids.com/item/32/sculk_catalyst.png) \ 
  /// [Sculk Catalyst](https://minecraft.wiki/w/sculk_catalyst) \ 
  /// _minecraft:sculk_catalyst_
  static const Block sculk_catalyst = Block('minecraft:sculk_catalyst');

  /// ![sculk_sensor](https://minecraftitemids.com/item/32/sculk_sensor.png) \ 
  /// [Sculk Sensor](https://minecraft.wiki/w/sculk_sensor) \ 
  /// _minecraft:sculk_sensor_
  static const Block sculk_sensor = Block('minecraft:sculk_sensor');

  /// ![sculk_shrieker](https://minecraftitemids.com/item/32/sculk_shrieker.png) \ 
  /// [Sculk Shrieker](https://minecraft.wiki/w/sculk_shrieker) \ 
  /// _minecraft:sculk_shrieker_
  static const Block sculk_shrieker = Block('minecraft:sculk_shrieker');

  /// ![sculk_vein](https://minecraftitemids.com/item/32/sculk_vein.png) \ 
  /// [Sculk Vein](https://minecraft.wiki/w/sculk_vein) \ 
  /// _minecraft:sculk_vein_
  static const Block sculk_vein = Block('minecraft:sculk_vein');

  /// ![sea_lantern](https://minecraftitemids.com/item/32/sea_lantern.png) \ 
  /// [Sea Lantern](https://minecraft.wiki/w/sea_lantern) \ 
  /// _minecraft:sea_lantern_
  static const Block sea_lantern = Block('minecraft:sea_lantern');

  /// ![sea_pickle](https://minecraftitemids.com/item/32/sea_pickle.png) \ 
  /// [Sea Pickle](https://minecraft.wiki/w/sea_pickle) \ 
  /// _minecraft:sea_pickle_
  static const Block sea_pickle = Block('minecraft:sea_pickle');

  /// ![seagrass](https://minecraftitemids.com/item/32/seagrass.png) \ 
  /// [Seagrass](https://minecraft.wiki/w/seagrass) \ 
  /// _minecraft:seagrass_
  static const Block seagrass = Block('minecraft:seagrass');

  /// ![short_grass](https://minecraftitemids.com/item/32/short_grass.png) \ 
  /// [Short Grass](https://minecraft.wiki/w/short_grass) \ 
  /// _minecraft:short_grass_
  static const Block short_grass = Block('minecraft:short_grass');

  /// ![shroomlight](https://minecraftitemids.com/item/32/shroomlight.png) \ 
  /// [Shroomlight](https://minecraft.wiki/w/shroomlight) \ 
  /// _minecraft:shroomlight_
  static const Block shroomlight = Block('minecraft:shroomlight');

  /// ![shulker_box](https://minecraftitemids.com/item/32/shulker_box.png) \ 
  /// [Shulker Box](https://minecraft.wiki/w/shulker_box) \ 
  /// _minecraft:shulker_box_
  static const Block shulker_box = Block('minecraft:shulker_box');

  /// ![skeleton_skull](https://minecraftitemids.com/item/32/skeleton_skull.png) \ 
  /// [Skeleton Skull](https://minecraft.wiki/w/skeleton_skull) \ 
  /// _minecraft:skeleton_skull_
  static const Block skeleton_skull = Block('minecraft:skeleton_skull');

  /// ![skeleton_wall_skull](https://minecraftitemids.com/item/32/skeleton_wall_skull.png) \ 
  /// [Skeleton Wall Skull](https://minecraft.wiki/w/skeleton_wall_skull) \ 
  /// _minecraft:skeleton_wall_skull_
  static const Block skeleton_wall_skull = Block('minecraft:skeleton_wall_skull');

  /// ![slime_block](https://minecraftitemids.com/item/32/slime_block.png) \ 
  /// [Slime Block](https://minecraft.wiki/w/slime_block) \ 
  /// _minecraft:slime_block_
  static const Block slime_block = Block('minecraft:slime_block');

  /// ![small_amethyst_bud](https://minecraftitemids.com/item/32/small_amethyst_bud.png) \ 
  /// [Small Amethyst Bud](https://minecraft.wiki/w/small_amethyst_bud) \ 
  /// _minecraft:small_amethyst_bud_
  static const Block small_amethyst_bud = Block('minecraft:small_amethyst_bud');

  /// ![small_dripleaf](https://minecraftitemids.com/item/32/small_dripleaf.png) \ 
  /// [Small Dripleaf](https://minecraft.wiki/w/small_dripleaf) \ 
  /// _minecraft:small_dripleaf_
  static const Block small_dripleaf = Block('minecraft:small_dripleaf');

  /// ![smithing_table](https://minecraftitemids.com/item/32/smithing_table.png) \ 
  /// [Smithing Table](https://minecraft.wiki/w/smithing_table) \ 
  /// _minecraft:smithing_table_
  static const Block smithing_table = Block('minecraft:smithing_table');

  /// ![smoker](https://minecraftitemids.com/item/32/smoker.png) \ 
  /// [Smoker](https://minecraft.wiki/w/smoker) \ 
  /// _minecraft:smoker_
  static const Block smoker = Block('minecraft:smoker');

  /// ![smooth_basalt](https://minecraftitemids.com/item/32/smooth_basalt.png) \ 
  /// [Smooth Basalt](https://minecraft.wiki/w/smooth_basalt) \ 
  /// _minecraft:smooth_basalt_
  static const Block smooth_basalt = Block('minecraft:smooth_basalt');

  /// ![smooth_quartz](https://minecraftitemids.com/item/32/smooth_quartz.png) \ 
  /// [Smooth Quartz](https://minecraft.wiki/w/smooth_quartz) \ 
  /// _minecraft:smooth_quartz_
  static const Block smooth_quartz = Block('minecraft:smooth_quartz');

  /// ![smooth_quartz_slab](https://minecraftitemids.com/item/32/smooth_quartz_slab.png) \ 
  /// [Smooth Quartz Slab](https://minecraft.wiki/w/smooth_quartz_slab) \ 
  /// _minecraft:smooth_quartz_slab_
  static const Block smooth_quartz_slab = Block('minecraft:smooth_quartz_slab');

  /// ![smooth_quartz_stairs](https://minecraftitemids.com/item/32/smooth_quartz_stairs.png) \ 
  /// [Smooth Quartz Stairs](https://minecraft.wiki/w/smooth_quartz_stairs) \ 
  /// _minecraft:smooth_quartz_stairs_
  static const Block smooth_quartz_stairs = Block('minecraft:smooth_quartz_stairs');

  /// ![smooth_red_sandstone](https://minecraftitemids.com/item/32/smooth_red_sandstone.png) \ 
  /// [Smooth Red Sandstone](https://minecraft.wiki/w/smooth_red_sandstone) \ 
  /// _minecraft:smooth_red_sandstone_
  static const Block smooth_red_sandstone = Block('minecraft:smooth_red_sandstone');

  /// ![smooth_red_sandstone_slab](https://minecraftitemids.com/item/32/smooth_red_sandstone_slab.png) \ 
  /// [Smooth Red Sandstone Slab](https://minecraft.wiki/w/smooth_red_sandstone_slab) \ 
  /// _minecraft:smooth_red_sandstone_slab_
  static const Block smooth_red_sandstone_slab = Block('minecraft:smooth_red_sandstone_slab');

  /// ![smooth_red_sandstone_stairs](https://minecraftitemids.com/item/32/smooth_red_sandstone_stairs.png) \ 
  /// [Smooth Red Sandstone Stairs](https://minecraft.wiki/w/smooth_red_sandstone_stairs) \ 
  /// _minecraft:smooth_red_sandstone_stairs_
  static const Block smooth_red_sandstone_stairs = Block('minecraft:smooth_red_sandstone_stairs');

  /// ![smooth_sandstone](https://minecraftitemids.com/item/32/smooth_sandstone.png) \ 
  /// [Smooth Sandstone](https://minecraft.wiki/w/smooth_sandstone) \ 
  /// _minecraft:smooth_sandstone_
  static const Block smooth_sandstone = Block('minecraft:smooth_sandstone');

  /// ![smooth_sandstone_slab](https://minecraftitemids.com/item/32/smooth_sandstone_slab.png) \ 
  /// [Smooth Sandstone Slab](https://minecraft.wiki/w/smooth_sandstone_slab) \ 
  /// _minecraft:smooth_sandstone_slab_
  static const Block smooth_sandstone_slab = Block('minecraft:smooth_sandstone_slab');

  /// ![smooth_sandstone_stairs](https://minecraftitemids.com/item/32/smooth_sandstone_stairs.png) \ 
  /// [Smooth Sandstone Stairs](https://minecraft.wiki/w/smooth_sandstone_stairs) \ 
  /// _minecraft:smooth_sandstone_stairs_
  static const Block smooth_sandstone_stairs = Block('minecraft:smooth_sandstone_stairs');

  /// ![smooth_stone](https://minecraftitemids.com/item/32/smooth_stone.png) \ 
  /// [Smooth Stone](https://minecraft.wiki/w/smooth_stone) \ 
  /// _minecraft:smooth_stone_
  static const Block smooth_stone = Block('minecraft:smooth_stone');

  /// ![smooth_stone_slab](https://minecraftitemids.com/item/32/smooth_stone_slab.png) \ 
  /// [Smooth Stone Slab](https://minecraft.wiki/w/smooth_stone_slab) \ 
  /// _minecraft:smooth_stone_slab_
  static const Block smooth_stone_slab = Block('minecraft:smooth_stone_slab');

  /// ![sniffer_egg](https://minecraftitemids.com/item/32/sniffer_egg.png) \ 
  /// [Sniffer Egg](https://minecraft.wiki/w/sniffer_egg) \ 
  /// _minecraft:sniffer_egg_
  static const Block sniffer_egg = Block('minecraft:sniffer_egg');

  /// ![snow](https://minecraftitemids.com/item/32/snow.png) \ 
  /// [Snow](https://minecraft.wiki/w/snow) \ 
  /// _minecraft:snow_
  static const Block snow = Block('minecraft:snow');

  /// ![snow_block](https://minecraftitemids.com/item/32/snow_block.png) \ 
  /// [Snow Block](https://minecraft.wiki/w/snow_block) \ 
  /// _minecraft:snow_block_
  static const Block snow_block = Block('minecraft:snow_block');

  /// ![soul_campfire](https://minecraftitemids.com/item/32/soul_campfire.png) \ 
  /// [Soul Campfire](https://minecraft.wiki/w/soul_campfire) \ 
  /// _minecraft:soul_campfire_
  static const Block soul_campfire = Block('minecraft:soul_campfire');

  /// ![soul_fire](https://minecraftitemids.com/item/32/soul_fire.png) \ 
  /// [Soul Fire](https://minecraft.wiki/w/soul_fire) \ 
  /// _minecraft:soul_fire_
  static const Block soul_fire = Block('minecraft:soul_fire');

  /// ![soul_lantern](https://minecraftitemids.com/item/32/soul_lantern.png) \ 
  /// [Soul Lantern](https://minecraft.wiki/w/soul_lantern) \ 
  /// _minecraft:soul_lantern_
  static const Block soul_lantern = Block('minecraft:soul_lantern');

  /// ![soul_sand](https://minecraftitemids.com/item/32/soul_sand.png) \ 
  /// [Soul Sand](https://minecraft.wiki/w/soul_sand) \ 
  /// _minecraft:soul_sand_
  static const Block soul_sand = Block('minecraft:soul_sand');

  /// ![soul_soil](https://minecraftitemids.com/item/32/soul_soil.png) \ 
  /// [Soul Soil](https://minecraft.wiki/w/soul_soil) \ 
  /// _minecraft:soul_soil_
  static const Block soul_soil = Block('minecraft:soul_soil');

  /// ![soul_torch](https://minecraftitemids.com/item/32/soul_torch.png) \ 
  /// [Soul Torch](https://minecraft.wiki/w/soul_torch) \ 
  /// _minecraft:soul_torch_
  static const Block soul_torch = Block('minecraft:soul_torch');

  /// ![soul_wall_torch](https://minecraftitemids.com/item/32/soul_wall_torch.png) \ 
  /// [Soul Wall Torch](https://minecraft.wiki/w/soul_wall_torch) \ 
  /// _minecraft:soul_wall_torch_
  static const Block soul_wall_torch = Block('minecraft:soul_wall_torch');

  /// ![spawner](https://minecraftitemids.com/item/32/spawner.png) \ 
  /// [Spawner](https://minecraft.wiki/w/spawner) \ 
  /// _minecraft:spawner_
  static const Block spawner = Block('minecraft:spawner');

  /// ![sponge](https://minecraftitemids.com/item/32/sponge.png) \ 
  /// [Sponge](https://minecraft.wiki/w/sponge) \ 
  /// _minecraft:sponge_
  static const Block sponge = Block('minecraft:sponge');

  /// ![spore_blossom](https://minecraftitemids.com/item/32/spore_blossom.png) \ 
  /// [Spore Blossom](https://minecraft.wiki/w/spore_blossom) \ 
  /// _minecraft:spore_blossom_
  static const Block spore_blossom = Block('minecraft:spore_blossom');

  /// ![spruce_button](https://minecraftitemids.com/item/32/spruce_button.png) \ 
  /// [Spruce Button](https://minecraft.wiki/w/spruce_button) \ 
  /// _minecraft:spruce_button_
  static const Block spruce_button = Block('minecraft:spruce_button');

  /// ![spruce_door](https://minecraftitemids.com/item/32/spruce_door.png) \ 
  /// [Spruce Door](https://minecraft.wiki/w/spruce_door) \ 
  /// _minecraft:spruce_door_
  static const Block spruce_door = Block('minecraft:spruce_door');

  /// ![spruce_fence](https://minecraftitemids.com/item/32/spruce_fence.png) \ 
  /// [Spruce Fence](https://minecraft.wiki/w/spruce_fence) \ 
  /// _minecraft:spruce_fence_
  static const Block spruce_fence = Block('minecraft:spruce_fence');

  /// ![spruce_fence_gate](https://minecraftitemids.com/item/32/spruce_fence_gate.png) \ 
  /// [Spruce Fence Gate](https://minecraft.wiki/w/spruce_fence_gate) \ 
  /// _minecraft:spruce_fence_gate_
  static const Block spruce_fence_gate = Block('minecraft:spruce_fence_gate');

  /// ![spruce_hanging_sign](https://minecraftitemids.com/item/32/spruce_hanging_sign.png) \ 
  /// [Spruce Hanging Sign](https://minecraft.wiki/w/spruce_hanging_sign) \ 
  /// _minecraft:spruce_hanging_sign_
  static const Block spruce_hanging_sign = Block('minecraft:spruce_hanging_sign');

  /// ![spruce_leaves](https://minecraftitemids.com/item/32/spruce_leaves.png) \ 
  /// [Spruce Leaves](https://minecraft.wiki/w/spruce_leaves) \ 
  /// _minecraft:spruce_leaves_
  static const Block spruce_leaves = Block('minecraft:spruce_leaves');

  /// ![spruce_log](https://minecraftitemids.com/item/32/spruce_log.png) \ 
  /// [Spruce Log](https://minecraft.wiki/w/spruce_log) \ 
  /// _minecraft:spruce_log_
  static const Block spruce_log = Block('minecraft:spruce_log');

  /// ![spruce_planks](https://minecraftitemids.com/item/32/spruce_planks.png) \ 
  /// [Spruce Planks](https://minecraft.wiki/w/spruce_planks) \ 
  /// _minecraft:spruce_planks_
  static const Block spruce_planks = Block('minecraft:spruce_planks');

  /// ![spruce_pressure_plate](https://minecraftitemids.com/item/32/spruce_pressure_plate.png) \ 
  /// [Spruce Pressure Plate](https://minecraft.wiki/w/spruce_pressure_plate) \ 
  /// _minecraft:spruce_pressure_plate_
  static const Block spruce_pressure_plate = Block('minecraft:spruce_pressure_plate');

  /// ![spruce_sapling](https://minecraftitemids.com/item/32/spruce_sapling.png) \ 
  /// [Spruce Sapling](https://minecraft.wiki/w/spruce_sapling) \ 
  /// _minecraft:spruce_sapling_
  static const Block spruce_sapling = Block('minecraft:spruce_sapling');

  /// ![spruce_sign](https://minecraftitemids.com/item/32/spruce_sign.png) \ 
  /// [Spruce Sign](https://minecraft.wiki/w/spruce_sign) \ 
  /// _minecraft:spruce_sign_
  static const Block spruce_sign = Block('minecraft:spruce_sign');

  /// ![spruce_slab](https://minecraftitemids.com/item/32/spruce_slab.png) \ 
  /// [Spruce Slab](https://minecraft.wiki/w/spruce_slab) \ 
  /// _minecraft:spruce_slab_
  static const Block spruce_slab = Block('minecraft:spruce_slab');

  /// ![spruce_stairs](https://minecraftitemids.com/item/32/spruce_stairs.png) \ 
  /// [Spruce Stairs](https://minecraft.wiki/w/spruce_stairs) \ 
  /// _minecraft:spruce_stairs_
  static const Block spruce_stairs = Block('minecraft:spruce_stairs');

  /// ![spruce_trapdoor](https://minecraftitemids.com/item/32/spruce_trapdoor.png) \ 
  /// [Spruce Trapdoor](https://minecraft.wiki/w/spruce_trapdoor) \ 
  /// _minecraft:spruce_trapdoor_
  static const Block spruce_trapdoor = Block('minecraft:spruce_trapdoor');

  /// ![spruce_wall_hanging_sign](https://minecraftitemids.com/item/32/spruce_wall_hanging_sign.png) \ 
  /// [Spruce Wall Hanging Sign](https://minecraft.wiki/w/spruce_wall_hanging_sign) \ 
  /// _minecraft:spruce_wall_hanging_sign_
  static const Block spruce_wall_hanging_sign = Block('minecraft:spruce_wall_hanging_sign');

  /// ![spruce_wall_sign](https://minecraftitemids.com/item/32/spruce_wall_sign.png) \ 
  /// [Spruce Wall Sign](https://minecraft.wiki/w/spruce_wall_sign) \ 
  /// _minecraft:spruce_wall_sign_
  static const Block spruce_wall_sign = Block('minecraft:spruce_wall_sign');

  /// ![spruce_wood](https://minecraftitemids.com/item/32/spruce_wood.png) \ 
  /// [Spruce Wood](https://minecraft.wiki/w/spruce_wood) \ 
  /// _minecraft:spruce_wood_
  static const Block spruce_wood = Block('minecraft:spruce_wood');

  /// ![sticky_piston](https://minecraftitemids.com/item/32/sticky_piston.png) \ 
  /// [Sticky Piston](https://minecraft.wiki/w/sticky_piston) \ 
  /// _minecraft:sticky_piston_
  static const Block sticky_piston = Block('minecraft:sticky_piston');

  /// ![stone](https://minecraftitemids.com/item/32/stone.png) \ 
  /// [Stone](https://minecraft.wiki/w/stone) \ 
  /// _minecraft:stone_
  static const Block stone = Block('minecraft:stone');

  /// ![stone_brick_slab](https://minecraftitemids.com/item/32/stone_brick_slab.png) \ 
  /// [Stone Brick Slab](https://minecraft.wiki/w/stone_brick_slab) \ 
  /// _minecraft:stone_brick_slab_
  static const Block stone_brick_slab = Block('minecraft:stone_brick_slab');

  /// ![stone_brick_stairs](https://minecraftitemids.com/item/32/stone_brick_stairs.png) \ 
  /// [Stone Brick Stairs](https://minecraft.wiki/w/stone_brick_stairs) \ 
  /// _minecraft:stone_brick_stairs_
  static const Block stone_brick_stairs = Block('minecraft:stone_brick_stairs');

  /// ![stone_brick_wall](https://minecraftitemids.com/item/32/stone_brick_wall.png) \ 
  /// [Stone Brick Wall](https://minecraft.wiki/w/stone_brick_wall) \ 
  /// _minecraft:stone_brick_wall_
  static const Block stone_brick_wall = Block('minecraft:stone_brick_wall');

  /// ![stone_bricks](https://minecraftitemids.com/item/32/stone_bricks.png) \ 
  /// [Stone Bricks](https://minecraft.wiki/w/stone_bricks) \ 
  /// _minecraft:stone_bricks_
  static const Block stone_bricks = Block('minecraft:stone_bricks');

  /// ![stone_button](https://minecraftitemids.com/item/32/stone_button.png) \ 
  /// [Stone Button](https://minecraft.wiki/w/stone_button) \ 
  /// _minecraft:stone_button_
  static const Block stone_button = Block('minecraft:stone_button');

  /// ![stone_pressure_plate](https://minecraftitemids.com/item/32/stone_pressure_plate.png) \ 
  /// [Stone Pressure Plate](https://minecraft.wiki/w/stone_pressure_plate) \ 
  /// _minecraft:stone_pressure_plate_
  static const Block stone_pressure_plate = Block('minecraft:stone_pressure_plate');

  /// ![stone_slab](https://minecraftitemids.com/item/32/stone_slab.png) \ 
  /// [Stone Slab](https://minecraft.wiki/w/stone_slab) \ 
  /// _minecraft:stone_slab_
  static const Block stone_slab = Block('minecraft:stone_slab');

  /// ![stone_stairs](https://minecraftitemids.com/item/32/stone_stairs.png) \ 
  /// [Stone Stairs](https://minecraft.wiki/w/stone_stairs) \ 
  /// _minecraft:stone_stairs_
  static const Block stone_stairs = Block('minecraft:stone_stairs');

  /// ![stonecutter](https://minecraftitemids.com/item/32/stonecutter.png) \ 
  /// [Stonecutter](https://minecraft.wiki/w/stonecutter) \ 
  /// _minecraft:stonecutter_
  static const Block stonecutter = Block('minecraft:stonecutter');

  /// ![stripped_acacia_log](https://minecraftitemids.com/item/32/stripped_acacia_log.png) \ 
  /// [Stripped Acacia Log](https://minecraft.wiki/w/stripped_acacia_log) \ 
  /// _minecraft:stripped_acacia_log_
  static const Block stripped_acacia_log = Block('minecraft:stripped_acacia_log');

  /// ![stripped_acacia_wood](https://minecraftitemids.com/item/32/stripped_acacia_wood.png) \ 
  /// [Stripped Acacia Wood](https://minecraft.wiki/w/stripped_acacia_wood) \ 
  /// _minecraft:stripped_acacia_wood_
  static const Block stripped_acacia_wood = Block('minecraft:stripped_acacia_wood');

  /// ![stripped_bamboo_block](https://minecraftitemids.com/item/32/stripped_bamboo_block.png) \ 
  /// [Stripped Bamboo Block](https://minecraft.wiki/w/stripped_bamboo_block) \ 
  /// _minecraft:stripped_bamboo_block_
  static const Block stripped_bamboo_block = Block('minecraft:stripped_bamboo_block');

  /// ![stripped_birch_log](https://minecraftitemids.com/item/32/stripped_birch_log.png) \ 
  /// [Stripped Birch Log](https://minecraft.wiki/w/stripped_birch_log) \ 
  /// _minecraft:stripped_birch_log_
  static const Block stripped_birch_log = Block('minecraft:stripped_birch_log');

  /// ![stripped_birch_wood](https://minecraftitemids.com/item/32/stripped_birch_wood.png) \ 
  /// [Stripped Birch Wood](https://minecraft.wiki/w/stripped_birch_wood) \ 
  /// _minecraft:stripped_birch_wood_
  static const Block stripped_birch_wood = Block('minecraft:stripped_birch_wood');

  /// ![stripped_cherry_log](https://minecraftitemids.com/item/32/stripped_cherry_log.png) \ 
  /// [Stripped Cherry Log](https://minecraft.wiki/w/stripped_cherry_log) \ 
  /// _minecraft:stripped_cherry_log_
  static const Block stripped_cherry_log = Block('minecraft:stripped_cherry_log');

  /// ![stripped_cherry_wood](https://minecraftitemids.com/item/32/stripped_cherry_wood.png) \ 
  /// [Stripped Cherry Wood](https://minecraft.wiki/w/stripped_cherry_wood) \ 
  /// _minecraft:stripped_cherry_wood_
  static const Block stripped_cherry_wood = Block('minecraft:stripped_cherry_wood');

  /// ![stripped_crimson_hyphae](https://minecraftitemids.com/item/32/stripped_crimson_hyphae.png) \ 
  /// [Stripped Crimson Hyphae](https://minecraft.wiki/w/stripped_crimson_hyphae) \ 
  /// _minecraft:stripped_crimson_hyphae_
  static const Block stripped_crimson_hyphae = Block('minecraft:stripped_crimson_hyphae');

  /// ![stripped_crimson_stem](https://minecraftitemids.com/item/32/stripped_crimson_stem.png) \ 
  /// [Stripped Crimson Stem](https://minecraft.wiki/w/stripped_crimson_stem) \ 
  /// _minecraft:stripped_crimson_stem_
  static const Block stripped_crimson_stem = Block('minecraft:stripped_crimson_stem');

  /// ![stripped_dark_oak_log](https://minecraftitemids.com/item/32/stripped_dark_oak_log.png) \ 
  /// [Stripped Dark Oak Log](https://minecraft.wiki/w/stripped_dark_oak_log) \ 
  /// _minecraft:stripped_dark_oak_log_
  static const Block stripped_dark_oak_log = Block('minecraft:stripped_dark_oak_log');

  /// ![stripped_dark_oak_wood](https://minecraftitemids.com/item/32/stripped_dark_oak_wood.png) \ 
  /// [Stripped Dark Oak Wood](https://minecraft.wiki/w/stripped_dark_oak_wood) \ 
  /// _minecraft:stripped_dark_oak_wood_
  static const Block stripped_dark_oak_wood = Block('minecraft:stripped_dark_oak_wood');

  /// ![stripped_jungle_log](https://minecraftitemids.com/item/32/stripped_jungle_log.png) \ 
  /// [Stripped Jungle Log](https://minecraft.wiki/w/stripped_jungle_log) \ 
  /// _minecraft:stripped_jungle_log_
  static const Block stripped_jungle_log = Block('minecraft:stripped_jungle_log');

  /// ![stripped_jungle_wood](https://minecraftitemids.com/item/32/stripped_jungle_wood.png) \ 
  /// [Stripped Jungle Wood](https://minecraft.wiki/w/stripped_jungle_wood) \ 
  /// _minecraft:stripped_jungle_wood_
  static const Block stripped_jungle_wood = Block('minecraft:stripped_jungle_wood');

  /// ![stripped_mangrove_log](https://minecraftitemids.com/item/32/stripped_mangrove_log.png) \ 
  /// [Stripped Mangrove Log](https://minecraft.wiki/w/stripped_mangrove_log) \ 
  /// _minecraft:stripped_mangrove_log_
  static const Block stripped_mangrove_log = Block('minecraft:stripped_mangrove_log');

  /// ![stripped_mangrove_wood](https://minecraftitemids.com/item/32/stripped_mangrove_wood.png) \ 
  /// [Stripped Mangrove Wood](https://minecraft.wiki/w/stripped_mangrove_wood) \ 
  /// _minecraft:stripped_mangrove_wood_
  static const Block stripped_mangrove_wood = Block('minecraft:stripped_mangrove_wood');

  /// ![stripped_oak_log](https://minecraftitemids.com/item/32/stripped_oak_log.png) \ 
  /// [Stripped Oak Log](https://minecraft.wiki/w/stripped_oak_log) \ 
  /// _minecraft:stripped_oak_log_
  static const Block stripped_oak_log = Block('minecraft:stripped_oak_log');

  /// ![stripped_oak_wood](https://minecraftitemids.com/item/32/stripped_oak_wood.png) \ 
  /// [Stripped Oak Wood](https://minecraft.wiki/w/stripped_oak_wood) \ 
  /// _minecraft:stripped_oak_wood_
  static const Block stripped_oak_wood = Block('minecraft:stripped_oak_wood');

  /// ![stripped_spruce_log](https://minecraftitemids.com/item/32/stripped_spruce_log.png) \ 
  /// [Stripped Spruce Log](https://minecraft.wiki/w/stripped_spruce_log) \ 
  /// _minecraft:stripped_spruce_log_
  static const Block stripped_spruce_log = Block('minecraft:stripped_spruce_log');

  /// ![stripped_spruce_wood](https://minecraftitemids.com/item/32/stripped_spruce_wood.png) \ 
  /// [Stripped Spruce Wood](https://minecraft.wiki/w/stripped_spruce_wood) \ 
  /// _minecraft:stripped_spruce_wood_
  static const Block stripped_spruce_wood = Block('minecraft:stripped_spruce_wood');

  /// ![stripped_warped_hyphae](https://minecraftitemids.com/item/32/stripped_warped_hyphae.png) \ 
  /// [Stripped Warped Hyphae](https://minecraft.wiki/w/stripped_warped_hyphae) \ 
  /// _minecraft:stripped_warped_hyphae_
  static const Block stripped_warped_hyphae = Block('minecraft:stripped_warped_hyphae');

  /// ![stripped_warped_stem](https://minecraftitemids.com/item/32/stripped_warped_stem.png) \ 
  /// [Stripped Warped Stem](https://minecraft.wiki/w/stripped_warped_stem) \ 
  /// _minecraft:stripped_warped_stem_
  static const Block stripped_warped_stem = Block('minecraft:stripped_warped_stem');

  /// ![structure_block](https://minecraftitemids.com/item/32/structure_block.png) \ 
  /// [Structure Block](https://minecraft.wiki/w/structure_block) \ 
  /// _minecraft:structure_block_
  static const Block structure_block = Block('minecraft:structure_block');

  /// ![structure_void](https://minecraftitemids.com/item/32/structure_void.png) \ 
  /// [Structure Void](https://minecraft.wiki/w/structure_void) \ 
  /// _minecraft:structure_void_
  static const Block structure_void = Block('minecraft:structure_void');

  /// ![sugar_cane](https://minecraftitemids.com/item/32/sugar_cane.png) \ 
  /// [Sugar Cane](https://minecraft.wiki/w/sugar_cane) \ 
  /// _minecraft:sugar_cane_
  static const Block sugar_cane = Block('minecraft:sugar_cane');

  /// ![sunflower](https://minecraftitemids.com/item/32/sunflower.png) \ 
  /// [Sunflower](https://minecraft.wiki/w/sunflower) \ 
  /// _minecraft:sunflower_
  static const Block sunflower = Block('minecraft:sunflower');

  /// ![suspicious_gravel](https://minecraftitemids.com/item/32/suspicious_gravel.png) \ 
  /// [Suspicious Gravel](https://minecraft.wiki/w/suspicious_gravel) \ 
  /// _minecraft:suspicious_gravel_
  static const Block suspicious_gravel = Block('minecraft:suspicious_gravel');

  /// ![suspicious_sand](https://minecraftitemids.com/item/32/suspicious_sand.png) \ 
  /// [Suspicious Sand](https://minecraft.wiki/w/suspicious_sand) \ 
  /// _minecraft:suspicious_sand_
  static const Block suspicious_sand = Block('minecraft:suspicious_sand');

  /// ![sweet_berry_bush](https://minecraftitemids.com/item/32/sweet_berry_bush.png) \ 
  /// [Sweet Berry Bush](https://minecraft.wiki/w/sweet_berry_bush) \ 
  /// _minecraft:sweet_berry_bush_
  static const Block sweet_berry_bush = Block('minecraft:sweet_berry_bush');

  /// ![tall_grass](https://minecraftitemids.com/item/32/tall_grass.png) \ 
  /// [Tall Grass](https://minecraft.wiki/w/tall_grass) \ 
  /// _minecraft:tall_grass_
  static const Block tall_grass = Block('minecraft:tall_grass');

  /// ![tall_seagrass](https://minecraftitemids.com/item/32/tall_seagrass.png) \ 
  /// [Tall Seagrass](https://minecraft.wiki/w/tall_seagrass) \ 
  /// _minecraft:tall_seagrass_
  static const Block tall_seagrass = Block('minecraft:tall_seagrass');

  /// ![target](https://minecraftitemids.com/item/32/target.png) \ 
  /// [Target](https://minecraft.wiki/w/target) \ 
  /// _minecraft:target_
  static const Block target = Block('minecraft:target');

  /// ![terracotta](https://minecraftitemids.com/item/32/terracotta.png) \ 
  /// [Terracotta](https://minecraft.wiki/w/terracotta) \ 
  /// _minecraft:terracotta_
  static const Block terracotta = Block('minecraft:terracotta');

  /// ![tinted_glass](https://minecraftitemids.com/item/32/tinted_glass.png) \ 
  /// [Tinted Glass](https://minecraft.wiki/w/tinted_glass) \ 
  /// _minecraft:tinted_glass_
  static const Block tinted_glass = Block('minecraft:tinted_glass');

  /// ![tnt](https://minecraftitemids.com/item/32/tnt.png) \ 
  /// [Tnt](https://minecraft.wiki/w/tnt) \ 
  /// _minecraft:tnt_
  static const Block tnt = Block('minecraft:tnt');

  /// ![torch](https://minecraftitemids.com/item/32/torch.png) \ 
  /// [Torch](https://minecraft.wiki/w/torch) \ 
  /// _minecraft:torch_
  static const Block torch = Block('minecraft:torch');

  /// ![torchflower](https://minecraftitemids.com/item/32/torchflower.png) \ 
  /// [Torchflower](https://minecraft.wiki/w/torchflower) \ 
  /// _minecraft:torchflower_
  static const Block torchflower = Block('minecraft:torchflower');

  /// ![torchflower_crop](https://minecraftitemids.com/item/32/torchflower_crop.png) \ 
  /// [Torchflower Crop](https://minecraft.wiki/w/torchflower_crop) \ 
  /// _minecraft:torchflower_crop_
  static const Block torchflower_crop = Block('minecraft:torchflower_crop');

  /// ![trapped_chest](https://minecraftitemids.com/item/32/trapped_chest.png) \ 
  /// [Trapped Chest](https://minecraft.wiki/w/trapped_chest) \ 
  /// _minecraft:trapped_chest_
  static const Block trapped_chest = Block('minecraft:trapped_chest');

  /// ![trial_spawner](https://minecraftitemids.com/item/32/trial_spawner.png) \ 
  /// [Trial Spawner](https://minecraft.wiki/w/trial_spawner) \ 
  /// _minecraft:trial_spawner_
  static const Block trial_spawner = Block('minecraft:trial_spawner');

  /// ![tripwire](https://minecraftitemids.com/item/32/tripwire.png) \ 
  /// [Tripwire](https://minecraft.wiki/w/tripwire) \ 
  /// _minecraft:tripwire_
  static const Block tripwire = Block('minecraft:tripwire');

  /// ![tripwire_hook](https://minecraftitemids.com/item/32/tripwire_hook.png) \ 
  /// [Tripwire Hook](https://minecraft.wiki/w/tripwire_hook) \ 
  /// _minecraft:tripwire_hook_
  static const Block tripwire_hook = Block('minecraft:tripwire_hook');

  /// ![tube_coral](https://minecraftitemids.com/item/32/tube_coral.png) \ 
  /// [Tube Coral](https://minecraft.wiki/w/tube_coral) \ 
  /// _minecraft:tube_coral_
  static const Block tube_coral = Block('minecraft:tube_coral');

  /// ![tube_coral_block](https://minecraftitemids.com/item/32/tube_coral_block.png) \ 
  /// [Tube Coral Block](https://minecraft.wiki/w/tube_coral_block) \ 
  /// _minecraft:tube_coral_block_
  static const Block tube_coral_block = Block('minecraft:tube_coral_block');

  /// ![tube_coral_fan](https://minecraftitemids.com/item/32/tube_coral_fan.png) \ 
  /// [Tube Coral Fan](https://minecraft.wiki/w/tube_coral_fan) \ 
  /// _minecraft:tube_coral_fan_
  static const Block tube_coral_fan = Block('minecraft:tube_coral_fan');

  /// ![tube_coral_wall_fan](https://minecraftitemids.com/item/32/tube_coral_wall_fan.png) \ 
  /// [Tube Coral Wall Fan](https://minecraft.wiki/w/tube_coral_wall_fan) \ 
  /// _minecraft:tube_coral_wall_fan_
  static const Block tube_coral_wall_fan = Block('minecraft:tube_coral_wall_fan');

  /// ![tuff](https://minecraftitemids.com/item/32/tuff.png) \ 
  /// [Tuff](https://minecraft.wiki/w/tuff) \ 
  /// _minecraft:tuff_
  static const Block tuff = Block('minecraft:tuff');

  /// ![tuff_brick_slab](https://minecraftitemids.com/item/32/tuff_brick_slab.png) \ 
  /// [Tuff Brick Slab](https://minecraft.wiki/w/tuff_brick_slab) \ 
  /// _minecraft:tuff_brick_slab_
  static const Block tuff_brick_slab = Block('minecraft:tuff_brick_slab');

  /// ![tuff_brick_stairs](https://minecraftitemids.com/item/32/tuff_brick_stairs.png) \ 
  /// [Tuff Brick Stairs](https://minecraft.wiki/w/tuff_brick_stairs) \ 
  /// _minecraft:tuff_brick_stairs_
  static const Block tuff_brick_stairs = Block('minecraft:tuff_brick_stairs');

  /// ![tuff_brick_wall](https://minecraftitemids.com/item/32/tuff_brick_wall.png) \ 
  /// [Tuff Brick Wall](https://minecraft.wiki/w/tuff_brick_wall) \ 
  /// _minecraft:tuff_brick_wall_
  static const Block tuff_brick_wall = Block('minecraft:tuff_brick_wall');

  /// ![tuff_bricks](https://minecraftitemids.com/item/32/tuff_bricks.png) \ 
  /// [Tuff Bricks](https://minecraft.wiki/w/tuff_bricks) \ 
  /// _minecraft:tuff_bricks_
  static const Block tuff_bricks = Block('minecraft:tuff_bricks');

  /// ![tuff_slab](https://minecraftitemids.com/item/32/tuff_slab.png) \ 
  /// [Tuff Slab](https://minecraft.wiki/w/tuff_slab) \ 
  /// _minecraft:tuff_slab_
  static const Block tuff_slab = Block('minecraft:tuff_slab');

  /// ![tuff_stairs](https://minecraftitemids.com/item/32/tuff_stairs.png) \ 
  /// [Tuff Stairs](https://minecraft.wiki/w/tuff_stairs) \ 
  /// _minecraft:tuff_stairs_
  static const Block tuff_stairs = Block('minecraft:tuff_stairs');

  /// ![tuff_wall](https://minecraftitemids.com/item/32/tuff_wall.png) \ 
  /// [Tuff Wall](https://minecraft.wiki/w/tuff_wall) \ 
  /// _minecraft:tuff_wall_
  static const Block tuff_wall = Block('minecraft:tuff_wall');

  /// ![turtle_egg](https://minecraftitemids.com/item/32/turtle_egg.png) \ 
  /// [Turtle Egg](https://minecraft.wiki/w/turtle_egg) \ 
  /// _minecraft:turtle_egg_
  static const Block turtle_egg = Block('minecraft:turtle_egg');

  /// ![twisting_vines](https://minecraftitemids.com/item/32/twisting_vines.png) \ 
  /// [Twisting Vines](https://minecraft.wiki/w/twisting_vines) \ 
  /// _minecraft:twisting_vines_
  static const Block twisting_vines = Block('minecraft:twisting_vines');

  /// ![twisting_vines_plant](https://minecraftitemids.com/item/32/twisting_vines_plant.png) \ 
  /// [Twisting Vines Plant](https://minecraft.wiki/w/twisting_vines_plant) \ 
  /// _minecraft:twisting_vines_plant_
  static const Block twisting_vines_plant = Block('minecraft:twisting_vines_plant');

  /// ![verdant_froglight](https://minecraftitemids.com/item/32/verdant_froglight.png) \ 
  /// [Verdant Froglight](https://minecraft.wiki/w/verdant_froglight) \ 
  /// _minecraft:verdant_froglight_
  static const Block verdant_froglight = Block('minecraft:verdant_froglight');

  /// ![vine](https://minecraftitemids.com/item/32/vine.png) \ 
  /// [Vine](https://minecraft.wiki/w/vine) \ 
  /// _minecraft:vine_
  static const Block vine = Block('minecraft:vine');

  /// ![void_air](https://minecraftitemids.com/item/32/void_air.png) \ 
  /// [Void Air](https://minecraft.wiki/w/void_air) \ 
  /// _minecraft:void_air_
  static const Block void_air = Block('minecraft:void_air');

  /// ![wall_torch](https://minecraftitemids.com/item/32/wall_torch.png) \ 
  /// [Wall Torch](https://minecraft.wiki/w/wall_torch) \ 
  /// _minecraft:wall_torch_
  static const Block wall_torch = Block('minecraft:wall_torch');

  /// ![warped_button](https://minecraftitemids.com/item/32/warped_button.png) \ 
  /// [Warped Button](https://minecraft.wiki/w/warped_button) \ 
  /// _minecraft:warped_button_
  static const Block warped_button = Block('minecraft:warped_button');

  /// ![warped_door](https://minecraftitemids.com/item/32/warped_door.png) \ 
  /// [Warped Door](https://minecraft.wiki/w/warped_door) \ 
  /// _minecraft:warped_door_
  static const Block warped_door = Block('minecraft:warped_door');

  /// ![warped_fence](https://minecraftitemids.com/item/32/warped_fence.png) \ 
  /// [Warped Fence](https://minecraft.wiki/w/warped_fence) \ 
  /// _minecraft:warped_fence_
  static const Block warped_fence = Block('minecraft:warped_fence');

  /// ![warped_fence_gate](https://minecraftitemids.com/item/32/warped_fence_gate.png) \ 
  /// [Warped Fence Gate](https://minecraft.wiki/w/warped_fence_gate) \ 
  /// _minecraft:warped_fence_gate_
  static const Block warped_fence_gate = Block('minecraft:warped_fence_gate');

  /// ![warped_fungus](https://minecraftitemids.com/item/32/warped_fungus.png) \ 
  /// [Warped Fungus](https://minecraft.wiki/w/warped_fungus) \ 
  /// _minecraft:warped_fungus_
  static const Block warped_fungus = Block('minecraft:warped_fungus');

  /// ![warped_hanging_sign](https://minecraftitemids.com/item/32/warped_hanging_sign.png) \ 
  /// [Warped Hanging Sign](https://minecraft.wiki/w/warped_hanging_sign) \ 
  /// _minecraft:warped_hanging_sign_
  static const Block warped_hanging_sign = Block('minecraft:warped_hanging_sign');

  /// ![warped_hyphae](https://minecraftitemids.com/item/32/warped_hyphae.png) \ 
  /// [Warped Hyphae](https://minecraft.wiki/w/warped_hyphae) \ 
  /// _minecraft:warped_hyphae_
  static const Block warped_hyphae = Block('minecraft:warped_hyphae');

  /// ![warped_nylium](https://minecraftitemids.com/item/32/warped_nylium.png) \ 
  /// [Warped Nylium](https://minecraft.wiki/w/warped_nylium) \ 
  /// _minecraft:warped_nylium_
  static const Block warped_nylium = Block('minecraft:warped_nylium');

  /// ![warped_planks](https://minecraftitemids.com/item/32/warped_planks.png) \ 
  /// [Warped Planks](https://minecraft.wiki/w/warped_planks) \ 
  /// _minecraft:warped_planks_
  static const Block warped_planks = Block('minecraft:warped_planks');

  /// ![warped_pressure_plate](https://minecraftitemids.com/item/32/warped_pressure_plate.png) \ 
  /// [Warped Pressure Plate](https://minecraft.wiki/w/warped_pressure_plate) \ 
  /// _minecraft:warped_pressure_plate_
  static const Block warped_pressure_plate = Block('minecraft:warped_pressure_plate');

  /// ![warped_roots](https://minecraftitemids.com/item/32/warped_roots.png) \ 
  /// [Warped Roots](https://minecraft.wiki/w/warped_roots) \ 
  /// _minecraft:warped_roots_
  static const Block warped_roots = Block('minecraft:warped_roots');

  /// ![warped_sign](https://minecraftitemids.com/item/32/warped_sign.png) \ 
  /// [Warped Sign](https://minecraft.wiki/w/warped_sign) \ 
  /// _minecraft:warped_sign_
  static const Block warped_sign = Block('minecraft:warped_sign');

  /// ![warped_slab](https://minecraftitemids.com/item/32/warped_slab.png) \ 
  /// [Warped Slab](https://minecraft.wiki/w/warped_slab) \ 
  /// _minecraft:warped_slab_
  static const Block warped_slab = Block('minecraft:warped_slab');

  /// ![warped_stairs](https://minecraftitemids.com/item/32/warped_stairs.png) \ 
  /// [Warped Stairs](https://minecraft.wiki/w/warped_stairs) \ 
  /// _minecraft:warped_stairs_
  static const Block warped_stairs = Block('minecraft:warped_stairs');

  /// ![warped_stem](https://minecraftitemids.com/item/32/warped_stem.png) \ 
  /// [Warped Stem](https://minecraft.wiki/w/warped_stem) \ 
  /// _minecraft:warped_stem_
  static const Block warped_stem = Block('minecraft:warped_stem');

  /// ![warped_trapdoor](https://minecraftitemids.com/item/32/warped_trapdoor.png) \ 
  /// [Warped Trapdoor](https://minecraft.wiki/w/warped_trapdoor) \ 
  /// _minecraft:warped_trapdoor_
  static const Block warped_trapdoor = Block('minecraft:warped_trapdoor');

  /// ![warped_wall_hanging_sign](https://minecraftitemids.com/item/32/warped_wall_hanging_sign.png) \ 
  /// [Warped Wall Hanging Sign](https://minecraft.wiki/w/warped_wall_hanging_sign) \ 
  /// _minecraft:warped_wall_hanging_sign_
  static const Block warped_wall_hanging_sign = Block('minecraft:warped_wall_hanging_sign');

  /// ![warped_wall_sign](https://minecraftitemids.com/item/32/warped_wall_sign.png) \ 
  /// [Warped Wall Sign](https://minecraft.wiki/w/warped_wall_sign) \ 
  /// _minecraft:warped_wall_sign_
  static const Block warped_wall_sign = Block('minecraft:warped_wall_sign');

  /// ![warped_wart_block](https://minecraftitemids.com/item/32/warped_wart_block.png) \ 
  /// [Warped Wart Block](https://minecraft.wiki/w/warped_wart_block) \ 
  /// _minecraft:warped_wart_block_
  static const Block warped_wart_block = Block('minecraft:warped_wart_block');

  /// ![water](https://minecraftitemids.com/item/32/water.png) \ 
  /// [Water](https://minecraft.wiki/w/water) \ 
  /// _minecraft:water_
  static const Block water = Block('minecraft:water');

  /// ![water_cauldron](https://minecraftitemids.com/item/32/water_cauldron.png) \ 
  /// [Water Cauldron](https://minecraft.wiki/w/water_cauldron) \ 
  /// _minecraft:water_cauldron_
  static const Block water_cauldron = Block('minecraft:water_cauldron');

  /// ![waxed_chiseled_copper](https://minecraftitemids.com/item/32/waxed_chiseled_copper.png) \ 
  /// [Waxed Chiseled Copper](https://minecraft.wiki/w/waxed_chiseled_copper) \ 
  /// _minecraft:waxed_chiseled_copper_
  static const Block waxed_chiseled_copper = Block('minecraft:waxed_chiseled_copper');

  /// ![waxed_copper_block](https://minecraftitemids.com/item/32/waxed_copper_block.png) \ 
  /// [Waxed Copper Block](https://minecraft.wiki/w/waxed_copper_block) \ 
  /// _minecraft:waxed_copper_block_
  static const Block waxed_copper_block = Block('minecraft:waxed_copper_block');

  /// ![waxed_copper_bulb](https://minecraftitemids.com/item/32/waxed_copper_bulb.png) \ 
  /// [Waxed Copper Bulb](https://minecraft.wiki/w/waxed_copper_bulb) \ 
  /// _minecraft:waxed_copper_bulb_
  static const Block waxed_copper_bulb = Block('minecraft:waxed_copper_bulb');

  /// ![waxed_copper_door](https://minecraftitemids.com/item/32/waxed_copper_door.png) \ 
  /// [Waxed Copper Door](https://minecraft.wiki/w/waxed_copper_door) \ 
  /// _minecraft:waxed_copper_door_
  static const Block waxed_copper_door = Block('minecraft:waxed_copper_door');

  /// ![waxed_copper_grate](https://minecraftitemids.com/item/32/waxed_copper_grate.png) \ 
  /// [Waxed Copper Grate](https://minecraft.wiki/w/waxed_copper_grate) \ 
  /// _minecraft:waxed_copper_grate_
  static const Block waxed_copper_grate = Block('minecraft:waxed_copper_grate');

  /// ![waxed_copper_trapdoor](https://minecraftitemids.com/item/32/waxed_copper_trapdoor.png) \ 
  /// [Waxed Copper Trapdoor](https://minecraft.wiki/w/waxed_copper_trapdoor) \ 
  /// _minecraft:waxed_copper_trapdoor_
  static const Block waxed_copper_trapdoor = Block('minecraft:waxed_copper_trapdoor');

  /// ![waxed_cut_copper](https://minecraftitemids.com/item/32/waxed_cut_copper.png) \ 
  /// [Waxed Cut Copper](https://minecraft.wiki/w/waxed_cut_copper) \ 
  /// _minecraft:waxed_cut_copper_
  static const Block waxed_cut_copper = Block('minecraft:waxed_cut_copper');

  /// ![waxed_cut_copper_slab](https://minecraftitemids.com/item/32/waxed_cut_copper_slab.png) \ 
  /// [Waxed Cut Copper Slab](https://minecraft.wiki/w/waxed_cut_copper_slab) \ 
  /// _minecraft:waxed_cut_copper_slab_
  static const Block waxed_cut_copper_slab = Block('minecraft:waxed_cut_copper_slab');

  /// ![waxed_cut_copper_stairs](https://minecraftitemids.com/item/32/waxed_cut_copper_stairs.png) \ 
  /// [Waxed Cut Copper Stairs](https://minecraft.wiki/w/waxed_cut_copper_stairs) \ 
  /// _minecraft:waxed_cut_copper_stairs_
  static const Block waxed_cut_copper_stairs = Block('minecraft:waxed_cut_copper_stairs');

  /// ![waxed_exposed_chiseled_copper](https://minecraftitemids.com/item/32/waxed_exposed_chiseled_copper.png) \ 
  /// [Waxed Exposed Chiseled Copper](https://minecraft.wiki/w/waxed_exposed_chiseled_copper) \ 
  /// _minecraft:waxed_exposed_chiseled_copper_
  static const Block waxed_exposed_chiseled_copper = Block('minecraft:waxed_exposed_chiseled_copper');

  /// ![waxed_exposed_copper](https://minecraftitemids.com/item/32/waxed_exposed_copper.png) \ 
  /// [Waxed Exposed Copper](https://minecraft.wiki/w/waxed_exposed_copper) \ 
  /// _minecraft:waxed_exposed_copper_
  static const Block waxed_exposed_copper = Block('minecraft:waxed_exposed_copper');

  /// ![waxed_exposed_copper_bulb](https://minecraftitemids.com/item/32/waxed_exposed_copper_bulb.png) \ 
  /// [Waxed Exposed Copper Bulb](https://minecraft.wiki/w/waxed_exposed_copper_bulb) \ 
  /// _minecraft:waxed_exposed_copper_bulb_
  static const Block waxed_exposed_copper_bulb = Block('minecraft:waxed_exposed_copper_bulb');

  /// ![waxed_exposed_copper_door](https://minecraftitemids.com/item/32/waxed_exposed_copper_door.png) \ 
  /// [Waxed Exposed Copper Door](https://minecraft.wiki/w/waxed_exposed_copper_door) \ 
  /// _minecraft:waxed_exposed_copper_door_
  static const Block waxed_exposed_copper_door = Block('minecraft:waxed_exposed_copper_door');

  /// ![waxed_exposed_copper_grate](https://minecraftitemids.com/item/32/waxed_exposed_copper_grate.png) \ 
  /// [Waxed Exposed Copper Grate](https://minecraft.wiki/w/waxed_exposed_copper_grate) \ 
  /// _minecraft:waxed_exposed_copper_grate_
  static const Block waxed_exposed_copper_grate = Block('minecraft:waxed_exposed_copper_grate');

  /// ![waxed_exposed_copper_trapdoor](https://minecraftitemids.com/item/32/waxed_exposed_copper_trapdoor.png) \ 
  /// [Waxed Exposed Copper Trapdoor](https://minecraft.wiki/w/waxed_exposed_copper_trapdoor) \ 
  /// _minecraft:waxed_exposed_copper_trapdoor_
  static const Block waxed_exposed_copper_trapdoor = Block('minecraft:waxed_exposed_copper_trapdoor');

  /// ![waxed_exposed_cut_copper](https://minecraftitemids.com/item/32/waxed_exposed_cut_copper.png) \ 
  /// [Waxed Exposed Cut Copper](https://minecraft.wiki/w/waxed_exposed_cut_copper) \ 
  /// _minecraft:waxed_exposed_cut_copper_
  static const Block waxed_exposed_cut_copper = Block('minecraft:waxed_exposed_cut_copper');

  /// ![waxed_exposed_cut_copper_slab](https://minecraftitemids.com/item/32/waxed_exposed_cut_copper_slab.png) \ 
  /// [Waxed Exposed Cut Copper Slab](https://minecraft.wiki/w/waxed_exposed_cut_copper_slab) \ 
  /// _minecraft:waxed_exposed_cut_copper_slab_
  static const Block waxed_exposed_cut_copper_slab = Block('minecraft:waxed_exposed_cut_copper_slab');

  /// ![waxed_exposed_cut_copper_stairs](https://minecraftitemids.com/item/32/waxed_exposed_cut_copper_stairs.png) \ 
  /// [Waxed Exposed Cut Copper Stairs](https://minecraft.wiki/w/waxed_exposed_cut_copper_stairs) \ 
  /// _minecraft:waxed_exposed_cut_copper_stairs_
  static const Block waxed_exposed_cut_copper_stairs = Block('minecraft:waxed_exposed_cut_copper_stairs');

  /// ![waxed_oxidized_chiseled_copper](https://minecraftitemids.com/item/32/waxed_oxidized_chiseled_copper.png) \ 
  /// [Waxed Oxidized Chiseled Copper](https://minecraft.wiki/w/waxed_oxidized_chiseled_copper) \ 
  /// _minecraft:waxed_oxidized_chiseled_copper_
  static const Block waxed_oxidized_chiseled_copper = Block('minecraft:waxed_oxidized_chiseled_copper');

  /// ![waxed_oxidized_copper](https://minecraftitemids.com/item/32/waxed_oxidized_copper.png) \ 
  /// [Waxed Oxidized Copper](https://minecraft.wiki/w/waxed_oxidized_copper) \ 
  /// _minecraft:waxed_oxidized_copper_
  static const Block waxed_oxidized_copper = Block('minecraft:waxed_oxidized_copper');

  /// ![waxed_oxidized_copper_bulb](https://minecraftitemids.com/item/32/waxed_oxidized_copper_bulb.png) \ 
  /// [Waxed Oxidized Copper Bulb](https://minecraft.wiki/w/waxed_oxidized_copper_bulb) \ 
  /// _minecraft:waxed_oxidized_copper_bulb_
  static const Block waxed_oxidized_copper_bulb = Block('minecraft:waxed_oxidized_copper_bulb');

  /// ![waxed_oxidized_copper_door](https://minecraftitemids.com/item/32/waxed_oxidized_copper_door.png) \ 
  /// [Waxed Oxidized Copper Door](https://minecraft.wiki/w/waxed_oxidized_copper_door) \ 
  /// _minecraft:waxed_oxidized_copper_door_
  static const Block waxed_oxidized_copper_door = Block('minecraft:waxed_oxidized_copper_door');

  /// ![waxed_oxidized_copper_grate](https://minecraftitemids.com/item/32/waxed_oxidized_copper_grate.png) \ 
  /// [Waxed Oxidized Copper Grate](https://minecraft.wiki/w/waxed_oxidized_copper_grate) \ 
  /// _minecraft:waxed_oxidized_copper_grate_
  static const Block waxed_oxidized_copper_grate = Block('minecraft:waxed_oxidized_copper_grate');

  /// ![waxed_oxidized_copper_trapdoor](https://minecraftitemids.com/item/32/waxed_oxidized_copper_trapdoor.png) \ 
  /// [Waxed Oxidized Copper Trapdoor](https://minecraft.wiki/w/waxed_oxidized_copper_trapdoor) \ 
  /// _minecraft:waxed_oxidized_copper_trapdoor_
  static const Block waxed_oxidized_copper_trapdoor = Block('minecraft:waxed_oxidized_copper_trapdoor');

  /// ![waxed_oxidized_cut_copper](https://minecraftitemids.com/item/32/waxed_oxidized_cut_copper.png) \ 
  /// [Waxed Oxidized Cut Copper](https://minecraft.wiki/w/waxed_oxidized_cut_copper) \ 
  /// _minecraft:waxed_oxidized_cut_copper_
  static const Block waxed_oxidized_cut_copper = Block('minecraft:waxed_oxidized_cut_copper');

  /// ![waxed_oxidized_cut_copper_slab](https://minecraftitemids.com/item/32/waxed_oxidized_cut_copper_slab.png) \ 
  /// [Waxed Oxidized Cut Copper Slab](https://minecraft.wiki/w/waxed_oxidized_cut_copper_slab) \ 
  /// _minecraft:waxed_oxidized_cut_copper_slab_
  static const Block waxed_oxidized_cut_copper_slab = Block('minecraft:waxed_oxidized_cut_copper_slab');

  /// ![waxed_oxidized_cut_copper_stairs](https://minecraftitemids.com/item/32/waxed_oxidized_cut_copper_stairs.png) \ 
  /// [Waxed Oxidized Cut Copper Stairs](https://minecraft.wiki/w/waxed_oxidized_cut_copper_stairs) \ 
  /// _minecraft:waxed_oxidized_cut_copper_stairs_
  static const Block waxed_oxidized_cut_copper_stairs = Block('minecraft:waxed_oxidized_cut_copper_stairs');

  /// ![waxed_weathered_chiseled_copper](https://minecraftitemids.com/item/32/waxed_weathered_chiseled_copper.png) \ 
  /// [Waxed Weathered Chiseled Copper](https://minecraft.wiki/w/waxed_weathered_chiseled_copper) \ 
  /// _minecraft:waxed_weathered_chiseled_copper_
  static const Block waxed_weathered_chiseled_copper = Block('minecraft:waxed_weathered_chiseled_copper');

  /// ![waxed_weathered_copper](https://minecraftitemids.com/item/32/waxed_weathered_copper.png) \ 
  /// [Waxed Weathered Copper](https://minecraft.wiki/w/waxed_weathered_copper) \ 
  /// _minecraft:waxed_weathered_copper_
  static const Block waxed_weathered_copper = Block('minecraft:waxed_weathered_copper');

  /// ![waxed_weathered_copper_bulb](https://minecraftitemids.com/item/32/waxed_weathered_copper_bulb.png) \ 
  /// [Waxed Weathered Copper Bulb](https://minecraft.wiki/w/waxed_weathered_copper_bulb) \ 
  /// _minecraft:waxed_weathered_copper_bulb_
  static const Block waxed_weathered_copper_bulb = Block('minecraft:waxed_weathered_copper_bulb');

  /// ![waxed_weathered_copper_door](https://minecraftitemids.com/item/32/waxed_weathered_copper_door.png) \ 
  /// [Waxed Weathered Copper Door](https://minecraft.wiki/w/waxed_weathered_copper_door) \ 
  /// _minecraft:waxed_weathered_copper_door_
  static const Block waxed_weathered_copper_door = Block('minecraft:waxed_weathered_copper_door');

  /// ![waxed_weathered_copper_grate](https://minecraftitemids.com/item/32/waxed_weathered_copper_grate.png) \ 
  /// [Waxed Weathered Copper Grate](https://minecraft.wiki/w/waxed_weathered_copper_grate) \ 
  /// _minecraft:waxed_weathered_copper_grate_
  static const Block waxed_weathered_copper_grate = Block('minecraft:waxed_weathered_copper_grate');

  /// ![waxed_weathered_copper_trapdoor](https://minecraftitemids.com/item/32/waxed_weathered_copper_trapdoor.png) \ 
  /// [Waxed Weathered Copper Trapdoor](https://minecraft.wiki/w/waxed_weathered_copper_trapdoor) \ 
  /// _minecraft:waxed_weathered_copper_trapdoor_
  static const Block waxed_weathered_copper_trapdoor = Block('minecraft:waxed_weathered_copper_trapdoor');

  /// ![waxed_weathered_cut_copper](https://minecraftitemids.com/item/32/waxed_weathered_cut_copper.png) \ 
  /// [Waxed Weathered Cut Copper](https://minecraft.wiki/w/waxed_weathered_cut_copper) \ 
  /// _minecraft:waxed_weathered_cut_copper_
  static const Block waxed_weathered_cut_copper = Block('minecraft:waxed_weathered_cut_copper');

  /// ![waxed_weathered_cut_copper_slab](https://minecraftitemids.com/item/32/waxed_weathered_cut_copper_slab.png) \ 
  /// [Waxed Weathered Cut Copper Slab](https://minecraft.wiki/w/waxed_weathered_cut_copper_slab) \ 
  /// _minecraft:waxed_weathered_cut_copper_slab_
  static const Block waxed_weathered_cut_copper_slab = Block('minecraft:waxed_weathered_cut_copper_slab');

  /// ![waxed_weathered_cut_copper_stairs](https://minecraftitemids.com/item/32/waxed_weathered_cut_copper_stairs.png) \ 
  /// [Waxed Weathered Cut Copper Stairs](https://minecraft.wiki/w/waxed_weathered_cut_copper_stairs) \ 
  /// _minecraft:waxed_weathered_cut_copper_stairs_
  static const Block waxed_weathered_cut_copper_stairs = Block('minecraft:waxed_weathered_cut_copper_stairs');

  /// ![weathered_chiseled_copper](https://minecraftitemids.com/item/32/weathered_chiseled_copper.png) \ 
  /// [Weathered Chiseled Copper](https://minecraft.wiki/w/weathered_chiseled_copper) \ 
  /// _minecraft:weathered_chiseled_copper_
  static const Block weathered_chiseled_copper = Block('minecraft:weathered_chiseled_copper');

  /// ![weathered_copper](https://minecraftitemids.com/item/32/weathered_copper.png) \ 
  /// [Weathered Copper](https://minecraft.wiki/w/weathered_copper) \ 
  /// _minecraft:weathered_copper_
  static const Block weathered_copper = Block('minecraft:weathered_copper');

  /// ![weathered_copper_bulb](https://minecraftitemids.com/item/32/weathered_copper_bulb.png) \ 
  /// [Weathered Copper Bulb](https://minecraft.wiki/w/weathered_copper_bulb) \ 
  /// _minecraft:weathered_copper_bulb_
  static const Block weathered_copper_bulb = Block('minecraft:weathered_copper_bulb');

  /// ![weathered_copper_door](https://minecraftitemids.com/item/32/weathered_copper_door.png) \ 
  /// [Weathered Copper Door](https://minecraft.wiki/w/weathered_copper_door) \ 
  /// _minecraft:weathered_copper_door_
  static const Block weathered_copper_door = Block('minecraft:weathered_copper_door');

  /// ![weathered_copper_grate](https://minecraftitemids.com/item/32/weathered_copper_grate.png) \ 
  /// [Weathered Copper Grate](https://minecraft.wiki/w/weathered_copper_grate) \ 
  /// _minecraft:weathered_copper_grate_
  static const Block weathered_copper_grate = Block('minecraft:weathered_copper_grate');

  /// ![weathered_copper_trapdoor](https://minecraftitemids.com/item/32/weathered_copper_trapdoor.png) \ 
  /// [Weathered Copper Trapdoor](https://minecraft.wiki/w/weathered_copper_trapdoor) \ 
  /// _minecraft:weathered_copper_trapdoor_
  static const Block weathered_copper_trapdoor = Block('minecraft:weathered_copper_trapdoor');

  /// ![weathered_cut_copper](https://minecraftitemids.com/item/32/weathered_cut_copper.png) \ 
  /// [Weathered Cut Copper](https://minecraft.wiki/w/weathered_cut_copper) \ 
  /// _minecraft:weathered_cut_copper_
  static const Block weathered_cut_copper = Block('minecraft:weathered_cut_copper');

  /// ![weathered_cut_copper_slab](https://minecraftitemids.com/item/32/weathered_cut_copper_slab.png) \ 
  /// [Weathered Cut Copper Slab](https://minecraft.wiki/w/weathered_cut_copper_slab) \ 
  /// _minecraft:weathered_cut_copper_slab_
  static const Block weathered_cut_copper_slab = Block('minecraft:weathered_cut_copper_slab');

  /// ![weathered_cut_copper_stairs](https://minecraftitemids.com/item/32/weathered_cut_copper_stairs.png) \ 
  /// [Weathered Cut Copper Stairs](https://minecraft.wiki/w/weathered_cut_copper_stairs) \ 
  /// _minecraft:weathered_cut_copper_stairs_
  static const Block weathered_cut_copper_stairs = Block('minecraft:weathered_cut_copper_stairs');

  /// ![weeping_vines](https://minecraftitemids.com/item/32/weeping_vines.png) \ 
  /// [Weeping Vines](https://minecraft.wiki/w/weeping_vines) \ 
  /// _minecraft:weeping_vines_
  static const Block weeping_vines = Block('minecraft:weeping_vines');

  /// ![weeping_vines_plant](https://minecraftitemids.com/item/32/weeping_vines_plant.png) \ 
  /// [Weeping Vines Plant](https://minecraft.wiki/w/weeping_vines_plant) \ 
  /// _minecraft:weeping_vines_plant_
  static const Block weeping_vines_plant = Block('minecraft:weeping_vines_plant');

  /// ![wet_sponge](https://minecraftitemids.com/item/32/wet_sponge.png) \ 
  /// [Wet Sponge](https://minecraft.wiki/w/wet_sponge) \ 
  /// _minecraft:wet_sponge_
  static const Block wet_sponge = Block('minecraft:wet_sponge');

  /// ![wheat](https://minecraftitemids.com/item/32/wheat.png) \ 
  /// [Wheat](https://minecraft.wiki/w/wheat) \ 
  /// _minecraft:wheat_
  static const Block wheat = Block('minecraft:wheat');

  /// ![white_banner](https://minecraftitemids.com/item/32/white_banner.png) \ 
  /// [White Banner](https://minecraft.wiki/w/white_banner) \ 
  /// _minecraft:white_banner_
  static const Block white_banner = Block('minecraft:white_banner');

  /// ![white_bed](https://minecraftitemids.com/item/32/white_bed.png) \ 
  /// [White Bed](https://minecraft.wiki/w/white_bed) \ 
  /// _minecraft:white_bed_
  static const Block white_bed = Block('minecraft:white_bed');

  /// ![white_candle](https://minecraftitemids.com/item/32/white_candle.png) \ 
  /// [White Candle](https://minecraft.wiki/w/white_candle) \ 
  /// _minecraft:white_candle_
  static const Block white_candle = Block('minecraft:white_candle');

  /// ![white_candle_cake](https://minecraftitemids.com/item/32/white_candle_cake.png) \ 
  /// [White Candle Cake](https://minecraft.wiki/w/white_candle_cake) \ 
  /// _minecraft:white_candle_cake_
  static const Block white_candle_cake = Block('minecraft:white_candle_cake');

  /// ![white_carpet](https://minecraftitemids.com/item/32/white_carpet.png) \ 
  /// [White Carpet](https://minecraft.wiki/w/white_carpet) \ 
  /// _minecraft:white_carpet_
  static const Block white_carpet = Block('minecraft:white_carpet');

  /// ![white_concrete](https://minecraftitemids.com/item/32/white_concrete.png) \ 
  /// [White Concrete](https://minecraft.wiki/w/white_concrete) \ 
  /// _minecraft:white_concrete_
  static const Block white_concrete = Block('minecraft:white_concrete');

  /// ![white_concrete_powder](https://minecraftitemids.com/item/32/white_concrete_powder.png) \ 
  /// [White Concrete Powder](https://minecraft.wiki/w/white_concrete_powder) \ 
  /// _minecraft:white_concrete_powder_
  static const Block white_concrete_powder = Block('minecraft:white_concrete_powder');

  /// ![white_glazed_terracotta](https://minecraftitemids.com/item/32/white_glazed_terracotta.png) \ 
  /// [White Glazed Terracotta](https://minecraft.wiki/w/white_glazed_terracotta) \ 
  /// _minecraft:white_glazed_terracotta_
  static const Block white_glazed_terracotta = Block('minecraft:white_glazed_terracotta');

  /// ![white_shulker_box](https://minecraftitemids.com/item/32/white_shulker_box.png) \ 
  /// [White Shulker Box](https://minecraft.wiki/w/white_shulker_box) \ 
  /// _minecraft:white_shulker_box_
  static const Block white_shulker_box = Block('minecraft:white_shulker_box');

  /// ![white_stained_glass](https://minecraftitemids.com/item/32/white_stained_glass.png) \ 
  /// [White Stained Glass](https://minecraft.wiki/w/white_stained_glass) \ 
  /// _minecraft:white_stained_glass_
  static const Block white_stained_glass = Block('minecraft:white_stained_glass');

  /// ![white_stained_glass_pane](https://minecraftitemids.com/item/32/white_stained_glass_pane.png) \ 
  /// [White Stained Glass Pane](https://minecraft.wiki/w/white_stained_glass_pane) \ 
  /// _minecraft:white_stained_glass_pane_
  static const Block white_stained_glass_pane = Block('minecraft:white_stained_glass_pane');

  /// ![white_terracotta](https://minecraftitemids.com/item/32/white_terracotta.png) \ 
  /// [White Terracotta](https://minecraft.wiki/w/white_terracotta) \ 
  /// _minecraft:white_terracotta_
  static const Block white_terracotta = Block('minecraft:white_terracotta');

  /// ![white_tulip](https://minecraftitemids.com/item/32/white_tulip.png) \ 
  /// [White Tulip](https://minecraft.wiki/w/white_tulip) \ 
  /// _minecraft:white_tulip_
  static const Block white_tulip = Block('minecraft:white_tulip');

  /// ![white_wall_banner](https://minecraftitemids.com/item/32/white_wall_banner.png) \ 
  /// [White Wall Banner](https://minecraft.wiki/w/white_wall_banner) \ 
  /// _minecraft:white_wall_banner_
  static const Block white_wall_banner = Block('minecraft:white_wall_banner');

  /// ![white_wool](https://minecraftitemids.com/item/32/white_wool.png) \ 
  /// [White Wool](https://minecraft.wiki/w/white_wool) \ 
  /// _minecraft:white_wool_
  static const Block white_wool = Block('minecraft:white_wool');

  /// ![wither_rose](https://minecraftitemids.com/item/32/wither_rose.png) \ 
  /// [Wither Rose](https://minecraft.wiki/w/wither_rose) \ 
  /// _minecraft:wither_rose_
  static const Block wither_rose = Block('minecraft:wither_rose');

  /// ![wither_skeleton_skull](https://minecraftitemids.com/item/32/wither_skeleton_skull.png) \ 
  /// [Wither Skeleton Skull](https://minecraft.wiki/w/wither_skeleton_skull) \ 
  /// _minecraft:wither_skeleton_skull_
  static const Block wither_skeleton_skull = Block('minecraft:wither_skeleton_skull');

  /// ![wither_skeleton_wall_skull](https://minecraftitemids.com/item/32/wither_skeleton_wall_skull.png) \ 
  /// [Wither Skeleton Wall Skull](https://minecraft.wiki/w/wither_skeleton_wall_skull) \ 
  /// _minecraft:wither_skeleton_wall_skull_
  static const Block wither_skeleton_wall_skull = Block('minecraft:wither_skeleton_wall_skull');

  /// ![yellow_banner](https://minecraftitemids.com/item/32/yellow_banner.png) \ 
  /// [Yellow Banner](https://minecraft.wiki/w/yellow_banner) \ 
  /// _minecraft:yellow_banner_
  static const Block yellow_banner = Block('minecraft:yellow_banner');

  /// ![yellow_bed](https://minecraftitemids.com/item/32/yellow_bed.png) \ 
  /// [Yellow Bed](https://minecraft.wiki/w/yellow_bed) \ 
  /// _minecraft:yellow_bed_
  static const Block yellow_bed = Block('minecraft:yellow_bed');

  /// ![yellow_candle](https://minecraftitemids.com/item/32/yellow_candle.png) \ 
  /// [Yellow Candle](https://minecraft.wiki/w/yellow_candle) \ 
  /// _minecraft:yellow_candle_
  static const Block yellow_candle = Block('minecraft:yellow_candle');

  /// ![yellow_candle_cake](https://minecraftitemids.com/item/32/yellow_candle_cake.png) \ 
  /// [Yellow Candle Cake](https://minecraft.wiki/w/yellow_candle_cake) \ 
  /// _minecraft:yellow_candle_cake_
  static const Block yellow_candle_cake = Block('minecraft:yellow_candle_cake');

  /// ![yellow_carpet](https://minecraftitemids.com/item/32/yellow_carpet.png) \ 
  /// [Yellow Carpet](https://minecraft.wiki/w/yellow_carpet) \ 
  /// _minecraft:yellow_carpet_
  static const Block yellow_carpet = Block('minecraft:yellow_carpet');

  /// ![yellow_concrete](https://minecraftitemids.com/item/32/yellow_concrete.png) \ 
  /// [Yellow Concrete](https://minecraft.wiki/w/yellow_concrete) \ 
  /// _minecraft:yellow_concrete_
  static const Block yellow_concrete = Block('minecraft:yellow_concrete');

  /// ![yellow_concrete_powder](https://minecraftitemids.com/item/32/yellow_concrete_powder.png) \ 
  /// [Yellow Concrete Powder](https://minecraft.wiki/w/yellow_concrete_powder) \ 
  /// _minecraft:yellow_concrete_powder_
  static const Block yellow_concrete_powder = Block('minecraft:yellow_concrete_powder');

  /// ![yellow_glazed_terracotta](https://minecraftitemids.com/item/32/yellow_glazed_terracotta.png) \ 
  /// [Yellow Glazed Terracotta](https://minecraft.wiki/w/yellow_glazed_terracotta) \ 
  /// _minecraft:yellow_glazed_terracotta_
  static const Block yellow_glazed_terracotta = Block('minecraft:yellow_glazed_terracotta');

  /// ![yellow_shulker_box](https://minecraftitemids.com/item/32/yellow_shulker_box.png) \ 
  /// [Yellow Shulker Box](https://minecraft.wiki/w/yellow_shulker_box) \ 
  /// _minecraft:yellow_shulker_box_
  static const Block yellow_shulker_box = Block('minecraft:yellow_shulker_box');

  /// ![yellow_stained_glass](https://minecraftitemids.com/item/32/yellow_stained_glass.png) \ 
  /// [Yellow Stained Glass](https://minecraft.wiki/w/yellow_stained_glass) \ 
  /// _minecraft:yellow_stained_glass_
  static const Block yellow_stained_glass = Block('minecraft:yellow_stained_glass');

  /// ![yellow_stained_glass_pane](https://minecraftitemids.com/item/32/yellow_stained_glass_pane.png) \ 
  /// [Yellow Stained Glass Pane](https://minecraft.wiki/w/yellow_stained_glass_pane) \ 
  /// _minecraft:yellow_stained_glass_pane_
  static const Block yellow_stained_glass_pane = Block('minecraft:yellow_stained_glass_pane');

  /// ![yellow_terracotta](https://minecraftitemids.com/item/32/yellow_terracotta.png) \ 
  /// [Yellow Terracotta](https://minecraft.wiki/w/yellow_terracotta) \ 
  /// _minecraft:yellow_terracotta_
  static const Block yellow_terracotta = Block('minecraft:yellow_terracotta');

  /// ![yellow_wall_banner](https://minecraftitemids.com/item/32/yellow_wall_banner.png) \ 
  /// [Yellow Wall Banner](https://minecraft.wiki/w/yellow_wall_banner) \ 
  /// _minecraft:yellow_wall_banner_
  static const Block yellow_wall_banner = Block('minecraft:yellow_wall_banner');

  /// ![yellow_wool](https://minecraftitemids.com/item/32/yellow_wool.png) \ 
  /// [Yellow Wool](https://minecraft.wiki/w/yellow_wool) \ 
  /// _minecraft:yellow_wool_
  static const Block yellow_wool = Block('minecraft:yellow_wool');

  /// ![zombie_head](https://minecraftitemids.com/item/32/zombie_head.png) \ 
  /// [Zombie Head](https://minecraft.wiki/w/zombie_head) \ 
  /// _minecraft:zombie_head_
  static const Block zombie_head = Block('minecraft:zombie_head');

  /// ![zombie_wall_head](https://minecraftitemids.com/item/32/zombie_wall_head.png) \ 
  /// [Zombie Wall Head](https://minecraft.wiki/w/zombie_wall_head) \ 
  /// _minecraft:zombie_wall_head_
  static const Block zombie_wall_head = Block('minecraft:zombie_wall_head');

  //[[[end]]]

  /// A List of all Minecraft blocks
  static List<Block> get all => const [
        /*[[[cog
    for b in blocks:
      cog.outl(f'{b},')
    ]]]*/
    acacia_button,
    acacia_door,
    acacia_fence,
    acacia_fence_gate,
    acacia_hanging_sign,
    acacia_leaves,
    acacia_log,
    acacia_planks,
    acacia_pressure_plate,
    acacia_sapling,
    acacia_sign,
    acacia_slab,
    acacia_stairs,
    acacia_trapdoor,
    acacia_wall_hanging_sign,
    acacia_wall_sign,
    acacia_wood,
    activator_rail,
    air,
    allium,
    amethyst_block,
    amethyst_cluster,
    ancient_debris,
    andesite,
    andesite_slab,
    andesite_stairs,
    andesite_wall,
    anvil,
    attached_melon_stem,
    attached_pumpkin_stem,
    azalea,
    azalea_leaves,
    azure_bluet,
    bamboo,
    bamboo_block,
    bamboo_button,
    bamboo_door,
    bamboo_fence,
    bamboo_fence_gate,
    bamboo_hanging_sign,
    bamboo_mosaic,
    bamboo_mosaic_slab,
    bamboo_mosaic_stairs,
    bamboo_planks,
    bamboo_pressure_plate,
    bamboo_sapling,
    bamboo_sign,
    bamboo_slab,
    bamboo_stairs,
    bamboo_trapdoor,
    bamboo_wall_hanging_sign,
    bamboo_wall_sign,
    barrel,
    barrier,
    basalt,
    beacon,
    bedrock,
    bee_nest,
    beehive,
    beetroots,
    bell,
    big_dripleaf,
    big_dripleaf_stem,
    birch_button,
    birch_door,
    birch_fence,
    birch_fence_gate,
    birch_hanging_sign,
    birch_leaves,
    birch_log,
    birch_planks,
    birch_pressure_plate,
    birch_sapling,
    birch_sign,
    birch_slab,
    birch_stairs,
    birch_trapdoor,
    birch_wall_hanging_sign,
    birch_wall_sign,
    birch_wood,
    black_banner,
    black_bed,
    black_candle,
    black_candle_cake,
    black_carpet,
    black_concrete,
    black_concrete_powder,
    black_glazed_terracotta,
    black_shulker_box,
    black_stained_glass,
    black_stained_glass_pane,
    black_terracotta,
    black_wall_banner,
    black_wool,
    blackstone,
    blackstone_slab,
    blackstone_stairs,
    blackstone_wall,
    blast_furnace,
    blue_banner,
    blue_bed,
    blue_candle,
    blue_candle_cake,
    blue_carpet,
    blue_concrete,
    blue_concrete_powder,
    blue_glazed_terracotta,
    blue_ice,
    blue_orchid,
    blue_shulker_box,
    blue_stained_glass,
    blue_stained_glass_pane,
    blue_terracotta,
    blue_wall_banner,
    blue_wool,
    bone_block,
    bookshelf,
    brain_coral,
    brain_coral_block,
    brain_coral_fan,
    brain_coral_wall_fan,
    brewing_stand,
    brick_slab,
    brick_stairs,
    brick_wall,
    bricks,
    brown_banner,
    brown_bed,
    brown_candle,
    brown_candle_cake,
    brown_carpet,
    brown_concrete,
    brown_concrete_powder,
    brown_glazed_terracotta,
    brown_mushroom,
    brown_mushroom_block,
    brown_shulker_box,
    brown_stained_glass,
    brown_stained_glass_pane,
    brown_terracotta,
    brown_wall_banner,
    brown_wool,
    bubble_column,
    bubble_coral,
    bubble_coral_block,
    bubble_coral_fan,
    bubble_coral_wall_fan,
    budding_amethyst,
    cactus,
    cake,
    calcite,
    calibrated_sculk_sensor,
    campfire,
    candle,
    candle_cake,
    carrots,
    cartography_table,
    carved_pumpkin,
    cauldron,
    cave_air,
    cave_vines,
    cave_vines_plant,
    chain,
    chain_command_block,
    cherry_button,
    cherry_door,
    cherry_fence,
    cherry_fence_gate,
    cherry_hanging_sign,
    cherry_leaves,
    cherry_log,
    cherry_planks,
    cherry_pressure_plate,
    cherry_sapling,
    cherry_sign,
    cherry_slab,
    cherry_stairs,
    cherry_trapdoor,
    cherry_wall_hanging_sign,
    cherry_wall_sign,
    cherry_wood,
    chest,
    chipped_anvil,
    chiseled_bookshelf,
    chiseled_copper,
    chiseled_deepslate,
    chiseled_nether_bricks,
    chiseled_polished_blackstone,
    chiseled_quartz_block,
    chiseled_red_sandstone,
    chiseled_sandstone,
    chiseled_stone_bricks,
    chiseled_tuff,
    chiseled_tuff_bricks,
    chorus_flower,
    chorus_plant,
    clay,
    coal_block,
    coal_ore,
    coarse_dirt,
    cobbled_deepslate,
    cobbled_deepslate_slab,
    cobbled_deepslate_stairs,
    cobbled_deepslate_wall,
    cobblestone,
    cobblestone_slab,
    cobblestone_stairs,
    cobblestone_wall,
    cobweb,
    cocoa,
    command_block,
    comparator,
    composter,
    conduit,
    copper_block,
    copper_bulb,
    copper_door,
    copper_grate,
    copper_ore,
    copper_trapdoor,
    cornflower,
    cracked_deepslate_bricks,
    cracked_deepslate_tiles,
    cracked_nether_bricks,
    cracked_polished_blackstone_bricks,
    cracked_stone_bricks,
    crafter,
    crafting_table,
    creeper_head,
    creeper_wall_head,
    crimson_button,
    crimson_door,
    crimson_fence,
    crimson_fence_gate,
    crimson_fungus,
    crimson_hanging_sign,
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
    crimson_wall_hanging_sign,
    crimson_wall_sign,
    crying_obsidian,
    cut_copper,
    cut_copper_slab,
    cut_copper_stairs,
    cut_red_sandstone,
    cut_red_sandstone_slab,
    cut_sandstone,
    cut_sandstone_slab,
    cyan_banner,
    cyan_bed,
    cyan_candle,
    cyan_candle_cake,
    cyan_carpet,
    cyan_concrete,
    cyan_concrete_powder,
    cyan_glazed_terracotta,
    cyan_shulker_box,
    cyan_stained_glass,
    cyan_stained_glass_pane,
    cyan_terracotta,
    cyan_wall_banner,
    cyan_wool,
    damaged_anvil,
    dandelion,
    dark_oak_button,
    dark_oak_door,
    dark_oak_fence,
    dark_oak_fence_gate,
    dark_oak_hanging_sign,
    dark_oak_leaves,
    dark_oak_log,
    dark_oak_planks,
    dark_oak_pressure_plate,
    dark_oak_sapling,
    dark_oak_sign,
    dark_oak_slab,
    dark_oak_stairs,
    dark_oak_trapdoor,
    dark_oak_wall_hanging_sign,
    dark_oak_wall_sign,
    dark_oak_wood,
    dark_prismarine,
    dark_prismarine_slab,
    dark_prismarine_stairs,
    daylight_detector,
    dead_brain_coral,
    dead_brain_coral_block,
    dead_brain_coral_fan,
    dead_brain_coral_wall_fan,
    dead_bubble_coral,
    dead_bubble_coral_block,
    dead_bubble_coral_fan,
    dead_bubble_coral_wall_fan,
    dead_bush,
    dead_fire_coral,
    dead_fire_coral_block,
    dead_fire_coral_fan,
    dead_fire_coral_wall_fan,
    dead_horn_coral,
    dead_horn_coral_block,
    dead_horn_coral_fan,
    dead_horn_coral_wall_fan,
    dead_tube_coral,
    dead_tube_coral_block,
    dead_tube_coral_fan,
    dead_tube_coral_wall_fan,
    decorated_pot,
    deepslate,
    deepslate_brick_slab,
    deepslate_brick_stairs,
    deepslate_brick_wall,
    deepslate_bricks,
    deepslate_coal_ore,
    deepslate_copper_ore,
    deepslate_diamond_ore,
    deepslate_emerald_ore,
    deepslate_gold_ore,
    deepslate_iron_ore,
    deepslate_lapis_ore,
    deepslate_redstone_ore,
    deepslate_tile_slab,
    deepslate_tile_stairs,
    deepslate_tile_wall,
    deepslate_tiles,
    detector_rail,
    diamond_block,
    diamond_ore,
    diorite,
    diorite_slab,
    diorite_stairs,
    diorite_wall,
    dirt,
    dirt_path,
    dispenser,
    dragon_egg,
    dragon_head,
    dragon_wall_head,
    dried_kelp_block,
    dripstone_block,
    dropper,
    emerald_block,
    emerald_ore,
    enchanting_table,
    end_gateway,
    end_portal,
    end_portal_frame,
    end_rod,
    end_stone,
    end_stone_brick_slab,
    end_stone_brick_stairs,
    end_stone_brick_wall,
    end_stone_bricks,
    ender_chest,
    exposed_chiseled_copper,
    exposed_copper,
    exposed_copper_bulb,
    exposed_copper_door,
    exposed_copper_grate,
    exposed_copper_trapdoor,
    exposed_cut_copper,
    exposed_cut_copper_slab,
    exposed_cut_copper_stairs,
    farmland,
    fern,
    fire,
    fire_coral,
    fire_coral_block,
    fire_coral_fan,
    fire_coral_wall_fan,
    fletching_table,
    flower_pot,
    flowering_azalea,
    flowering_azalea_leaves,
    frogspawn,
    frosted_ice,
    furnace,
    gilded_blackstone,
    glass,
    glass_pane,
    glow_lichen,
    glowstone,
    gold_block,
    gold_ore,
    granite,
    granite_slab,
    granite_stairs,
    granite_wall,
    grass_block,
    gravel,
    gray_banner,
    gray_bed,
    gray_candle,
    gray_candle_cake,
    gray_carpet,
    gray_concrete,
    gray_concrete_powder,
    gray_glazed_terracotta,
    gray_shulker_box,
    gray_stained_glass,
    gray_stained_glass_pane,
    gray_terracotta,
    gray_wall_banner,
    gray_wool,
    green_banner,
    green_bed,
    green_candle,
    green_candle_cake,
    green_carpet,
    green_concrete,
    green_concrete_powder,
    green_glazed_terracotta,
    green_shulker_box,
    green_stained_glass,
    green_stained_glass_pane,
    green_terracotta,
    green_wall_banner,
    green_wool,
    grindstone,
    hanging_roots,
    hay_block,
    heavy_weighted_pressure_plate,
    honey_block,
    honeycomb_block,
    hopper,
    horn_coral,
    horn_coral_block,
    horn_coral_fan,
    horn_coral_wall_fan,
    ice,
    infested_chiseled_stone_bricks,
    infested_cobblestone,
    infested_cracked_stone_bricks,
    infested_deepslate,
    infested_mossy_stone_bricks,
    infested_stone,
    infested_stone_bricks,
    iron_bars,
    iron_block,
    iron_door,
    iron_ore,
    iron_trapdoor,
    jack_o_lantern,
    jigsaw,
    jukebox,
    jungle_button,
    jungle_door,
    jungle_fence,
    jungle_fence_gate,
    jungle_hanging_sign,
    jungle_leaves,
    jungle_log,
    jungle_planks,
    jungle_pressure_plate,
    jungle_sapling,
    jungle_sign,
    jungle_slab,
    jungle_stairs,
    jungle_trapdoor,
    jungle_wall_hanging_sign,
    jungle_wall_sign,
    jungle_wood,
    kelp,
    kelp_plant,
    ladder,
    lantern,
    lapis_block,
    lapis_ore,
    large_amethyst_bud,
    large_fern,
    lava,
    lava_cauldron,
    lectern,
    lever,
    light,
    light_blue_banner,
    light_blue_bed,
    light_blue_candle,
    light_blue_candle_cake,
    light_blue_carpet,
    light_blue_concrete,
    light_blue_concrete_powder,
    light_blue_glazed_terracotta,
    light_blue_shulker_box,
    light_blue_stained_glass,
    light_blue_stained_glass_pane,
    light_blue_terracotta,
    light_blue_wall_banner,
    light_blue_wool,
    light_gray_banner,
    light_gray_bed,
    light_gray_candle,
    light_gray_candle_cake,
    light_gray_carpet,
    light_gray_concrete,
    light_gray_concrete_powder,
    light_gray_glazed_terracotta,
    light_gray_shulker_box,
    light_gray_stained_glass,
    light_gray_stained_glass_pane,
    light_gray_terracotta,
    light_gray_wall_banner,
    light_gray_wool,
    light_weighted_pressure_plate,
    lightning_rod,
    lilac,
    lily_of_the_valley,
    lily_pad,
    lime_banner,
    lime_bed,
    lime_candle,
    lime_candle_cake,
    lime_carpet,
    lime_concrete,
    lime_concrete_powder,
    lime_glazed_terracotta,
    lime_shulker_box,
    lime_stained_glass,
    lime_stained_glass_pane,
    lime_terracotta,
    lime_wall_banner,
    lime_wool,
    lodestone,
    loom,
    magenta_banner,
    magenta_bed,
    magenta_candle,
    magenta_candle_cake,
    magenta_carpet,
    magenta_concrete,
    magenta_concrete_powder,
    magenta_glazed_terracotta,
    magenta_shulker_box,
    magenta_stained_glass,
    magenta_stained_glass_pane,
    magenta_terracotta,
    magenta_wall_banner,
    magenta_wool,
    magma_block,
    mangrove_button,
    mangrove_door,
    mangrove_fence,
    mangrove_fence_gate,
    mangrove_hanging_sign,
    mangrove_leaves,
    mangrove_log,
    mangrove_planks,
    mangrove_pressure_plate,
    mangrove_propagule,
    mangrove_roots,
    mangrove_sign,
    mangrove_slab,
    mangrove_stairs,
    mangrove_trapdoor,
    mangrove_wall_hanging_sign,
    mangrove_wall_sign,
    mangrove_wood,
    medium_amethyst_bud,
    melon,
    melon_stem,
    moss_block,
    moss_carpet,
    mossy_cobblestone,
    mossy_cobblestone_slab,
    mossy_cobblestone_stairs,
    mossy_cobblestone_wall,
    mossy_stone_brick_slab,
    mossy_stone_brick_stairs,
    mossy_stone_brick_wall,
    mossy_stone_bricks,
    moving_piston,
    mud,
    mud_brick_slab,
    mud_brick_stairs,
    mud_brick_wall,
    mud_bricks,
    muddy_mangrove_roots,
    mushroom_stem,
    mycelium,
    nether_brick_fence,
    nether_brick_slab,
    nether_brick_stairs,
    nether_brick_wall,
    nether_bricks,
    nether_gold_ore,
    nether_portal,
    nether_quartz_ore,
    nether_sprouts,
    nether_wart,
    nether_wart_block,
    netherite_block,
    netherrack,
    note_block,
    oak_button,
    oak_door,
    oak_fence,
    oak_fence_gate,
    oak_hanging_sign,
    oak_leaves,
    oak_log,
    oak_planks,
    oak_pressure_plate,
    oak_sapling,
    oak_sign,
    oak_slab,
    oak_stairs,
    oak_trapdoor,
    oak_wall_hanging_sign,
    oak_wall_sign,
    oak_wood,
    observer,
    obsidian,
    ochre_froglight,
    orange_banner,
    orange_bed,
    orange_candle,
    orange_candle_cake,
    orange_carpet,
    orange_concrete,
    orange_concrete_powder,
    orange_glazed_terracotta,
    orange_shulker_box,
    orange_stained_glass,
    orange_stained_glass_pane,
    orange_terracotta,
    orange_tulip,
    orange_wall_banner,
    orange_wool,
    oxeye_daisy,
    oxidized_chiseled_copper,
    oxidized_copper,
    oxidized_copper_bulb,
    oxidized_copper_door,
    oxidized_copper_grate,
    oxidized_copper_trapdoor,
    oxidized_cut_copper,
    oxidized_cut_copper_slab,
    oxidized_cut_copper_stairs,
    packed_ice,
    packed_mud,
    pearlescent_froglight,
    peony,
    petrified_oak_slab,
    piglin_head,
    piglin_wall_head,
    pink_banner,
    pink_bed,
    pink_candle,
    pink_candle_cake,
    pink_carpet,
    pink_concrete,
    pink_concrete_powder,
    pink_glazed_terracotta,
    pink_petals,
    pink_shulker_box,
    pink_stained_glass,
    pink_stained_glass_pane,
    pink_terracotta,
    pink_tulip,
    pink_wall_banner,
    pink_wool,
    piston,
    piston_head,
    pitcher_crop,
    pitcher_plant,
    player_head,
    player_wall_head,
    podzol,
    pointed_dripstone,
    polished_andesite,
    polished_andesite_slab,
    polished_andesite_stairs,
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
    polished_deepslate,
    polished_deepslate_slab,
    polished_deepslate_stairs,
    polished_deepslate_wall,
    polished_diorite,
    polished_diorite_slab,
    polished_diorite_stairs,
    polished_granite,
    polished_granite_slab,
    polished_granite_stairs,
    polished_tuff,
    polished_tuff_slab,
    polished_tuff_stairs,
    polished_tuff_wall,
    poppy,
    potatoes,
    potted_acacia_sapling,
    potted_allium,
    potted_azalea_bush,
    potted_azure_bluet,
    potted_bamboo,
    potted_birch_sapling,
    potted_blue_orchid,
    potted_brown_mushroom,
    potted_cactus,
    potted_cherry_sapling,
    potted_cornflower,
    potted_crimson_fungus,
    potted_crimson_roots,
    potted_dandelion,
    potted_dark_oak_sapling,
    potted_dead_bush,
    potted_fern,
    potted_flowering_azalea_bush,
    potted_jungle_sapling,
    potted_lily_of_the_valley,
    potted_mangrove_propagule,
    potted_oak_sapling,
    potted_orange_tulip,
    potted_oxeye_daisy,
    potted_pink_tulip,
    potted_poppy,
    potted_red_mushroom,
    potted_red_tulip,
    potted_spruce_sapling,
    potted_torchflower,
    potted_warped_fungus,
    potted_warped_roots,
    potted_white_tulip,
    potted_wither_rose,
    powder_snow,
    powder_snow_cauldron,
    powered_rail,
    prismarine,
    prismarine_brick_slab,
    prismarine_brick_stairs,
    prismarine_bricks,
    prismarine_slab,
    prismarine_stairs,
    prismarine_wall,
    pumpkin,
    pumpkin_stem,
    purple_banner,
    purple_bed,
    purple_candle,
    purple_candle_cake,
    purple_carpet,
    purple_concrete,
    purple_concrete_powder,
    purple_glazed_terracotta,
    purple_shulker_box,
    purple_stained_glass,
    purple_stained_glass_pane,
    purple_terracotta,
    purple_wall_banner,
    purple_wool,
    purpur_block,
    purpur_pillar,
    purpur_slab,
    purpur_stairs,
    quartz_block,
    quartz_bricks,
    quartz_pillar,
    quartz_slab,
    quartz_stairs,
    rail,
    raw_copper_block,
    raw_gold_block,
    raw_iron_block,
    red_banner,
    red_bed,
    red_candle,
    red_candle_cake,
    red_carpet,
    red_concrete,
    red_concrete_powder,
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
    red_wall_banner,
    red_wool,
    redstone_block,
    redstone_lamp,
    redstone_ore,
    redstone_torch,
    redstone_wall_torch,
    redstone_wire,
    reinforced_deepslate,
    repeater,
    repeating_command_block,
    respawn_anchor,
    rooted_dirt,
    rose_bush,
    sand,
    sandstone,
    sandstone_slab,
    sandstone_stairs,
    sandstone_wall,
    scaffolding,
    sculk,
    sculk_catalyst,
    sculk_sensor,
    sculk_shrieker,
    sculk_vein,
    sea_lantern,
    sea_pickle,
    seagrass,
    short_grass,
    shroomlight,
    shulker_box,
    skeleton_skull,
    skeleton_wall_skull,
    slime_block,
    small_amethyst_bud,
    small_dripleaf,
    smithing_table,
    smoker,
    smooth_basalt,
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
    sniffer_egg,
    snow,
    snow_block,
    soul_campfire,
    soul_fire,
    soul_lantern,
    soul_sand,
    soul_soil,
    soul_torch,
    soul_wall_torch,
    spawner,
    sponge,
    spore_blossom,
    spruce_button,
    spruce_door,
    spruce_fence,
    spruce_fence_gate,
    spruce_hanging_sign,
    spruce_leaves,
    spruce_log,
    spruce_planks,
    spruce_pressure_plate,
    spruce_sapling,
    spruce_sign,
    spruce_slab,
    spruce_stairs,
    spruce_trapdoor,
    spruce_wall_hanging_sign,
    spruce_wall_sign,
    spruce_wood,
    sticky_piston,
    stone,
    stone_brick_slab,
    stone_brick_stairs,
    stone_brick_wall,
    stone_bricks,
    stone_button,
    stone_pressure_plate,
    stone_slab,
    stone_stairs,
    stonecutter,
    stripped_acacia_log,
    stripped_acacia_wood,
    stripped_bamboo_block,
    stripped_birch_log,
    stripped_birch_wood,
    stripped_cherry_log,
    stripped_cherry_wood,
    stripped_crimson_hyphae,
    stripped_crimson_stem,
    stripped_dark_oak_log,
    stripped_dark_oak_wood,
    stripped_jungle_log,
    stripped_jungle_wood,
    stripped_mangrove_log,
    stripped_mangrove_wood,
    stripped_oak_log,
    stripped_oak_wood,
    stripped_spruce_log,
    stripped_spruce_wood,
    stripped_warped_hyphae,
    stripped_warped_stem,
    structure_block,
    structure_void,
    sugar_cane,
    sunflower,
    suspicious_gravel,
    suspicious_sand,
    sweet_berry_bush,
    tall_grass,
    tall_seagrass,
    target,
    terracotta,
    tinted_glass,
    tnt,
    torch,
    torchflower,
    torchflower_crop,
    trapped_chest,
    trial_spawner,
    tripwire,
    tripwire_hook,
    tube_coral,
    tube_coral_block,
    tube_coral_fan,
    tube_coral_wall_fan,
    tuff,
    tuff_brick_slab,
    tuff_brick_stairs,
    tuff_brick_wall,
    tuff_bricks,
    tuff_slab,
    tuff_stairs,
    tuff_wall,
    turtle_egg,
    twisting_vines,
    twisting_vines_plant,
    verdant_froglight,
    vine,
    void_air,
    wall_torch,
    warped_button,
    warped_door,
    warped_fence,
    warped_fence_gate,
    warped_fungus,
    warped_hanging_sign,
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
    warped_wall_hanging_sign,
    warped_wall_sign,
    warped_wart_block,
    water,
    water_cauldron,
    waxed_chiseled_copper,
    waxed_copper_block,
    waxed_copper_bulb,
    waxed_copper_door,
    waxed_copper_grate,
    waxed_copper_trapdoor,
    waxed_cut_copper,
    waxed_cut_copper_slab,
    waxed_cut_copper_stairs,
    waxed_exposed_chiseled_copper,
    waxed_exposed_copper,
    waxed_exposed_copper_bulb,
    waxed_exposed_copper_door,
    waxed_exposed_copper_grate,
    waxed_exposed_copper_trapdoor,
    waxed_exposed_cut_copper,
    waxed_exposed_cut_copper_slab,
    waxed_exposed_cut_copper_stairs,
    waxed_oxidized_chiseled_copper,
    waxed_oxidized_copper,
    waxed_oxidized_copper_bulb,
    waxed_oxidized_copper_door,
    waxed_oxidized_copper_grate,
    waxed_oxidized_copper_trapdoor,
    waxed_oxidized_cut_copper,
    waxed_oxidized_cut_copper_slab,
    waxed_oxidized_cut_copper_stairs,
    waxed_weathered_chiseled_copper,
    waxed_weathered_copper,
    waxed_weathered_copper_bulb,
    waxed_weathered_copper_door,
    waxed_weathered_copper_grate,
    waxed_weathered_copper_trapdoor,
    waxed_weathered_cut_copper,
    waxed_weathered_cut_copper_slab,
    waxed_weathered_cut_copper_stairs,
    weathered_chiseled_copper,
    weathered_copper,
    weathered_copper_bulb,
    weathered_copper_door,
    weathered_copper_grate,
    weathered_copper_trapdoor,
    weathered_cut_copper,
    weathered_cut_copper_slab,
    weathered_cut_copper_stairs,
    weeping_vines,
    weeping_vines_plant,
    wet_sponge,
    wheat,
    white_banner,
    white_bed,
    white_candle,
    white_candle_cake,
    white_carpet,
    white_concrete,
    white_concrete_powder,
    white_glazed_terracotta,
    white_shulker_box,
    white_stained_glass,
    white_stained_glass_pane,
    white_terracotta,
    white_tulip,
    white_wall_banner,
    white_wool,
    wither_rose,
    wither_skeleton_skull,
    wither_skeleton_wall_skull,
    yellow_banner,
    yellow_bed,
    yellow_candle,
    yellow_candle_cake,
    yellow_carpet,
    yellow_concrete,
    yellow_concrete_powder,
    yellow_glazed_terracotta,
    yellow_shulker_box,
    yellow_stained_glass,
    yellow_stained_glass_pane,
    yellow_terracotta,
    yellow_wall_banner,
    yellow_wool,
    zombie_head,
    zombie_wall_head,
        //[[[end]]]
      ];

  /// A List of newer experimental blocks introduced in the next minecraft version
  static List<Block> get snapshot => const [
        /*[[[cog
    for b in next_blocks:
      cog.outl(f'{b},')
    ]]]*/
        //[[[end]]]
      ];
}
