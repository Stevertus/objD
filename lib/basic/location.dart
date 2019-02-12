import 'package:meta/meta.dart';
class Location {
  double x,y,z = 0;
  String _location;
  Location(this._location);
  Location.glob({@required this.x,@required this.y,@required this.z}){
    _location = x.toString() + " " + y.toString()+ " " + z.toString();
  }
  Location.rel({@required this.x,@required this.y,@required this.z}){
    _location = "~" + (x == 0 ? "": x.toString()) + " ~" + (y == 0 ? "": y.toString() )+ " ~" + (z == 0 ? "" : z.toString());
  }
  Location.local({@required this.x,@required this.y,@required this.z}){
    _location = "^" + (x == 0 ? "": x.toString()) + " ^" + (y == 0 ? "": y.toString() )+ " ^" + (z == 0 ? "" : z.toString());
  }
  Location.here(){
    _location = "~ ~ ~";
    x = y = z = 0;
  }


  @override
  String toString() {
    return _location.replaceAll('.0', '');
  }
}