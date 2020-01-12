import 'dart:convert';

import 'package:objd/basic/widget.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/text_components.dart';
import 'package:meta/meta.dart';

class Title extends RestActionAble {
  String type;
  String jsonText;
  String entity;

  /// To display our TextComponent, we need the `/title` command and the Title class wrapper.
  Title(
    Entity selector, {
    @required List<TextComponent> show,
  }) {
    type = 'title';
    entity = selector.toString();
    jsonText = json.encode(show.map((text) => text.toMap()).toList());
  }
  Title.subtitle(Entity selector, {@required List<TextComponent> show}) {
    type = 'subtitle';
    entity = selector.toString();
    jsonText = json.encode(show.map((text) => text.toMap()).toList());
  }
  Title.actionbar(Entity selector, {@required List<TextComponent> show}) {
    type = 'actionbar';
    entity = selector.toString();
    jsonText = json.encode(show.map((text) => text.toMap()).toList());
  }

  /// Title.clear clears all titles again:
  Title.clear(Entity selector) {
    type = 'clear';
    entity = selector.toString();
    jsonText = '';
  }

  /// Title.times sets the timings
  Title.times(
    Entity selector, {
    int fadein = 20,
    int display = 60,
    int fadeout = 20,
  }) {
    type = 'times';
    entity = selector.toString();
    jsonText =
        fadein.toString() + ' ' + display.toString() + ' ' + fadeout.toString();
  }

  /// resets times for one selector
  Title.resetTimes(Entity selector) {
    type = 'reset';
    entity = selector.toString();
    jsonText = '';
  }
  @override
  Widget generate(Context context) {
    jsonText = jsonText.replaceAll('\\[repl]\\', '\\');
    return Command('title ' + entity + ' ' + type + ' ' + jsonText);
  }
}
