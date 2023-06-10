import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  group('Title', () {
    command(
      'simple',
      Title(
        Entity.All(),
        show: [TextComponent('title')],
      ),
      'title @a title [{"text":"title"}]',
    );
    command(
      'times',
      Title.times(
        Entity.All(),
        fadein: 10.seconds,
        fadeout: Time(4),
      ),
      'title @a times 10s 3s 4',
    );

    command(
      'times fractions',
      Title.times(
        Entity.All(),
        fadein: 10.5.seconds,
        display: 25.ticks,
        fadeout: Time.duration(minutes: 5),
      ),
      'title @a times 10.5s 1.25s 300s',
    );
  });
}
