import 'package:objd/core.dart';
import 'package:objd/src/wrappers/execute.dart';

/// This translates into Minecraft Coordinates.
class Location {
  final double x, y, z;
  final String location;

  /// takes in a string and translates it into coordinates
  const Location(this.location)
      : x = 0,
        y = 0,
        z = 0;

  /// The Location class provides a wrapper for global(9 9 9) coordinates:
  const Location.glob({this.x = 0, this.y = 0, this.z = 0})
      : location = '$x $y $z';

  /// The Location class provides a wrapper for relative(~ ~ ~) coordinates:
  const Location.rel({this.x = 0, this.y = 0, this.z = 0})
      : location = '~$x ~$y ~$z';

  /// The Location class provides a wrapper for local(^ ^ ^) coordinates:
  const Location.local({this.x = 0, this.y = 0, this.z = 0})
      : location = '^$x ^$y ^$z';

  /// Selects the current Position
  ///
  /// This is a shortcut for `~ ~ ~`
  const Location.here()
      : location = '~ ~ ~',
        x = 0,
        y = 0,
        z = 0;

  /// Clones a Location:
  factory Location.clone(Location loc) => Location(loc.location);

  /// This stores a result or success of a Widget in the nbt [path] of a location.
  /// **Example:**
  /// ```dart
  ///Location.here().storeResult(Command('say hello'),path: 'Items[0].tag.command',useSuccess:true)

  ///⇒ execute store success block ~ ~ ~ Items[0].tag.command run say hello
  ///```
  Group storeResult(
    Widget w, {
    required String path,
    String datatype = 'double',
    double scale = 1,
    bool useSuccess = false,
  }) {
    assert(path.isEmpty);
    return Execute.internal_store_command(
      'block $location $path $datatype $scale',
      w,
      useSuccess,
    );
  }

  @override
  String toString() {
    return (location + ' ')
        .replaceAll('.0 ', ' ')
        .replaceAll('~0', '~')
        .replaceAll('^0', '^')
        .trim();
  }
}
