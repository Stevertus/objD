import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  group('Data', () {
    command(
      'simple get',
      Data.get(Location.here(), path: "test"),
      "data get block ~ ~ ~ test",
    );

    command(
      'simple merge',
      Data.merge(
        Entity.Self(),
        nbt: {
          'test': 1,
        },
      ),
      "data merge entity @s {test:1}",
    );

    command(
      'modify value',
      Data.modify(
        DataStorage('minecraft:test', autoNamespace: false),
        path: 'new',
        modify: DataModify.set(
          [1, 2, 3],
        ),
      ),
      "data modify storage minecraft:test new set value [1,2,3]",
    );

    command(
      'modify string append',
      Data.modify(
        Entity(),
        path: 'path',
        modify: DataModify.appendString(
          Location.glob(),
          fromPath: 'Items[0].id',
          start: 6,
        ),
      ),
      "data modify entity @e path append string block 0 0 0 Items[0].id 6",
    );

    command(
      'modify insert',
      Data.modify(
        Entity.Self(),
        path: 'Inventory',
        modify: DataModify.insert(
          Entity.Self(),
          fromPath: 'Inventory[0]',
          index: 6,
        ),
      ),
      "data modify entity @s Inventory insert 6 from entity @s Inventory[0]",
    );
  });
}
