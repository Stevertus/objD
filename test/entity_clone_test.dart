import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  group('Entity Clone', () {
    Entity newEntity = Entity(tags: ['test']);
    Entity clonedEntity = newEntity.copyWith(tags: ['testCloned']);

    command(
      'Original Entity',
      Execute.as(newEntity, children: [Say("hi")]),
      'execute as @e[tag=test] run say hi',
    );
    command(
      'Cloned Entity',
      Execute.as(clonedEntity, children: [Say("hi")]),
      'execute as @e[tag=test,tag=testCloned] run say hi',
    );
  });
}
