import 'package:meta/meta.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/types/entity.dart';
import 'dart:convert';

import 'package:objd/basic/types/item.dart';
import 'package:objd/basic/types/location.dart';
import 'package:objd/basic/score.dart';

class TextComponent {
  Map<String, dynamic> value;
  Color color;
  bool bold, underlined, strikethrough, obfuscated, italic;
  TextClickEvent clickEvent;
  TextHoverEvent hoverEvent;
  String insertion;
  // default text display
  /// In Minecraft text in the chat or as title is defined with JSON-data. objD makes the JSON part of it easier by utilizing the TextComponent Class:
  TextComponent(
    String text, {
    this.color,
    this.bold,
    this.underlined,
    this.italic,
    this.strikethrough,
    this.obfuscated,
    this.clickEvent,
    this.hoverEvent,
    this.insertion,
  }) {
    value = {'text': text};
  }

  /// This inserts a simple line break
  TextComponent.lineBreak() {
    value = {'text': '\n'};
  }

  /// |TextComponent.customFont||
  /// |--|--|
  /// |String| a Custom Font Character(\u[HEX]) to insert in your text|
  /// |...same properties...|from TextComponent|
  ///
  /// ```dart
  /// TextComponent.customFont('\uFaa4')
  /// ⇒ {'text':'\uFaa4','color':'white'}
  /// ```
  TextComponent.customFont(
    String char, {
    this.color,
    this.bold,
    this.underlined,
    this.italic,
    this.strikethrough,
    this.obfuscated,
    this.clickEvent,
    this.hoverEvent,
    this.insertion,
  }) {
    color ??= Color.White;
    value = {'text': char};
  }

  ///**Attention: This requires a custom negative spaces font by AmberW installed(https://cdn.discordapp.com/attachments/157097006500806656/486915349569208322/NegativeSpaceFont3.zip)**
  ///
  /// |TextComponent.space|  |
  /// |--|--|
  /// |int| the pixel amount you want to move the next TextComponent (positive or negative)|
  /// |...same properties...|from TextComponent|
  /// This automatically calculates the custom characters for moving your text horizontally.
  ///
  /// ```dart
  /// Tellraw(
  /// 	Entity.All(),
  /// 	show:[
  /// 		TextComponent.space(478),
  /// 		TextComponent('This is moved')
  /// 	]
  /// )
  /// ⇒ tellraw  @a  [{'text':'\uF82D\uF82C\uF82B\uF829\uF828\uF826'},{'text':'This is moved'}]
  /// ```
  TextComponent.space(
    int pixels, {
    this.color,
    this.bold,
    this.underlined,
    this.italic,
    this.strikethrough,
    this.obfuscated,
    this.clickEvent,
    this.hoverEvent,
    this.insertion,
  }) {
    var nums = <int, String>{
      1: '\uF821',
      2: '\uF822',
      3: '\uF823',
      4: '\uF824',
      5: '\uF825',
      6: '\uF826',
      7: '\uF827',
      8: '\uF828',
      16: '\uF829',
      32: '\uF82A',
      64: '\uF82B',
      128: '\uF82C',
      256: '\uF82D',
      512: '\uF82E',
      1024: '\uF82F'
    };
    var negnums = <int, String>{
      -1024: '\uF80F',
      -512: '\uF80E',
      -256: '\uF80D',
      -128: '\uF80C',
      -64: '\uF80B',
      -32: '\uF80A',
      -16: '\uF809',
      -8: '\uF808',
      -7: '\uF807',
      -6: '\uF806',
      -5: '\uF805',
      -4: '\uF804',
      -3: '\uF803',
      -2: '\uF802',
      -1: '\uF801'
    };

    if (pixels == 0) {
      throw ('Please insert a pixel amount on how much you want to move characters');
    }
    var res = '';
    if (pixels > 0) {
      for (var value in nums.keys.toList().reversed) {
        while (pixels >= value) {
          res += nums[value];
          pixels -= value;
        }
      }
    } else {
      for (var value in negnums.keys) {
        while (pixels <= value) {
          res += negnums[value];
          pixels -= value;
        }
      }
    }

    value = {'text': res};
  }
  // translates from a key in the translations
  TextComponent.translate(
    String key, {

    /// a List containing a String, TextComponent or another List of TextComponents that replace placeholder values(e.g $s)
    List<dynamic> conversionFlags,
    this.color,
    this.bold,
    this.italic,
    this.underlined,
    this.strikethrough,
    this.obfuscated,
    this.clickEvent,
    this.hoverEvent,
    this.insertion,
  }) {
    value = {'translate': key};
    if (conversionFlags != null && conversionFlags.isNotEmpty) {
      value['with'] = [];
      conversionFlags.forEach((c) {
        if (c is List<TextComponent>) {
          value['with'].add(c.map((TextComponent x) => x.toMap()).toList());
        }
        if (c is TextComponent) value['with'].add(c.toMap());
        if (c is String) value['with'].add(TextComponent(c).toMap());
      });
    }
  }

