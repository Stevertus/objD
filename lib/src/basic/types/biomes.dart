/// A List of all Minecraft biomes
class Biomes {
  // using cog generation tool to fetch blocks
  /*[[[cog
  import cog
  import requests

  version = '1.20/snapshots/23w12a'

  res = requests.get(f'https://raw.githubusercontent.com/PixiGeko/Minecraft-generated-data/master/{version}/custom-generated/lists/worldgen/biome.txt')
  blocks = []
  for l in res.iter_lines():
      full = l.decode('UTF-8')
      id = full.split('.')[0]
      blocks.append(id)
      cog.outl(f'/// _minecraft:{id}_')
      cog.outl(f"static const Biome {id} = Biome('minecraft:{id}');\n")
  ]]]*/
  /// _minecraft:badlands_
  static const Biome badlands = Biome('minecraft:badlands');

  /// _minecraft:bamboo_jungle_
  static const Biome bamboo_jungle = Biome('minecraft:bamboo_jungle');

  /// _minecraft:basalt_deltas_
  static const Biome basalt_deltas = Biome('minecraft:basalt_deltas');

  /// _minecraft:beach_
  static const Biome beach = Biome('minecraft:beach');

  /// _minecraft:birch_forest_
  static const Biome birch_forest = Biome('minecraft:birch_forest');

  /// _minecraft:cherry_grove_
  static const Biome cherry_grove = Biome('minecraft:cherry_grove');

  /// _minecraft:cold_ocean_
  static const Biome cold_ocean = Biome('minecraft:cold_ocean');

  /// _minecraft:crimson_forest_
  static const Biome crimson_forest = Biome('minecraft:crimson_forest');

  /// _minecraft:dark_forest_
  static const Biome dark_forest = Biome('minecraft:dark_forest');

  /// _minecraft:deep_cold_ocean_
  static const Biome deep_cold_ocean = Biome('minecraft:deep_cold_ocean');

  /// _minecraft:deep_dark_
  static const Biome deep_dark = Biome('minecraft:deep_dark');

  /// _minecraft:deep_frozen_ocean_
  static const Biome deep_frozen_ocean = Biome('minecraft:deep_frozen_ocean');

  /// _minecraft:deep_lukewarm_ocean_
  static const Biome deep_lukewarm_ocean = Biome('minecraft:deep_lukewarm_ocean');

  /// _minecraft:deep_ocean_
  static const Biome deep_ocean = Biome('minecraft:deep_ocean');

  /// _minecraft:desert_
  static const Biome desert = Biome('minecraft:desert');

  /// _minecraft:dripstone_caves_
  static const Biome dripstone_caves = Biome('minecraft:dripstone_caves');

  /// _minecraft:end_barrens_
  static const Biome end_barrens = Biome('minecraft:end_barrens');

  /// _minecraft:end_highlands_
  static const Biome end_highlands = Biome('minecraft:end_highlands');

  /// _minecraft:end_midlands_
  static const Biome end_midlands = Biome('minecraft:end_midlands');

  /// _minecraft:eroded_badlands_
  static const Biome eroded_badlands = Biome('minecraft:eroded_badlands');

  /// _minecraft:flower_forest_
  static const Biome flower_forest = Biome('minecraft:flower_forest');

  /// _minecraft:forest_
  static const Biome forest = Biome('minecraft:forest');

  /// _minecraft:frozen_ocean_
  static const Biome frozen_ocean = Biome('minecraft:frozen_ocean');

  /// _minecraft:frozen_peaks_
  static const Biome frozen_peaks = Biome('minecraft:frozen_peaks');

  /// _minecraft:frozen_river_
  static const Biome frozen_river = Biome('minecraft:frozen_river');

  /// _minecraft:grove_
  static const Biome grove = Biome('minecraft:grove');

  /// _minecraft:ice_spikes_
  static const Biome ice_spikes = Biome('minecraft:ice_spikes');

  /// _minecraft:jagged_peaks_
  static const Biome jagged_peaks = Biome('minecraft:jagged_peaks');

  /// _minecraft:jungle_
  static const Biome jungle = Biome('minecraft:jungle');

  /// _minecraft:lukewarm_ocean_
  static const Biome lukewarm_ocean = Biome('minecraft:lukewarm_ocean');

  /// _minecraft:lush_caves_
  static const Biome lush_caves = Biome('minecraft:lush_caves');

  /// _minecraft:mangrove_swamp_
  static const Biome mangrove_swamp = Biome('minecraft:mangrove_swamp');

  /// _minecraft:meadow_
  static const Biome meadow = Biome('minecraft:meadow');

  /// _minecraft:mushroom_fields_
  static const Biome mushroom_fields = Biome('minecraft:mushroom_fields');

  /// _minecraft:nether_wastes_
  static const Biome nether_wastes = Biome('minecraft:nether_wastes');

  /// _minecraft:ocean_
  static const Biome ocean = Biome('minecraft:ocean');

  /// _minecraft:old_growth_birch_forest_
  static const Biome old_growth_birch_forest = Biome('minecraft:old_growth_birch_forest');

