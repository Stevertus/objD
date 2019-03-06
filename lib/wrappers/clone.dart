import 'package:meta/meta.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/block.dart';
import 'package:objd/basic/area.dart';
import 'package:objd/build/build.dart';

class Clone extends Widget {
  Area area;
  Location to;
  String type = "";
  
  Clone(this.area,{this.to});

  Clone.filtered(this.area,{@required this.to,Block block = Block.air,String mode}){
    type = "filtered " + block.toString();
    if(mode != null &&  mode.isNotEmpty) type += " " + mode;
  }
  Clone.masked(this.area,{@required this.to,String mode}){
    type = "masked";
    if(mode != null &&  mode.isNotEmpty) type += " " + mode;
  }
  Clone.replace(this.area,{@required this.to,String mode}){
    type = "replace";
    if(mode != null && mode.isNotEmpty) type += " " + mode;
  }
  
  @override
  Widget generate(Context context){
    if(type.length > 0) type = " " + type;
    return new Command('clone ' + area.getCoordinates() + ' ' + to.toString() + type);
  }
}
