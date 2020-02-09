import 'package:objd/basic/types/area.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/types/block.dart';
import 'package:objd/basic/types/location.dart';
import 'package:objd/basic/types/particles.dart';
import 'package:objd/basic/types/rotation.dart';
import 'package:objd/basic/score.dart';
import 'package:objd/basic/tag.dart';
import 'package:objd/basic/types/slot.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/basic/types/selector.dart';
import 'package:objd/core.dart';
import 'package:objd/wrappers/execute.dart';
import 'package:meta/meta.dart';
import 'package:objd/wrappers/team.dart';

import 'item.dart';
export 'entities.dart';

abstract class EntityClass {
  String selector;
  @override
  String toString();
}

class Entity implements EntityClass {
  @override
  String selector;

  /// creates an entity with @p
  Entity.Player({
    Range distance,
    List<dynamic> tags,
    Team team,
    String strNbt,
    Map<String, dynamic> nbt,
    List<Score> scores,
    Range level,
    Gamemode gamemode,
    Area area,
    String name,
    Rotation isRotated,
    Range horizontalRotation,
    Range verticalRotation,
    String predicate,
  }) {
    selector = 'p';
    _setArguments(
      null,
      tags,
      team,
      scores,
      nbt,
      strNbt,
      null,
      area,
      distance,
      level,
      gamemode,
      name,
      isRotated,
      horizontalRotation,
      verticalRotation,
      predicate,
      false,
    );
  }

  /// creates an entity with an implicit name
  Entity.PlayerName(String name) : this(playerName: name);

  /// creates an entity with @a
  Entity.All({
    Range distance,
    List<dynamic> tags,
    Team team,
    String strNbt,
    Map<String, dynamic> nbt,
    int limit,
    List<Score> scores,
    Range level,
    Gamemode gamemode,
    Area area,
    String name,
    Rotation isRotated,
    Range horizontalRotation,
    Range verticalRotation,
    String predicate,
  }) {
    selector = 'a';
    _setArguments(
      limit,
      tags,
      team,
      scores,
      nbt,
      strNbt,
      null,
      area,
      distance,
      level,
      gamemode,
      name,
      isRotated,
      horizontalRotation,
      verticalRotation,
      predicate,
      false,
    );
  }

  /// creates an entity with @r
  Entity.Random({
    EntityType type,
    Range distance,
    List<dynamic> tags,
    Team team,
    String strNbt,
    Map<String, dynamic> nbt,
    int limit,
    List<Score> scores,
    Range level,
    Gamemode gamemode,
    Area area,
    String name,
    Rotation isRotated,
    Range horizontalRotation,
    Range verticalRotation,
    String predicate,
  }) {
    selector = 'r';
    _setArguments(
      limit,
      tags,
      team,
      scores,
      nbt,
      strNbt,
      type,
      area,
      distance,
      level,
      gamemode,
      name,
      isRotated,
      horizontalRotation,
      verticalRotation,
      predicate,
      false,
    );
  }

  /// creates an entity with @s
  Entity.Selected({
    EntityType type,
    Range distance,
    List<dynamic> tags,
    Team team,
    String strNbt,
    Map<String, dynamic> nbt,
    List<Score> scores,
    Range level,
    Gamemode gamemode,
    Area area,
    String name,
    Rotation isRotated,
    Range horizontalRotation,
    Range verticalRotation,
    String predicate,
  }) {
    selector = 's';
    _setArguments(
      null,
      tags,
      team,
      scores,
      nbt,
      strNbt,
      type,
      area,
      distance,
      level,
      gamemode,
      name,
      isRotated,
      horizontalRotation,
      verticalRotation,
      predicate,
      false,
    );
  }

  /// creates an entity with @s
  @deprecated
  Entity.self({
    EntityType type,
    Range distance,
    List<dynamic> tags,
    Team team,
    String strNbt,
    Map<String, dynamic> nbt,
    List<Score> scores,
    Range level,
    Gamemode gamemode,
    Area area,
    String name,
    Rotation isRotated,
    Range horizontalRotation,
    Range verticalRotation,
    String predicate,
  }) {
    selector = 's';
    _setArguments(
      null,
      tags,
      team,
      scores,
      nbt,
      strNbt,
      type,
      area,
      distance,
      level,
      gamemode,
      name,
      isRotated,
      horizontalRotation,
      verticalRotation,
      predicate,
      false,
    );
  }

  /// creates an entity with @s
  Entity.Self({
    EntityType type,
    Range distance,
    List<dynamic> tags,
    Team team,
    String strNbt,
    Map<String, dynamic> nbt,
    List<Score> scores,
    Range level,
    Gamemode gamemode,
    Area area,
    String name,
    Rotation isRotated,
    Range horizontalRotation,
    Range verticalRotation,
    String predicate,
  }) {
    selector = 's';
    _setArguments(
      null,
      tags,
      team,
      scores,
      nbt,
      strNbt,
      type,
      area,
      distance,
      level,
      gamemode,
      name,
      isRotated,
      horizontalRotation,
      verticalRotation,
      predicate,
      false,
    );
  }

  /// creates an entity from a prepared selector
  Entity.Select(Selector selector) {
    this.selector = selector.selector;
    _setArguments(
      selector.limit,
      selector.tags,
      selector.team,
      selector.scores,
      selector.nbt,
      selector.strNbt,
      selector.type,
      selector.area,
      selector.distance,
      selector.level,
      selector.gamemode,
      selector.name,
      selector.isRotated,
      selector.horizontalRotation,
      selector.verticalRotation,
      null, //TODO: Predicate
      false,
    );
    if (selector.sorting != null) {
      sort(selector.sorting);
    }
  }

