import 'package:gson/gson.dart';
import 'package:objd/basic/area.dart';
import 'package:objd/basic/selector.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/rotation.dart';
import 'package:objd/basic/score.dart';
import 'package:objd/basic/tag.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/core.dart';
import 'package:objd/wrappers/execute.dart';
import 'package:meta/meta.dart';
import 'package:objd/wrappers/team.dart';

abstract class EntityClass {
  String selector;
  String toString();
}
class Entity implements EntityClass {

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

  /// creates an entity with @s
  Entity.self ({EntityType type, Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}){
    selector = "s";
    _setArguments(null,tags,team,scores,nbt,strNbt,type,area,distance,level,gamemode,name,isRotated,horizontalRotation,verticalRotation,false);
  }

  /// creates an entity from a prepared selector
  Entity.Select (Selector selector){
    this.selector = selector.selector;
    _setArguments(selector.limit,selector.tags,selector.team,selector.scores,selector.nbt,selector.strNbt,selector.type,selector.area,selector.distance,selector.level,selector.gamemode,selector.name,selector.isRotated,selector.horizontalRotation,selector.verticalRotation,false);
    if(selector.sorting != null) {
      sort(selector.sorting);
    }
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

  /// Modifies the properties of the existing Entity and applies new arguments(same as constructors)
  setValues({int limit,
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
    if(type != null) arguments['type'] = n + type.toString();
    if(gamemode != null) arguments['gamemode'] = n+gamemode.toString().split('.').last;
    if(name != null) arguments['name'] = n+name;
    if(horizontalRotation != null) arguments['y_rotation'] = n+horizontalRotation.toString();
    if(verticalRotation != null) arguments['x_rotation'] = n+verticalRotation.toString();
    if(isRotated != null) {
      arguments['y_rotation'] = n+isRotated.x.toString();
      arguments['x_rotation'] = n+isRotated.y.toString();
    }
    if(area != null) arguments.addAll(area.getRanges());
    if(nbt != null) arguments['nbt'] = n+gson.encode(nbt);
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
      for(int i = 0; i < scores.length; i++) {
        Score score = scores[i];
        if(score.getMatch().isEmpty) throw("Please insert a match method in the scores value for an entity!");
        ret += score.score + "=" + score.getMatch() + (i < scores.length - 1 ? "," : "");
      }
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
        ['store ' + (useSuccess ? 'success' : 'result') + ' entity ' + this.toString() + ' ' + path + ' ${datatype} ${scale}'],
      ],
    );
  }
  
