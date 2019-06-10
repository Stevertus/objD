import 'dart:convert';

import 'package:objd/basic/area.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/rotation.dart';
import 'package:objd/basic/score.dart';
import 'package:objd/basic/tag.dart';
import 'package:objd/wrappers/execute.dart';
import 'package:meta/meta.dart';
import 'package:objd/wrappers/team.dart';

abstract class EntityClass {
  String selector;
  String toString();
}
class Entity implements EntityClass{
  String selector;
  /// creates an entity with @p
  Entity.Player ({Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}){
        selector = "p";
        _setArguments(null,tags,team,scores,nbt,strNbt,null,area,distance,level,gamemode,name,isRotated,horizontalRotation,verticalRotation,false);
  }
  /// creates an entity with an implicit name
  Entity.PlayerName (String name): this(playerName:name);
  /// creates an entity with @a
  Entity.All ({Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,int limit,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}){
        selector = "a";
        _setArguments(limit,tags,team,scores,nbt,strNbt,null,area,distance,level,gamemode,name,isRotated,horizontalRotation,verticalRotation,false);
  }
  /// creates an entity with @r
  Entity.Random({EntityType type,Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,int limit,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}){
    selector = "r";
    _setArguments(limit,tags,team,scores,nbt,strNbt,type,area,distance,level,gamemode,name,isRotated,horizontalRotation,verticalRotation,false);
  }
  /// creates an entity with @s
  Entity.Selected ({EntityType type, Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}){
    selector = "s";
    _setArguments(null,tags,team,scores,nbt,strNbt,type,area,distance,level,gamemode,name,isRotated,horizontalRotation,verticalRotation,false);
  }
  /// creates a new instance of an already existing Entity object
  Entity.clone(Entity ent){
    this.selector = ent.selector;
    this.playerName = ent.playerName;
    this.arguments = new Map.from(ent.arguments);
  }

  /// Entity is an util class to convert an argument list into the Minecraft Entity format(@p...)
  Entity({
      this.selector = 'e',
      int limit,
      List<dynamic> tags,
      Team team,
      List<Score> scores,
      Map<String,dynamic> nbt,
      String strNbt,
      EntityType type,
      Area area,
      Range distance,
      Range level,
      Gamemode gamemode, 
      String name,
      Rotation isRotated, 
      Range horizontalRotation, 
      Range verticalRotation,
      this.playerName}){

    _setArguments(limit,tags,team,scores,nbt,strNbt,type,area,distance,level,gamemode,name,isRotated,horizontalRotation,verticalRotation,false);
  }
  _setArguments(
      int limit,
      List<dynamic> tags,
      Team team,
      List<Score> scores,
      Map<String,dynamic> nbt,
      String strNbt,
      EntityType type,
      Area area,
      Range distance,
      Range level,
      Gamemode gamemode, 
      String name,
      Rotation isRotated, 
      Range horizontalRotation, 
      Range verticalRotation,
      bool not,
      ){
    var n = "";
    if(not != null && not) n = "!";
    if(distance != null) arguments['distance'] = n+distance.toString();
    if(level != null) arguments['level'] = n+level.toString();
    if(limit != null) arguments['limit'] = n+limit.toString();
    if(type != null) arguments['type'] = type.toString();
    if(gamemode != null) arguments['gamemode'] = n+gamemode.toString().split('.').last;
    if(name != null) arguments['name'] = n+name;
    if(horizontalRotation != null) arguments['y_rotation'] = n+horizontalRotation.toString();
    if(verticalRotation != null) arguments['x_rotation'] = n+verticalRotation.toString();
    if(isRotated != null) {
      arguments['y_rotation'] = n+isRotated.x.toString();
      arguments['x_rotation'] = n+isRotated.y.toString();
    }
    if(area != null) arguments.addAll(area.getRanges());
    if(nbt != null) arguments['nbt'] = n+json.encode(nbt);
    if(strNbt != null && strNbt.isNotEmpty) arguments['nbt'] = n+strNbt;
    if(team != null) arguments['team'] = n+team.name;
    if(tags != null){
      arguments['tag'] = [];
      tags.forEach((tag){
        if(tag is Tag) arguments['tag'].add(n+tag.tag);
        else if(tag is String) arguments['tag'].add(n+tag);
        else throw("Please insert a Tag or String as tag into Entity!");
      });
    }
    if(scores != null){
      String ret = n+"{";
      scores.forEach((score){
        if(score.getMatch().isEmpty) throw("Please insert a match method in the scores value for an entity!");
        ret += score.score + "=" + score.getMatch();
      });
      arguments['scores'] = ret + "}";
    }

  }
  Map arguments = {
    
  };
  String playerName;
  
