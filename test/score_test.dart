import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  final s1 = Score(Entity.All(), "test");

  group('Score', () {
    test('prefixing', () {
      Scoreboard.prefix = 'mock_';
      final s = Score.fromSelected('test');
      expect('mock_test', s.score);
      Scoreboard.prefix = null;
    });
    test('constant', () {
      final s = Score.con(5);
      expect('#5', s.entity.playerName);
      expect("objd_consts", s.score);
    });
    command(
      'register',
      s1,
      "scoreboard objectives add test dummy",
    );
    commands('set', s1.set(5), [
      "scoreboard objectives add test dummy",
      "scoreboard players set @a test 5"
    ]);
    commands('get', s1.get(), [
      "scoreboard objectives add test dummy",
      "scoreboard players get @a test"
    ]);
    commands('reset', s1.reset(), [
      "scoreboard objectives add test dummy",
      "scoreboard players reset @a test"
    ]);
    command(
      'register',
      s1,
      "scoreboard objectives add test dummy",
    );

    commands('add', s1 + 5, [
      "scoreboard objectives add test dummy",
      "scoreboard players add @a test 5"
    ]);

    commands('remove', s1 - 2, [
      "scoreboard objectives add test dummy",
      "scoreboard players remove @a test 2"
    ]);

    commands('sum', s1 + Score(Entity.Self(), "test"), [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test += @s test"
    ]);

    commands('difference', s1 - Score(Entity.Self(), "test"), [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test -= @s test"
    ]);

    commands('modulo', s1 % Score(Entity.Self(), "test"), [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test %= @s test"
    ]);

    commands('modulo constant', s1 % 3, [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test %= #3 objd_consts"
    ]);
    commands('divide', s1 / Score(Entity.Self(), "test"), [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test /= @s test"
    ]);

    commands('divide constant', s1 / 5, [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test /= #5 objd_consts"
    ]);
    commands('multiply', s1 * Score(Entity.Self(), "test"), [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test *= @s test"
    ]);

    commands('multiply constant', s1 * 5, [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test *= #5 objd_consts"
    ]);

    commands('swapWith', s1.swapWith(Score(Entity.Self(), "test")), [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test >< @s test"
    ]);
    commands('setToSmallest', s1.setToSmallest(Score(Entity.Self(), "test")), [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test < @s test"
    ]);
    commands('setToBiggest', s1.setToBiggest(Score(Entity.Self(), "test")), [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test > @s test"
    ]);

    commands('setTo int', s1 << 5, [
      "scoreboard objectives add test dummy",
      "scoreboard players set @a test 5"
    ]);
    commands('setTo int reverse', s1 >> 5, [
      "scoreboard objectives add test dummy",
      "scoreboard players set @a test 5"
    ]);
    commands('setEqual', s1.setEqual(Score(Entity.Self(), "test")), [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test = @s test"
    ]);
    commands('setTo Score', s1 << Score(Entity.Self(), "test"), [
      "scoreboard objectives add test dummy",
      "scoreboard players operation @a test = @s test"
    ]);
    commands('setTo Command', s1 << Command("mock command"), [
      "scoreboard objectives add test dummy",
      "execute store result score @a test run mock command"
    ]);
    commands('setTo Data', s1 << Data.get(Entity.Self(), path: "test"), [
      "scoreboard objectives add test dummy",
      "execute store result score @a test run data get entity @s test 1"
    ]);
    commands(
      'setTo File',
      s1 << File("test"),
      ["execute store result score @a test run function :test"],
    );
    commands(
      'setTo Widget',
      s1 << Say("mock"),
      ["execute store result score @a test run say mock"],
    );
    commands(
      'setTo Condition',
      s1 << Condition(s1 < 10),
      [
        'scoreboard objectives add test dummy',
        'execute store result score @a test if score @a test matches ..9'
      ],
    );
  });

  group('Score Conditions', () {
    commands(
      "empty",
      s1.isBigger(Score(Entity.Self(), "new")),
      [],
    );
    command(
      "simple if",
      If(
        s1.isBigger(Score(Entity.Self(), "new")),
        then: [Say("test")],
      ),
      "execute if score @a test > @s new run say test",
    );
    command(
      "matches int",
      If(
        s1 & 1,
        then: [Say("test")],
      ),
      "execute if score @a test matches 1 run say test",
    );
    command(
      "matches Range",
      If(
        s1 & Range(5, 10),
        then: [Say("test")],
      ),
      "execute if score @a test matches 5..10 run say test",
    );
    command(
      "matches Score",
      If(
        s1 & Score(Entity.Self(), "new"),
        then: [Say("test")],
      ),
      "execute if score @a test = @s new run say test",
    );
    command(
      "compare constant",
      If(s1 > 4, then: [Say("test")]),
      "execute if score @a test matches 5.. run say test",
    );
    command(
      "smallerOrEqual constant",
      If(s1 <= 4, then: [Say("test")]),
      "execute if score @a test matches ..4 run say test",
    );
    command(
      "smallerOrEqual Score",
      If(s1 <= Score(Entity.Self(), "new"), then: [Say("test")]),
      "execute if score @a test <= @s new run say test",
    );
    command(
      "largerOrEqual constant",
      If(s1 >= -5, then: [Say("test")]),
      "execute if score @a test matches -5.. run say test",
    );
    command(
      "largerOrEqual Score",
      If(s1 >= Score(Entity.Self(), "new"), then: [Say("test")]),
      "execute if score @a test >= @s new run say test",
    );
    command(
      "isSmaller Score",
      If(s1 < Score(Entity.Self(), "new"), then: [Say("test")]),
      "execute if score @a test < @s new run say test",
    );
    command(
      "isLarger Score",
      If(s1 > Score(Entity.Self(), "new"), then: [Say("test")]),
      "execute if score @a test > @s new run say test",
    );
  });
}
