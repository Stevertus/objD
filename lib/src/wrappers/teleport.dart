import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';

class Teleport extends RestActionAble {
  Entity entity;
  late String to;

  /// Sets the location of an Entity to a new Location and Rotation(optional).
  Teleport(this.entity, {required Location to, dynamic facing, Rotation? rot}) {
    this.to = to.toString();
    if (rot != null) this.to += ' ' + rot.toString();
    _setFacing(facing);
  }

  Teleport.entity(this.entity, {required Entity to, dynamic facing}) {
    this.to = to.toString();
    _setFacing(facing);
  }
  void _setFacing(facing) {
    if (facing != null) {
      if (facing is Location) {
        to += ' facing ' + facing.toString();
      } else if (facing is Entity) {
        to += ' facing entity ' + facing.toString();
      } else {
        throw ('Please set the facing part either to a entity or location');
      }
    }
  }

  @override
  Widget generate(Context context) {
    return Command('tp ' + entity.toString() + ' ' + to);
  }
}
