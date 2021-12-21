import 'dart:convert';

import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/context.dart';
import 'package:objd/src/wrappers/execute.dart';

class Bossbar extends RestActionAble {
  final BossbarType type;
  final String id;

  String? name;
  List<TextComponent>? nameTexts;
  BossbarOption? option;
  Map<String, String> modifiers = {};

  Bossbar(this.id, {this.name, this.type = BossbarType.add}) {
    name ??= id;
  }

  Bossbar remove() => copyWith(type: BossbarType.remove);

  Bossbar get(BossbarOption option) {
    final b = copyWith(type: BossbarType.get);
    b.option = option;
    return b;
  }

  Bossbar show(Entity player) {
    final b = copyWith(type: BossbarType.get);
    b.modifiers['players'] = player.toString();
    return b;
  }

  Bossbar set({
    String? name,
    List<TextComponent>? nameTexts,
    Color? color,
    String? style,
    int? value,
    int? max,
    bool? visible,
    Entity? players,
  }) {
    final b = copyWith(type: BossbarType.set);

    if (name != null) b.nameTexts = [TextComponent(name)];
    if (nameTexts != null) b.nameTexts = nameTexts;
    if (color != null) b.modifiers['color'] = color.toString();
    if (style != null) b.modifiers['style'] = style;
    if (value != null) b.modifiers['value'] = value.toString();
    if (max != null) b.modifiers['max'] = max.toString();
    if (visible != null) b.modifiers['visible'] = visible.toString();
    if (players != null) b.modifiers['players'] = players.toString();
    return b;
  }

  @override
  Widget? generate(Context context) {
    switch (type) {
      case BossbarType.add:
        return Command('bossbar add $id {"text":"$name}"');
      case BossbarType.remove:
        return Command('bossbar remove $id');
      case BossbarType.get:
        return Command('bossbar get $id ${option!.name}');
      case BossbarType.set:
        {
          var widgets = <Widget>[];
          if (nameTexts != null) {
            widgets.add(Command('bossbar set $id name ${_getNameJson()}'));
          }
          modifiers.forEach((key, value) {
            widgets.add(Command('bossbar set $id $key $value'));
          });
          return For.of(widgets);
        }
      default:
        return null;
    }
  }

  String _getNameJson() {
    if (nameTexts!.length == 1) return nameTexts![0].toJson()!;
    return json.encode(nameTexts!.map((text) => text.toMap()).toList());
  }

  Group storeResult(
    Widget w,
    BossbarOption option, {
    bool useSuccess = false,
  }) {
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

    return Execute.internal_store_command(
      'bossbar $id $strOption',
      w,
      useSuccess,
    );
  }

  Bossbar copyWith({
    BossbarType? type,
    String? id,
  }) {
    return Bossbar(
      id ?? this.id,
      name: name,
      type: type ?? this.type,
    );
  }
}

enum BossbarOption { max, players, value, visible }
enum BossbarType { add, set, get, remove }
