import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  group('Context', () {
    final c = Context(version: 20.4, packId: 'test');
    final sArg = c.stringArgument('sArg');
    final iArg = c.intArgument('iArg');
    final double dArg = c.argument('dArg');
    final Score scoreArg = c.argument('scoreArg');
    final Entity eArg = c.argument('eArg');
    final Location lArg = c.argument('lArg');

    command(
      'String Argument',
      Say('Test $sArg'),
      '\$say Test \${sArg}',
      context: c,
    );

    command(
      'Entity & Int Argument',
      Data.merge(eArg, nbt: {
        "uuid": UUID(1, 2, 3, iArg),
      }),
      '\$data merge entity \${eArg} {uuid:[I;1,2,3,\${iArg}]}',
      context: c,
    );

    command(
      'Score Argument',
      scoreArg.add(5),
      '\$scoreboard players add \${scoreArg} 5',
      context: c,
    );

    command(
      'Location Argument',
      SetBlock(Blocks.stone, location: lArg, nbt: {
        'test': dArg,
      }),
      '\$setblock \${lArg} minecraft:stone{test:\${dArg}}',
      context: c,
    );
  });
}
