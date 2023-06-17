import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';
import 'package:objd/src/wrappers/widgets.dart';

/// The execute command has multiple syntaxes that allow to manipulate the position, executer or condition.
class Execute extends RestActionAble {
  List<List<String>> _args = [[]];

  // The arguments
  List<List<String>> get args => _args;

  // Child content
  List<Widget> children = [];

  // The name of the file that is generated if it has to much content
  String? targetFileName;

  // The path of the file that is generated if it has to much content
  String targetFilePath;

  // Generate at a file if execute command has to much content
  bool encapsulate = true;

  /// All Execute classes are also an Group, so they will group commands in seperate files and allow multiple children.
  Execute({
    this.children = const [],
    Entity? as,
    Entity? at,
    Relation? on,
    dynamic location,
    String? align,
    this.targetFilePath = 'objd',
    this.targetFileName,
    Facing? anchor,
    Condition? If,
    Condition? unless,
    dynamic facing,
    Rotation? rotation,
    Dimension? dimension,
    this.encapsulate = true,
    List<List<String>>? args,
    List<Widget>? writable,
  }) {
    if (args != null) _args = args;

    if (on != null) _args = this.on(on).args;
    if (as != null) _args = this.as(as).args;
    if (at != null) _args = this.at(at).args;
    if (location != null) _args = positioned(location).args;
    if (align != null) _args = this.align(align).args;
    if (anchor != null) _args = anchored(anchor).args;
    if (facing != null) _args = this.facing(facing).args;
    if (rotation != null) _args = rotated(rotation).args;
    if (dimension != null) _args = this.dimension(dimension).args;
    if (If != null) _args = this.If(If).args;
    if (unless != null) _args = this.unless(unless).args;

    this.writable = writable;
  }

  Execute.strait({
    required Function(List<Widget>) run,
    Entity? as,
    Entity? at,
    Relation? on,
    dynamic location,
    String? align,
    String targetFilePath = 'objd',
    String? targetFileName,
    Facing? anchor,
    Condition? If,
    Condition? unless,
    dynamic facing,
    Rotation? rotation,
    Dimension? dimension,
    bool encapsulate = true,
    List<List<String>>? args,
    List<Widget>? writable,
  }) : this(
          children: [StraitWidget(run)],
          as: as,
          at: at,
          on: on,
          location: location,
          align: align,
          targetFilePath: targetFilePath,
          targetFileName: targetFileName,
          anchor: anchor,
          If: If,
          unless: unless,
          rotation: rotation,
          dimension: dimension,
          encapsulate: encapsulate,
          args: args,
          writable: writable,
        );

  /// Changes the executor to a related entity, but keeps the position the same
  ///
  /// takes in a relation type which is either `Relation.attacker, Relation.controller, Relation.leasher, Relation.origin, Relation.owner, Relation.passengers, Relation.target, Relation.vehicle`
  Execute.on(
    Relation relation, {
    required this.children,
    this.encapsulate = true,
    this.targetFilePath = 'objd',
    this.targetFileName,
  }) {
    _args = on(relation).args;
  }

  /// Summons a new entity at execution position and changes the executor to this summoned entity.
  /// ```dart
  ///  Execute.summon(
  ///   Entities.sheep,
  ///   children: [
  ///     Tag('Test').add()
  ///   ]
  ///  )
  /// ```
  Execute.summon(
    EntityType entity, {
    required this.children,
    this.encapsulate = true,
    this.targetFilePath = 'objd',
    this.targetFileName,
  }) {
    _args = summon(entity).args;
  }
  Execute.as(
    Entity entity, {
    required this.children,
    this.encapsulate = true,
    this.targetFilePath = 'objd',
    this.targetFileName,
  }) {
    _args = as(entity).args;
  }
  Execute.at(
    Entity entity, {
    required this.children,
    this.encapsulate = true,
    this.targetFilePath = 'objd',
    this.targetFileName,
  }) {
    _args = at(entity).args;
  }

