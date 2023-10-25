import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  group('Score', () {
    command(
      'register',
      Score(Entity.All(), "test"),
      "scoreboard objectives add test dummy",
    );
    commands('set', Score(Entity.All(), "test").set(5), [
      "scoreboard objectives add test dummy",
      "scoreboard players set @a test 5"
    ]);
    commands('reset', Score(Entity.All(), "test").reset(), [
      "scoreboard objectives add test dummy",
      "scoreboard players reset @a test"
    ]);
    command(
      'register',
      Score(Entity.All(), "test"),
      "scoreboard objectives add test dummy",
    );

    commands('add', Score(Entity.All(), "test") + 5, [
      "scoreboard objectives add test dummy",
      "scoreboard players add @a test 5"
    ]);

    commands(
        'sum', Score(Entity.All(), "test") + Score(Entity.Self(), "test"), [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test += @s test"
    ]);
  });

  group('Score Conditions', () {
    commands(
      "empty",
      Score(Entity.All(), "test").isBigger(Score(Entity.Self(), "new")),
      [],
    );
    command(
      "simple if",
      If(
        Score(Entity.All(), "test").isBigger(Score(Entity.Self(), "new")),
        then: [Say("test")],
      ),
      "execute if score @a test > @s new run say test",
    );
    command(
      "compare constant",
      If(Score(Entity.All(), "test") > 4, then: [Say("test")]),
      "execute if score @a test matches 5.. run say test",
    );
  });
}
