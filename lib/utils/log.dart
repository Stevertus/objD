
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/score.dart';
import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';
import 'package:objd/wrappers/comment.dart';
import 'package:objd/wrappers/tellraw.dart';

class Log extends RestActionAble {
  dynamic msg;
  Entity to;
  Color color;
  String desc;
  /// The log widgets displays a console logging in the players chat. That way you can quickly check execution times, score values and entities.
  Log(this.msg,{this.to,this.desc,this.color = Color.DarkAqua}){
    if(to == null) to =Entity.All();
  }

  @override
  Widget generate(Context context) {

    if(context.prod) return Comment.Null();

    TextComponent text =TextComponent("undefined");
    if(msg is num || msg is bool) text =TextComponent(msg.toString());
    if(msg is String) text =TextComponent(msg as String);
    if(msg is Score) text =TextComponent.score(msg as Score);
    if(msg is Entity) text =TextComponent.selector(msg as Entity);
    return Tellraw(to,show: [
      TextComponent("Console > ",color:color),
      if(desc != null) TextComponent("$desc "),
      text
    ]);
  }
}