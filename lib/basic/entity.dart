import 'package:objd/basic/location.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/objD/execute.dart';
import 'package:meta/meta.dart';

abstract class EntityClass {
  String selector;
  String toString();
}
class Entity implements EntityClass{
  String selector;
  static Function Player = ({Range distance,Range level, Gamemode gamemode, List<Location> area, String name, Range horizontalRotation, Range verticalRotation}){
    return Entity(selector: 'p',distance:distance,level: level,area: area,gamemode: gamemode,name: name,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);
  };
  static Function PlayerName = (String name){
    return Entity(playerName: name);
  };
  static Function All = ({Range distance,int limit,Range level, Gamemode gamemode, List<Location> area, String name, Range horizontalRotation, Range verticalRotation}){
    return Entity(selector: 'a',limit:limit,distance:distance,level: level,area: area,gamemode: gamemode,name: name,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);
  };
  static Function Random = ({EntityType type,Range distance,int limit,Range level, Gamemode gamemode, List<Location> area, String name, Range horizontalRotation, Range verticalRotation}){
    return Entity(selector: 'r',type:type,limit:limit,distance:distance,level: level,area: area,gamemode: gamemode,name: name,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);
  };
  static Function Selected = ({EntityType type, Range distance,Range level, Gamemode gamemode, List<Location> area, String name, Range horizontalRotation, Range verticalRotation}){
    return Entity(selector: 's',type:type,distance:distance,level: level,area: area,gamemode: gamemode,name: name,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);
  };
  // Todo: implement Scores, Tags, Area, Nbt
  Entity({
      this.selector = 'e',
      int limit,
      EntityType type,
      List<Location> area,
      Range distance,
      Range level,
      Gamemode gamemode, 
      String name, 
      Range horizontalRotation, 
      Range verticalRotation,
      this.playerName}){

    if(distance != null) arguments['distance'] = distance.toString();
    if(level != null) arguments['level'] = level.toString();
    if(limit != null) arguments['limit'] = limit.toString();
    if(type != null) arguments['type'] = type.toString();
    if(gamemode != null) arguments['gamemode'] = gamemode.toString().split('.').last;
    if(name != null) arguments['name'] = name;
    if(horizontalRotation != null) arguments['horizontalRotation'] = horizontalRotation.toString();
    if(verticalRotation != null) arguments['verticalRotation'] = verticalRotation.toString();
    if(area != null && area.length > 1){
      var from = area[0];
      var to = area[1];
      arguments['x'] = min(from.x, to.x).toString();
      arguments['y'] = min(from.y, to.y).toString();
      arguments['z'] = min(from.y, to.y).toString();
      if(from.x != null && to.x != null && abs(from.x - to.x) > 0) arguments['dx'] = abs(from.x - to.x).toString();
      if(from.y != null && to.y != null && abs(from.y - to.y) > 0) arguments['dy'] = abs(from.y - to.y).toString();
      if(from.z != null && to.z != null && abs(from.z - to.z) > 0) arguments['dz'] = abs(from.z - to.z).toString();
    }
  }
  Map arguments = {
    
  };
  String playerName;
  Entity sort(Sort sort){
    arguments['sort'] = sort.toString().split('.').last;
    return this;
  }

  /// stores the result or success of a [command] in a nbt [path] in your entity
  Execute storeResult(Command command,
      {@required String path, bool useSuccess = false}) {
    assert(path == null && path.isEmpty);
    return new Execute(
      children: [command],
      encapsulate: false,
      args: [
        'store ' + (useSuccess ? 'success' : 'result') + ' entity ' + this.toString() + ' ' + path,
      ],
    );
  }

