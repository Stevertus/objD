import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  group('Clone', () {
    command(
      'simple',
      Clone(Area(), to: Location.here()),
      "clone 0 0 0 0 0 0 ~ ~ ~",
    );

    command(
      '.replace',
      Clone.replace(
        Area.rel(y1: -2, y2: 2),
        to: Location.here(),
      ),
      "clone ~ ~-2 ~ ~ ~2 ~ ~ ~ ~ replace",
    );

    command(
      '.replace Mode',
      Clone.replace(
        Area(),
        to: Location.glob(y: 200),
        mode: CloneMode.force,
        from: Dimension.the_end,
      ),
      "clone from minecraft:the_end 0 0 0 0 0 0 0 200 0 replace force",
    );

    command(
      '.filter Mode',
      Clone.filtered(
        Area(),
        to: Location.glob(y: 2),
        mode: CloneMode.move,
        block: Blocks.air,
        from: Dimension.the_nether,
        into: Dimension.overworld,
      ),
      "clone from minecraft:the_nether 0 0 0 0 0 0 to minecraft:overworld 0 2 0 filtered minecraft:air move",
    );
  });
}
