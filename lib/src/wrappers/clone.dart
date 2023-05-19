
import 'package:objd/core.dart';

class Clone extends RestActionAble {
  final Area area;
  final Location to;
  final Dimension? from;
  final Dimension? into;
  final String type;
  final CloneMode? mode;

  /// The clone command clones an Area to another Location with different modes.
  /// **Example:**
  /// ```dart
  /// Clone(
  /// 	Area(x1:0,y1:0,z1:0,x2:10,y2:10,z2:10),
  /// 	to: Location.here()
  /// )
  /// ⇒ clone 0 0 0 10 10 10 ~ ~ ~
  /// ```
  Clone(
    this.area, {
    required this.to,
    this.from,
    this.into,
  })  : type = '',
        mode = null;

  Clone.filtered(
    this.area, {
    required this.to,
    Block block = Blocks.air,
    this.mode,
    this.from,
    this.into,
  }) : type = 'filtered $block';

  Clone.masked(
    this.area, {
    required this.to,
    this.mode,
    this.from,
    this.into,
  }) : type = 'masked';

  Clone.replace(
    this.area, {
    required this.to,
    this.mode,
    this.from,
    this.into,
  }) : type = 'replace';

  @override
  Widget generate(Context context) {
    return CommandBuilder('clone')
        .string(from?.name, prefix: 'from ')
        .string(area.getCoordinates())
        .string(into?.name, prefix: 'to ')
        .location(to)
        .string(type)
        .string(mode?.name);
  }
}

enum CloneMode { force, move, normal }
