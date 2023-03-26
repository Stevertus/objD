import 'package:objd/core.dart';
import 'package:objd/src/basic/command.dart';

import 'package:objd/src/basic/rest_action.dart';
import 'package:objd/src/basic/types/biomes.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/basic/types/area.dart';
import 'package:objd/src/build/build.dart';

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
