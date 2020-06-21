import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/score.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/extend.dart';
import 'package:objd/build/build.dart';
import 'package:objd/wrappers/comment.dart';

class Scoreboard extends RestActionAble {
  /// Often you find yourself giving all scoreboards a prefix especially for your project. This can get very repetitive and annoying, so objD has this prefix built in.

  static String prefix;

  String subcommand;
  String name;
  String type;

  /// A scoreboard objective holds values, kind a like a Variable inside Minecraft.
  ///
  /// The Scoreboard class just handles adding or removing objectives. The value assignment is handled by the Score class.
  ///
  /// objD automatically keeps a list of all scoreboards and inserts them into the given load file, ignoring doubled names.
  Scoreboard(
    this.name, {
    this.type = 'dummy',
    TextComponent display,
    bool addIntoLoad = true,
  }) {
    subcommand = addIntoLoad ? 'add' : 'addHere';
    if (display != null) type += ' ' + display.toJson();
    prefixName();
  }

  /// The `Scoreboard.click` constructor adds a carrot on a stick click event objective
  Scoreboard.click(
    this.name, {
    TextComponent display,
    bool addIntoLoad = true,
  }) {
    type = 'minecraft.used:minecraft.carrot_on_a_stick';
    subcommand = addIntoLoad ? 'add' : 'addHere';
    if (display != null) type += ' ' + display.toJson();
    prefixName();
  }

  /// The `Scoreboard.trigger` constructor adds a trigger objective
  Scoreboard.trigger(
    this.name, {
    TextComponent display,
    bool addIntoLoad = true,
  }) {
    type = 'trigger';
    subcommand = addIntoLoad ? 'add' : 'addHere';
    if (display != null) type += ' ' + display.toJson();
    prefixName();
  }

  /// The `Scoreboard.add` constructor does exactly the same as Scoreboard but puts the result without checking in the current file.
  Scoreboard.add(this.name, {this.type = 'dummy', TextComponent display}) {
    subcommand = 'addHere';
    if (display != null) type += ' ' + display.toJson();
    prefixName();
  }

  /// `Scoreboard.remove` removes an objective by its name again.
  Scoreboard.remove(this.name) {
    subcommand = 'remove';
    prefixName();
  }

  /// With `Scoreboard.setdisplay` you can display the values:
  ///
  /// |Scoreboard.setdisplay|  |
  /// |--|--|
  /// |String|name of the objective(required)|
  /// |display|String for display location (default = sidebar)|

  Scoreboard.setdisplay(this.name, {String display = 'sidebar'}) {
    subcommand = 'setdisplay';
    type = display;
    prefixName();
  }
  // TODO: modify

  void prefixName() {
    if (prefix != null && !name.contains(prefix)) name = prefix + name;
  }

  @override
  Widget generate(Context context) {
    switch (subcommand) {
      case 'add':
        return Extend(
          context.loadFile ?? 'load',
          child: Command('scoreboard objectives add ' + name + ' ' + type),
          first: true,
        );
      case 'addHere':
        return Command('scoreboard objectives add ' + name + ' ' + type);
      case 'remove':
        return Command('scoreboard objectives remove ' + name);
      case 'setdisplay':
        return Command('scoreboard objectives setdisplay ' + type + ' ' + name);
    }
    return Comment.Null();
  }

  Score operator [](dynamic target) {
    if (target is Entity) return Score(target, name);
    if (target is String) return Score(Entity.PlayerName(target), name);
    throw ('The operator [] just accepts Entity or String!');
  }

  @override
  Map toMap() {
    return {
      'Scoreboard': {'name': name, 'type': type}
    };
  }
}
