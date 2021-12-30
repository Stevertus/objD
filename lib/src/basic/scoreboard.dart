import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/rest_action.dart';
import 'package:objd/src/basic/score.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/basic/command.dart';
import 'package:objd/src/basic/text_components.dart';
import 'package:objd/src/basic/extend.dart';
import 'package:objd/src/build/build.dart';
import 'package:objd/src/wrappers/comment.dart';

class Scoreboard extends RestActionAble {
  /// Often you find yourself giving all scoreboards a prefix especially for your project. This can get very repetitive and annoying, so objD has this prefix built in.

  static String? prefix;

  late String subcommand;
  String name;
  late String type;
  bool? useHearts;

  /// A scoreboard objective holds values, kind a like a Variable inside Minecraft.
  ///
  /// The Scoreboard class just handles adding or removing objectives. The value assignment is handled by the Score class.
  ///
  /// objD automatically keeps a list of all scoreboards and inserts them into the given load file, ignoring doubled names.
  Scoreboard(
    this.name, {
    this.type = 'dummy',
    TextComponent? display,
    bool addIntoLoad = true,
  }) {
    subcommand = addIntoLoad ? 'add' : 'addHere';
    if (display != null) type += ' ' + display.toJson()!;
    prefixName();
  }

  /// The `Scoreboard.click` constructor adds a carrot on a stick click event objective
  Scoreboard.click(
    this.name, {
    TextComponent? display,
    bool addIntoLoad = true,
  }) {
    type = 'minecraft.used:minecraft.carrot_on_a_stick';
    subcommand = addIntoLoad ? 'add' : 'addHere';
    if (display != null) type += ' ' + display.toJson()!;
    prefixName();
  }

  /// The `Scoreboard.click` constructor adds a carrot on a stick click event objective
  Scoreboard.villager(
    this.name, {
    TextComponent? display,
    bool addIntoLoad = true,
  }) {
    type = 'minecraft.custom:minecraft.talked_to_villager';
    subcommand = addIntoLoad ? 'add' : 'addHere';
    if (display != null) type += ' ' + display.toJson()!;
    prefixName();
  }

  /// The `Scoreboard.trigger` constructor adds a trigger objective
  Scoreboard.trigger(
    this.name, {
    TextComponent? display,
    bool addIntoLoad = true,
  }) {
    type = 'trigger';
    subcommand = addIntoLoad ? 'add' : 'addHere';
    if (display != null) type += ' ' + display.toJson()!;
    prefixName();
  }

  /// The `Scoreboard.add` constructor does exactly the same as Scoreboard but puts the result without checking in the current file.
  Scoreboard.add(this.name, {this.type = 'dummy', TextComponent? display}) {
    subcommand = 'addHere';
    if (display != null) type += ' ' + display.toJson()!;
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
  Scoreboard.modify(
    this.name, {
    this.useHearts = false,
  }) : subcommand = 'modify';

  void prefixName() {
    if (prefix != null && !name.contains(prefix!)) name = prefix! + name;
  }

  @override
  Widget generate(Context context) {
    if (context.version < 18) {
      assert(
        name.length <= 16,
        'A scoreboard can not be longer than 16 characters',
      );
    }
    switch (subcommand) {
      case 'add':
        return Extend(
          context.loadFile ?? 'load',
          child: Command('scoreboard objectives add $name $type'),
          first: true,
        );
      case 'addHere':
        return Command('scoreboard objectives add $name $type');
      case 'remove':
        return Command('scoreboard objectives remove $name');
      case 'modify':
        return Command(
          'scoreboard objectives modify $name rendertype ' +
              (useHearts! ? 'hearts' : 'integer'),
        );
      case 'setdisplay':
        return Command('scoreboard objectives setdisplay $type $name');
    }
    return Comment.Null();
  }

  Score operator [](dynamic target) {
    if (target is Entity) return Score(target, name, type: type);
    if (target is String) {
      return Score(Entity.PlayerName(target), name, type: type);
    }
    throw ('The operator [] just accepts Entity or String!');
  }

  /// Scoreboard.self is a shortcut for Scoreboard[Entity.Self()]
  Score get self => Score(Entity.Self(), name);

  /// Scoreboard.all is a shortcut for Scoreboard[Entity.All()]
  Score get all => Score(Entity.All(), name);

  /// Scoreboard.player is a shortcut for Scoreboard[Entity.Player()]
  Score get player => Score(Entity.Player(), name);

  @override
  Map toMap() {
    return {
      'Scoreboard': {'name': name, 'type': type}
    };
  }
}