  /// Asat combines as and at to just one entity.
  /// ```dart
  /// Execute.asat(
  /// 	Entity.player(),
  /// 	children: List<Widget> [
  /// 		Command('/say I get executed')
  /// 	]
  /// ),
  ///
  /// ⇒ execute as @p at @s run say I get executed
  /// ```
  Execute.asat(
    Entity entity, {
    required this.children,
    this.encapsulate = true,
    this.targetFilePath = 'objd',
    this.targetFileName,
  }) {
    _args = asat(entity).args;
  }

  /// Positioned sets the execution point of the command to a new Location or Entity.
  /// ```dart
  /// Execute.positioned(
  /// 	Entity.player(), // Location...
  /// 	children: List<Widget> [
  /// 		Command('/say I get executed')
  /// 	]
  /// ),
  ///
  /// ⇒ execute positioned as @p run say I get executed
  /// ```
  /// When given a Heightmap, sets the y-coordinate to the current positions heightmap(world_suface, motion_blocking, motion_blocking_no_leaves, ocean_floor) by generating the over subcommand:
  ///
  /// ```dart
  /// Execute.positioned(
  /// 	Heighmap.motion_blocking, // Location...
  /// 	children: List<Widget> [
  /// 		Command("/say I get executed")
  /// 	]
  /// ),
  /// ⇒ execute positioned over motion_blocking run say I get executed
  /// ```
  Execute.positioned(
    dynamic loc, {
    required this.children,
    this.encapsulate = true,
    this.targetFilePath = 'objd',
    this.targetFileName,
  }) {
    _args = positioned(loc).args;
  }

  /// Aligns the position to the corners of the block grid.
  Execute.align(
    String axis, {
    required this.children,
    this.encapsulate = true,
    this.targetFilePath = 'objd',
    this.targetFileName,
  }) {
    _args = align(axis).args;
  }

  /// Sets the execution position(^ ^ ^) to the eyes or the feet.
  Execute.anchored(
    Facing anchor, {
    required this.children,
    this.encapsulate = true,
    this.targetFilePath = 'objd',
    this.targetFileName,
  }) {
    _args = anchored(anchor).args;
  }

  /// Sets the execution rotation to the given rotation.
  Execute.rotated(
    dynamic rot, {
    required this.children,
    this.encapsulate = true,
    this.targetFilePath = 'objd',
    this.targetFileName,
  }) {
    _args = rotated(rot).args;
  }

  ///Sets the execution dimension(execute in) to either `Dimension.overworld`, `Dimension.the_end` or `Dimension.the_nether`.
  Execute.dimension(
    Dimension dimension, {
    required this.children,
    this.encapsulate = true,
    this.targetFilePath = 'objd',
    this.targetFileName,
  }) {
    _args = this.dimension(dimension).args;
  }

  ///Sets the execution rotation so that it faces a location or an entity's feet or eyes.
  /// **Example:**
  /// ```dart
  /// Execute.facing(
  /// 	Entity.player(), // or Location...
  /// 	facing: Facing.feet // optional
  /// 	children: List<Widget> [
  /// 		Command('/say I get executed')
  /// 	]
  /// )
  /// ⇒ execute facing entity @p feet run say I get executed
  /// ```
  Execute.facing(
    dynamic target, {
    required this.children,
    this.encapsulate = true,
    this.targetFilePath = 'objd',
    this.targetFileName,
    Facing facing = Facing.eyes,
  }) {
    _args = this.facing(target, facing: facing).args;
  }

  @override
  Widget generate(Context context) {
    List<Widget> res = _args
        .map((subargs) => Group(
              children: children,
              prefix: 'execute ${subargs.join(' ')} run',
              groupMin: encapsulate ? 3 : -1,
              generateIDs: targetFileName == null,
              path: targetFilePath,
              filename: targetFileName ?? 'execute',
            ))
        .toList();
    if (res.length == 1) return res[0];
    return For.of(res);
  }

