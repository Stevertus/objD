import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  group('If', () {
    command(
      'dimension',
      If(Dimension.the_end, then: [Return(1)]),
      "execute if dimension minecraft:the_end run return 1",
    );

    command(
      'dimension condition',
      If(Condition.dimension(Dimension.overworld), then: [Return(1)]),
      "execute if dimension minecraft:overworld run return 1",
    );

    command(
      'loaded',
      If(Condition.loaded(Location.here()), then: [Return(1)]),
      "execute if loaded ~ ~ ~ run return 1",
    );

    command(
      'biome',
      If(Biomes.beach, then: [Say('test')]),
      "execute if biome minecraft:beach run say test",
    );

    command(
      'biome condition custom',
      If(Condition.biome(Biome('custom:test')), then: [Return(10)]),
      "execute if biome custom:test run return 10",
    );
    commands(
      'command grouping',
      If(Entity.All(), then: [Say('yes'), Return(10)]),
      [
        "execute if entity @a run say yes",
        "execute if entity @a run return 10"
      ],
    );
  });
  group("Execute", () {
    command(
      'summon',
      Execute.summon(Entities.enderman, children: [Tag('new').add()]),
      "execute summon minecraft:enderman run tag @s add new",
    );

    command(
      'over',
      Execute.positioned(Heightmap.ocean_floor,
          children: [SetBlock(Blocks.stone)]),
      "execute positioned over ocean_floor run setblock ~ ~ ~ minecraft:stone",
    );
    command(
      'on',
      Execute.on(Relation.owner, children: [Say('fel')]),
      "execute on owner run say fel",
    );
    command(
      'complex over summoned on',
      Execute(
        location: Heightmap.motion_blocking,
        children: [Say('test')],
      ).summon(Entities.sheep).on(Relation.attacker),
      "execute positioned over motion_blocking summon minecraft:sheep on attacker run say test",
    );
  });
}
