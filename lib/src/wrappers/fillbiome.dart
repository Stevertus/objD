import 'package:objd/core.dart';


/// Fill acts similar to setblock, but fills a whole area instead.
class FillBiome extends RestActionAble {
  final Area area;
  final Biome biome;
  final Biome? replace;

  /// Fill acts similar to setblock, but fills a whole area instead.
  FillBiome(this.biome, {required this.area, this.replace});

  @override
  Widget generate(Context context) {
    return CommandBuilder('fillbiome')
        .string(area.getCoordinates())
        .string(biome.toString())
        .string(replace?.toString(), prefix: 'replace ');
  }
}
