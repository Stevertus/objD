
class Rotation {
  double x,y = 0;
  String _rotation;
  /// The Rotation Widget is very similar to Location but takes in just two directions for an entities rotation:
  Rotation(this._rotation);
  Rotation.glob({this.x = 0,this.y = 0}){
    _rotation = x.toString() + " " + y.toString();
  }
  Rotation.rel({this.x = 0,this.y = 0}){
    _rotation = "~" + (x == 0 ? "": x.toString()) + " ~" + (y == 0 ? "": y.toString() );
  }
  Rotation.here(){
    _rotation = "~ ~";
    x = y = 0;
  }
    @override
  String toString() {
    return _rotation.replaceAll('.0', '');
  }
}