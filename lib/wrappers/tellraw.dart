import 'package:objd/basic/gson.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/build/build.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/text_components.dart';

class Tellraw extends RestActionAble {
  String jsonText;
  String entity;
  /// The Tellraw class is very similar to the Title class, but shows its texts in the chat.
  Tellraw(Entity selector, {List<TextComponent> show}){
    entity = selector.toString();
    jsonText = gsonEncode(show.map((text) => text.toMap()).toList()).replaceAll("\\", "\u005C");;
  }
  @override
  Widget generate(Context context) {
    return Command("tellraw " + entity + " " + jsonText);
  }
}