  @override
  String toString(){
    if(playerName != null && playerName.isNotEmpty) return playerName;
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

abs(num val){
  if(val != null && val.isNegative) return - val;
  return val;
}
min(num one,num two){
  if(one == null) return two;
  if(two == null) return one;
  if(one > two) return two;
  return one;
}

class Range {
  num from,to;
  Range({this.from, this.to});

  @override
  String toString(){
    String ret = "0";
    if(from != null && to == null) ret = "$from..";
    if(from == null && to != null) ret = "..$to";
    if(from != null && to != null) ret = "$from..$to";
    return ret.replaceAll('.0', '');
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
  static const EntityType armor_stand = const EntityType('armor_stand');
  static const EntityType area_effect_cloud = const EntityType('area_effect_cloud');
  static const EntityType player = const EntityType('player');
  static const EntityType boat = const EntityType('boat');
  static const EntityType minecart	 = const EntityType('minecart');
  static const EntityType chest_minecart	 = const EntityType('chest_minecart');
  static const EntityType furnace_minecart	 = const EntityType('furnace_minecart');
  static const EntityType tnt_minecart	 = const EntityType('tnt_minecart');
  static const EntityType hopper_minecart	 = const EntityType('hopper_minecart');
  static const EntityType spawner_minecart	 = const EntityType('spawner_minecart');
  static const EntityType item	 = const EntityType('item');
  static const EntityType experience_orb	 = const EntityType('experience_orb');
  static const EntityType experience_bottle	 = const EntityType('experience_bottle');
  static const EntityType arrow	 = const EntityType('arrow');
  static const EntityType spectral_arrow	 = const EntityType('spectral_arrow');
  static const EntityType trident	 = const EntityType('trident');
  static const EntityType snowball	 = const EntityType('snowball');
  static const EntityType egg	 = const EntityType('egg');
  static const EntityType llama_spit	 = const EntityType('llama_spit');
  static const EntityType ender_pearl	 = const EntityType('ender_pearl');
  static const EntityType eye_of_ender	 = const EntityType('eye_of_ender');
  static const EntityType fireworks_rocket	 = const EntityType('fireworks_rocket');
  static const EntityType tnt	 = const EntityType('tnt');
  static const EntityType falling_block	 = const EntityType('falling_block');
  static const EntityType fishing_bobber	 = const EntityType('fishing_bobber');
  static const EntityType leash_knot	 = const EntityType('leash_knot');
  static const EntityType painting	 = const EntityType('painting');
  static const EntityType item_frame	 = const EntityType('item_frame');
  static const EntityType fireball	 = const EntityType('fireball');
  static const EntityType shulker_bullet	 = const EntityType('shulker_bullet');
  static const EntityType end_crystal	 = const EntityType('end_crystal');
  static const EntityType evoker_fangs	 = const EntityType('evoker_fangs');
  static const EntityType potion = const EntityType('potion');

  // hostile
  static const EntityType elder_guardian	 = const EntityType('elder_guardian');
  static const EntityType wither_skeleton	 = const EntityType('wither_skeleton');
  static const EntityType stray	 = const EntityType('stray');
  static const EntityType husk	 = const EntityType('husk');
  static const EntityType zombie_villager	 = const EntityType('zombie_villager');
  static const EntityType vex	 = const EntityType('vex');
  static const EntityType vindicator	 = const EntityType('vindicator');
  static const EntityType illager_beast	 = const EntityType('illager_beast');
  static const EntityType illusioner	 = const EntityType('illusioner');
  static const EntityType pillager	 = const EntityType('pillager');
  static const EntityType creeper	 = const EntityType('creeper');
  static const EntityType skeleton	 = const EntityType('skeleton');
  static const EntityType spider	 = const EntityType('spider');
  static const EntityType giant	 = const EntityType('giant');
  static const EntityType zombie	 = const EntityType('zombie');
  static const EntityType slime	 = const EntityType('slime');
  static const EntityType ghast	 = const EntityType('ghast');
  static const EntityType zombie_pigman	 = const EntityType('zombie_pigman');
  static const EntityType enderman	 = const EntityType('enderman');
  static const EntityType cave_spider	 = const EntityType('cave_spider');
  static const EntityType silverfish	 = const EntityType('silverfish');
  static const EntityType blaze	 = const EntityType('blaze');
  static const EntityType magma_cube = const EntityType('magma_cube');
  static const EntityType ender_dragon = const EntityType('ender_dragon');
  static const EntityType wither = const EntityType('wither');
  static const EntityType wither_skull = const EntityType('wither_skull');
  static const EntityType witch = const EntityType('witch');
  static const EntityType endermite = const EntityType('endermite');
  static const EntityType guardian = const EntityType('guardian');
  static const EntityType shulker = const EntityType('shulker');
  static const EntityType dragon_fireball = const EntityType('dragon_fireball');
  static const EntityType drowned = const EntityType('drowned');

  // passive
  static const EntityType skeleton_horse = const EntityType('skeleton_horse');
  static const EntityType zombie_horse = const EntityType('zombie_horse');
  static const EntityType donkey = const EntityType('donkey');
  static const EntityType mule = const EntityType('mule');
  static const EntityType bat = const EntityType('bat');
  static const EntityType pig = const EntityType('pig');
  static const EntityType sheep = const EntityType('sheep');
  static const EntityType cow = const EntityType('cow');
  static const EntityType chicken = const EntityType('chicken');
  static const EntityType squid = const EntityType('squid');
  static const EntityType wolf = const EntityType('wolf');
  static const EntityType mooshroom = const EntityType('mooshroom');
  static const EntityType snowman = const EntityType('snowman');
  static const EntityType ocelot = const EntityType('ocelot');
  static const EntityType iron_golem = const EntityType('iron_golem');
  static const EntityType horse = const EntityType('horse');
  static const EntityType rabbit = const EntityType('rabbit');
  static const EntityType polar_bear = const EntityType('polar_bear');
  static const EntityType llama = const EntityType('llama');
  static const EntityType parrot = const EntityType('parrot');
  static const EntityType villager = const EntityType('villager');
  static const EntityType cod = const EntityType('cod');
  static const EntityType salmon = const EntityType('salmon');
  static const EntityType tropical_fish = const EntityType('tropical_fish');
  static const EntityType turtle = const EntityType('turtle');
  static const EntityType dolphin = const EntityType('dolphin');
  static const EntityType panda = const EntityType('panda');


  final String type;
  const EntityType(this.type);
  @override
    String toString() {
      return type;
    }
}