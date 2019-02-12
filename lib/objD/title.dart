import 'package:objd/basic/widget.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/build/build.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/text_components.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
class Title extends Widget {
  String type;
  String jsonText;
  String entity;
  Title(Entity selector, {@required List<TextComponent> show}){
    type = "title";
    entity = selector.toString();
    jsonText = json.encode(show.map((text) => text.toMap()).toList());
  }
  Title.subtitle(Entity selector, {@required List<TextComponent> show}){
    type = "subtitle";
    entity = selector.toString();
    jsonText = json.encode(show.map((text) => text.toMap()).toList());
  }
  Title.actionbar(Entity selector, {@required List<TextComponent> show}){
    type = "actionbar";
    entity = selector.toString();
    jsonText = json.encode(show.map((text) => text.toMap()).toList());
  }
  Title.clear(Entity selector){
    type = "clear";
    entity = selector.toString();
    jsonText = "";
  }
  Title.times(Entity selector,{int fadein = 20, int display = 60, int fadeout = 20}){
    type = "times";
    entity = selector.toString();
    jsonText = fadein.toString() + " " + display.toString() + " " + fadeout.toString();
  }
  Title.resetTimes(Entity selector){
    type = "reset";
    entity = selector.toString();
    jsonText = "";
  }
  @override
  Widget generate(Context context) {
    return Command("title " + entity + " "+type+" " + jsonText);
  }
}