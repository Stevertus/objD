
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/score.dart';
import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';
import 'package:objd/wrappers/tellraw.dart';

class Log extends Widget {
  dynamic msg;
  Entity to;
  Color color;
  /// The log widgets displays a console logging in the players chat. That way you can quickly check execution times, score values and entities.
  Log(this.msg,{this.to,this.color}){
    if(to == null) to =Entity.All();
    if(color == null) color =Color.DarkAqua;
  }

  @override
  Widget generate(Context context) {

    TextComponent text =TextComponent("undefined");
    if(msg is num || msg is bool) text =TextComponent(msg.toString());
    if(msg is String) text =TextComponent(msg);
    if(msg is Score) text =TextComponent.score(msg);
    if(msg is Entity) text =TextComponent.selector(msg);
    return Tellraw(to,show: [
      TextComponent("Console > ",color:color),
      text
    ]);
  }
}