  Entity sort(Sort sort){
    arguments['sort'] = sort.toString().split('.').last;
    return this;
  }
/// With the not function you can negate specific arguments. It takes in the same options as `Entity()`.
///
/// **Example:**
/// ```dart
/// Say(Entity().not(tags:["mytag"],nbt:{"istrue":1}))
/// ⇒ say @e[tag=!mytag,nbt=!{"istrue":1}]
/// ```
  Entity not({
      int limit,
      List<dynamic> tags,
      Team team,
      List<Score> scores,
      Map<String,dynamic> nbt,
      String strNbt,
      EntityType type,
      Area area,
      Range distance,
      Range level,
      Gamemode gamemode, 
      String name,
      Rotation isRotated, 
      Range horizontalRotation, 
      Range verticalRotation,}){

    _setArguments(limit,tags,team,scores,nbt,strNbt,type,area,distance,level,gamemode,name,isRotated,horizontalRotation,verticalRotation,true);
    return this;
  }

  /// stores the result or success of a [command] in a nbt [path] in your entity
  Execute storeResult(Command command,
      {@required String path, String datatype = "double", double scale = 1, bool useSuccess = false}) {
    assert(path != null || path.isNotEmpty);
    return new Execute(
      children: [command],
      encapsulate: false,
      args: [
        'store ' + (useSuccess ? 'success' : 'result') + ' entity ' + this.toString() + ' ' + path + ' ${datatype} ${scale}',
      ],
    );
  }

  Tag addTag(String tag){
    return Tag(tag,entity: this,value: true);
  }
  Team joinTeam(String team){
    return Team.join(team, this);
  }
  Team leaveTeam(){
    return Team.leave(this);
  }
  For addTags(List<String> tags){
    return For.of(tags.map((tag) => Tag(tag,entity: this,value: true)).toList());
  }
  Tag removeTag(String tag){
    return Tag(tag,entity: this,value: false);
  }

  @override
  String toString([Map arguments]){
    if(arguments == null) arguments = this.arguments;
    if(playerName != null && playerName.isNotEmpty) return playerName;
    String ret = "@" + selector;
    
    if(arguments.length > 0){
      ret += '[';
      arguments.keys.forEach((key){
        if(arguments[key] is List){
          arguments[key].forEach((item){
            ret += _addArg(item,key);
            if(item != arguments[key].last) ret += ',';
          });
          if(key != arguments.keys.last) ret += ',';
        } else {
         ret += _addArg(arguments[key],key);
         if(key != arguments.keys.last) ret += ',';
        }
      });
      ret += ']';
    }
    return ret;
  }
  String _addArg(arg,key) {
    String ret = "";
    
    if(arg != null){
      arg = arg.toString().replaceAll(r"[0-9].0", "");
      ret += key + '=' + arg;
    } 
    return ret;
  }
}

class Range {
  num from,to;
  /// The Range class defines a range of values(e.g 3..10 in vanilla)
  Range({this.from, this.to});

  @override
  String toString(){
    String ret = "0";
    if(from != null && to == null) ret = "$from..";
    if(from == null && to != null) ret = "..$to";
    if(from != null && to != null) ret = "$from..$to";
    return ret.replaceAll(r'[0-9].0', '');
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
/// There is an EntityType for every type_id in minecraft with `EntityType.[type_id]`
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