import 'package:meta/meta.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/types/location.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';

class AroundLocation extends RestActionAble {
  double rel;
  Widget Function(Location) build;
  bool top, bottom, left, right, front, back;

  /// Often times you need to check blocks or entities around one Location. AroundLocation utilizes this by using just one build method for all sides:
  /// **Example:**
  /// ```dart
  /// AroundLocation(
  /// 	1,
  /// 	build: (Location loc){
  /// 		return Setblock(Blocks.stone,location:loc)
  /// 	}
  /// )
  /// ⇒ setblock ~1 ~ ~ stone
  /// ⇒ setblock ~-1 ~ ~ stone
  /// ⇒ setblock ~ ~1 ~ stone
  /// ⇒ setblock ~ ~-1 ~ stone
  /// ⇒ setblock ~ ~ ~1 stone
  /// ⇒ setblock ~ ~ ~-1 stone
  /// ```
  AroundLocation(
    this.rel, {
    @required this.build,
    this.top = true,
    this.bottom = true,
    this.left = true,
    this.right = true,
    this.front = true,
    this.back = true,
  });

  @override
  Widget generate(Context context) {
    var builds = <Widget>[];
    if (left) builds.add(build(Location.rel(x: rel, y: 0, z: 0)));
    if (right) builds.add(build(Location.rel(x: -rel, y: 0, z: 0)));
    if (top) builds.add(build(Location.rel(x: 0, y: rel, z: 0)));
    if (bottom) builds.add(build(Location.rel(x: 0, y: -rel, z: 0)));
    if (front) builds.add(build(Location.rel(x: 0, y: 0, z: rel)));
    if (back) builds.add(build(Location.rel(x: 0, y: 0, z: -rel)));
    return For.of(builds);
  }
}
