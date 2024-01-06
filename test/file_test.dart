import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  group('File', () {
    command(
      'simple',
      File('name'),
      "function test:name",
    );
    command(
      'execute with map arguments',
      File.execute('name', arguments: {'a': 1, 'b': Byte(2)}),
      "function test:name {a:1,b:2b}",
    );
    command(
      'execute with entity arguments',
      File.execute('entity', arguments: Entity.All(distance: Range.to(5))),
      "function test:entity with entity @a[distance=..5]",
    );
    command(
      'execute with storage arguments',
      File.execute('entity', arguments: Storage.get('test', key: 'new')),
      "function test:entity with storage test:test new",
    );
  });
  command(
    'Schedule',
    Schedule('function', ticks: 2.minutes),
    "schedule function test:function 120s",
  );
}
