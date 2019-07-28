import 'package:meta/meta.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/core.dart';

class LivingEntity extends Entity {

  /// creates an entity with @p
  LivingEntity.Player ({Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}) :
    this(selector: 'p',distance:distance,tags:tags,team:team,scores:scores,strNbt:strNbt,nbt:nbt,level: level,area: area,gamemode: gamemode,name: name,isRotated:isRotated,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);

  /// creates an entity with an implicit name
  LivingEntity.PlayerName (String name): this(playerName:name);

  /// creates an entity with @a
  LivingEntity.All ({Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,int limit,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}): 
    this(selector: 'a',limit:limit,distance:distance,tags:tags,team:team,strNbt:strNbt,nbt:nbt,scores:scores,level: level,area: area,gamemode: gamemode,name: name,isRotated:isRotated,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);

  /// creates an entity with @r
  LivingEntity.Random({EntityType type,Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,int limit,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}): 
    this(selector: 'r',type:type,limit:limit,distance:distance,tags:tags,team:team,strNbt:strNbt,nbt:nbt,scores:scores,level: level,area: area,gamemode: gamemode,name: name,isRotated:isRotated,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);

  /// creates an entity with @s
  LivingEntity.Selected ({EntityType type, Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}):
    this(selector: 's',type:type,distance:distance,tags:tags,team:team,strNbt:strNbt,nbt:nbt,scores:scores,level: level,area: area,gamemode: gamemode,name: name,isRotated:isRotated,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);

  /// creates an entity with @s
  LivingEntity.self ({EntityType type, Range distance,List<dynamic> tags,Team team,String strNbt,Map<String,dynamic> nbt,List<Score> scores,Range level, Gamemode gamemode, Area area, String name,Rotation isRotated, Range horizontalRotation, Range verticalRotation}):
    this(selector: 's',type:type,distance:distance,tags:tags,team:team,strNbt:strNbt,nbt:nbt,scores:scores,level: level,area: area,gamemode: gamemode,name: name,isRotated:isRotated,horizontalRotation: horizontalRotation,verticalRotation: verticalRotation);
  
  /// creates an entity with @e
  LivingEntity({String selector = 'e', int limit, List<dynamic> tags, Team team, List<Score> scores, Map<String,dynamic> nbt, String strNbt, EntityType type, Area area, Range distance, Range level, Gamemode gamemode, String name, Rotation isRotated, Range horizontalRotation, Range verticalRotation, String playerName}) : 
    super(selector: selector, limit: limit, tags: tags, team: team, scores: scores, nbt: nbt, strNbt: strNbt, type: type, area: area, distance: distance, level: level, gamemode: gamemode, name: name, isRotated: isRotated, horizontalRotation: horizontalRotation, verticalRotation: verticalRotation, playerName: playerName);

  // appends an effect to the entity
  RestAction effect({@required EffectType effect, int duration = 30, int amplifier = 1, bool showParticles = true})
    => StraitWidget.builder.create(Effect(effect, entity: this, duration: duration, amplifier: amplifier, showParticles: showParticles));
  
  /**
   * Executes given content for all entities matching the selector (Strait function)
   * ```dart
   * entity.forEach((LivingEntity e, List<Widget> strait) {
   *   e.kill().queue();
   * }).queue();
   * ```
   */
  Execute forEach(Function(LivingEntity p, List<Widget> strait) fn) => asStrait(run: (List<Widget> strait) => fn(new LivingEntity.self(), strait));
}