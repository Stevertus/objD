import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/build/build.dart';

class Tag extends Widget {
  bool value;
  Entity entity;
  String tag;
  
  Tag(this.tag, {@required this.entity,this.value = true}){
    if(this.entity == null) this.entity = Entity.Selected();
  }
  setValue(bool status) => Tag(tag,entity: entity,value: status);
  add() => Tag(tag,entity: entity,value: true);
  remove() => Tag(tag,entity: entity,value: false);

  String getEntity(){
    var args = new Map.from(entity.arguments);
    if(args['tag'] == null) args['tag'] = [];
    args['tag'].add(tag);
    return entity.toString(args);
  }
  Command getCommand(){
     return value ? Command('tag ' + entity.toString() + " add " + tag) :Command('tag ' + entity.toString() + " remove " + tag);
  }

  @override
  generate(Context context) {
    return getCommand();
  }
}