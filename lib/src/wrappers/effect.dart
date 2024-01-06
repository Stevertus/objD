import 'package:objd/core.dart';

class Effect extends RestActionAble implements GsonValue {
  EffectType? effect;
  Entity? entity;

  Time? duration;
  int? amplifier;
  bool? showParticles;
  final String _type;

  /// This command is used to give an entity a specific effect and affect their gameplay.
  /// ```dart
  /// Effect(
  /// 	EffectType.jump_boost,
  /// 	entity: Entity.Player(),
  /// 	duration: 20.seconds,
  /// 	amplifier: 3,
  /// 	showParticles: false
  /// )
  /// ⇒ effect give @p minecraft:jump_boost 20 3 true
  /// ```
  /// From version 19.4 you can use Time.infinite() as duration to make the effect last forever
  Effect(
    this.effect, {
    this.entity,
    this.duration = const Time.seconds(30),
    this.amplifier = 1,
    this.showParticles = true,
  }) : _type = 'give' {
    entity ??= Entity.Selected();
  }

  /// You can clear an effect again.
  /// ```dart
  /// Effect.clear(Entity.Player(),EffectType.jump_boost)
  /// ⇒ effect clear @p minecraft:jump_boost
  /// ```
  Effect.clear(this.entity, [this.effect]) : _type = 'clear';

  Map getMap() {
    var ret = {};
    if (effect != null) ret['id'] = EffectType.values.indexOf(effect!) + 1;
    ret['amplifier'] = Byte(amplifier != null ? amplifier! - 1 : 0);
    ret['duration'] = duration != null ? duration!.ticks : 0;
    ret['show_particles'] = Byte(
      showParticles != null && showParticles! ? 1 : 0,
    );
    return ret;
  }

  @override
  String toSimple() => gson.encode(getMap());

  @override
  Widget generate(Context context) {
    if (_type == 'clear') {
      return CommandBuilder('effect clear $entity').string(
        effect?.name,
        prefix: 'minecraft:',
      );
    } else {
      return CommandBuilder('effect give $entity')
          .string(
            effect!.name,
            prefix: 'minecraft:',
          )
          .when(
            duration == null || duration!.isInfinite,
            then: 'infinite',
            otherwise: duration?.seconds.toStringAsFixed(0),
          )
          .string('$amplifier ${!showParticles!}');
    }
  }
}

enum EffectType {
  speed,
  slowness,
  haste,
  mining_fatigue,
  strength,
  instant_health,
  instant_damage,
  jump_boost,
  nausea,
  regeneration,
  resistance,
  fire_resistance,
  water_breathing,
  invisibility,
  blindness,
  night_vision,
  hunger,
  weakness,
  poison,
  wither,
  health_boost,
  absorption,
  saturation,
  glowing,
  levitation,
  luck,
  unluck,
  slow_falling,
  conduit_power,
  dolphins_grace,
  bad_omen,
}
