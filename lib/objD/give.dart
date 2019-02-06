import 'package:objd/basic/command.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/item.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/build/build.dart';

class Give extends Widget {
  Entity entity;
  Item item;
  Give(this.entity, {@required this.item}):assert(item != null);
  
  @override
  Widget generate(Context context){
    return new Command('give ' + entity.getString() + ' ' + item.getGiveNotation());
  }
}
