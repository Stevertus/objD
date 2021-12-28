import 'package:objd/src/basic/command.dart';
import 'package:objd/src/basic/rest_action.dart';
import 'package:objd/src/basic/types/block.dart';
import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/types/item.dart';
import 'package:objd/src/basic/types/location.dart';
import 'package:objd/src/basic/types/particles.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/context.dart';

/// The particle command spawns particles in the world to enhance certain graphics.
class Particle extends RestActionAble {
  final ParticleType particle;
  final String? texture;
  final Location? location;
  final Location? delta;
  final double speed;
  final int count;
  final bool force;
  final Entity? player;

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
  /// | texture | texture for block, falling_dust, item and dust particles(optional)|
  ///
  /// ```dart
  /// Particle(
  /// 	ParticleType.flame,
  /// 	location: Location.here(),
  /// )
  /// ⇒ particle minecraft:flame ~ ~ ~
  /// ```
  Particle(
    this.particle, {
    this.texture,
    this.location,
    this.delta,
    this.speed = 0,
    this.count = 1,
    this.force = false,
    this.player,
  });

  /// For the Block particle(shows block break) there is a named constructor
  Particle.block(
    Block block, {
    bool falling = false,
    bool marker = false,
    this.location,
    this.delta,
    this.speed = 0,
    this.count = 1,
    this.force = false,
    this.player,
  })  : particle = falling
            ? Particles.falling_dust
            : (marker ? Particles.block_marker : Particles.block),
        texture = block.toString();

  /// For the Item particle(shows item break) there is a named constructor
  Particle.item(
    Item item, {
    this.location,
    this.delta,
    this.speed = 0,
    this.count = 1,
    this.force = false,
    this.player,
  })  : particle = Particles.item,
        texture = item.getId();

  // The dust particle requires a rgb color ranging from 0.0 to 1.0 each and a size
  Particle.dust(
    double r,
    double g,
    double b, {
    required double size,
    this.location,
    this.delta,
    this.speed = 0,
    this.count = 1,
    this.force = false,
    this.player,
  })  : particle = Particles.dust,
        texture = '$r $g $b $size';

  /// use copyWith to create a new instance with some values changed
  Particle copyWith({
    ParticleType? particle,
    String? texture,
    Location? location,
    Location? delta,
    double? speed,
    int? count,
    bool? force,
    Entity? player,
  }) {
    return Particle(
      particle ?? this.particle,
      texture: texture ?? this.texture,
      location: location ?? this.location,
      delta: delta ?? this.delta,
      speed: speed ?? this.speed,
      count: count ?? this.count,
      force: force ?? this.force,
      player: player ?? this.player,
    );
  }

  @override
  Widget generate(Context context) {
    var _gen = particle.toString();

    if (context.version >= 18 &&
        ["minecraft:barrier", "minecraft:light"].contains(particle.type)) {
      _gen = "${Particles.block_marker} ${particle.type}";
    }

    if (texture != null) _gen += ' $texture';
    if (location != null) _gen += ' $location';
    if (delta != null) {
      if (location == null) {
        throw ('If you decide to use the full particle command add a delta, location, speed and count property!');
      }
      _gen += ' $delta $speed $count ';
      _gen += force ? 'force' : 'normal';
      if (player != null) _gen += ' $player';
    }
    return Command('particle ' + _gen);
  }
}
