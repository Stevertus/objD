import 'package:meta/meta.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/types/location.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/types/block.dart';
import 'package:objd/basic/types/area.dart';
import 'package:objd/build/build.dart';

class Clone extends RestActionAble {
  Area area;
  Location to;
  String type = '';

  /// The clone command clones an Area to another Location with different modes.
  /// **Example:**
  /// ```dart
  /// Clone(
  /// 	Area(x1:0,y1:0,z1:0,x2:10,y2:10,z2:10),
  /// 	to: Location.here()
  /// )
  /// ⇒ clone 0 0 0 10 10 10 ~ ~ ~
  /// ```
  Clone(this.area, {@required this.to});

  Clone.filtered(this.area,
      {@required this.to, Block block = Blocks.air, String mode}) {
    type = 'filtered ' + block.toString();
    if (mode != null && mode.isNotEmpty) type += ' ' + mode;
  }
  Clone.masked(this.area, {@required this.to, String mode}) {
    type = 'masked';
    if (mode != null && mode.isNotEmpty) type += ' ' + mode;
  }
  Clone.replace(this.area, {@required this.to, String mode}) {
    type = 'replace';
    if (mode != null && mode.isNotEmpty) type += ' ' + mode;
  }

  @override
  Widget generate(Context context) {
    if (type.isNotEmpty) type = ' ' + type;
    return Command(
        'clone ' + area.getCoordinates() + ' ' + to.toString() + type);
  }
}