  ///```dart
  /// TextComponent.score(
  /// 	Entity.Selected(),
  /// 	objective: 'myscores',
  /// 	color:Color.Black
  /// )
  /// ⇒ {'score':{'name': '@s','objective':'myscores'},'color':'black'}
  /// ```
  TextComponent.score(
    Score score, {
    this.color,
    this.bold,
    this.italic,
    this.underlined,
    this.strikethrough,
    this.obfuscated,
    this.clickEvent,
    this.hoverEvent,
    this.insertion,
  }) {
    value = {
      'score': {'name': score.entity.toString(), 'objective': score.score}
    };
  }

  /// |TextComponent.entityNbt| |
  /// |--|--|
  /// |Entity|the entity which has nbt to display|
  /// |path| the path as a String |
  /// |interpret|bool if nbt should be interpreted as TextComponent(optional)|
  /// |...same properties...|from TextComponent|
  ///
  /// ```dart
  /// TextComponent.entityNbt(
  /// 	Entity.Selected(),
  /// 	path: 'CustomName'
  /// 	underlined: true
  /// )
  /// ⇒ {'entity':'@s','nbt':'CustomName','underlined':true}
  /// ```
  TextComponent.entityNbt(
    Entity entity, {
    @required String path,
    bool interpret,
    this.color,
    this.bold,
    this.underlined,
    this.italic,
    this.strikethrough,
    this.obfuscated,
    this.clickEvent,
    this.hoverEvent,
    this.insertion,
  }) {
    value = {'nbt': path, 'entity': entity.toString()};
    if (interpret != null) value['interpret'] = interpret;
  }

  /// |TextComponent.blockNbt| |
  /// |--|--|
  /// |Location|a location of a block|
  /// |path| the path as a String |
  /// |interpret|bool if nbt should be interpreted as TextComponent(optional)|
  /// |...same properties...|from TextComponent|
  ///
  /// ```dart
  /// TextComponent.blockNbt(
  /// 	Location.glob(x:5,y:10,z:100),
  /// 	path: 'Items[0].tag.display.Name'
  /// 	interpret: true
  /// )
  /// ```
  TextComponent.blockNbt(
    Location location, {
    @required String path,
    bool interpret,
    this.color,
    this.bold,
    this.underlined,
    this.italic,
    this.strikethrough,
    this.obfuscated,
    this.clickEvent,
    this.hoverEvent,
    this.insertion,
  }) {
    value = {'nbt': path, 'block': location.toString()};
    if (interpret != null) value['interpret'] = interpret;
  }

  /// |TextComponent.storageNbt| |
  /// |--|--|
  /// |String|The name of your Storage(including namespace)|
  /// |path| the path as a String |
  /// |interpret|bool if nbt should be interpreted as TextComponent(optional)|
  /// |...same properties...|from TextComponent|
  ///
  /// ```dart
  /// TextComponent.storageNbt(
  /// 	'mypack:storage1',
  /// 	path: 'Custom.Stored.Text'
  /// 	interpret: true
  /// )
  /// ```
  TextComponent.storageNbt(
    String name, {
    @required String path,
    bool interpret,
    this.color,
    this.bold,
    this.underlined,
    this.italic,
    this.strikethrough,
    this.obfuscated,
    this.clickEvent,
    this.hoverEvent,
    this.insertion,
  }) {
    value = {'nbt': path, 'storage': name};
    if (interpret != null) value['interpret'] = interpret;
  }
  // shows entity
  TextComponent.selector(
    Entity entity, {
    this.color,
    this.bold,
    this.underlined,
    this.italic,
    this.strikethrough,
    this.obfuscated,
    this.clickEvent,
    this.hoverEvent,
    this.insertion,
  }) {
    value = {'selector': entity.toString()};
  }

