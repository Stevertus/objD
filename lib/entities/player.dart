import 'package:meta/meta.dart';
import 'package:objd/basic/score.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/wrappers/data.dart';
import 'package:objd/wrappers/team.dart';
import 'package:objd/wrappers/widgets.dart';
import 'living_entity.dart';

class Player extends LivingEntity {

  /// @see ./entity.dart
  Player.Player ({Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}) :
    this(selector: 'p',distance:distance,tags:tags,team:team,scores:scores,strNbt:strNbt,nbt:nbt,level: level,area: area,gamemode: gamemode,name: name,isRotated:isRotated,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);

  /// creates player using @a selector
  Player.All ({Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,int limit,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}): 
    this(selector: 'a',limit:limit,distance:distance,tags:tags,team:team,strNbt:strNbt,nbt:nbt,scores:scores,level: level,area: area,gamemode: gamemode,name: name,isRotated:isRotated,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);

  /// creates player using @r selector
  Player.Random({EntityType type,Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,int limit,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}): 
    this(selector: 'r',type:type,limit:limit,distance:distance,tags:tags,team:team,strNbt:strNbt,nbt:nbt,scores:scores,level: level,area: area,gamemode: gamemode,name: name,isRotated:isRotated,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);

  /// creates player using @s selector
  Player.Selected ({EntityType type, Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}):
    this(selector: 's',type:type,distance:distance,tags:tags,team:team,strNbt:strNbt,nbt:nbt,scores:scores,level: level,area: area,gamemode: gamemode,name: name,isRotated:isRotated,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);

  /// creates player using @s selector
  Player.self ({EntityType type, Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}):
    this(selector: 's',type:type,distance:distance,tags:tags,team:team,strNbt:strNbt,nbt:nbt,scores:scores,level: level,area: area,gamemode: gamemode,name: name,isRotated:isRotated,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);

  /// creates player using @a selector
  Player({String selector = 'a', int limit, List<dynamic> tags, Team team, List<Score> scores, Map<String,dynamic> nbt, String strNbt, EntityType type, Area area, Range distance, Range level, Gamemode gamemode, String name, Rotation isRotated, Range horizontalRotation, Range verticalRotation, String playerName}) : 
    super(selector: selector, limit: limit, tags: tags, team: team, scores: scores, nbt: nbt, strNbt: strNbt, type: type, area: area, distance: distance, level: level, gamemode: gamemode, name: name, isRotated: isRotated, horizontalRotation: horizontalRotation, verticalRotation: verticalRotation, playerName: playerName);

  /**
   * Waring, dont use this function, you cannot modify a player's data, it will throw an exception
   * ```dart
   * => throw ("Cannot modify a player's data")
   * ```
   * **Throws Exception:** Cannot modify a player's data
   */
  @override
  @Deprecated("Cannot modify a player's data")
  Data dataMerge({Map<String,dynamic> nbt, String strNbt}) => throw ("Cannot modify a player's data");
  
  /**
   * Waring, dont use this function, you cannot modify a player's data, it will throw an exception
   * ```dart
   * => throw ("Cannot modify a player's data")
   * ```
   * **Throws Exception:** Cannot modify a player's data
   */
  @override
  @Deprecated("Cannot modify a player's data")
  Data dataRemove({@required String path}) => throw ("Cannot modify a player's data");
  
  /**
   * Waring, dont use this function, you cannot modify a player's data, it will throw an exception
   * ```dart
   * => throw ("Cannot modify a player's data")
   * ```
   * **Throws Exception:** Cannot modify a player's data
   */
  @override
  @Deprecated("Cannot modify a player's data")
  Data dataModify({@required String path,@required DataModify modify}) => throw ("Cannot modify a player's data");

  /**
   * Generates a Give Widget
   * ```dart
   * player.give(item).queue()
   * ```
   */
  Give give(Item item) => StraitWidget.builder.create(Give(this, item: item));

  /**
   * Generates a ReplaceItem Widget
   * ```dart
   * player.replaceitem(item: item, slot: slot).queue()
   * ```
   */
  ReplaceItem replaceitem({@required Item item, @required Slot slot}) => StraitWidget.builder.create(ReplaceItem(this, item: item, slot: slot));

  /**
   * Generates a Particle Widget
   * ```dart
   * player.particle(particle: ParticleType.barrier, location: location).queue()
   * ```
   */
  Particle particle({@required ParticleType particle,@required Location location, Location delta, double speed = 1, int count = 1, bool force = false})
    => StraitWidget.builder.create(Particle(particle,location: location, delta: delta, speed: speed, count: count, force: force, player: this));

  /**
   * Crashes a player's game by sending him to many particles and forces the client to show them (Who ever wants to do that, propably for people who don't like your map or datapack 😉)
   * ```dart
   * player.crash().queue()
   * ```
   * ---
   * Uses `StraitPlayer.particle()` and `StraitEntity.at()`
   */
  Execute crash() => at(children: [this.particle(particle: ParticleType.barrier, location: Location.here(), count: 1000000000, force: true)]);

  Clear clear([Item item]) => StraitWidget.builder.create(Clear(this, item));

  /**
   * Generates a tellraw command
   * ```dart
   * player.tellraw([
   *  TextComponent("Welcome to my Server!")
   * ]).queue()
   * ```
   * ---
   * Uses `StraitPlayer.particle()` and `StraitEntity.at()`
   */
  Tellraw tellraw({List<TextComponent> show}) => StraitWidget.builder.create(Tellraw(this,show: show));

  /**
   * Executes given content for all players matching the selector (Strait function)
   * ```dart
   * player.forEach((StraitPlayer p, List<Widget> strait) {
   *   p.kill().queue();
   * }).queue();
   * ```
   */
  Execute forEach(Function(Player p, List<Widget> strait) fn) => asStrait(run: (List<Widget> strait) => fn(new Player.self(), strait));  
}