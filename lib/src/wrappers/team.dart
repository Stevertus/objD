import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/context.dart';

class Team extends RestActionAble {
  String name;
  Entity? entity;
  Map<String, dynamic> modifiers = {};
  final _TeamAction _action;

  Team(this.name) : _action = _TeamAction.add;

  Team.add(
    this.name, {
    TextComponent? display,
    Color? color,
    ModifyTeam? nametag,
    ModifyTeam? collision,
    ModifyTeam? deathMessage,
    bool? friendlyFire,
    String? prefix,
    String? suffix,
    bool? seeInvisible,
  }) : _action = _TeamAction.add {
    _setModifiers(display, color, nametag, collision, deathMessage,
        friendlyFire, prefix, suffix, seeInvisible);
  }

  Team.empty(this.name) : _action = _TeamAction.empty;

  Team.join(this.name, this.entity) : _action = _TeamAction.join;

  Team.leave(this.entity)
      : _action = _TeamAction.leave,
        name = '';

  Team.modify(
    this.name, {
    TextComponent? display,
    Color? color,
    ModifyTeam? nametag,
    ModifyTeam? collision,
    ModifyTeam? deathMessage,
    bool? friendlyFire,
    String? prefix,
    String? suffix,
    bool? seeInvisible,
  }) : _action = _TeamAction.modify {
    _setModifiers(display, color, nametag, collision, deathMessage,
        friendlyFire, prefix, suffix, seeInvisible);
  }
  void _setModifiers(
    TextComponent? display,
    Color? color,
    ModifyTeam? nametag,
    ModifyTeam? collision,
    ModifyTeam? deathMessage,
    bool? friendlyFire,
    String? prefix,
    String? suffix,
    bool? seeInvisible,
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
    if (seeInvisible != null) modifiers['seeFriendlyInvisibles'] = seeInvisible;
  }

  String _genEnum(ModifyTeam en) {
    return en.name;
  }

  @override
  Widget generate(Context context) {
    var wids = <Widget>[];
    switch (_action) {
      case _TeamAction.add:
        wids.add(Command('team add $name'));
        break;
      case _TeamAction.empty:
        wids.add(Command('team empty $name'));
        break;
      case _TeamAction.remove:
        wids.add(Command('team remove $name'));
        break;
      case _TeamAction.join:
        wids.add(Command('team join $name $entity'));
        break;
      case _TeamAction.leave:
        wids.add(Command('team leave $entity'));
        break;
      default:
    }
    if (modifiers.isNotEmpty) {
      for (var key in modifiers.keys) {
        wids.add(Command('team modify $name $key ${modifiers[key]}'));
      }
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
