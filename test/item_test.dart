import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  group('Item', () {
    builder('UUID in getNbt', () {
      final item = Item(
        Items.crafting_table,
        nbt: {
          'UUID': [11, 22, 33, 44]
        },
      );
      expect(
        item.getNbt(),
        '{id:"minecraft:crafting_table",tag:{UUID:[I;11,22,33,44]}}',
      );
    });

    builder('UUID in getGiveNotation', () {
      final item = Item(
        Items.furnace,
        count: 3,
        nbt: {
          'UUID': [11, 22, 33, 44]
        },
      );
      expect(
        item.getGiveNotation(),
        'minecraft:furnace{UUID:[I;11,22,33,44]} 3',
      );
    });
  });
}
