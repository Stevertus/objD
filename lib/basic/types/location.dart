import 'package:meta/meta.dart';
import 'package:objd/wrappers/execute.dart';
import 'package:objd/basic/command.dart';

/// This translates into Minecraft Coordinates.
class Location {
  double x, y, z = 0;
  String location;

  /// takes in a string and translates it into coordinates
  Location(this.location) {
    x = y = z = 0;
  }

  /// The Location class provides a wrapper for global(9 9 9) coordinates:
  Location.glob({this.x = 0, this.y = 0, this.z = 0}) {
    location = x.toString() + ' ' + y.toString() + ' ' + z.toString();
  }

  /// The Location class provides a wrapper for relative(~ ~ ~) coordinates:
  Location.rel({this.x = 0, this.y = 0, this.z = 0}) {
    location = '~' +
        (x == 0 ? '' : x.toString()) +
        ' ~' +
        (y == 0 ? '' : y.toString()) +
        ' ~' +
        (z == 0 ? '' : z.toString());
  }

  /// The Location class provides a wrapper for local(^ ^ ^) coordinates:
  Location.local({this.x = 0, this.y = 0, this.z = 0}) {
    location = '^' +
        (x == 0 ? '' : x.toString()) +
        ' ^' +
        (y == 0 ? '' : y.toString()) +
        ' ^' +
        (z == 0 ? '' : z.toString());
  }

  /// Selects the current Position
  ///
  /// This is a shortcut for `~ ~ ~`
  Location.here() {
    location = '~ ~ ~';
    x = y = z = 0;
  }

  /// Clones a Location:
  Location.clone(Location loc) {
    x = loc.x;
    y = loc.y;
    z = loc.z;
    location = loc.toString();
  }

  /// This stores a result or success of a [command] in the nbt [path] of a location.
  /// **Example:**
  /// ```dart
  ///Location.here().storeResult(Command('say hello'),path: 'Items[0].tag.command',useSuccess:true)

  ///⇒ execute store success block ~ ~ ~ Items[0].tag.command run say hello
  ///```
  Execute storeResult(
    Command command, {
    @required String path,
    String datatype = 'double',
    double scale = 1,
    bool useSuccess = false,
  }) {
    assert(path == null && path.isEmpty);
    return Execute(
      children: [command],
      encapsulate: false,
      args: [
        [
          'store ' +
              (useSuccess ? 'success' : 'result') +
              ' block ' +
              location +
              ' ' +
              path +
              ' ${datatype} ${scale}'
        ],
      ],
    );
  }

  @override
  String toString() {
    return (location + ' ').replaceAll('.0 ', ' ').trim();
  }
}
