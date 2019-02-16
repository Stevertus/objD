import 'package:objd/basic/widget.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/extend.dart';
import 'package:objd/build/build.dart';
import 'package:meta/meta.dart';

class Scoreboard extends Widget {
  String subcommand;
  String name;
  String type;
  Scoreboard(this.name, {this.type = "dummy", TextComponent display, addIntoLoad = true}) {
    subcommand = addIntoLoad ? "add": "addHere";
    if (display != null) type += " " + display.toJson();
  }
  Scoreboard.add(this.name, {this.type = "dummy", TextComponent display}) {
    subcommand = "addHere";
    if (display != null) type += " " + display.toJson();
  }
  Scoreboard.remove(this.name) {
    subcommand = "remove";
  }
  Scoreboard.setdisplay(this.name,{String display = "sidebar"}) {
    subcommand = "setdisplay";
    type = display;
  }
  // TODO: modify
  @override
  Widget generate(Context context) {
    switch (subcommand) {
      case "add":
        return Extend(
          context.loadFile,
          child: Command("scoreboard objectives add " + name + " " + type),
          first: true,
        );
      case "addHere": return Command("scoreboard objectives add " + name + " " + type);
      case "remove":
        return Command("scoreboard objectives remove " + name);
      case "setdisplay":
        return Command("scoreboard objectives setdisplay " + type + " " + name);
    }
    return Widget();
  }

  @override
  Map toMap() {
    return {'Scoreboard':{'name':name,'type':type}};
  }
}
