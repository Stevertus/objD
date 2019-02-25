import 'package:meta/meta.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/basic/rotation.dart';
import 'package:objd/build/build.dart';

class Teleport extends Widget {
  Entity entity;
  String to;
  /// Sets the location of an Entity to a new Location and Rotation(optional).
  Teleport(this.entity,{@required Location to, dynamic facing, Rotation rot}){
    this.to = to.toString();
    if(rot != null) this.to += " " + rot.toString();
    if(facing != null){
      if(facing is Entity || facing is Location) this.to += " facing " + facing.toString();
      else throw("Please set the facing part either to a entity or location");
    }
  }

  Teleport.entity(this.entity,{Entity to, dynamic facing}){
    this.to = to.toString();
    if(facing != null){
      if(facing is Entity || facing is Location) this.to += " facing " + facing.toString();
      else throw("Please set the facing part either to a entity or location");
    }
  }
  
  @override
  Widget generate(Context context){
    return new Command('teleport ' + entity.toString() + ' ' + to);
  }
}