  Execute _addArgumentRet(String arg) {
    var args = _resolve(_args);
    for (var e in args) {
      e.add(arg);
    }
    return Execute(
      children: List<Widget>.from(children),
      encapsulate: encapsulate,
      args: args,
      writable: writable,
    );
  }

  Execute summon(EntityType entity) => _addArgumentRet('summon $entity');

  /// Updates the executor, selecting entities based on relation to the current executor entity (changing the original executor),
  /// without changing execution position, rotation, dimension, and anchor.
  ///
  /// Terminates if the executor is not an entity, the relation is not applicable to the current executor entity or there are no entities matching it.
  Execute on(Relation relation) => _addArgumentRet('on ${relation.name}');

  // the entity from which the children should run
  Execute as(Entity entity) => _addArgumentRet('as $entity');

  // the entity from where the children should run
  Execute at(Entity entity) => _addArgumentRet('at $entity');

  /// Asat combines as and at to just one entity.
  /// ```dart
  /// Execute.asat(
  /// 	Entity.player(),
  /// 	children: List<Widget> [
  /// 		Command('/say I get executed')
  /// 	]
  /// ),
  ///
  /// ⇒ execute as @p at @s run say I get executed
  /// ```
  Execute asat(Entity entity) => _addArgumentRet('as $entity at @s');

  /// Positioned sets the execution point of the command to a new Location, Heightmap or Entity.
  /// ```dart
  /// Execute.positioned(
  /// 	Entity.player(), // Location...
  /// 	children: List<Widget> [
  /// 		Command('/say I get executed')
  /// 	]
  /// ),
  ///
  /// ⇒ execute positioned as @p run say I get executed
  /// ```
  Execute positioned(dynamic loc) {
    if (loc is Heightmap) return over(loc);

    if (!(loc is Location || loc is Entity)) {
      throw ('Please insert either a Location or an Entity into Execute.positioned');
    }
    return _addArgumentRet('positioned ${loc is Entity ? 'as ' : ''}$loc');
  }

  /// Positioned at the Y-coordinate of a specific heightmap
  Execute over(Heightmap height) {
    return _addArgumentRet('positioned over ${height.name}');
  }

  /// Aligns the position to the corners of the block grid.
  Execute align(String axis) {
    assert(axis.isNotEmpty);
    return _addArgumentRet('align $axis');
  }

  // Centers the alignment(middle of the block)
  Execute center([double y = 0.5]) => align('xyz positioned ~0.5 ~$y ~0.5');

  // Centers the alignment(vertical middle of the block)
  Execute vcenter() => align('xz');

  /// Sets the execution position(^ ^ ^) to the eyes or the feet.
  Execute anchored(Facing anchor) {
    return _addArgumentRet('anchored ${anchor.name}');
  }

  ///Sets the execution rotation so that it faces a location or an entity's feet or eyes.
  /// **Example:**
  /// ```dart
  /// Execute.facing(
  /// 	Entity.player(), // or Location...
  /// 	facing: Facing.feet // optional
  /// 	children: List<Widget> [
  /// 		Command('/say I get executed')
  /// 	]
  /// )
  /// ⇒ execute facing entity @p feet run say I get executed
  /// ```
  Execute facing(dynamic target, {Facing facing = Facing.eyes}) {
    if (target is Location) {
      return _addArgumentRet('facing $target');
    }
    if (target is Entity) {
      return _addArgumentRet('facing entity $target ${facing.name}');
    }
    throw ('Please insert either a Location or an Entity into Execute.facing');
  }

  Execute If(Condition c) {
    var prefixes = Condition.getPrefixes(c.getList());
    var args = this.args;
    _args = [];
    for (var p in prefixes) {
      var add = <List<String>>[];
      for (var e in args) {
        add.add(List<String>.from(e));
      }
      for (var e in add) {
        e.add(p);
      }
      _args.addAll(add);
    }
    return this;
  }

  /// just for internal use
  static Group internal_store_command(String type, Widget w, bool useSuccess) =>
      Group(
        prefix: 'execute store ${useSuccess ? 'success ' : 'result '}$type run',
        groupMin: 1000,
        children: [w],
      );

