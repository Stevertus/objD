import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  group('FillBiome', () {
    command(
      'simple',
      FillBiome(Biomes.plains, area: Area()),
      "fillbiome 0 0 0 0 0 0 minecraft:plains",
    );

    command(
      'replace',
      FillBiome(
        Biomes.bamboo_jungle,
        area: Area.rel(y1: 0, x1: 0, y2: 10, x2: 10),
        replace: Biomes.badlands,
      ),
      "fillbiome ~ ~ ~ ~10 ~10 ~ minecraft:bamboo_jungle replace minecraft:badlands",
    );
  });
}
