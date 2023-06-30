import 'dart:convert';

import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';

class Title extends RestActionAble {
  final _TitleType _type;
  final Entity entity;
  final List<TextComponent> show;
  final (Time, Time, Time)? times;

  /// To display our TextComponent, we need the `/title` command and the Title class wrapper.
  Title(
    this.entity, {
    required this.show,
  })  : _type = _TitleType.title,
        times = null;
  //jsonText = json.encode(show.map((text) => text.toMap()).toList());

  Title.subtitle(this.entity, {required this.show})
      : _type = _TitleType.subtitle,
        times = null;

  Title.actionbar(this.entity, {required this.show})
      : _type = _TitleType.actionbar,
        times = null;

  /// Title.clear clears all titles again:
  Title.clear(this.entity)
      : _type = _TitleType.clear,
        show = [],
        times = null;

  /// Title.times sets the timings
  Title.times(
    this.entity, {
    Time fadein = const Time(20),
    Time display = const Time(60),
    Time fadeout = const Time(20),
  })  : _type = _TitleType.times,
        show = [],
        times = (fadein, display, fadeout);
  //jsonText = '$fadein $display $fadeout';

  /// resets times for one selector
  Title.resetTimes(this.entity)
      : _type = _TitleType.reset,
        show = [],
        times = null;
  @override
  Widget generate(Context context) {
    final jsonText = json
        .encode(show.map((text) => text.toMap()).toList())
        .replaceAll('\\[repl]\\', '\\');

    return Command(times != null
        ? 'title $entity times ${times!.$1} ${times!.$2} ${times!.$3}'
        : 'title $entity ${_type.name} $jsonText');
  }
}

enum _TitleType {
  title,
  subtitle,
  actionbar,
  clear,
  times,
  reset,
}
