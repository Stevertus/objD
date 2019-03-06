


import 'package:objd/basic/block.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/item.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';

class Particle extends Widget {

  String _gen;

  Particle(ParticleType particle,{Location location,Location delta, int speed = 1, int count = 1, bool force}){
    _gen = "minecraft:" + particle.toString().split(".")[1];
    if(location != null) _gen += " " + location.toString();
    if(delta != null){
      if(speed == null || speed == null || count == null) throw("If you decide to use the full particle command add a delta, speed and count property!");
      _gen += " " + delta.toString();
      _gen += " " + speed.toString();
      _gen += " " + count.toString();
      if(force != null) _gen += force ? "force" : "normal";
    } 
  }
  Particle.block(Block block,{Location location,Location delta, int speed = 1, int count = 1, bool force}){
    _gen = "minecraft:block ";
    _gen += block.toString();
    if(location != null) _gen += " " + location.toString();
    if(delta != null){
      if(speed == null || speed == null || count == null) throw("If you decide to use the full particle command add a delta, speed and count property!");
      _gen += " " + delta.toString();
      _gen += " " + speed.toString();
      _gen += " " + count.toString();
      if(force != null) _gen += force ? "force" : "normal";
    } 
  }
  Particle.item(Item item,{Location location,Location delta, int speed = 1, int count = 1, bool force}){
    _gen = "minecraft:item ";
    _gen += item.toString();
    if(location != null) _gen += " " + location.toString();
    if(delta != null){
      if(speed == null || speed == null || count == null) throw("If you decide to use the full particle command add a delta, speed and count property!");
      _gen += " " + delta.toString();
      _gen += " " + speed.toString();
      _gen += " " + count.toString();
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