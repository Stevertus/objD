import 'package:objd/core.dart';
import 'package:test/test.dart';

void main() {
  group('Block', () {
    test('all not empty', () {
      expect(Blocks.all.length, greaterThan(0));
    });
  });
  group('Item', () {
    test('all not empty', () {
      expect(Items.all.length, greaterThan(0));
    });
  });
  group('Entity', () {
    test('all not empty', () {
      expect(Entities.all.length, greaterThan(0));
    });
  });
  group('Particle', () {
    test('all not empty', () {
      expect(Particles.all.length, greaterThan(0));
    });
  });
  group('Biome', () {
    test('all not empty', () {
      expect(Biomes.all.length, greaterThan(0));
    });
  });
}
