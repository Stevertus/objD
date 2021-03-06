import 'dart:convert';
import 'package:objd/src/basic/rest_action.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/basic/command.dart';
import 'package:objd/src/build/build.dart';
import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/text_components.dart';

class Tellraw extends RestActionAble {
  String jsonText;
  Entity selector;

  /// The Tellraw class is very similar to the Title class, but shows its texts in the chat.
  Tellraw(this.selector, {required List<TextComponent> show})
      : jsonText = json
            .encode(show.map((text) => text.toMap()).toList())
            .replaceAll('\\', '\u005C');

  @override
  Widget generate(Context context) {
    return Command('tellraw $selector $jsonText');
  }
}
