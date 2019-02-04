import 'package:meta/meta.dart';
class Location {
  String _location;
  Location(this._location);
  Location.glob({@required double x,@required double y,@required double z}){
    _location = x.toString() + " " + y.toString()+ " " + z.toString();
  }
  Location.rel({@required double x,@required double y,@required double z}){
    _location = "~" + (x == 0 ? "": x.toString()) + " ~" + (y == 0 ? "": y.toString() )+ " ~" + (z == 0 ? "" : z.toString());
  }
  Location.local({@required double x,@required double y,@required double z}){
    _location = "^" + (x == 0 ? "": x.toString()) + " ^" + (y == 0 ? "": y.toString() )+ " ^" + (z == 0 ? "" : z.toString());
  }
  Location.here(){
    _location = "~ ~ ~";
  }


  @override
  String toString() {
    return _location.replaceAll('.0', '');
  }
}