  Map toMap() {
    if (value.containsKey('text') && value['text'] == null) return null;

    var ret = {};
    ret.addAll(value);
    if (color != null) ret['color'] = color.toString();
    if (bold != null) ret['bold'] = bold;
    if (italic != null) ret['italic'] = italic;
    if (underlined != null) ret['underlined'] = underlined;
    if (strikethrough != null) ret['strikethrough'] = strikethrough;
    if (obfuscated != null) ret['obfuscated'] = obfuscated;
    if (clickEvent != null) ret['clickEvent'] = clickEvent.toMap();
    if (hoverEvent != null) ret['hoverEvent'] = hoverEvent.toMap();
    if (insertion != null) ret['insertion'] = insertion;
    return ret;
  }

  String toJson() {
    final m = toMap();
    return m != null ? json.encode(m).replaceAll('\\[repl]\\', '\\') : null;
  }
}

/// Fires on left click, Part of TextComponent.
class TextClickEvent {
  String action;
  String value;

  /// Fires on left click, Part of TextComponent.
  TextClickEvent({
    @required this.action,
    @required this.value,
  })  : assert(value != null),
        assert(action != null);

  /// Opens the specified web url
  TextClickEvent.open_url(String url) {
    action = 'open_url';
    value = url;
  }

  /// runs given command
  TextClickEvent.run_command(Command command) {
    action = 'run_command';
    value = '/' + (command.toMap()['command'] ?? '');
  }

  /// copies command in chat
  TextClickEvent.suggest(String text) {
    action = 'suggest_command';
    value = text;
  }

  /// changes book page
  TextClickEvent.change_page(int to) {
    action = 'change_page';
    value = to.toString();
  }

  Map<String, String> toMap() {
    return {'action': action, 'value': value};
  }
}

/// Fires on mouse over, Part of TextComponent.
class TextHoverEvent {
  String action;
  dynamic value;

  /// Fires on mouse over, Part of TextComponent.
  TextHoverEvent({@required this.action, @required this.value})
      : assert(value != null),
        assert(action != null);

  /// Accepts a new List of TextComponents to display
  TextHoverEvent.text(List<TextComponent> texts) {
    action = 'show_text';
    // ToDo: catch if score, selector or event listener
    value = texts.map((item) => item.toMap()).toList();
  }

  /// shows an achievement
  TextHoverEvent.achievement(String name) {
    action = 'show_achievement';
    value = name;
  }
  // displays item
  // Todo: add item model
  TextHoverEvent.item(Item item) {
    action = 'show_item';
    value = item.toString();
  }
  // shows a dummy entity presentation in chat
  TextHoverEvent.entity(String name, String type, String id) {
    action = 'show_entity';
    value = json.encode({'name': name, 'type': type, 'id': id});
  }

  Map<String, dynamic> toMap() {
    return {'action': action, 'value': value};
  }
}

/// See all available colors: https://minecraft.gamepedia.com/Formatting_codes#Color_codes
class Color {
  final String _color;

  ///   With 1.16 you can also use any rgb color now:
  ///
  /// ```dart
  /// Color("#ff6a00")
  /// Color.fromInt(16738816)
  /// Color.fromRGB(255,106,0)
  /// ```
  const Color(this._color);

  static Color fromInt(int color) =>
      Color('#' + color.toRadixString(16).padLeft(4, '0'));
  static Color fromRGB(int r, int g, int b) {
    r = (r < 0) ? -r : r;
    g = (g < 0) ? -g : g;
    b = (b < 0) ? -b : b;
    r = (r > 255) ? 255 : r;
    g = (g > 255) ? 255 : g;
    b = (b > 255) ? 255 : b;
    return Color.fromInt(
      ((r & 0x0ff) << 16) | ((g & 0x0ff) << 8) | (b & 0x0ff),
    );
  }

  static const Color White = Color('white');
  static const Color Black = Color('black');
  static const Color DarkBlue = Color('dark_blue');
  static const Color DarkGreen = Color('dark_green');
  static const Color DarkAqua = Color('dark_aqua');
  static const Color DarkRed = Color('dark_red');
  static const Color DarkPurple = Color('dark_purple');
  static const Color Gold = Color('gold');
  static const Color Gray = Color('gray');
  static const Color DarkGray = Color('dark_gray');
  static const Color Blue = Color('blue');
  static const Color Green = Color('green');
  static const Color Aqua = Color('aqua');
  static const Color Red = Color('red');
  static const Color LightPurple = Color('light_purple');
  static const Color Yellow = Color('yellow');

  @override
  String toString() {
    return _color;
  }
}
