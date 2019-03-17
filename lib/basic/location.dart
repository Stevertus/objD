import 'package:meta/meta.dart';
import 'package:objd/wrappers/execute.dart';
import 'package:objd/basic/command.dart';

/// This translates into Minecraft Coordinates.
class Location {
  double x, y, z = 0;
  String _location;
  /// takes in a string and translates it into coordinates
  Location(this._location){
    x = y = z = 0;
  }
  /// The Location class provides a wrapper for global(9 9 9) coordinates:
  Location.glob({this.x = 0, this.y = 0, this.z = 0}) {
    _location = x.toString() + " " + y.toString() + " " + z.toString();
  }
  /// The Location class provides a wrapper for relative(~ ~ ~) coordinates:
  Location.rel({this.x = 0, this.y = 0, this.z = 0}) {
    _location = "~" +
        (x == 0 ? "" : x.toString()) +
        " ~" +
        (y == 0 ? "" : y.toString()) +
        " ~" +
        (z == 0 ? "" : z.toString());
  }
  /// The Location class provides a wrapper for local(^ ^ ^) coordinates:
  Location.local({this.x = 0, this.y = 0, this.z = 0}) {
    _location = "^" +
        (x == 0 ? "" : x.toString()) +
        " ^" +
        (y == 0 ? "" : y.toString()) +
        " ^" +
        (z == 0 ? "" : z.toString());
  }
  /// Selects the current Position
  /// 
  /// This is a shortcut for `~ ~ ~`
  Location.here() {
    _location = "~ ~ ~";
    x = y = z = 0;
  }

/// This stores a result or success of a [command] in the nbt [path] of a location.
/// **Example:**
/// ```dart
///Location.here().storeResult(Command('say hello'),path: "Items[0].tag.command",useSuccess:true)

///⇒ execute store success block ~ ~ ~ Items[0].tag.command run say hello
///```
  Execute storeResult(Command command,
      {@required String path, bool useSuccess = false}) {
    assert(path == null && path.isEmpty);
    return new Execute(
      children: [command],
      encapsulate: false,
      args: [
        'store ' + (useSuccess ? 'success' : 'result') + ' block ' + _location + ' ' + path,
      ],
    );
  }

  @override
  String toString() {
    return _location.replaceAll('.0', '');
  }
}
