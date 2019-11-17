import 'package:objd/basic/area.dart';
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

import 'selector.dart';

abstract class EntityClass {
  String selector;
  String toString();
}

class Entity implements EntityClass {
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
    selector = "p";
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
    selector = "a";
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
    selector = "r";
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
    selector = "s";
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
    selector = "s";
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
    selector = "s";
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
    this.selector = ent.selector;
    this.playerName = ent.playerName;
    this.arguments = Map.from(ent.arguments);
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
  setValues({
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

  _setArguments(
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
    var n = "";
    if (not != null && not) {
      n = "!";
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
      arguments['tag'] = [];
      tags.forEach((tag) {
        if (tag is Tag) {
          arguments['tag'].add(n + tag.tag);
        } else if (tag is String) {
          if (Tag.prefix != null && !(tag as String).contains(Tag.prefix)) {
            tag = Tag.prefix + (tag as String);
          }
          arguments['tag'].add(n + (tag as String));
        } else {
          throw ("Please insert a Tag or String as tag into Entity!");
        }
      });
    }
    if (scores != null) {
      List<String> ret = [];
      scores.forEach((score) {
        if (score.getMatch().isEmpty) {
          throw ("Please insert a match method in the scores value for an entity!");
        }
        ret.add(score.score + "=" + score.getMatch());
      });
      arguments['scores'] = n + "{" + ret.join(",") + "}";
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
  /// Say(Entity().not(tags:["mytag"],nbt:{"istrue":1}))
  /// ⇒ say @e[tag=!mytag,nbt=!{"istrue":1}]
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
      String datatype = "double",
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
              this.toString() +
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
    Entity temp = Entity.clone(this);
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
    Block through = Block.air,
    Widget Function(Function, Function) ray,
    List<Widget> onhit,
    String scoreName = "objd_count",
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

  RestActionAble teleport(
      {Location location, Entity entity, dynamic facing, Rotation rot}) {
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
        this.particle(
          particle: ParticleType.barrier,
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
  /// TextComponent("Welcome to my Server!")
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
  RestActionAble data({Map<String, dynamic> nbt, String type = "merge"}) {
    if ((this.selector == "a" ||
        this.selector == "r" ||
        this.selector == "p" ||
        this.arguments["type"] == "minecraft:player" ||
        this.arguments["type"] == "player")) {
      throw ("Cannot modify a player's data");
    }
    if ((this.selector == "a" || this.selector == "e") &&
        (this.arguments["limit"] == null || this.arguments["limit"] != "1")) {
      throw ("Cannot work with data of multiple entities in data command");
    }
    return StraitWidget.builder.create(Data(this, nbt: nbt, type: type));
  }

  ///
  ///Generates a Data Widget
  ///```dart
  ///entity.dataMerge(nbt: {"CustomNameVisible":true}).queue()
  ///```

  RestActionAble dataMerge({Map<String, dynamic> nbt, String strNbt}) {
    if ((this.selector == "a" ||
        this.selector == "r" ||
        this.selector == "p" ||
        this.arguments["type"] == "minecraft:player" ||
        this.arguments["type"] == "player")) {
      throw ("Cannot modify a player's data");
    }
    if ((this.selector == "a" || this.selector == "e") &&
        (this.arguments["limit"] == null || this.arguments["limit"] != "1")) {
      throw ("Cannot work with data of multiple entities in data command");
    }
    return StraitWidget.builder
        .create(Data.merge(this, nbt: nbt, strNbt: strNbt));
  }

  ///
  ///Generates a Data Widget
  ///```dart
  ///entity.dataGet(path: "CustomName").queue()
  ///```

  RestActionAble dataGet({@required String path, num scale = 1}) {
    if ((this.selector == "a" || this.selector == "e") &&
        (this.arguments["limit"] == null || this.arguments["limit"] != "1")) {
      throw ("Cannot work with data of multiple entities in data command");
    }
    return StraitWidget.builder
        .create(Data.get(this, path: path, scale: scale));
  }

  ///
  ///Generates a Data Widget
  ///```dart
  ///entity.dataRemove(path: "CustomName").queue()
  ///```

  RestActionAble dataRemove({@required String path}) {
    if ((this.selector == "a" ||
        this.selector == "r" ||
        this.selector == "p" ||
        this.arguments["type"] == "minecraft:player" ||
        this.arguments["type"] == "player")) {
      throw ("Cannot modify a player's data");
    }
    if ((this.selector == "a" || this.selector == "e") &&
        (this.arguments["limit"] == null || this.arguments["limit"] != "1")) {
      throw ("Cannot work with data of multiple entities in data command");
    }
    return StraitWidget.builder.create(Data.remove(this, path: path));
  }

  ///
  ///Generates a Data Widget
  ///```dart
  ///entity.dataModify(path: "CustomName", modify: ...).queue()
  ///```

  RestActionAble dataModify(
      {@required String path, @required DataModify modify}) {
    if ((this.selector == "a" ||
        this.selector == "r" ||
        this.selector == "p" ||
        this.arguments["type"] == "minecraft:player" ||
        this.arguments["type"] == "player")) {
      throw ("Cannot modify a player's data");
    }
    if ((this.selector == "a" || this.selector == "e") &&
        (this.arguments["limit"] == null || this.arguments["limit"] != "1")) {
      throw ("Cannot work with data of multiple entities in data command");
    }
    return StraitWidget.builder
        .create(Data.modify(this, path: path, modify: modify));
  }

  ///
  ///Generates a Execute Widget (execute as the entity)
  ///```dart
  ///entity.execute().run(Say("hi")).queue()
  ///```

  RestActionAble execute({
    List<Widget> children,
    String targetFilePath = "objd",
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
  ///entity.exec().run(Say("hi")).queue()
  ///```
  ///short form for `entity.execute()`

  RestActionAble exec({
    List<Widget> children,
    String targetFilePath = "objd",
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
    String targetFilePath = "objd",
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
    String targetFilePath = "objd",
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
    String targetFilePath = "objd",
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
    String targetFilePath = "objd",
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
  ///entity.as().run(Say("hi")).queue()
  ///```

  RestActionAble as({
    List<Widget> children,
    String targetFilePath = "objd",
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
    String targetFilePath = "objd",
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
    String targetFilePath = "objd",
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
    String targetFilePath = "objd",
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
  ///entity.addTag("objDTest").queue()
  ///```

  RestActionAble addTag(String tag) =>
      StraitWidget.builder.create(Tag(tag, entity: this, value: true));

  ///
  ///Adds tags to the entity
  ///```dart
  ///entity.addTags(["objDTest","objDTest2"]).queue()
  ///```

  RestActionAble addTags(List<String> tags) => StraitWidget.builder.create(
      For.of(tags.map((tag) => Tag(tag, entity: this, value: true)).toList()));

  ///
  ///Removes a tag from the entity
  ///```dart
  ///entity.removeTag("objDTest").queue()
  ///```

  RestActionAble removeTag(String tag) =>
      StraitWidget.builder.create(Tag(tag, entity: this, value: false));

  ///
  ///Removes tags from the entity
  ///```dart
  ///entity.removeTags(["objDTest","objDTest2"]).queue()
  ///```

  RestActionAble removeTags(List<String> tags) => StraitWidget.builder.create(
      For.of(tags.map((tag) => Tag(tag, entity: this, value: false)).toList()));

  ///
  ///The entity joins a team
  ///```dart
  ///entity.joinTeam("red").queue()
  ///```

  RestActionAble joinTeam(String team) =>
      StraitWidget.builder.create(Team.join(team, this));

  ///
  ///The entity leaves a team
  ///```dart
  ///entity.leaveTeam("red").queue()
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
  String toString([Map arguments]) {
    if (arguments == null) arguments = this.arguments;
    if (playerName != null && playerName.isNotEmpty) return playerName;
    String ret = "@" + selector;

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
    String ret = "";

    if (arg != null) {
      arg = arg.toString().replaceAll(r"[0-9].0", "");
      ret += key.toString() + '=' + arg.toString();
    }
    return ret;
  }
}

class Range {
  num from, to, exact;

  /// The Range class defines a range of values(e.g 3..10 in vanilla)
  Range({this.from, this.to});

  /// Use Range.exact to get the exact Range(e.g 4)
  Range.exact(this.exact);

  @override
  String toString() {
    String ret = "0";
    if (exact != null) {
      ret = exact.toString();
    } else if (from != null && to == null) {
      ret = "$from..";
    } else if (from == null && to != null) {
      ret = "..$to";
    } else if (from != null && to != null) ret = "$from..$to";
    return ret.replaceAll(r'[0-9].0', '');
  }
}

enum Gamemode { creative, adventure, survival, spectator }
enum Sort { random, furthest, nearest, arbitrary }

/// There is an EntityType for every type_id in minecraft with `EntityType.[type_id]`
class EntityType {
  // throwable
  static const EntityType armor_stand = EntityType('armor_stand');
  static const EntityType area_effect_cloud = EntityType('area_effect_cloud');
  static const EntityType player = EntityType('player');
  static const EntityType boat = EntityType('boat');
  static const EntityType minecart = EntityType('minecart');
  static const EntityType chest_minecart = EntityType('chest_minecart');
  static const EntityType furnace_minecart = EntityType('furnace_minecart');
  static const EntityType tnt_minecart = EntityType('tnt_minecart');
  static const EntityType hopper_minecart = EntityType('hopper_minecart');
  static const EntityType spawner_minecart = EntityType('spawner_minecart');
  static const EntityType item = EntityType('item');
  static const EntityType experience_orb = EntityType('experience_orb');
  static const EntityType experience_bottle = EntityType('experience_bottle');
  static const EntityType arrow = EntityType('arrow');
  static const EntityType spectral_arrow = EntityType('spectral_arrow');
  static const EntityType trident = EntityType('trident');
  static const EntityType snowball = EntityType('snowball');
  static const EntityType egg = EntityType('egg');
  static const EntityType llama_spit = EntityType('llama_spit');
  static const EntityType ender_pearl = EntityType('ender_pearl');
  static const EntityType eye_of_ender = EntityType('eye_of_ender');
  static const EntityType fireworks_rocket = EntityType('fireworks_rocket');
  static const EntityType tnt = EntityType('tnt');
  static const EntityType falling_block = EntityType('falling_block');
  static const EntityType fishing_bobber = EntityType('fishing_bobber');
  static const EntityType leash_knot = EntityType('leash_knot');
  static const EntityType painting = EntityType('painting');
  static const EntityType item_frame = EntityType('item_frame');
  static const EntityType fireball = EntityType('fireball');
  static const EntityType shulker_bullet = EntityType('shulker_bullet');
  static const EntityType end_crystal = EntityType('end_crystal');
  static const EntityType evoker_fangs = EntityType('evoker_fangs');
  static const EntityType potion = EntityType('potion');

  // hostile
  static const EntityType elder_guardian = EntityType('elder_guardian');
  static const EntityType wither_skeleton = EntityType('wither_skeleton');
  static const EntityType stray = EntityType('stray');
  static const EntityType husk = EntityType('husk');
  static const EntityType zombie_villager = EntityType('zombie_villager');
  static const EntityType vex = EntityType('vex');
  static const EntityType vindicator = EntityType('vindicator');
  static const EntityType illager_beast = EntityType('illager_beast');
  static const EntityType illusioner = EntityType('illusioner');
  static const EntityType pillager = EntityType('pillager');
  static const EntityType creeper = EntityType('creeper');
  static const EntityType skeleton = EntityType('skeleton');
  static const EntityType spider = EntityType('spider');
  static const EntityType giant = EntityType('giant');
  static const EntityType zombie = EntityType('zombie');
  static const EntityType slime = EntityType('slime');
  static const EntityType ghast = EntityType('ghast');
  static const EntityType zombie_pigman = EntityType('zombie_pigman');
  static const EntityType enderman = EntityType('enderman');
  static const EntityType cave_spider = EntityType('cave_spider');
  static const EntityType silverfish = EntityType('silverfish');
  static const EntityType blaze = EntityType('blaze');
  static const EntityType magma_cube = EntityType('magma_cube');
  static const EntityType ender_dragon = EntityType('ender_dragon');
  static const EntityType wither = EntityType('wither');
  static const EntityType wither_skull = EntityType('wither_skull');
  static const EntityType witch = EntityType('witch');
  static const EntityType endermite = EntityType('endermite');
  static const EntityType guardian = EntityType('guardian');
  static const EntityType shulker = EntityType('shulker');
  static const EntityType dragon_fireball = EntityType('dragon_fireball');
  static const EntityType drowned = EntityType('drowned');

  // passive
  static const EntityType skeleton_horse = EntityType('skeleton_horse');
  static const EntityType zombie_horse = EntityType('zombie_horse');
  static const EntityType donkey = EntityType('donkey');
  static const EntityType mule = EntityType('mule');
  static const EntityType bat = EntityType('bat');
  static const EntityType pig = EntityType('pig');
  static const EntityType sheep = EntityType('sheep');
  static const EntityType cow = EntityType('cow');
  static const EntityType chicken = EntityType('chicken');
  static const EntityType squid = EntityType('squid');
  static const EntityType wolf = EntityType('wolf');
  static const EntityType mooshroom = EntityType('mooshroom');
  static const EntityType snowman = EntityType('snowman');
  static const EntityType ocelot = EntityType('ocelot');
  static const EntityType iron_golem = EntityType('iron_golem');
  static const EntityType horse = EntityType('horse');
  static const EntityType rabbit = EntityType('rabbit');
  static const EntityType polar_bear = EntityType('polar_bear');
  static const EntityType llama = EntityType('llama');
  static const EntityType parrot = EntityType('parrot');
  static const EntityType villager = EntityType('villager');
  static const EntityType cod = EntityType('cod');
  static const EntityType salmon = EntityType('salmon');
  static const EntityType tropical_fish = EntityType('tropical_fish');
  static const EntityType turtle = EntityType('turtle');
  static const EntityType dolphin = EntityType('dolphin');
  static const EntityType panda = EntityType('panda');

  final String type;
  const EntityType(this.type);

  bool operator ==(dynamic other) {
    if (other is EntityType && other.type == this.type) {
      return true;
    }
    if (other is String && other == this.type) {
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return type;
  }
}
