import 'package:objd/basic/command.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';
import 'package:objd/core.dart';

class Effect extends RestActionAble {
  EffectType effect;
  Entity entity;
  int duration;
  int amplifier;
  bool showParticles;
  String _type;

  /// This command is used to give an entity a specific effect and affect their gameplay.
  /// ```dart
  /// Effect(
  /// 	EffectType.jump_boost,
  /// 	entity: Entity.Player(),
  /// 	duration: 20,
  /// 	amplifier: 3,
  /// 	showParticles: false
  /// )
  /// ⇒ effect give @p minecraft:jump_boost 20 3 true
  /// ```
  Effect(
    this.effect, {
    this.entity,
    this.duration = 30,
    this.amplifier = 1,
    this.showParticles = true,
  }) {
    entity ??= Entity.Selected();
    _type = 'give';
  }

  /// You can clear an effect again.
  /// ```dart
  /// Effect.clear(Entity.Player(),EffectType.jump_boost)
  /// ⇒ effect clear @p minecraft:jump_boost
  /// ```
  Effect.clear(this.entity, [this.effect]) {
    _type = 'clear';
  }
  Map getMap() {
    var ret = {};
    ret['Id'] = EffectType.values.indexOf(effect) + 1;
    ret['Amplifier'] = Byte(amplifier != null ? amplifier - 1 : 0);
    ret['Duration'] = duration != null ? duration * 20 : 0;
    ret['ShowParticles'] = Byte(showParticles != null && showParticles ? 1 : 0);
    return ret;
  }

  @override
  Widget generate(Context context) {
    if (_type == 'clear') {
      return Command(
        'effect clear ${entity}' +
            (effect != null
                ? ' minecraft:' + effect.toString().split('.')[1]
                : ''),
      );
    } else {
      return Command(
        'effect give ${entity} minecraft:' +
            effect.toString().split('.')[1] +
            ' ${duration} ${amplifier} ${!showParticles}',
      );
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
