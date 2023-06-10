import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  group('Summon', () {
    command(
      'Interaction simple',
      Interaction(Location.here(), response: true),
      "summon minecraft:interaction ~ ~ ~ {response:1b}",
    );
    command(
      'Interaction complex',
      Interaction(Location.here(),
          width: 3, height: 5, nbt: {'test': 1}, age: 4),
      "summon minecraft:interaction ~ ~ ~ {test:1,Age:4,height:5.0d,width:3.0d}",
    );
  });
}
