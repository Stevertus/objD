import 'dart:convert';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/context.dart';
import 'package:objd/wrappers/execute.dart';

class Bossbar extends RestActionAble {
  String _type;

  String id;
  String name;
  List<TextComponent> nameTexts;
  BossbarOption _option;
  Map<String, String> modifiers = {};

  Bossbar(this.id, {this.name}) {
    name ??= id;
    _type = 'add';
  }

  Bossbar remove() {
    _type = 'remove';
    return this;
  }

  Bossbar get(BossbarOption option) {
    _option = option;
    _type = 'get';
    return this;
  }

  Bossbar show(Entity player) {
    modifiers['players'] = player.toString();
    return this;
  }

  Bossbar set({
    String name,
    List<TextComponent> nameTexts,
    Color color,
    String style,
    int value,
    int max,
    bool visible,
    Entity players,
  }) {
    if (name != null) this.nameTexts = [TextComponent(name)];
    if (nameTexts != null) this.nameTexts = nameTexts;
    if (color != null) modifiers['color'] = color.toString();
    if (style != null) modifiers['style'] = style;
    if (value != null) modifiers['value'] = value.toString();
    if (max != null) modifiers['max'] = max.toString();
    if (visible != null) modifiers['visible'] = visible.toString();
    if (players != null) modifiers['players'] = players.toString();
    _type = 'set';
    return this;
  }

  @override
  Widget generate(Context context) {
    switch (_type) {
      case 'add':
        return Command('bossbar add ${id} {"text":"${name}"}');
      case 'remove':
        return Command('bossbar remove ${id}');
      case 'get':
        return Command('bossbar get ${id} ${_option.toString().split('.')[1]}');
      case 'set':
        {
          var widgets = <Widget>[];
          if (nameTexts != null) {
            widgets.add(Command('bossbar set ${id} name ${_getNameJson()}'));
          }
          modifiers.forEach((key, value) {
            widgets.add(Command('bossbar set ${id} ${key} ${value}'));
          });
          return For.of(widgets);
        }
      default:
        return null;
    }
  }

  String _getNameJson() {
    if (nameTexts.length == 1) return nameTexts[0].toJson();
    return json.encode(nameTexts.map((text) => text.toMap()).toList());
  }

  Execute storeResult(Command command, BossbarOption option,
      {bool useSuccess = false}) {
    String strOption;
    switch (option) {
      case BossbarOption.max:
        strOption = 'max';
        break;
      case BossbarOption.value:
        strOption = 'value';
        break;
      default:
        throw ('Please use BossbarOption.max or BossbarOption.value with storeResult!');
    }
    ;
    return Execute(
      children: [command],
      encapsulate: false,
      args: [
        [
          'store ' +
              (useSuccess ? 'success' : 'result') +
              ' bossbar ${id} ${strOption}'
        ],
      ],
    );
  }
}

enum BossbarOption { max, players, value, visible }
