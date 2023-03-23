import 'package:objd/core.dart';
import 'package:test/test.dart';

void main() {
  group('FillBiome', () {
    test('simple', () {
      expect(
        getCommands(FillBiome(Biomes.plains, area: Area())),
        ["fillbiome 0 0 0 0 0 0 minecraft:plains"],
      );
    });
    test('replace', () {
      expect(
        getCommands(FillBiome(
          Biomes.bamboo_jungle,
          area: Area.rel(y1: 0, x1: 0, y2: 10, x2: 10),
          replace: Biomes.badlands,
        )),
        [
          "fillbiome ~ ~ ~ ~10 ~10 ~ minecraft:bamboo_jungle replace minecraft:badlands"
        ],
      );
    });
  });
}
