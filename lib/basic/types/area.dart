import 'package:objd/basic/types/location.dart';

class Area {
  double dx, dy, dz = -1;
  Location loc1;
  Location loc2;

  Area({double x1, double y1, double z1, double x2, double y2, double z2}) {
    loc1 = Location.glob(x: _min(x1, x2), y: _min(y1, y2), z: _min(z1, z2));
    loc2 = Location.glob(x: _max(x1, x2), y: _max(y1, y2), z: _max(z1, z2));
    _setDifferences();
  }

  /// Use Area.rel if you want to select the area relative to an unknown position.
  Area.rel({double x1, double y1, double z1, double x2, double y2, double z2}) {
    loc1 = Location.rel(x: _min(x1, x2), y: _min(y1, y2), z: _min(z1, z2));
    loc2 = Location.rel(x: _max(x1, x2), y: _max(y1, y2), z: _max(z1, z2));
    _setDifferences();
  }

  /// fromRanges is a constructor to construct an Area within a defined Range of a Location(Works like fill or clone).
  Area.fromRanges({
    double x,
    double y,
    double z,
    double dx,
    double dy,
    double dz,
    Map<String, double> ranges,
  }) {
    x = x ?? ranges['x'];
    y = y ?? ranges['y'];
    z = z ?? ranges['z'];

    dx = dx ?? ranges['dx'];
    dy = dy ?? ranges['dy'];
    dz = dz ?? ranges['dz'];

    final x2 = x != null && dx != null ? x + dx : null;
    final y2 = y != null && dy != null ? y + dy : null;
    final z2 = z != null && dz != null ? z + dz : null;

    loc1 = Location.glob(x: _min(x, x2), y: _min(y, y2), z: _min(z, z2));
    loc2 = Location.glob(x: _max(x, x2), y: _max(y, y2), z: _max(z, z2));
    _setDifferences();
  }
  Area.fromLocations(this.loc1, this.loc2) {
    _setDifferences();
  }

  void _setDifferences() {
    if (loc1.x != null && loc2.x != null) dx = _abs(loc2.x - loc1.x) ?? -1;
    if (loc1.y != null && loc2.y != null) dy = _abs(loc2.y - loc1.y) ?? -1;
    if (loc1.z != null && loc2.z != null) dz = _abs(loc2.z - loc1.z) ?? -1;
  }

  Map getRanges() {
    var ret = <String, double>{};
    if (loc1.x != null) ret['x'] = loc1.x;
    if (loc1.y != null) ret['y'] = loc1.y;
    if (loc1.z != null) ret['z'] = loc1.z;

    if (dx != null && dx >= 0) ret['dx'] = dx;
    if (dy != null && dy >= 0) ret['dy'] = dy;
    if (dz != null && dz >= 0) ret['dz'] = dz;
    return ret;
  }

  String getCoordinates() {
    return loc1.toString() + ' ' + loc2.toString();
  }
}

double _abs(double val) {
  if (val != null && val.isNegative) return 0 - val;
  return val;
}

double _min(double one, double two) {
  if (one == null) return two;
  if (two == null) return one;
  if (one > two) return two;
  return one;
}

double _max(double one, double two) {
  if (one == null) return two;
  if (two == null) return one;
  if (one < two) return two;
  return one;
}
