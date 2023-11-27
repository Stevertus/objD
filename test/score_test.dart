import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  group('Score', () {
    test('constant', () {
      expect(
        Score.con(5).toString(),
        "#5 objd_consts",
      );
    });
    test('temp', () {
      // mock temp name generation
      Scoreboard.overrideTempPlayerNames(["mock1"]);
      expect(
        Score.tmp().toString(),
        "#mock1 objd_temp",
      );
    });
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

  group("Score Bossbar", () {
    Scoreboard.overrideTempPlayerNames(["mock1"]);
    commands('add', Bossbar("test").get(BossbarOption.value) + 1, [
      "execute store result score #mock1 objd_temp run bossbar get test value",
      "scoreboard objectives add objd_temp dummy",
      "scoreboard players add #mock1 objd_temp 1",
      "execute store result bossbar test value run scoreboard players get #mock1 objd_temp"
    ]);
  });

  group('Score Conditions', () {
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
