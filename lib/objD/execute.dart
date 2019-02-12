import 'package:objd/basic/group.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/build/build.dart';

class Execute extends Widget {

  Widget build; 
  Execute.as(Entity entity,{@required List<Widget> children, bool encapsulate = true}){
    build = Group(children: children,prefix: 'execute as ' + entity.toString() + ' run',groupMin: encapsulate ? 3 : -1,filename: 'as');
  }
  Execute.asat(Entity entity,{@required List children, bool encapsulate = true}){
    build = Group(children: children,prefix: 'execute as ' + entity.toString() + ' at @s run',groupMin: encapsulate ? 3 : -1,filename: 'asat');
  }
  //Todo: Position, Scores, Rotation
  Execute({@required List<Widget> children, Entity as, Entity at, bool encapsulate = true}){
    String prefix = "execute";
    if(as != null) prefix += ' as ' + as.toString();
    if(at != null) prefix += ' at ' + at.toString();
    build = Group(children: children,prefix: prefix + ' run',groupMin: encapsulate ? 3 : -1,filename: 'execute');
  }
  @override
  Widget generate(Context context){
    return build;
  }
}
