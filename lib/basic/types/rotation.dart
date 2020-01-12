class Rotation {
  double x, y = 0;
  String _rotation;

  /// The Rotation Widget is very similar to Location but takes in just two directions for an entities rotation:
  Rotation(this._rotation);
  Rotation.glob({this.x = 0, this.y = 0}) {
    _rotation = x.toString() + ' ' + y.toString();
  }
  Rotation.rel({this.x = 0, this.y = 0}) {
    _rotation = '~' +
        (x == 0 ? '' : x.toString()) +
        ' ~' +
        (y == 0 ? '' : y.toString());
  }
  Rotation.here() {
    _rotation = '~ ~';
    x = y = 0;
  }

  static int n = 180;
  static int s = 0;
  static int e = -90;
  static int w = 90;

  Rotation.north({double dx = 0, this.y = 0}) {
    x = Rotation.n + dx;
  }
  Rotation.south({double dx = 0, this.y = 0}) {
    x = Rotation.s + dx;
  }
  Rotation.east({double dx = 0, this.y = 0}) {
    x = Rotation.e + dx;
  }
  Rotation.west({double dx = 0, this.y = 0}) {
    x = Rotation.w + dx;
  }

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
