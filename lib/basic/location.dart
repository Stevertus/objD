import 'package:meta/meta.dart';
import 'package:objd/objD/execute.dart';
import 'package:objd/basic/command.dart';

class Location {
  double x, y, z = 0;
  String _location;
  Location(this._location);
  Location.glob({@required this.x, @required this.y, @required this.z}) {
    _location = x.toString() + " " + y.toString() + " " + z.toString();
  }
  Location.rel({@required this.x, @required this.y, @required this.z}) {
    _location = "~" +
        (x == 0 ? "" : x.toString()) +
        " ~" +
        (y == 0 ? "" : y.toString()) +
        " ~" +
        (z == 0 ? "" : z.toString());
  }
  Location.local({@required this.x, @required this.y, @required this.z}) {
    _location = "^" +
        (x == 0 ? "" : x.toString()) +
        " ^" +
        (y == 0 ? "" : y.toString()) +
        " ^" +
        (z == 0 ? "" : z.toString());
  }
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
