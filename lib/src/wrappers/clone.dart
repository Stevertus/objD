import 'package:objd/core.dart';

class Clone extends RestActionAble {
  final Area area;
  final Location to;
  final Dimension? from;
  final Dimension? into;
  late final String type;

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
  });

  Clone.filtered(
    this.area, {
    required this.to,
    Block block = Blocks.air,
    String? mode,
    this.from,
    this.into,
  }) {
    type = 'filtered $block';
    if (mode != null && mode.isNotEmpty) type += ' $mode';
  }
  Clone.masked(
    this.area, {
    required this.to,
    String? mode,
    this.from,
    this.into,
  }) {
    type = 'masked';
    if (mode != null && mode.isNotEmpty) type += ' $mode';
  }
  Clone.replace(
    this.area, {
    required this.to,
    String? mode,
    this.from,
    this.into,
  }) {
    type = 'replace';
    if (mode != null && mode.isNotEmpty) type += ' $mode';
  }

  @override
  Widget generate(Context context) {
    if (type.isNotEmpty) type = ' $type';
    return Command('clone ${area.getCoordinates()} $to$type');
  }
}
