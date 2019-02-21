import 'package:objd/basic/command.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/block.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/build/build.dart';

class Fill extends Widget {
  Location from;
  Location to;
  Block block;
  String type = "";
  /// Fill acts similar to setblock, but fills a whole area instead.
  Fill(this.block,{@required this.from, @required this.to});
  Fill.destroy(this.block,{@required this.from, @required this.to}){
    type = "destroy";
  }
  Fill.hollow(this.block,{@required this.from, @required this.to}){
    type = "hollow";
  }
  Fill.outline(this.block,{@required this.from, @required this.to}){
    type = "outline";
  }
  Fill.keep(this.block,{@required this.from, @required this.to}){
    type = "keep";
  }
  Fill.replace(this.block,{@required this.from, @required this.to, Block replace}){
    if(replace != null) type = "replace " + replace.toString();
  }
  
  @override
  Widget generate(Context context){
    if(type.length > 0) type = " " + type;
    return new Command('fill ' + from.toString() + ' ' + to.toString() + ' ' + block.toString() + type);
  }
}
