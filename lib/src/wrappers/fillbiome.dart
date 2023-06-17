import 'package:objd/core.dart';

/// Fill acts similar to setblock, but fills a whole area instead.
class FillBiome extends RestActionAble {
  final Area area;
  final Biome biome;
  final Biome? replace;

  /// Fills an area with a specified biome similar to the Fill widget
  /// optionally you can only replace another biome
  /// ```dart
  /// FillBiome(
  /// 	Biomes.dark_forest,
  /// 	area: Area.fromRanges(x: 10, dx: 10, dz: 10),
  /// )
  /// ⇒ fillbiome 10 0 0 20 0 0 minecraft:dark_forest
  /// ```
  FillBiome(this.biome, {required this.area, this.replace});

  @override
  Widget generate(Context context) {
    if (context.version < 19.4) {
      throw "FillBiome requires at least version 19.4";
    }

    return CommandBuilder('fillbiome')
        .string(area.getCoordinates())
        .string(biome.toString())
        .string(replace?.toString(), prefix: 'replace ');
  }
}
