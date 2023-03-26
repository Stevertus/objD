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
      'give complex',
      Effect(
        EffectType.absorption,
        duration: -1,
        entity: e,
        amplifier: 2,
        showParticles: false,
      ),
      "effect give $e minecraft:absorption infinite 2 true",
    );
  });
}
