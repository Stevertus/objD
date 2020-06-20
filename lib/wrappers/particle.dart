import 'package:meta/meta.dart';
import 'package:objd/basic/types/block.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/types/item.dart';
import 'package:objd/basic/types/location.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/types/particles.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';

/// The particle command spawns particles in the world to enhance certain graphics.
class Particle extends RestActionAble {
  String _gen;

  /// The particle command spawns particles in the world to enhance certain graphics.
  ///
  /// |constructor| |
  /// |--|--|
  /// |ParticleType| the type of the particle( ParticleType.[particle_id] ) |
  /// |location| where to show the particle(required) |
  /// | delta | the directions in which the particle expands(Location.glob, optional) |
  /// | speed | the speed of the expanding particle(optional, but delta required) |
  /// | count| the amount of particles(optional, but delta required) |
  /// | force | bool if the particle should be visible from far away(optional)|
  ///
  /// ```dart
  /// Particle(
  /// 	ParticleType.flame,
  /// 	location: Location.here(),
  /// )
  /// ⇒ particle minecraft:flame ~ ~ ~
  /// ```
  Particle(
    ParticleType particle, {
    Location location,
    Location delta,
    double speed = 0,
    int count = 1,
    bool force = false,
    Entity player,
  }) {
    _gen = particle.toString();
    if (location != null) _gen += ' ' + location.toString();
    if (delta != null) {
      if (speed == null || count == null || location == null) {
        throw ('If you decide to use the full particle command add a delta, location, speed and count property!');
      }
      _gen += ' ${delta} ${speed} ${count} ';
      _gen += force ? 'force' : 'normal';
      if (player != null) _gen += ' ' + player.toString();
    }
  }

  /// For the Block particle(shows block break) there is a named constructor
  Particle.block(
    Block block, {
    Location location,
    Location delta,
    double speed = 0,
    int count = 1,
    bool force,
    Entity player,
  }) {
    _gen = 'minecraft:block ';
    _gen += block.toString();
    if (location != null) _gen += ' ' + location.toString();
    if (delta != null) {
      if (speed == null || count == null || location == null) {
        throw ('If you decide to use the full particle command add a delta, location, speed and count property!');
      }
      _gen += ' ${delta} ${speed} ${count} ';
      _gen += force ? 'force' : 'normal';
      if (player != null) _gen += ' ' + player.toString();
    }
  }

  /// For the Item particle(shows item break) there is a named constructor
  Particle.item(
    Item item, {
    @required Location location,
    Location delta,
    double speed = 0,
    int count = 1,
    bool force = false,
    Entity player,
  }) {
    _gen = 'minecraft:item ';
    _gen += item.getId();
    if (location != null) _gen += ' ' + location.toString();
    if (delta != null) {
      if (speed == null || count == null) {
        throw ('If you decide to use the full particle command add a delta, speed and count property!');
      }
      _gen += ' ${delta} ${speed} ${count}';
      _gen += force ? 'force' : 'normal';
      if (player != null) _gen += ' ' + player.toString();
    }
  }

  @override
  Widget generate(Context context) {
    return Command('particle ' + _gen);
  }
}