  /// _minecraft:old_growth_pine_taiga_
  static const Biome old_growth_pine_taiga = Biome('minecraft:old_growth_pine_taiga');

  /// _minecraft:old_growth_spruce_taiga_
  static const Biome old_growth_spruce_taiga = Biome('minecraft:old_growth_spruce_taiga');

  /// _minecraft:plains_
  static const Biome plains = Biome('minecraft:plains');

  /// _minecraft:river_
  static const Biome river = Biome('minecraft:river');

  /// _minecraft:savanna_
  static const Biome savanna = Biome('minecraft:savanna');

  /// _minecraft:savanna_plateau_
  static const Biome savanna_plateau = Biome('minecraft:savanna_plateau');

  /// _minecraft:small_end_islands_
  static const Biome small_end_islands = Biome('minecraft:small_end_islands');

  /// _minecraft:snowy_beach_
  static const Biome snowy_beach = Biome('minecraft:snowy_beach');

  /// _minecraft:snowy_plains_
  static const Biome snowy_plains = Biome('minecraft:snowy_plains');

  /// _minecraft:snowy_slopes_
  static const Biome snowy_slopes = Biome('minecraft:snowy_slopes');

  /// _minecraft:snowy_taiga_
  static const Biome snowy_taiga = Biome('minecraft:snowy_taiga');

  /// _minecraft:soul_sand_valley_
  static const Biome soul_sand_valley = Biome('minecraft:soul_sand_valley');

  /// _minecraft:sparse_jungle_
  static const Biome sparse_jungle = Biome('minecraft:sparse_jungle');

  /// _minecraft:stony_peaks_
  static const Biome stony_peaks = Biome('minecraft:stony_peaks');

  /// _minecraft:stony_shore_
  static const Biome stony_shore = Biome('minecraft:stony_shore');

  /// _minecraft:sunflower_plains_
  static const Biome sunflower_plains = Biome('minecraft:sunflower_plains');

  /// _minecraft:swamp_
  static const Biome swamp = Biome('minecraft:swamp');

  /// _minecraft:taiga_
  static const Biome taiga = Biome('minecraft:taiga');

  /// _minecraft:the_end_
  static const Biome the_end = Biome('minecraft:the_end');

  /// _minecraft:the_void_
  static const Biome the_void = Biome('minecraft:the_void');

  /// _minecraft:warm_ocean_
  static const Biome warm_ocean = Biome('minecraft:warm_ocean');

  /// _minecraft:warped_forest_
  static const Biome warped_forest = Biome('minecraft:warped_forest');

  /// _minecraft:windswept_forest_
  static const Biome windswept_forest = Biome('minecraft:windswept_forest');

  /// _minecraft:windswept_gravelly_hills_
  static const Biome windswept_gravelly_hills = Biome('minecraft:windswept_gravelly_hills');

  /// _minecraft:windswept_hills_
  static const Biome windswept_hills = Biome('minecraft:windswept_hills');

  /// _minecraft:windswept_savanna_
  static const Biome windswept_savanna = Biome('minecraft:windswept_savanna');

  /// _minecraft:wooded_badlands_
  static const Biome wooded_badlands = Biome('minecraft:wooded_badlands');

  //[[[end]]]

  /// A List of all Minecraft biomes
  static List<Biome> get all => const [
        /*[[[cog
    for b in blocks:
      cog.outl(f'{b},')
    ]]]*/
    badlands,
    bamboo_jungle,
    basalt_deltas,
    beach,
    birch_forest,
    cherry_grove,
    cold_ocean,
    crimson_forest,
    dark_forest,
    deep_cold_ocean,
    deep_dark,
    deep_frozen_ocean,
    deep_lukewarm_ocean,
    deep_ocean,
    desert,
    dripstone_caves,
    end_barrens,
    end_highlands,
    end_midlands,
    eroded_badlands,
    flower_forest,
    forest,
    frozen_ocean,
    frozen_peaks,
    frozen_river,
    grove,
    ice_spikes,
    jagged_peaks,
    jungle,
    lukewarm_ocean,
    lush_caves,
    mangrove_swamp,
    meadow,
    mushroom_fields,
    nether_wastes,
    ocean,
    old_growth_birch_forest,
    old_growth_pine_taiga,
    old_growth_spruce_taiga,
    plains,
    river,
    savanna,
    savanna_plateau,
    small_end_islands,
    snowy_beach,
    snowy_plains,
    snowy_slopes,
    snowy_taiga,
    soul_sand_valley,
    sparse_jungle,
    stony_peaks,
    stony_shore,
    sunflower_plains,
    swamp,
    taiga,
    the_end,
    the_void,
    warm_ocean,
    warped_forest,
    windswept_forest,
    windswept_gravelly_hills,
    windswept_hills,
    windswept_savanna,
    wooded_badlands,
        //[[[end]]]
      ];
}

class Biome {
  final String type;
  const Biome(this.type);

  @override
  bool operator ==(dynamic other) {
    if (other is Biome && other.type == type) {
      return true;
    }
    if (other is String && other == type) {
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return type;
  }

  @override
  int get hashCode => type.hashCode;
}
