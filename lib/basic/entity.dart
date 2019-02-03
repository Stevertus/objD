import 'package:objd/basic/widget.dart';
abstract class EntityClass {
  String selector;
  String getString();
}
class Entity implements EntityClass{
  String selector;
  static Function Player = ({Range distance,Range level, Gamemode gamemode, String name, Range horizontalRotation, Range verticalRotation}){
    return Entity(selector: 'p',distance:distance,level: level,gamemode: gamemode,name: name,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);
  };
  static Function All = ({Range distance,int limit,Range level, Gamemode gamemode, String name, Range horizontalRotation, Range verticalRotation}){
    return Entity(selector: 'a',limit:limit,distance:distance,level: level,gamemode: gamemode,name: name,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);
  };
  static Function Random = ({EntityType type,Range distance,int limit,Range level, Gamemode gamemode, String name, Range horizontalRotation, Range verticalRotation}){
    return Entity(selector: 'r',type:type,limit:limit,distance:distance,level: level,gamemode: gamemode,name: name,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);
  };
  static Function Selected = ({EntityType type, Range distance,Range level, Gamemode gamemode, String name, Range horizontalRotation, Range verticalRotation}){
    return Entity(selector: 's',type:type,distance:distance,level: level,gamemode: gamemode,name: name,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);
  };
  // Todo: implement Scores, Tags, Area, Nbt
  Entity({
      this.selector = 'e',
      int limit,
      EntityType type,
      Range distance,
      Range level,
      Gamemode gamemode, 
      String name, 
      Range horizontalRotation, 
      Range verticalRotation}){

    if(distance != null) arguments['distance'] = distance.toString();
    if(level != null) arguments['level'] = level.toString();
    if(limit != null) arguments['limit'] = limit.toString();
    if(type != null) arguments['type'] = type.toString();
    if(gamemode != null) arguments['gamemode'] = gamemode.toString().split('.').last;
    if(name != null) arguments['name'] = name;
    if(horizontalRotation != null) arguments['horizontalRotation'] = horizontalRotation.toString();
    if(verticalRotation != null) arguments['verticalRotation'] = verticalRotation.toString();
  }
  Map arguments = {
    
  };
  Entity sort(Sort sort){
    arguments['sort'] = sort.toString().split('.').last;
    return this;
  }
  String getString(){
    String ret = "@" + selector;
    if(arguments.length > 0){
      ret += '[';
      arguments.keys.forEach((key){
        String arg = arguments[key];
        if(arg != null) ret += key + '=' + arg;
        if(arguments.keys.toList().indexOf(key) < arguments.keys.length -1) ret += ',';
      });
      ret += ']';
    }
    return ret;
  }
}

class Range {
  num from,to;
  Range({this.from = 0, this.to});

  String getString(){
    if(from > 0 && to == null) return "$from..";
    if(from == 0 && to > 0) return "..$to";
    if(from > 0 && to > 0) return "$from..$to";
    return "0";
  }
}
enum Gamemode{
  creative,
  adventure,
  survival,
  spectator
}
enum Sort{
  random,
  furthest,
  nearest,
  arbitrary
}
class EntityType {
  // throwable
  static EntityType armor_stand = EntityType('armor_stand');
  static EntityType area_effect_cloud = EntityType('area_effect_cloud');
  static EntityType player = EntityType('player');
  static EntityType boat = EntityType('boat');
  static EntityType minecart	 = EntityType('minecart');
  static EntityType chest_minecart	 = EntityType('chest_minecart');
  static EntityType furnace_minecart	 = EntityType('furnace_minecart');
  static EntityType tnt_minecart	 = EntityType('tnt_minecart');
  static EntityType hopper_minecart	 = EntityType('hopper_minecart');
  static EntityType spawner_minecart	 = EntityType('spawner_minecart');
  static EntityType item	 = EntityType('item');
  static EntityType experience_orb	 = EntityType('experience_orb');
  static EntityType experience_bottle	 = EntityType('experience_bottle');
  static EntityType arrow	 = EntityType('arrow');
  static EntityType spectral_arrow	 = EntityType('spectral_arrow');
  static EntityType trident	 = EntityType('trident');
  static EntityType snowball	 = EntityType('snowball');
  static EntityType egg	 = EntityType('egg');
  static EntityType llama_spit	 = EntityType('llama_spit');
  static EntityType ender_pearl	 = EntityType('ender_pearl');
  static EntityType eye_of_ender	 = EntityType('eye_of_ender');
  static EntityType fireworks_rocket	 = EntityType('fireworks_rocket');
  static EntityType tnt	 = EntityType('tnt');
  static EntityType falling_block	 = EntityType('falling_block');
  static EntityType fishing_bobber	 = EntityType('fishing_bobber');
  static EntityType leash_knot	 = EntityType('leash_knot');
  static EntityType painting	 = EntityType('painting');
  static EntityType item_frame	 = EntityType('item_frame');
  static EntityType fireball	 = EntityType('fireball');
  static EntityType shulker_bullet	 = EntityType('shulker_bullet');
  static EntityType end_crystal	 = EntityType('end_crystal');
  static EntityType evoker_fangs	 = EntityType('evoker_fangs');
  static EntityType potion = EntityType('potion');