  /// creates a new instance of an already existing Entity object
  Entity.clone(Entity ent) {
    selector = ent.selector;
    playerName = ent.playerName;
    arguments = Map.from(ent.arguments);
  }

  /// Entity is an util class to convert an argument list into the Minecraft Entity format(@p...)
  Entity({
    this.selector = 'e',
    int limit,
    List<dynamic> tags,
    Team team,
    List<Score> scores,
    Map<String, dynamic> nbt,
    String strNbt,
    EntityType type,
    String predicate,
    Area area,
    Range distance,
    Range level,
    Gamemode gamemode,
    String name,
    Rotation isRotated,
    Range horizontalRotation,
    Range verticalRotation,
    this.playerName,
  }) {
    _setArguments(
      limit,
      tags,
      team,
      scores,
      nbt,
      strNbt,
      type,
      area,
      distance,
      level,
      gamemode,
      name,
      isRotated,
      horizontalRotation,
      verticalRotation,
      predicate,
      false,
    );
  }

  /// Modifies the properties of the existing Entity and applies new arguments(same as constructors)
  void setValues({
    int limit,
    List<dynamic> tags,
    Team team,
    List<Score> scores,
    Map<String, dynamic> nbt,
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
    String predicate,
  }) {
    _setArguments(
      limit,
      tags,
      team,
      scores,
      nbt,
      strNbt,
      type,
      area,
      distance,
      level,
      gamemode,
      name,
      isRotated,
      horizontalRotation,
      verticalRotation,
      predicate,
      false,
    );
  }

  void _setArguments(
    int limit,
    List<dynamic> tags,
    Team team,
    List<Score> scores,
    Map<String, dynamic> nbt,
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
    String predicate,
    bool not,
  ) {
    var n = '';
    if (not != null && not) {
      n = '!';
    }
    if (distance != null) {
      arguments['distance'] = n + distance.toString();
    }
    if (level != null) {
      arguments['level'] = n + level.toString();
    }
    if (limit != null) {
      arguments['limit'] = n + limit.toString();
    }
    if (type != null) {
      arguments['type'] = n + type.toString();
    }
    if (gamemode != null) {
      arguments['gamemode'] = n + gamemode.toString().split('.').last;
    }
    if (name != null) {
      arguments['name'] = n + name;
    }
    if (horizontalRotation != null) {
      arguments['y_rotation'] = n + horizontalRotation.toString();
    }
    if (verticalRotation != null) {
      arguments['x_rotation'] = n + verticalRotation.toString();
    }
    if (isRotated != null) {
      arguments['y_rotation'] = n + isRotated.x.toString();
      arguments['x_rotation'] = n + isRotated.y.toString();
    }
    if (area != null) {
      arguments.addAll(area.getRanges());
    }
    if (nbt != null) {
      arguments['nbt'] = n + gsonEncode(nbt);
    }
    if (strNbt != null && strNbt.isNotEmpty) {
      arguments['nbt'] = n + strNbt;
    }
    if (team != null) {
      arguments['team'] = n + team.name;
    }
    if (predicate != null) {
      arguments['predicate'] = n + predicate;
    }
    if (tags != null) {
      arguments['tag'] ??= [];
      tags.forEach((tag) {
        if (tag is Tag) {
          arguments['tag'].add(n + tag.tag);
        } else if (tag is String) {
          if (Tag.prefix != null && !(tag as String).contains(Tag.prefix)) {
            tag = Tag.prefix + (tag as String);
          }
          arguments['tag'].add(n + (tag as String));
        } else {
          throw ('Please insert a Tag or String as tag into Entity!');
        }
      });
    }
    if (scores != null) {
      var ret = <String>[];
      scores.forEach((score) {
        if (score.getMatch().isEmpty) {
          throw ('Please insert a match method in the scores value for an entity!');
        }
        ret.add(score.score + '=' + score.getMatch());
      });
      arguments['scores'] = n + '{' + ret.join(',') + '}';
    }
  }

  Map arguments = {};
  String playerName;

  Entity sort(Sort sort) {
    arguments['sort'] = sort.toString().split('.').last;
    return this;
  }

  /// With the not function you can negate specific arguments. It takes in the same options as `Entity()`.
  ///
  /// **Example:**
  /// ```dart
  /// Say(Entity().not(tags:['mytag'],nbt:{'istrue':1}))
  /// ⇒ say @e[tag=!mytag,nbt=!{'istrue':1}]
  /// ```
  Entity not({
    int limit,
    List<dynamic> tags,
    Team team,
    List<Score> scores,
    Map<String, dynamic> nbt,
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
    String predicate,
  }) {
    _setArguments(
        limit,
        tags,
        team,
        scores,
        nbt,
        strNbt,
        type,
        area,
        distance,
        level,
        gamemode,
        name,
        isRotated,
        horizontalRotation,
        verticalRotation,
        predicate,
        true);
    return this;
  }

