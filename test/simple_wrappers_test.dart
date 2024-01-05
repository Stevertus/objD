import 'package:objd/core.dart';
import 'package:test/test.dart';

import 'test_widget.dart';

void main() {
  group('Say', () {
    command('string', Say("Hello"), "say Hello");
    builder('entity', () {
      final e = Entity.Self();
      expect(getCommands(Say(e)), ["say $e"]);
    });
  });
  group('Ride', () {
    command('mount', Ride(Entity.Self(), Entity.Random()), "ride @s mount @r");
    command('dismount', Ride.dismount(Entity.All()), "ride @a dismount");
  });
  group('Effect', () {
    final e = Entity.All();
    command('clear', Effect.clear(e), "effect clear $e");
    command(
      'clear specific',
      Effect.clear(e, EffectType.bad_omen),
      "effect clear $e minecraft:bad_omen",
    );
    command(
      'give simple',
      Effect(
        EffectType.absorption,
        entity: e,
      ),
      "effect give $e minecraft:absorption 30 1 false",
    );
    command(
      'give time',
      Effect(
        EffectType.saturation,
        duration: Time.seconds(15),
        entity: e,
      ),
      "effect give $e minecraft:saturation 15 1 false",
    );
    command(
      'give fraction time',
      Effect(
        EffectType.saturation,
        duration: 2.ticks,
        entity: e,
      ),
      "effect give $e minecraft:saturation 0 1 false",
    );
    command(
      'give complex',
      Effect(
        EffectType.absorption,
        duration: Time.infinite(),
        entity: e,
        amplifier: 2,
        showParticles: false,
      ),
      "effect give $e minecraft:absorption infinite 2 true",
    );
  });

  command('Return', Return(30), "return 30");

  command(
    'Schedule',
    Schedule('function', ticks: 2.minutes),
    "schedule function :function 120s",
  );

  group('Damage', () {
    final e = Entity.All();
    command('simple', Damage(e, amount: 30), "damage $e 30.0");
    command(
      'by',
      Damage.by(
        e,
        target: e,
        amount: 10,
        cause: Entity.Self(),
      ),
      "damage $e 10.0 by $e from @s",
    );
    command(
      'at',
      Damage.at(Location.here(), target: e, amount: 50),
      "damage $e 50.0 at ~ ~ ~",
    );
    test('failure', () {
      expect(
        () => Damage(
          e,
          location: Location.here(),
          by: e,
          amount: 50,
          cause: Entity.All(),
        ),
        throwsA(
          isA<AssertionError>(),
        ),
      );
    });
  });

  group('Random', () {
    command(
      'simple',
      Random(Range(1, 10)),
      "random value 1..10",
    );
    command(
      'roll',
      Random(Range(1, 10), roll: true),
      "random roll 1..10",
    );
    command(
      'sequence',
      Random(Range(1, 10), sequence: 'test'),
      "random value 1..10 test",
    );
    command('reset simple', Random.reset('test'), "random reset test");
    command(
      'reset complex',
      Random.reset(
        'test',
        seed: 1234,
        includeWorldSeed: false,
        includeSequenceId: true,
      ),
      "random reset test 1234 false true",
    );
    test('reset failure', () {
      expect(
        () => Random.reset(
          'test',
          includeWorldSeed: false,
        ).generate(Context(version: 20.1)),
        throwsA(
          isA<AssertionError>(),
        ),
      );
    });
  });
}
