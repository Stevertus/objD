import 'package:objd/basic/command.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/context.dart';

class Team extends RestActionAble {
  String name;
  Entity entity;
  Map<String, dynamic> modifiers = {};
  _TeamAction _action;

  Team(this.name) {
    _action = _TeamAction.add;
  }
  Team.add(
    this.name, {
    TextComponent display,
    Color color,
    ModifyTeam nametag,
    ModifyTeam collision,
    ModifyTeam deathMessage,
    bool friendlyFire,
    String prefix,
    String suffix,
    bool seeInvisible,
  }) {
    _action = _TeamAction.add;
    _setModifiers(display, color, nametag, collision, deathMessage,
        friendlyFire, prefix, suffix, seeInvisible);
  }

  Team.empty(this.name) {
    _action = _TeamAction.empty;
  }
  Team.join(this.name, this.entity) {
    _action = _TeamAction.join;
  }
  Team.leave(this.entity) {
    _action = _TeamAction.leave;
  }
  Team.modify(
    this.name, {
    TextComponent display,
    Color color,
    ModifyTeam nametag,
    ModifyTeam collision,
    ModifyTeam deathMessage,
    bool friendlyFire,
    String prefix,
    String suffix,
    bool seeInvisible,
  }) {
    _action = _TeamAction.modify;
    _setModifiers(display, color, nametag, collision, deathMessage,
        friendlyFire, prefix, suffix, seeInvisible);
  }
  void _setModifiers(
    TextComponent display,
    Color color,
    ModifyTeam nametag,
    ModifyTeam collision,
    ModifyTeam deathMessage,
    bool friendlyFire,
    String prefix,
    String suffix,
    bool seeInvisible,
  ) {
    if (display != null) modifiers['displayName'] = display.toJson();
    if (color != null) modifiers['color'] = color.toString();
    if (deathMessage != null) {
      modifiers['deathMessageVisibility'] = _genEnum(deathMessage);
    }
    if (friendlyFire != null) modifiers['friendlyFire'] = friendlyFire;
    if (nametag != null) modifiers['nametagVisibility'] = _genEnum(nametag);
    if (collision != null) modifiers['collisionRule'] = _genEnum(collision);
    if (prefix != null) modifiers['prefix'] = prefix;
    if (suffix != null) modifiers['suffix'] = suffix;
    if (seeInvisible != null) modifiers['seeFriendlyInvisible'] = seeInvisible;
  }

  String _genEnum(dynamic en) {
    return en.toString().split('.')[1];
  }

  @override
  Widget generate(Context context) {
    var wids = <Widget>[];
    switch (_action) {
      case _TeamAction.add:
        wids.add(Command('team add ${name}'));
        break;
      case _TeamAction.empty:
        wids.add(Command('team empty ${name}'));
        break;
      case _TeamAction.remove:
        wids.add(Command('team remove ${name}'));
        break;
      case _TeamAction.join:
        wids.add(Command('team join ${name} ${entity}'));
        break;
      case _TeamAction.leave:
        wids.add(Command('team leave ${entity}'));
        break;
      default:
    }
    if (modifiers.isNotEmpty) {
      modifiers.keys.forEach((key) =>
          wids.add(Command('team modify ${name} ${key} ${modifiers[key]}')));
    }
    return For.of(wids);
  }
}

enum _TeamAction {
  add,
  remove,
  modify,
  join,
  leave,
  empty,
}

enum ModifyTeam {
  never,
  always,
  hideForOtherTeams,
  hideForOwnTeam,
  pushOtherTeams,
  pushOwnTeam,
}
