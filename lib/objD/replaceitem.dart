import 'package:objd/basic/command.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/item.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/build/build.dart';

class ReplaceItem extends Widget {
  Entity entity;
  String replaceType;
  String slot;
  Item item;
  ReplaceItem(this.entity, {@required this.item,@required this.slot}):assert(item != null){
    replaceType = "entity";
  }
  
  @override
  Widget generate(Context context){
    if(replaceType == "entity") return new Command('replaceitem entity ' + entity.toString() + ' ' + slot + " " + item.getGiveNotation());
  }
}
