import 'package:meta/meta.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/entity.dart';
import 'dart:convert';

import 'package:objd/basic/item.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/basic/score.dart';

class TextComponent {
  Map<String,dynamic> value;
  Color color;
  bool bold, underlined, strikethrough, obfuscated, italic;
  TextClickEvent clickEvent;
  TextHoverEvent hoverEvent;
  String insertion;
  // ToDo: new 1.14 types!!!
  // default text display
  /// In Minecraft text in the chat or as title is defined with JSON-data. objD makes the JSON part of it easier by utilizing the TextComponent Class:
  TextComponent(String text, {this.color,this.bold, this.underlined,this.italic, this.strikethrough,this.obfuscated,this.clickEvent,this.hoverEvent,this.insertion}){
    value = {"text":text};
  }
  // translates from a key in the translations
  TextComponent.translate(String key, {List<String> conversionFlags,this.color,this.bold,this.italic, this.underlined, this.strikethrough,this.obfuscated,this.clickEvent,this.hoverEvent,this.insertion}){
    value = {"translate":key};
    if(conversionFlags != null && conversionFlags.length > 0) value['with'] = conversionFlags;
  }
  TextComponent.score(Score score, { this.color,this.bold,this.italic, this.underlined, this.strikethrough,this.obfuscated,this.clickEvent,this.hoverEvent,this.insertion}){
    value = {"score":{"name":score.entity.toString(),"objective":score.score}};
  }
  TextComponent.entityNbt(Entity entity, { @required String path,bool interpret,this.color,this.bold, this.underlined,this.italic, this.strikethrough,this.obfuscated,this.clickEvent,this.hoverEvent,this.insertion}){
    value = {"nbt":path,"entity":entity.toString()};
    if(interpret != null) value["interpret"] = interpret;
  }
  TextComponent.blockNbt(Location location, { @required String path,bool interpret,this.color,this.bold, this.underlined,this.italic, this.strikethrough,this.obfuscated,this.clickEvent,this.hoverEvent,this.insertion}){
    value = {"nbt":path,"block":location.toString()};
    if(interpret != null) value["interpret"] = interpret;
  }
  // shows entity
  TextComponent.selector(Entity entity, {this.color,this.bold, this.underlined,this.italic, this.strikethrough,this.obfuscated,this.clickEvent,this.hoverEvent,this.insertion}){
    value = {"selector":entity.toString()};
  }

  Map toMap(){
    var ret = {};
    ret.addAll(value);
    if(color != null) ret["color"] = color.toString();
    if(bold != null) ret["bold"] = bold;
    if(italic != null) ret["italic"] = italic;
    if(underlined != null) ret["underlined"] = underlined;
    if(strikethrough != null) ret["strikethrough"] = strikethrough;
    if(obfuscated != null) ret["obfuscated"] = obfuscated;
    if(clickEvent != null) ret["clickEvent"] = clickEvent.toMap();
    if(hoverEvent != null) ret["hoverEvent"] = hoverEvent.toMap();
    if(insertion != null) ret["insertion"] = insertion;
    return ret;
  }
  String toJson(){
    return json.encode(this.toMap());
  }
}
/// Fires on left click, Part of TextComponent.
class TextClickEvent {
  String action;
  String value;
  /// Fires on left click, Part of TextComponent.
  TextClickEvent({@required this.action, @required this.value}): assert(value != null),assert(action != null);
  /// Opens the specified web url
  TextClickEvent.open_url (String url){
    action = "open_url";
    value = url;
  }
  /// runs given command
  TextClickEvent.run_command (Command command){
    action = "run_command";
    value = command.toMap()["command"] ?? "";
  }
  /// copies command in chat
  TextClickEvent.suggest (String text){
    action = "suggest_command";
    value = text;
  }
  /// changes book page
  TextClickEvent.change_page (int to){
    action = "change_page";
    value = to.toString();
  }

  Map<String,String> toMap(){
    return {"action":action,"value":value};
  }
  
}
/// Fires on mouse over, Part of TextComponent.
class TextHoverEvent {
  String action;
  dynamic value;
  /// Fires on mouse over, Part of TextComponent.
  TextHoverEvent({@required this.action, @required this.value}): assert(value != null),assert(action != null);

  /// Accepts a new List of TextComponents to display
  TextHoverEvent.text(List<TextComponent> texts){
    action = "show_text";
    // ToDo: catch if score, selector or event listener
    value = texts.map((item) => item.toMap());
  }
  /// shows an achievement
  TextHoverEvent.achievement(String name){
    action = "show_achievement";
    value = name;
  }
  // displays item 
  // Todo: add item model
  TextHoverEvent.item(Item item){
    action = "show_item";
    value = item.toString();
  }
  // shows a dummy entity presentation in chat
  TextHoverEvent.entity(String name, String type, String id){
    action = "show_entity";
    value = json.encode({"name":name,"type":type,"id":id});
  }

  Map<String,dynamic> toMap(){
    return {"action":action,"value":value};
  }
  
}


/// Lists all availavle colors
/// 
/// See all available colors: https://minecraft.gamepedia.com/Formatting_codes#Color_codes
class Color {
  String color;
  Color(this.color);

  static Color White = Color('white');
  static Color Black = Color('black');
  static Color DarkBlue = Color('dark_blue');
  static Color DarkGreen = Color('dark_green');
  static Color DarkAqua = Color('dark_aqua');
  static Color DarkRed = Color('dark_red');
  static Color DarkPurple = Color('dark_purple');
  static Color Gold = Color('gold');
  static Color Gray = Color('gray');
  static Color DarkGray = Color('dark_gray');
  static Color Blue = Color('blue');
  static Color Green = Color('green');
  static Color Aqua = Color('aqua');
  static Color Red = Color('red');
  static Color LightPurple = Color('light_purple');
  static Color Yellow = Color('yellow');

  @override
  String toString() {
    return color;
  }
}