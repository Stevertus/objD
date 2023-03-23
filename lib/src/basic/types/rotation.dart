import 'package:objd/src/basic/types/entity.dart' show Range;

class Rotation {
  double x = 0, y = 0;
  String _rotation;

  /// The Rotation Widget is very similar to Location but takes in just two directions for an entities rotation:
  Rotation(this._rotation);
  Rotation.glob({this.x = 0, this.y = 0}) : _rotation = '$x $y';
  Rotation.rel({this.x = 0, this.y = 0})
      : _rotation =
            '~${x == 0 ? '' : x.toString()} ~${y == 0 ? '' : y.toString()}';
  Rotation.here()
      : _rotation = '~ ~',
        x = 0,
        y = 0;

  factory Rotation.north({double dx = 0, double y = 0}) =>
      Rotation.glob(x: 180 + dx, y: y);
  factory Rotation.south({double dx = 0, double y = 0}) =>
      Rotation.glob(x: 0 + dx, y: y);
  factory Rotation.east({double dx = 0, double y = 0}) =>
      Rotation.glob(x: -90 + dx, y: y);
  factory Rotation.west({double dx = 0, double y = 0}) =>
      Rotation.glob(x: 90 + dx, y: y);

  static Range get checkNorth => Range(135, -134);
  static Range get checkEast => Range(-135, -44);
  static Range get checkSouth => Range(-45, 45);
  static Range get checkWest => Range(45, 135);

  String getDirection() {
    var dir = x ~/ 90;
    switch (dir) {
      case 0:
        return 'south';
      case 1:
        return 'west';
      case 2:
        return 'north';
      case -1:
        return 'east';
    }
    return 'north';
  }

  @override
  String toString() {
    return _rotation.replaceAll('.0', '');
  }
}
