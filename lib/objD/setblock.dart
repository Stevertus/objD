import 'package:objd/basic/command.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/block.dart';
import 'package:objd/build/build.dart';

class SetBlock extends Widget {
  Location location;
  Block block;
  SetBlock(this.block,{@required this.location});
  
  @override
  Widget generate(Context context){
    return new Command('setblock ' + location.toString() + ' ' + block.toString());
  }
}
