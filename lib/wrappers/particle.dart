


import 'package:meta/meta.dart';
import 'package:objd/basic/block.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/item.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';

/// The particle command spawns particles in the world to enhance certain graphics.
class Particle extends Widget {

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
  Particle(ParticleType particle,{Location location,Location delta, double speed = 1, int count = 1, bool force}){
    _gen = "minecraft:" + particle.toString().split(".")[1];
    if(location != null) _gen += " " + location.toString();
    if(delta != null){
      if(speed == null || count == null || location == null) throw("If you decide to use the full particle command add a delta, location, speed and count property!");
       _gen += " ${delta} ${speed} ${count}";
      if(force != null) _gen += force ? "force" : "normal";
    } 
  }
  /// For the Block particle(shows block break) there is a named constructor
  Particle.block(Block block,{Location location,Location delta, double speed = 1, int count = 1, bool force}){
    _gen = "minecraft:block ";
    _gen += block.toString();
    if(location != null) _gen += " " + location.toString();
    if(delta != null){
      if(speed == null || count == null || location == null) throw("If you decide to use the full particle command add a delta, location, speed and count property!");
       _gen += " ${delta} ${speed} ${count}";
      if(force != null) _gen += force ? "force" : "normal";
    } 
  }
  /// For the Item particle(shows item break) there is a named constructor
  Particle.item(ItemType item,{@required Location location,Location delta, double speed = 1, int count = 1, bool force}){
    _gen = "minecraft:item ";
    _gen += item.toString();
    if(location != null) _gen += " " + location.toString();
    if(delta != null){
      if(speed == null || count == null) throw("If you decide to use the full particle command add a delta, speed and count property!");
       _gen += " ${delta} ${speed} ${count}";
      if(force != null) _gen += force ? "force" : "normal";
    } 
  }

  @override
  Widget generate(Context context) {
    return Command("particle " + _gen);
  }
}

enum ParticleType {
  ambient_entity_effect,
  angry_villager,
  barrier,
  bubble,
  bubble_column_up,
  bubble_pop,
  campfire_cosy_smoke,
  cloud,
  crit,
  current_down,
  damage_indicator,
  dolphin,
  dragon_breath,
  dripping_lava,
  dripping_water,
  dust,
  effect,
  elder_guardian,
  enchant,
  enchanted_hit,
  end_rod,
  entity_effect,
  explosion,
  explosion_emitter,
  falling_dust,
  firework,
  fishing,
  flame,
  happy_villager,
  heart,
  instant_effect,
  item_slime,
  item_snowball,
  large_smoke,
  lava,
  mycelium,
  nautilus,
  note,
  poof,
  portal,
  rain,
  smoke,
  sneeze,
  spit,
  splash,
  squid_ink,
  sweep_attack,
  totem_of_undying,
  underwater,
  witch
}