  /// Creates a new Entity based on the existing one and applies new arguments. (same as constructors)
  ///
  /// **Example:**
  /// ```dart
  /// Entity ent1 = Entity(type:EntityType.sheep)
  /// Entity ent2 = ent1.copyWith(distance:Range(to:1))
  /// ``` 
  Entity copyWith({
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
      return Entity.clone(this)._setArguments(limit, tags, team, scores, nbt, strNbt, type, area, distance, level, gamemode, name, isRotated, horizontalRotation, verticalRotation, false);
  }

  /**
   * Generates a Kill Widget
   * ```dart
   * entity.kill().queue()
   * ```
   */
  Kill kill() => StraitWidget.builder.create(Kill(this));

  /**
   * Generates a Raycast Widget
   * ```dart
   * entity.raycast(onhit: [
   *  ...
   * ]).queue()
   * ```
   */
  Raycast raycast({int max, double step = 1, Block through = Block.air, Widget Function(Function,Function) ray, List<Widget> onhit, String scoreName = "objd_count"}) => StraitWidget.builder.create(Raycast(this,max: max, step: step,through: through, ray: ray, onhit: onhit, scoreName: scoreName));

  /**
   * Generates a Teleport Widget
   * ```dart
   * entity.teleport(Location.here()).queue()
   * ```
   */
  Teleport teleport({Location location, Entity entity, dynamic facing, Rotation rot}) {

    //Teleport to entity
    if(entity != null && facing != null) return StraitWidget.builder.create(Teleport.entity(this, to: entity, facing: facing));
    if(entity != null) return StraitWidget.builder.create(Teleport.entity(this, to: entity));

    // Teleport to Location
    if(location != null && facing != null && rot != null) return StraitWidget.builder.create(Teleport(this, to: location, facing: facing, rot: rot));
    if(location != null && facing != null) return StraitWidget.builder.create(Teleport(this, to: location, facing: facing));
    if(location != null && rot != null) return StraitWidget.builder.create(Teleport(this, to: location, rot: rot));
    if(location != null) return StraitWidget.builder.create(Teleport(this, to: location));
    throw new Error();
  }

  /**
   * Generates a Tp Widget
   * ```dart
   * entity.tp(Location.here()).queue()
   * ```
   */
  Tp tp({Location location, Entity entity, dynamic facing, Rotation rot}) {

    //Teleport to entity
    if(entity != null && facing != null) return StraitWidget.builder.create(Tp.entity(this, to: entity, facing: facing));
    if(entity != null) return StraitWidget.builder.create(Tp.entity(this, to: entity));

    // Teleport to Location
    if(location != null && facing != null && rot != null) return StraitWidget.builder.create(Tp(this, to: location, facing: facing, rot: rot));
    if(location != null && facing != null) return StraitWidget.builder.create(Tp(this, to: location, facing: facing));
    if(location != null && rot != null) return StraitWidget.builder.create(Tp(this, to: location, rot: rot));
    if(location != null) return StraitWidget.builder.create(Tp(this, to: location));
    throw new Error();
  }

  // Data Commands

  /**
   * Use #dataMerge, #dataGet, #dataRemove and #dataModify instead
   */
  @Deprecated('Use #dataMerge, #dataGet, #dataRemove and #dataModify instead')
  Data data({Map<String,dynamic> nbt, String type = "merge"}) {
    if((this.selector == "a" || this.selector == "r" || this.selector == "p" || this.arguments["type"] == "minecraft:player" || this.arguments["type"] == "player")) throw("Cannot modify a player's data");
    if((this.selector == "a" || this.selector == "e") && (this.arguments["limit"] == null || this.arguments["limit"] != "1")) throw("Cannot work with data of multiple entities in data command");
    return StraitWidget.builder.create(Data(this,nbt: nbt, type: type));
  }

  /**
   * Generates a Data Widget
   * ```dart
   * entity.dataMerge(nbt: {"CustomNameVisible":true}).queue()
   * ```
   */
  Data dataMerge({Map<String,dynamic> nbt, String strNbt}) {
    if((this.selector == "a" || this.selector == "r" || this.selector == "p" || this.arguments["type"] == "minecraft:player" || this.arguments["type"] == "player")) throw("Cannot modify a player's data");
    if((this.selector == "a" || this.selector == "e") && (this.arguments["limit"] == null || this.arguments["limit"] != "1")) throw("Cannot work with data of multiple entities in data command");
    return StraitWidget.builder.create(Data.merge(this,nbt: nbt, strNbt: strNbt));
  }

  /**
   * Generates a Data Widget
   * ```dart
   * entity.dataGet(path: "CustomName").queue()
   * ```
   */
  Data dataGet({@required String path, num scale = 1}) {
    if((this.selector == "a" || this.selector == "e") && (this.arguments["limit"] == null || this.arguments["limit"] != "1")) throw("Cannot work with data of multiple entities in data command");
    return StraitWidget.builder.create(Data.get(this, path: path, scale: scale));
  }

  /**
   * Generates a Data Widget
   * ```dart
   * entity.dataRemove(path: "CustomName").queue()
   * ```
   */
  Data dataRemove({@required String path}) {
    if((this.selector == "a" || this.selector == "r" || this.selector == "p" || this.arguments["type"] == "minecraft:player" || this.arguments["type"] == "player")) throw("Cannot modify a player's data");
    if((this.selector == "a" || this.selector == "e") && (this.arguments["limit"] == null || this.arguments["limit"] != "1")) throw("Cannot work with data of multiple entities in data command");
    return StraitWidget.builder.create(Data.remove(this, path: path));
  }
  
  /**
   * Generates a Data Widget
   * ```dart
   * entity.dataModify(path: "CustomName", modify: ...).queue()
   * ```
   */
  Data dataModify({@required String path, @required DataModify modify}) {
    if((this.selector == "a" || this.selector == "r" || this.selector == "p" || this.arguments["type"] == "minecraft:player" || this.arguments["type"] == "player")) throw("Cannot modify a player's data");
    if((this.selector == "a" || this.selector == "e") && (this.arguments["limit"] == null || this.arguments["limit"] != "1")) throw("Cannot work with data of multiple entities in data command");
    return StraitWidget.builder.create(Data.modify(this, path: path, modify: modify));
  }

  /**
   * Generates a Execute Widget (execute as the entity)
   * ```dart
   * entity.execute().run(Say("hi")).queue()
   * ```
   */
  Execute execute({List<Widget> children = null, String targetFilePath="objd", String targetFileName, bool encapsulate = true})
    => as(children: children, targetFilePath: targetFilePath, targetFileName: targetFileName, encapsulate: encapsulate);

  /**
   * Generates a Execute Widget (execute as the entity)
   * ```dart
   * entity.exec().run(Say("hi")).queue()
   * ```
   * short form for `entity.execute()`
   */
  Execute exec({List<Widget> children = null, String targetFilePath="objd", String targetFileName, bool encapsulate = true})
    => as(children: children, targetFilePath: targetFilePath, targetFileName: targetFileName, encapsulate: encapsulate);

  /**
   * Generates a Execute Widget strait (execute as the entity)
   * ```dart
   * entity.executeStrait(run: (List<Widget> cont) {
   *  ...
   * }).queue()
   * ```
   */
  Execute executeStrait({@required Function(List<Widget>) run, String targetFilePath="objd", String targetFileName, bool encapsulate = true})
    => asStrait(run: run, targetFilePath: targetFilePath, targetFileName: targetFileName, encapsulate: encapsulate);

  /**
   * Generates a Execute Widget strait (execute as the entity)
   * ```dart
   * entity.execStrait(run: (List<Widget> cont) {
   *  ...
   * }).queue()
   * ```
   * short form for `entity.executeStrait()`
   */
  Execute execStrait({@required Function(List<Widget>) run, String targetFilePath="objd", String targetFileName, bool encapsulate = true})
    => asStrait(run: run, targetFilePath: targetFilePath, targetFileName: targetFileName, encapsulate: encapsulate);

  /**
   * Generates a Execute Widget (execute as and at the entity)
   * ```dart
   * entity.asat().run(Particle(ParticleType.flame)).queue()
   * ```
   */
  Execute asat({List<Widget> children = null, String targetFilePath="objd", String targetFileName, bool encapsulate = true}) 
    => StraitWidget.builder.create(Execute(children: children, targetFilePath: targetFilePath, targetFileName: targetFileName, encapsulate: encapsulate).asat(this));

  /**
   * Generates a Execute Widget strait (execute as and at the entity)
   * ```dart
   * entity.asatStrait(run: (List<Widget> cont) {
   *  ...
   * }).queue()
   * ```
   */
  Execute asatStrait({@required Function(List<Widget>) run, String targetFilePath="objd", String targetFileName, bool encapsulate = true})
    => StraitWidget.builder.create(Execute.strait(run: run, targetFilePath: targetFilePath, targetFileName: targetFileName, encapsulate: encapsulate).asat(this));

  /**
   * Generates a Execute Widget (execute as the entity)
   * ```dart
   * entity.as().run(Say("hi")).queue()
   * ```
   */
  Execute as({List<Widget> children = null, String targetFilePath="objd", String targetFileName, bool encapsulate = true}) 
    => StraitWidget.builder.create(Execute(children: children, targetFilePath: targetFilePath, targetFileName: targetFileName, encapsulate: encapsulate).as(this));

  /**
   * Generates a Execute Widget strait (execute as the entity)
   * ```dart
   * entity.asStrait(run: (List<Widget> cont) {
   *  ...
   * }).queue()
   * ```
   */
  Execute asStrait({@required Function(List<Widget>) run, String targetFilePath="objd", String targetFileName, bool encapsulate = true})
    => StraitWidget.builder.create(Execute.strait(run: run, targetFilePath: targetFilePath, targetFileName: targetFileName, encapsulate: encapsulate).as(this));

  /**
   * Generates a Execute Widget (execute at the entity)
   * ```dart
   * entity.at().run(Particle(ParticleType.flame)).queue()
   * ```
   */
  Execute at({List<Widget> children = null, String targetFilePath="objd", String targetFileName, bool encapsulate = true}) 
    => StraitWidget.builder.create(Execute(children: children, targetFilePath: targetFilePath, targetFileName: targetFileName, encapsulate: encapsulate).at(this));

  /**
   * Generates a Execute Widget strait (execute at the entity)
   * ```dart
   * entity.atStrait(run: (List<Widget> cont) {
   *  ...
   * }).queue()
   * ```
   */
  Execute atStrait({@required Function(List<Widget>) run, String targetFilePath="objd", String targetFileName, bool encapsulate = true})
    => StraitWidget.builder.create(Execute.strait(run: run, targetFilePath: targetFilePath, targetFileName: targetFileName, encapsulate: encapsulate).at(this));
  
  /**
   * Adds a tag to the entity
   * ```dart
   * entity.addTag("objDTest").queue()
   * ```
   */
  Tag addTag(String tag) => StraitWidget.builder.create(Tag(tag,entity: this,value: true));
  
  /**
   * Adds tags to the entity
   * ```dart
   * entity.addTags(["objDTest","objDTest2"]).queue()
   * ```
   */
  For addTags(List<String> tags) => StraitWidget.builder.create(For.of(tags.map((tag) => Tag(tag,entity: this,value: true)).toList()));
  
  /**
   * Removes a tag from the entity
   * ```dart
   * entity.removeTag("objDTest").queue()
   * ```
   */
  Tag removeTag(String tag) => StraitWidget.builder.create(Tag(tag,entity: this,value: false));
  
  /**
   * Removes tags from the entity
   * ```dart
   * entity.removeTags(["objDTest","objDTest2"]).queue()
   * ```
   */
  For removeTags(List<String> tags) => StraitWidget.builder.create(For.of(tags.map((tag) => Tag(tag,entity: this,value: false)).toList()));

  /**
   * The entity joins a team
   * ```dart
   * entity.joinTeam("red").queue()
   * ```
   */
  Team joinTeam(String team) => StraitWidget.builder.create(Team.join(team, this));

  /**
   * The entity leaves a team
   * ```dart
   * entity.leaveTeam("red").queue()
   * ```
   */
  Team leaveTeam() => StraitWidget.builder.create(Team.leave(this));

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
  num from,to,exact;
  /// The Range class defines a range of values(e.g 3..10 in vanilla)
  Range({this.from, this.to,this.exact});

  @override
  String toString() {
    String ret = "0";
    if(exact != null) ret = exact.toString();
    else if(from != null && to == null) ret = "$from..";
    else if(from == null && to != null) ret = "..$to";
    else if(from != null && to != null) ret = "$from..$to";
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

  bool operator ==(dynamic other) {
    if(other is EntityType && other.type == this.type) {
      return true;
    }
    if(other is String && other == this.type) {
      return true;
    }
    return false;
  }

  @override
    String toString() {
      return type;
    }
}