  Execute storeBlock({
    ExecuteStoreResultType result = ExecuteStoreResultType.result,
    required Location location,
    required String path,
    int scale = 1,
    ExecuteStoreVarType varType = ExecuteStoreVarType.int,
  }) =>
      _addArgumentRet([
        'store',
        result.name,
        'block',
        location.toString(),
        path,
        varType.name,
        scale.toString()
      ].join(' '));

  Execute storeEntity({
    ExecuteStoreResultType result = ExecuteStoreResultType.result,
    required Entity entity,
    required String path,
    int scale = 1,
    ExecuteStoreVarType varType = ExecuteStoreVarType.int,
  }) =>
      _addArgumentRet(
          'store ${result.name} entity $entity $path ${varType.name} $scale');

  Execute storeScore({
    ExecuteStoreResultType result = ExecuteStoreResultType.result,
    required Score score,
  }) =>
      _addArgumentRet(
        'store ${result.name} score ${score.entity} ${score.score}',
      );

  Execute storeBossbar({
    ExecuteStoreResultType result = ExecuteStoreResultType.result,
    required String name,
    BossbarOption setting = BossbarOption.value,
  }) =>
      _addArgumentRet('store ${result.name} score $name ${setting.name}');

  Execute unless(Condition c) => If(Condition.not(c));

  ///Sets the execution rotation to the given rotation.
  Execute rotated(dynamic rot) {
    if (rot is Rotation) {
      return _addArgumentRet('rotated $rot');
    }
    if (rot is Entity) {
      return _addArgumentRet('rotated as $rot');
    }
    throw ('Please insert either a Rotation or an Entity into Execute.rotated');
  }

  ///Sets the execution dimension(execute in) to either `Dimension.overworld`, `Dimension.the_end` or `Dimension.the_nether`.
  Execute dimension(Dimension dimension) {
    return _addArgumentRet('in $dimension');
  }

  Execute In(Dimension d) => dimension(d);

  Execute run(Widget w) {
    var children = List<Widget>.from(this.children);
    children.add(w);
    return Execute(
        children: children,
        encapsulate: encapsulate,
        args: _resolve(args),
        writable: writable);
  }

  Execute runStrait(Function(List<Widget>) f) => run(StraitWidget(f));

  List<List<String>> _resolve(src) {
    var ret = <List<String>>[];
    src.forEach((e) => ret.add(List<String>.from((e as List<dynamic>))));
    return ret;
  }
}

enum Facing { eyes, feet }

class Dimension {
  static final overworld = Dimension("minecraft:overworld");
  static final the_end = Dimension("minecraft:the_end");
  static final the_nether = Dimension("minecraft:the_nether");

  final String name;
  const Dimension(this.name);

  @override
  String toString() => name;
}

enum ExecuteStoreResultType { result, success }

enum ExecuteStoreVarType { byte, short, int, long, float, double }

enum Relation {
  /// the last entity that damaged the current executor entity in the previous 5 second
  attacker,

  /// the entity that is riding and controlling the current executor entity
  controller,

  /// the entity leading the current executor entity with a leash.
  leasher,

  /// the entity that cause the summon of the current executor entity. For example, the shooter of an arrow, the primer of a primed TNT entity.
  origin,

  /// the owner of the current executor entity if it is a tameable animal.
  owner,

  /// all entities that are directly riding the current executor entity, no sub-passengers.
  passengers,

  /// the attack target of the current executor entity.
  target,

  /// the entity ridden by the current executor entity.
  vehicle
}

/// Heightmaps to be used in Execute.positioned
enum Heightmap {
  /// Y-level of the highest non-air block.
  world_suface,

  /// Y-level of the highest block whose material blocks motion or blocks that contains a fluid.
  motion_blocking,

  /// Y-level of the highest block whose material blocks motion or blocks that contains a fluid except leaves.
  motion_blocking_no_leaves,

  /// Y-level of the highest block whose material blocks motion
  ocean_floor
}