  /// stores the result or success of a [command] in a nbt [path] in your entity
  Execute storeResult(Command command,
      {@required String path,
      String datatype = 'double',
      double scale = 1,
      bool useSuccess = false}) {
    assert(path != null || path.isNotEmpty);
    return Execute(
      children: [command],
      encapsulate: false,
      args: [
        [
          'store ' +
              (useSuccess ? 'success' : 'result') +
              ' entity ' +
              toString() +
              ' ' +
              path +
              ' ${datatype} ${scale}'
        ],
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
    Map<String, dynamic> nbt,
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
    String predicate,
  }) {
    var temp = Entity.clone(this);
    temp._setArguments(
        limit,
        tags,
        team,
        scores,
        nbt,
        strNbt,
        type,
        area,
        distance,
        level,
        gamemode,
        name,
        isRotated,
        horizontalRotation,
        verticalRotation,
        predicate,
        false);
    return temp;
  }

  ///
  ///Generates a Kill Widget
  ///```dart
  ///entity.kill().queue()
  ///```

  RestActionAble kill() => StraitWidget.builder.create(Kill(this));

  ///
  ///Generates a Raycast Widget
  ///```dart
  ///entity.raycast(onhit: [
  /// ...
  ///]).queue()
  ///```

  RestActionAble raycast({
    int max,
    double step = 1,
    Block through = Blocks.air,
    Widget Function(Function, Function) ray,
    List<Widget> onhit,
    String scoreName = 'objd_count',
  }) =>
      StraitWidget.builder.create(Raycast(this,
          max: max,
          step: step,
          through: through,
          ray: ray,
          onhit: onhit,
          scoreName: scoreName));

  ///
  ///Generates a Teleport Widget
  ///```dart
  ///entity.teleport(Location.here()).queue()
  ///```

  RestActionAble teleport({
    Location location,
    Entity entity,
    dynamic facing,
    Rotation rot,
  }) {
    //Teleport to entity
    if (entity != null && facing != null) {
      return StraitWidget.builder
          .create(Teleport.entity(this, to: entity, facing: facing));
    }

    if (entity != null) {
      return StraitWidget.builder.create(Teleport.entity(this, to: entity));
    }

    // Teleport to Location
    if (location != null && facing != null && rot != null) {
      return StraitWidget.builder
          .create(Teleport(this, to: location, facing: facing, rot: rot));
    }

    if (location != null && facing != null) {
      return StraitWidget.builder
          .create(Teleport(this, to: location, facing: facing));
    }

    if (location != null && rot != null) {
      return StraitWidget.builder
          .create(Teleport(this, to: location, rot: rot));
    }

    if (location != null) {
      return StraitWidget.builder.create(Teleport(this, to: location));
    }
    throw Error();
  }

  ///
  ///Generates a Give Widget
  ///```dart
  ///player.give(item).queue()
  ///```

  RestActionAble give(Item item) =>
      StraitWidget.builder.create(Give(this, item: item));

  ///
  ///Generates a ReplaceItem Widget
  ///```dart
  ///player.replaceitem(item: item, slot: slot).queue()
  ///```

  RestActionAble replaceitem({@required Item item, @required Slot slot}) =>
      StraitWidget.builder.create(ReplaceItem(this, item: item, slot: slot));

  ///
  ///Generates a Particle Widget
  ///```dart
  ///player.particle(particle: ParticleType.barrier, location: location).queue()
  ///```

  RestActionAble particle({
    @required ParticleType particle,
    @required Location location,
    Location delta,
    double speed = 1,
    int count = 1,
    bool force = false,
  }) =>
      StraitWidget.builder.create(Particle(
        particle,
        location: location,
        delta: delta,
        speed: speed,
        count: count,
        force: force,
        player: this,
      ));

  ///
  ///Crashes a player's game by sending him to many particles and forces the client to show them (Who ever wants to do that, propably for people who don't like your map or datapack 😉)
  ///```dart
  ///player.crash().queue()
  ///```
  ///---
  ///Uses `StraitPlayer.particle()` and `StraitEntity.at()`

  RestActionAble crash() => at(children: [
        particle(
          particle: Particles.barrier,
          location: Location.here(),
          count: 1000000000,
          force: true,
        ),
      ]);

  RestActionAble clear([Item item]) =>
      StraitWidget.builder.create(Clear(this, item));

  ///
  ///Generates a tellraw command
  ///```dart
  ///player.tellraw([
  /// TextComponent('Welcome to my Server!')
  ///]).queue()
  ///```
  ///---
  ///Uses `StraitPlayer.particle()` and `StraitEntity.at()`

  RestActionAble tellraw({List<TextComponent> show}) =>
      StraitWidget.builder.create(Tellraw(this, show: show));

  ///
  ///Generates a Tp Widget
  ///```dart
  ///entity.tp(Location.here()).queue()
  ///```

  RestActionAble tp(
      {Location location, Entity entity, dynamic facing, Rotation rot}) {
    //Teleport to entity
    if (entity != null && facing != null) {
      return StraitWidget.builder
          .create(Tp.entity(this, to: entity, facing: facing));
    }

    if (entity != null) {
      return StraitWidget.builder.create(Tp.entity(this, to: entity));
    }

    // Teleport to Location
    if (location != null && facing != null && rot != null) {
      return StraitWidget.builder
          .create(Tp(this, to: location, facing: facing, rot: rot));
    }
    if (location != null && facing != null) {
      return StraitWidget.builder
          .create(Tp(this, to: location, facing: facing));
    }
    if (location != null && rot != null) {
      return StraitWidget.builder.create(Tp(this, to: location, rot: rot));
    }
    if (location != null) {
      return StraitWidget.builder.create(Tp(this, to: location));
    }
    throw Error();
  }

  // Data Commands

  ///
  ///Use #dataMerge, #dataGet, #dataRemove and #dataModify instead

  @Deprecated('Use #dataMerge, #dataGet, #dataRemove and #dataModify instead')
  RestActionAble data({Map<String, dynamic> nbt, String type = 'merge'}) {
    if ((selector == 'a' ||
        selector == 'r' ||
        selector == 'p' ||
        arguments['type'] == 'minecraft:player' ||
        arguments['type'] == 'player')) {
      throw ('Cannot modify a player\'s data');
    }
    if ((selector == 'a' || selector == 'e') &&
        (arguments['limit'] == null || arguments['limit'] != '1')) {
      throw ('Cannot work with data of multiple entities in data command');
    }
    return StraitWidget.builder.create(Data(this, nbt: nbt, type: type));
  }

  ///
  ///Generates a Data Widget
  ///```dart
  ///entity.dataMerge(nbt: {'CustomNameVisible':true}).queue()
  ///```

  RestActionAble dataMerge({Map<String, dynamic> nbt, String strNbt}) {
    if ((selector == 'a' ||
        selector == 'r' ||
        selector == 'p' ||
        arguments['type'] == 'minecraft:player' ||
        arguments['type'] == 'player')) {
      throw ('Cannot modify a player\'s data');
    }
    if ((selector == 'a' || selector == 'e') &&
        (arguments['limit'] == null || arguments['limit'] != '1')) {
      throw ('Cannot work with data of multiple entities in data command');
    }
    return StraitWidget.builder
        .create(Data.merge(this, nbt: nbt, strNbt: strNbt));
  }

  ///
  ///Generates a Data Widget
  ///```dart
  ///entity.dataGet(path: 'CustomName').queue()
  ///```

  RestActionAble dataGet({@required String path, num scale = 1}) {
    if ((selector == 'a' || selector == 'e') &&
        (arguments['limit'] == null || arguments['limit'] != '1')) {
      throw ('Cannot work with data of multiple entities in data command');
    }
    return StraitWidget.builder
        .create(Data.get(this, path: path, scale: scale));
  }

  ///
  ///Generates a Data Widget
  ///```dart
  ///entity.dataRemove(path: 'CustomName').queue()
  ///```

  RestActionAble dataRemove({@required String path}) {
    if ((selector == 'a' ||
        selector == 'r' ||
        selector == 'p' ||
        arguments['type'] == 'minecraft:player' ||
        arguments['type'] == 'player')) {
      throw ('Cannot modify a player\'s data');
    }
    if ((selector == 'a' || selector == 'e') &&
        (arguments['limit'] == null || arguments['limit'] != '1')) {
      throw ('Cannot work with data of multiple entities in data command');
    }
    return StraitWidget.builder.create(Data.remove(this, path: path));
  }

  ///
  ///Generates a Data Widget
  ///```dart
  ///entity.dataModify(path: 'CustomName', modify: ...).queue()
  ///```

  RestActionAble dataModify(
      {@required String path, @required DataModify modify}) {
    if ((selector == 'a' ||
        selector == 'r' ||
        selector == 'p' ||
        arguments['type'] == 'minecraft:player' ||
        arguments['type'] == 'player')) {
      throw ('Cannot modify a player\'s data');
    }
    if ((selector == 'a' || selector == 'e') &&
        (arguments['limit'] == null || arguments['limit'] != '1')) {
      throw ('Cannot work with data of multiple entities in data command');
    }
    return StraitWidget.builder
        .create(Data.modify(this, path: path, modify: modify));
  }

  ///
  ///Generates a Execute Widget (execute as the entity)
  ///```dart
  ///entity.execute().run(Say('hi')).queue()
  ///```

  RestActionAble execute({
    List<Widget> children,
    String targetFilePath = 'objd',
    String targetFileName,
    bool encapsulate = true,
  }) =>
      as(
        children: children,
        targetFilePath: targetFilePath,
        targetFileName: targetFileName,
        encapsulate: encapsulate,
      );

  ///
  ///Generates a Execute Widget (execute as the entity)
  ///```dart
  ///entity.exec().run(Say('hi')).queue()
  ///```
  ///short form for `entity.execute()`

  RestActionAble exec({
    List<Widget> children,
    String targetFilePath = 'objd',
    String targetFileName,
    bool encapsulate = true,
  }) =>
      as(
        children: children,
        targetFilePath: targetFilePath,
        targetFileName: targetFileName,
        encapsulate: encapsulate,
      );

  ///
  ///Generates a Execute Widget strait (execute as the entity)
  ///```dart
  ///entity.executeStrait(run: (List<Widget> cont) {
  /// ...
  ///}).queue()
  ///```

  RestActionAble executeStrait({
    @required Function(List<Widget>) run,
    String targetFilePath = 'objd',
    String targetFileName,
    bool encapsulate = true,
  }) =>
      asStrait(
        run: run,
        targetFilePath: targetFilePath,
        targetFileName: targetFileName,
        encapsulate: encapsulate,
      );

  ///
  ///Generates a Execute Widget strait (execute as the entity)
  ///```dart
  ///entity.execStrait(run: (List<Widget> cont) {
  /// ...
  ///}).queue()
  ///```
  ///short form for `entity.executeStrait()`

  RestActionAble execStrait({
    @required Function(List<Widget>) run,
    String targetFilePath = 'objd',
    String targetFileName,
    bool encapsulate = true,
  }) =>
      asStrait(
        run: run,
        targetFilePath: targetFilePath,
        targetFileName: targetFileName,
        encapsulate: encapsulate,
      );

  ///
  ///Generates a Execute Widget (execute as and at the entity)
  ///```dart
  ///entity.asat().run(Particle(ParticleType.flame)).queue()
  ///```

  RestActionAble asat({
    List<Widget> children,
    String targetFilePath = 'objd',
    String targetFileName,
    bool encapsulate = true,
  }) =>
      StraitWidget.builder.create(Execute(
        children: children,
        targetFilePath: targetFilePath,
        targetFileName: targetFileName,
        encapsulate: encapsulate,
      ).asat(this));

  ///
  ///Generates a Execute Widget strait (execute as and at the entity)
  ///```dart
  ///entity.asatStrait(run: (List<Widget> cont) {
  /// ...
  ///}).queue()
  ///```

  RestActionAble asatStrait({
    @required Function(List<Widget>) run,
    String targetFilePath = 'objd',
    String targetFileName,
    bool encapsulate = true,
  }) =>
      StraitWidget.builder.create(Execute.strait(
        run: run,
        targetFilePath: targetFilePath,
        targetFileName: targetFileName,
        encapsulate: encapsulate,
      ).asat(this));

  ///
  ///Generates a Execute Widget (execute as the entity)
  ///```dart
  ///entity.as().run(Say('hi')).queue()
  ///```

  RestActionAble as({
    List<Widget> children,
    String targetFilePath = 'objd',
    String targetFileName,
    bool encapsulate = true,
  }) =>
      StraitWidget.builder.create(Execute(
        children: children,
        targetFilePath: targetFilePath,
        targetFileName: targetFileName,
        encapsulate: encapsulate,
      ).as(this));

  ///
  ///Generates a Execute Widget strait (execute as the entity)
  ///```dart
  ///entity.asStrait(run: (List<Widget> cont) {
  /// ...
  ///}).queue()
  ///```

  RestActionAble asStrait({
    @required Function(List<Widget>) run,
    String targetFilePath = 'objd',
    String targetFileName,
    bool encapsulate = true,
  }) =>
      StraitWidget.builder.create(Execute.strait(
        run: run,
        targetFilePath: targetFilePath,
        targetFileName: targetFileName,
        encapsulate: encapsulate,
      ).as(this));

  ///
  ///Generates a Execute Widget (execute at the entity)
  ///```dart
  ///entity.at().run(Particle(ParticleType.flame)).queue()
  ///```

  RestActionAble at({
    List<Widget> children,
    String targetFilePath = 'objd',
    String targetFileName,
    bool encapsulate = true,
  }) =>
      StraitWidget.builder.create(Execute(
        children: children,
        targetFilePath: targetFilePath,
        targetFileName: targetFileName,
        encapsulate: encapsulate,
      ).at(this));

  ///
  ///Generates a Execute Widget strait (execute at the entity)
  ///```dart
  ///entity.atStrait(run: (List<Widget> cont) {
  /// ...
  ///}).queue()
  ///```

  RestActionAble atStrait({
    @required Function(List<Widget>) run,
    String targetFilePath = 'objd',
    String targetFileName,
    bool encapsulate = true,
  }) =>
      StraitWidget.builder.create(Execute.strait(
        run: run,
        targetFilePath: targetFilePath,
        targetFileName: targetFileName,
        encapsulate: encapsulate,
      ).at(this));

  ///
  ///Adds a tag to the entity
  ///```dart
  ///entity.addTag('objDTest').queue()
  ///```

  RestActionAble addTag(String tag) =>
      StraitWidget.builder.create(Tag(tag, entity: this, value: true));

  ///
  ///Adds tags to the entity
  ///```dart
  ///entity.addTags(['objDTest','objDTest2']).queue()
  ///```

  RestActionAble addTags(List<String> tags) => StraitWidget.builder.create(
      For.of(tags.map((tag) => Tag(tag, entity: this, value: true)).toList()));

  ///
  ///Removes a tag from the entity
  ///```dart
  ///entity.removeTag('objDTest').queue()
  ///```

  RestActionAble removeTag(String tag) =>
      StraitWidget.builder.create(Tag(tag, entity: this, value: false));

  ///
  ///Removes tags from the entity
  ///```dart
  ///entity.removeTags(['objDTest','objDTest2']).queue()
  ///```

  RestActionAble removeTags(List<String> tags) => StraitWidget.builder.create(
      For.of(tags.map((tag) => Tag(tag, entity: this, value: false)).toList()));

  ///
  ///The entity joins a team
  ///```dart
  ///entity.joinTeam('red').queue()
  ///```

  RestActionAble joinTeam(String team) =>
      StraitWidget.builder.create(Team.join(team, this));

  ///
  ///The entity leaves a team
  ///```dart
  ///entity.leaveTeam('red').queue()
  ///```

  RestActionAble leaveTeam() => StraitWidget.builder.create(Team.leave(this));

  ///
  ///Executes given content for all entities matching the selector (Strait function)
  ///```dart
  ///entity.forEach((LivingEntity e, List<Widget> strait) {
  ///  e.kill().queue();
  ///}).queue();
  ///```

  RestActionAble forEach(Function(Entity p, List<Widget> strait) fn) =>
      asStrait(run: (List<Widget> strait) => fn(Entity.Self(), strait));

  @override
  String toString([Map args]) {
    arguments ??= args;
    if (playerName != null && playerName.isNotEmpty) return playerName;
    var ret = '@' + selector;

    if (arguments.isNotEmpty) {
      ret += '[';
      arguments.keys.forEach((key) {
        if (arguments[key] is List) {
          arguments[key].forEach((item) {
            ret += _addArg(item, key);
            if (item != arguments[key].last) ret += ',';
          });
          if (key != arguments.keys.last) ret += ',';
        } else {
          ret += _addArg(arguments[key], key);
          if (key != arguments.keys.last) ret += ',';
        }
      });
      ret += ']';
    }
    return ret;
  }

  String _addArg(arg, key) {
    var ret = '';

    if (arg != null) {
      arg = arg.toString().replaceAll(r'[0-9].0', '');
      ret += key.toString() + '=' + arg.toString();
    }
    return ret;
  }
}

class Range {
  num from, to, exact;