  // hostile
  static EntityType elder_guardian	 = EntityType('elder_guardian');
  static EntityType wither_skeleton	 = EntityType('wither_skeleton');
  static EntityType stray	 = EntityType('stray');
  static EntityType husk	 = EntityType('husk');
  static EntityType zombie_villager	 = EntityType('zombie_villager');
  static EntityType vex	 = EntityType('vex');
  static EntityType vindicator	 = EntityType('vindicator');
  static EntityType illager_beast	 = EntityType('illager_beast');
  static EntityType illusioner	 = EntityType('illusioner');
  static EntityType pillager	 = EntityType('pillager');
  static EntityType creeper	 = EntityType('creeper');
  static EntityType skeleton	 = EntityType('skeleton');
  static EntityType spider	 = EntityType('spider');
  static EntityType giant	 = EntityType('giant');
  static EntityType zombie	 = EntityType('zombie');
  static EntityType slime	 = EntityType('slime');
  static EntityType ghast	 = EntityType('ghast');
  static EntityType zombie_pigman	 = EntityType('zombie_pigman');
  static EntityType enderman	 = EntityType('enderman');
  static EntityType cave_spider	 = EntityType('cave_spider');
  static EntityType silverfish	 = EntityType('silverfish');
  static EntityType blaze	 = EntityType('blaze');
  static EntityType magma_cube = EntityType('magma_cube');
  static EntityType ender_dragon = EntityType('ender_dragon');
  static EntityType wither = EntityType('wither');
  static EntityType wither_skull = EntityType('wither_skull');
  static EntityType witch = EntityType('witch');
  static EntityType endermite = EntityType('endermite');
  static EntityType guardian = EntityType('guardian');
  static EntityType shulker = EntityType('shulker');
  static EntityType dragon_fireball = EntityType('dragon_fireball');
  static EntityType drowned = EntityType('drowned');

  // passive
  static EntityType skeleton_horse = EntityType('skeleton_horse');
  static EntityType zombie_horse = EntityType('zombie_horse');
  static EntityType donkey = EntityType('donkey');
  static EntityType mule = EntityType('mule');
  static EntityType bat = EntityType('bat');
  static EntityType pig = EntityType('pig');
  static EntityType sheep = EntityType('sheep');
  static EntityType cow = EntityType('cow');
  static EntityType chicken = EntityType('chicken');
  static EntityType squid = EntityType('squid');
  static EntityType wolf = EntityType('wolf');
  static EntityType mooshroom = EntityType('mooshroom');
  static EntityType snowman = EntityType('snowman');
  static EntityType ocelot = EntityType('ocelot');
  static EntityType iron_golem = EntityType('iron_golem');
  static EntityType horse = EntityType('horse');
  static EntityType rabbit = EntityType('rabbit');
  static EntityType polar_bear = EntityType('polar_bear');
  static EntityType llama = EntityType('llama');
  static EntityType parrot = EntityType('parrot');
  static EntityType villager = EntityType('villager');
  static EntityType cod = EntityType('cod');
  static EntityType salmon = EntityType('salmon');
  static EntityType tropical_fish = EntityType('tropical_fish');
  static EntityType turtle = EntityType('turtle');
  static EntityType dolphin = EntityType('dolphin');
  static EntityType panda = EntityType('panda');


  String type;
  EntityType(this.type);
  @override
    String toString() {
      return type;
    }
}