  /// The Range class defines a range of values(e.g 3..10 in vanilla)
  Range(this.from, this.to);
  Range.to(this.to);
  Range.from(this.from);

  /// Use Range.exact to get the exact Range(e.g 4)
  Range.exact(this.exact);

  @override
  String toString() {
    var ret = '0';
    if (exact != null) {
      ret = exact.toString();
    } else if (from != null && to == null) {
      ret = '$from..';
    } else if (from == null && to != null) {
      ret = '..$to';
    } else if (from != null && to != null) ret = '$from..$to';
    return ret.replaceAll(r'[0-9].0', '');
  }
}

enum Gamemode { creative, adventure, survival, spectator }
enum Sort { random, furthest, nearest, arbitrary }

/// There is an EntityType for every type_id in minecraft with `EntityType.[type_id]`
class EntityType {
  final String type;
  const EntityType(this.type);

  @override
  bool operator ==(dynamic other) {
    if (other is EntityType && other.type == type) {
      return true;
    }
    if (other is String && other == type) {
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return type;
  }

  /// DEPRECATED, please use Entities.area_effect_cloud
  @deprecated
  static const EntityType area_effect_cloud =
      EntityType('minecraft:area_effect_cloud');

  /// DEPRECATED, please use Entities.armor_stand
  @deprecated
  static const EntityType armor_stand = EntityType('minecraft:armor_stand');

  /// DEPRECATED, please use Entities.arrow
  @deprecated
  static const EntityType arrow = EntityType('minecraft:arrow');

  /// DEPRECATED, please use Entities.bat
  @deprecated
  static const EntityType bat = EntityType('minecraft:bat');

  /// DEPRECATED, please use Entities.bee
  @deprecated
  static const EntityType bee = EntityType('minecraft:bee');

  /// DEPRECATED, please use Entities.blaze
  @deprecated
  static const EntityType blaze = EntityType('minecraft:blaze');

  /// DEPRECATED, please use Entities.boat
  @deprecated
  static const EntityType boat = EntityType('minecraft:boat');

  /// DEPRECATED, please use Entities.cat
  @deprecated
  static const EntityType cat = EntityType('minecraft:cat');

  /// DEPRECATED, please use Entities.cave_spider
  @deprecated
  static const EntityType cave_spider = EntityType('minecraft:cave_spider');

  /// DEPRECATED, please use Entities.chicken
  @deprecated
  static const EntityType chicken = EntityType('minecraft:chicken');

  /// DEPRECATED, please use Entities.cod
  @deprecated
  static const EntityType cod = EntityType('minecraft:cod');

  /// DEPRECATED, please use Entities.cow
  @deprecated
  static const EntityType cow = EntityType('minecraft:cow');

  /// DEPRECATED, please use Entities.creeper
  @deprecated
  static const EntityType creeper = EntityType('minecraft:creeper');

  /// DEPRECATED, please use Entities.donkey
  @deprecated
  static const EntityType donkey = EntityType('minecraft:donkey');

  /// DEPRECATED, please use Entities.dolphin
  @deprecated
  static const EntityType dolphin = EntityType('minecraft:dolphin');

  /// DEPRECATED, please use Entities.dragon_fireball
  @deprecated
  static const EntityType dragon_fireball =
      EntityType('minecraft:dragon_fireball');

  /// DEPRECATED, please use Entities.drowned
  @deprecated
  static const EntityType drowned = EntityType('minecraft:drowned');

  /// DEPRECATED, please use Entities.elder_guardian
  @deprecated
  static const EntityType elder_guardian =
      EntityType('minecraft:elder_guardian');

  /// DEPRECATED, please use Entities.end_crystal
  @deprecated
  static const EntityType end_crystal = EntityType('minecraft:end_crystal');

  /// DEPRECATED, please use Entities.ender_dragon
  @deprecated
  static const EntityType ender_dragon = EntityType('minecraft:ender_dragon');

  /// DEPRECATED, please use Entities.enderman
  @deprecated
  static const EntityType enderman = EntityType('minecraft:enderman');

  /// DEPRECATED, please use Entities.endermite
  @deprecated
  static const EntityType endermite = EntityType('minecraft:endermite');

  /// DEPRECATED, please use Entities.evoker_fangs
  @deprecated
  static const EntityType evoker_fangs = EntityType('minecraft:evoker_fangs');

  /// DEPRECATED, please use Entities.evoker
  @deprecated
  static const EntityType evoker = EntityType('minecraft:evoker');

  /// DEPRECATED, please use Entities.experience_orb
  @deprecated
  static const EntityType experience_orb =
      EntityType('minecraft:experience_orb');

  /// DEPRECATED, please use Entities.eye_of_ender
  @deprecated
  static const EntityType eye_of_ender = EntityType('minecraft:eye_of_ender');

  /// DEPRECATED, please use Entities.falling_block
  @deprecated
  static const EntityType falling_block = EntityType('minecraft:falling_block');

  /// DEPRECATED, please use Entities.firework_rocket
  @deprecated
  static const EntityType firework_rocket =
      EntityType('minecraft:firework_rocket');

  /// DEPRECATED, please use Entities.fox
  @deprecated
  static const EntityType fox = EntityType('minecraft:fox');

  /// DEPRECATED, please use Entities.ghast
  @deprecated
  static const EntityType ghast = EntityType('minecraft:ghast');

  /// DEPRECATED, please use Entities.giant
  @deprecated
  static const EntityType giant = EntityType('minecraft:giant');

  /// DEPRECATED, please use Entities.guardian
  @deprecated
  static const EntityType guardian = EntityType('minecraft:guardian');

  /// DEPRECATED, please use Entities.horse
  @deprecated
  static const EntityType horse = EntityType('minecraft:horse');

  /// DEPRECATED, please use Entities.husk
  @deprecated
  static const EntityType husk = EntityType('minecraft:husk');

  /// DEPRECATED, please use Entities.illusioner
  @deprecated
  static const EntityType illusioner = EntityType('minecraft:illusioner');

  /// DEPRECATED, please use Entities.item
  @deprecated
  static const EntityType item = EntityType('minecraft:item');

  /// DEPRECATED, please use Entities.item_frame
  @deprecated
  static const EntityType item_frame = EntityType('minecraft:item_frame');

  /// DEPRECATED, please use Entities.fireball
  @deprecated
  static const EntityType fireball = EntityType('minecraft:fireball');

  /// DEPRECATED, please use Entities.leash_knot
  @deprecated
  static const EntityType leash_knot = EntityType('minecraft:leash_knot');

  /// DEPRECATED, please use Entities.llama
  @deprecated
  static const EntityType llama = EntityType('minecraft:llama');

  /// DEPRECATED, please use Entities.llama_spit
  @deprecated
  static const EntityType llama_spit = EntityType('minecraft:llama_spit');

  /// DEPRECATED, please use Entities.magma_cube
  @deprecated
  static const EntityType magma_cube = EntityType('minecraft:magma_cube');

  /// DEPRECATED, please use Entities.minecart
  @deprecated
  static const EntityType minecart = EntityType('minecraft:minecart');

  /// DEPRECATED, please use Entities.chest_minecart
  @deprecated
  static const EntityType chest_minecart =
      EntityType('minecraft:chest_minecart');

  /// DEPRECATED, please use Entities.command_block_minecart
  @deprecated
  static const EntityType command_block_minecart =
      EntityType('minecraft:command_block_minecart');

  /// DEPRECATED, please use Entities.furnace_minecart
  @deprecated
  static const EntityType furnace_minecart =
      EntityType('minecraft:furnace_minecart');

  /// DEPRECATED, please use Entities.hopper_minecart
  @deprecated
  static const EntityType hopper_minecart =
      EntityType('minecraft:hopper_minecart');

  /// DEPRECATED, please use Entities.spawner_minecart
  @deprecated
  static const EntityType spawner_minecart =
      EntityType('minecraft:spawner_minecart');

  /// DEPRECATED, please use Entities.tnt_minecart
  @deprecated
  static const EntityType tnt_minecart = EntityType('minecraft:tnt_minecart');

  /// DEPRECATED, please use Entities.mule
  @deprecated
  static const EntityType mule = EntityType('minecraft:mule');

  /// DEPRECATED, please use Entities.mooshroom
  @deprecated
  static const EntityType mooshroom = EntityType('minecraft:mooshroom');

  /// DEPRECATED, please use Entities.ocelot
  @deprecated
  static const EntityType ocelot = EntityType('minecraft:ocelot');

  /// DEPRECATED, please use Entities.painting
  @deprecated
  static const EntityType painting = EntityType('minecraft:painting');

  /// DEPRECATED, please use Entities.panda
  @deprecated
  static const EntityType panda = EntityType('minecraft:panda');

  /// DEPRECATED, please use Entities.parrot
  @deprecated
  static const EntityType parrot = EntityType('minecraft:parrot');

  /// DEPRECATED, please use Entities.pig
  @deprecated
  static const EntityType pig = EntityType('minecraft:pig');

  /// DEPRECATED, please use Entities.pufferfish
  @deprecated
  static const EntityType pufferfish = EntityType('minecraft:pufferfish');

  /// DEPRECATED, please use Entities.zombie_pigman
  @deprecated
  static const EntityType zombie_pigman = EntityType('minecraft:zombie_pigman');

  /// DEPRECATED, please use Entities.polar_bear
  @deprecated
  static const EntityType polar_bear = EntityType('minecraft:polar_bear');

  /// DEPRECATED, please use Entities.tnt
  @deprecated
  static const EntityType tnt = EntityType('minecraft:tnt');

  /// DEPRECATED, please use Entities.rabbit
  @deprecated
  static const EntityType rabbit = EntityType('minecraft:rabbit');

  /// DEPRECATED, please use Entities.salmon
  @deprecated
  static const EntityType salmon = EntityType('minecraft:salmon');

  /// DEPRECATED, please use Entities.sheep
  @deprecated
  static const EntityType sheep = EntityType('minecraft:sheep');

  /// DEPRECATED, please use Entities.shulker
  @deprecated
  static const EntityType shulker = EntityType('minecraft:shulker');

  /// DEPRECATED, please use Entities.shulker_bullet
  @deprecated
  static const EntityType shulker_bullet =
      EntityType('minecraft:shulker_bullet');

  /// DEPRECATED, please use Entities.silverfish
  @deprecated
  static const EntityType silverfish = EntityType('minecraft:silverfish');

  /// DEPRECATED, please use Entities.skeleton
  @deprecated
  static const EntityType skeleton = EntityType('minecraft:skeleton');

  /// DEPRECATED, please use Entities.skeleton_horse
  @deprecated
  static const EntityType skeleton_horse =
      EntityType('minecraft:skeleton_horse');

  /// DEPRECATED, please use Entities.slime
  @deprecated
  static const EntityType slime = EntityType('minecraft:slime');

  /// DEPRECATED, please use Entities.small_fireball
  @deprecated
  static const EntityType small_fireball =
      EntityType('minecraft:small_fireball');

  /// DEPRECATED, please use Entities.snow_golem
  @deprecated
  static const EntityType snow_golem = EntityType('minecraft:snow_golem');

  /// DEPRECATED, please use Entities.snowball
  @deprecated
  static const EntityType snowball = EntityType('minecraft:snowball');

  /// DEPRECATED, please use Entities.spectral_arrow
  @deprecated
  static const EntityType spectral_arrow =
      EntityType('minecraft:spectral_arrow');

  /// DEPRECATED, please use Entities.spider
  @deprecated
  static const EntityType spider = EntityType('minecraft:spider');

  /// DEPRECATED, please use Entities.squid
  @deprecated
  static const EntityType squid = EntityType('minecraft:squid');

  /// DEPRECATED, please use Entities.stray
  @deprecated
  static const EntityType stray = EntityType('minecraft:stray');

  /// DEPRECATED, please use Entities.trader_llama
  @deprecated
  static const EntityType trader_llama = EntityType('minecraft:trader_llama');

  /// DEPRECATED, please use Entities.tropical_fish
  @deprecated
  static const EntityType tropical_fish = EntityType('minecraft:tropical_fish');

  /// DEPRECATED, please use Entities.turtle
  @deprecated
  static const EntityType turtle = EntityType('minecraft:turtle');

  /// DEPRECATED, please use Entities.egg
  @deprecated
  static const EntityType egg = EntityType('minecraft:egg');

  /// DEPRECATED, please use Entities.ender_pearl
  @deprecated
  static const EntityType ender_pearl = EntityType('minecraft:ender_pearl');

  /// DEPRECATED, please use Entities.experience_bottle
  @deprecated
  static const EntityType experience_bottle =
      EntityType('minecraft:experience_bottle');

  /// DEPRECATED, please use Entities.potion
  @deprecated
  static const EntityType potion = EntityType('minecraft:potion');

  /// DEPRECATED, please use Entities.trident
  @deprecated
  static const EntityType trident = EntityType('minecraft:trident');

  /// DEPRECATED, please use Entities.vex
  @deprecated
  static const EntityType vex = EntityType('minecraft:vex');

  /// DEPRECATED, please use Entities.villager
  @deprecated
  static const EntityType villager = EntityType('minecraft:villager');

  /// DEPRECATED, please use Entities.iron_golem
  @deprecated
  static const EntityType iron_golem = EntityType('minecraft:iron_golem');

  /// DEPRECATED, please use Entities.vindicator
  @deprecated
  static const EntityType vindicator = EntityType('minecraft:vindicator');

  /// DEPRECATED, please use Entities.pillager
  @deprecated
  static const EntityType pillager = EntityType('minecraft:pillager');

  /// DEPRECATED, please use Entities.wandering_trader
  @deprecated
  static const EntityType wandering_trader =
      EntityType('minecraft:wandering_trader');

  /// DEPRECATED, please use Entities.witch
  @deprecated
  static const EntityType witch = EntityType('minecraft:witch');

  /// DEPRECATED, please use Entities.wither
  @deprecated
  static const EntityType wither = EntityType('minecraft:wither');

  /// DEPRECATED, please use Entities.wither_skeleton
  @deprecated
  static const EntityType wither_skeleton =
      EntityType('minecraft:wither_skeleton');

  /// DEPRECATED, please use Entities.wither_skull
  @deprecated
  static const EntityType wither_skull = EntityType('minecraft:wither_skull');

  /// DEPRECATED, please use Entities.wolf
  @deprecated
  static const EntityType wolf = EntityType('minecraft:wolf');

  /// DEPRECATED, please use Entities.zombie
  @deprecated
  static const EntityType zombie = EntityType('minecraft:zombie');

  /// DEPRECATED, please use Entities.zombie_horse
  @deprecated
  static const EntityType zombie_horse = EntityType('minecraft:zombie_horse');

  /// DEPRECATED, please use Entities.zombie_villager
  @deprecated
  static const EntityType zombie_villager =
      EntityType('minecraft:zombie_villager');

  /// DEPRECATED, please use Entities.phantom
  @deprecated
  static const EntityType phantom = EntityType('minecraft:phantom');

  /// DEPRECATED, please use Entities.ravager
  @deprecated
  static const EntityType ravager = EntityType('minecraft:ravager');

  /// DEPRECATED, please use Entities.lightning_bolt
  @deprecated
  static const EntityType lightning_bolt =
      EntityType('minecraft:lightning_bolt');

  /// DEPRECATED, please use Entities.player
  @deprecated
  static const EntityType player = EntityType('minecraft:player');

  /// DEPRECATED, please use Entities.fishing_bobber
  @deprecated
  static const EntityType fishing_bobber =
      EntityType('minecraft:fishing_bobber');
}
