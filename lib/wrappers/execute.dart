import 'package:objd/basic/condition.dart';
import 'package:objd/basic/group.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/basic/rotation.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';
import 'package:objd/wrappers/widgets.dart';

/// The execute command has multiple syntaxes that allow to manipulate the position, executer or condition.
class Execute extends RestActionAble {
  List<List<String>> _args = [[]];

  // The arguments
  get args => _args;

  // Child content
  List<Widget> children = [];

  // The name of the file that is generated if it has to much content
  String targetFileName;

  // The path of the file that is generated if it has to much content
  String targetFilePath;

  // Generate at a file if execute command has to much gontent
  bool encapsulate = true;

  /// All Execute classes are also an Group, so they will group commands in seperate files and allow multiple children.
  Execute(
      {this.children,
      Entity as,
      Entity at,
      dynamic location,
      String align,
      this.targetFilePath = "objd",
      this.targetFileName,
      Facing anchor,
      Condition If,
      Condition unless,
      dynamic facing,
      Rotation rotation,
      Dimension dimension,
      this.encapsulate = true,
      List<List<String>> args,
      List<Widget> writable}) {
    if (args != null) _args = args;

    if (as != null) _args = this.as(as).args;
    if (at != null) _args = this.at(at).args;
    if (location != null) _args = this.positioned(location).args;
    if (align != null) _args = this.align(align).args;
    if (anchor != null) _args = this.anchored(anchor).args;
    if (facing != null) _args = this.facing(facing).args;
    if (rotation != null) _args = this.rotated(rotation).args;
    if (dimension != null) _args = this.dimension(dimension).args;
    if (If != null) this._args = this.If(If).args;
    if (unless != null) this._args = this.unless(unless).args;

    if(this.children == null) this.children = [];
    this.writable = writable;
  }

  Execute.strait({
    @required Function(List<Widget>) run,
    Entity as,
    Entity at,
    dynamic location,
    String align,
    String targetFilePath = "objd",
    String targetFileName,
    Facing anchor,
    Condition If,
    Condition unless,
    dynamic facing,
    Rotation rotation,
    Dimension dimension,
    bool encapsulate = true,
    List<List<String>> args,
    List<Widget> writable
  }): this(children: [new StraitWidget(run)], as: as, at: at, location: location, align: align, targetFilePath: targetFilePath, targetFileName: targetFileName,anchor: anchor,If: If,unless: unless,
           rotation: rotation, dimension: dimension, encapsulate: encapsulate, args: args, writable: writable);

  Execute.as(Entity entity,{@required this.children, this.encapsulate = true}) {
    _args = as(entity).args;
  }
  Execute.at(Entity entity,{@required this.children, this.encapsulate = true}) {
    _args = at(entity).args;
  }

  /// Asat combines as and at to just one entity.
  /// ```dart
  /// Execute.asat(
  /// 	Entity.player(),
  /// 	children: List<Widget> [
  /// 		Command("/say I get executed")
  /// 	]
  /// ),
  ///
  /// ⇒ execute as @p at @s run say I get executed
  /// ```
  Execute.asat(Entity entity,{@required this.children, this.encapsulate = true}) {
    _args = this.asat(entity).args;
  }

  /// Positioned sets the execution point of the command to a new Location or Entity.
  /// ```dart
  /// Execute.positioned(
  /// 	Entity.player(), // Location...
  /// 	children: List<Widget> [
  /// 		Command("/say I get executed")
  /// 	]
  /// ),
  ///
  /// ⇒ execute positioned as @p run say I get executed
  /// ```
  Execute.positioned(dynamic loc,{@required this.children, this.encapsulate = true}) {
    _args = positioned(loc).args;
  }

  /// Aligns the position to the corners of the block grid.
  Execute.align(String axis,{@required this.children, this.encapsulate = true}) {
    _args = align(axis).args;
  }

  /// Sets the execution position(^ ^ ^) to the eyes or the feet.
  Execute.anchored(Facing anchor,{@required this.children, this.encapsulate = true}) {
    _args = anchored(anchor).args;
  }

  /// Sets the execution rotation to the given rotation.
  Execute.rotated(dynamic rot,{@required this.children, this.encapsulate = true}) {
    _args = rotated(rot).args;
  }

  ///Sets the execution dimension(execute in) to either `Dimension.overworld`, `Dimension.the_end` or `Dimension.the_nether`.
  Execute.dimension(Dimension dimension,{@required this.children, this.encapsulate = true}) {
    _args = this.dimension(dimension).args;
  }

  ///Sets the execution rotation so that it faces a location or an entity's feet or eyes.
  /// **Example:**
  /// ```dart
  /// Execute.facing(
  /// 	Entity.player(), // or Location...
  /// 	facing: Facing.feet // optional
  /// 	children: List<Widget> [
  /// 		Command("/say I get executed")
  /// 	]
  /// )
  /// ⇒ execute facing entity @p feet run say I get executed
  /// ```
  Execute.facing(dynamic target,{@required this.children,this.encapsulate = true,Facing facing = Facing.eyes}) {
    _args = this.facing(target, facing: facing).args;
  }

  @override
  Widget generate(Context context) {
    return Group(
        children: children,
        prefix: 'execute ' + _args.join(" ") + ' run',
        groupMin: encapsulate ? 3 : -1,
        generateIDs: targetFileName == null,
        path:targetFilePath ?? "objd",
        filename: targetFileName ?? 'execute');
  }

  Execute _addArgumentRet(String arg) {
    List<List<String>> args = _resolve(this._args);
    args.forEach((e) => e.add(arg));
    return new Execute(children: List<Widget>.from(this.children), encapsulate: this.encapsulate, args: args, writable: writable);
  }

  // the entity from which the children should run
  Execute as(Entity entity) => _addArgumentRet('as ' + entity.toString());

  // the entity from where the children should run
  Execute at(Entity entity) => _addArgumentRet('at ' + entity.toString());

  /// Asat combines as and at to just one entity.
  /// ```dart
  /// Execute.asat(
  /// 	Entity.player(),
  /// 	children: List<Widget> [
  /// 		Command("/say I get executed")
  /// 	]
  /// ),
  ///
  /// ⇒ execute as @p at @s run say I get executed
  /// ```
  Execute asat(Entity entity) => _addArgumentRet('as ' + entity.toString() + ' at @s');

  /// Positioned sets the execution point of the command to a new Location or Entity.
  /// ```dart
  /// Execute.positioned(
  /// 	Entity.player(), // Location...
  /// 	children: List<Widget> [
  /// 		Command("/say I get executed")
  /// 	]
  /// ),
  ///
  /// ⇒ execute positioned as @p run say I get executed
  /// ```
  Execute positioned(dynamic loc) {
    if (!(loc is Location || loc is Entity))
      throw ("Please insert either a Location or an Entity into Execute.positioned");
    return _addArgumentRet(
        'positioned ' + (loc is Entity ? 'as ' : '') + loc.toString());
  }

  /// Aligns the position to the corners of the block grid.
  Execute align(String axis) {
    assert(axis.isNotEmpty);
    return _addArgumentRet('align ' + axis);
  }

  // centeres the alignment(middle of the block)
  Execute center() => align("xyz");
  
  // centeres the alignment(vertical middle of the block)
  Execute vcenter() => align("xz");

  /// Sets the execution position(^ ^ ^) to the eyes or the feet.
  Execute anchored(Facing anchor) {
    return _addArgumentRet('anchored ' + anchor.toString().split('.')[1]);
  }

  ///Sets the execution rotation so that it faces a location or an entity's feet or eyes.
  /// **Example:**
  /// ```dart
  /// Execute.facing(
  /// 	Entity.player(), // or Location...
  /// 	facing: Facing.feet // optional
  /// 	children: List<Widget> [
  /// 		Command("/say I get executed")
  /// 	]
  /// )
  /// ⇒ execute facing entity @p feet run say I get executed
  /// ```
  Execute facing(dynamic target, {Facing facing = Facing.eyes}) {
    if (target is Location) {
      return _addArgumentRet('facing ' + target.toString());
    }
    if (target is Entity) {
      return _addArgumentRet('facing entity' +
          target.toString() +
          ' ' +
          facing.toString().split('.')[1]);
    }
    throw ("Please insert either a Location or an Entity into Execute.facing");
  }

  
  Execute If(Condition c) {
    List<String> prefixes = Condition.getPrefixes(c.getList());
    List<List<String>> args = this.args;
    this._args = [];
    prefixes.forEach((p) {
      List<List<String>> add = new List<List<String>>();
      args.forEach((e) => add.add(List<String>.from(e)));
      add.forEach((e) => e.add(p));
      this.args.addAll(add);
    });
    return this;
  }

  storeBlock({ExecuteStoreResultType result = ExecuteStoreResultType.result, @required Location location, @required String path, int scale = 1, ExecuteStoreVarType varType = ExecuteStoreVarType.int}) 
    => _addArgumentRet('store ' + result.toString().split(".")[1] + ' block ' + location.toString() + ' ' + path + ' ' + varType.toString().split(".")[1] + ' ' + scale.toString());

  storeEntity({ExecuteStoreResultType result = ExecuteStoreResultType.result, @required Entity entity, @required String path, int scale = 1, ExecuteStoreVarType varType = ExecuteStoreVarType.int}) 
    => _addArgumentRet('store ' + result.toString().split(".")[1] + ' entity ' + entity.toString() + ' ' + path +  ' ' + varType.toString().split(".")[1] + ' ' + scale.toString());

  storeScore({ExecuteStoreResultType result = ExecuteStoreResultType.result, @required Entity entity, @required String score}) 
    => _addArgumentRet('store ' + result.toString().split(".")[1] + ' score ' + entity.toString() + ' ' + score);

  storeBossbar({ExecuteStoreResultType result = ExecuteStoreResultType.result, @required String name, BossbarOption setting = BossbarOption.value}) 
    => _addArgumentRet('store ' + result.toString().split(".")[1] + ' score ' + name + ' ' + setting.toString().split(".")[1]);

  Execute unless(Condition c) => If(Condition.not(c));

  ///Sets the execution rotation to the given rotation.
  Execute rotated(dynamic rot) {
    if (rot is Rotation) {
      return _addArgumentRet('rotated ' + rot.toString());
    }
    if (rot is Entity) {
      return _addArgumentRet('rotated as ' + rot.toString());
    }
    throw ("Please insert either a Rotation or an Entity into Execute.rotated");
  }

  ///Sets the execution dimension(execute in) to either `Dimension.overworld`, `Dimension.the_end` or `Dimension.the_nether`.
  Execute dimension(Dimension dimension) {
    return _addArgumentRet('in ' + dimension.toString().split('.')[1]);
  }
  Execute In(Dimension d) => dimension(d);

  Execute run(Widget w) {
    List<Widget> children = new List<Widget>.from(this.children);
    children.add(w);
    return new Execute(children: children, encapsulate: this.encapsulate, args: _resolve(this.args), writable: writable);
  }

  Execute runStrait(Function(List<Widget>) f) => run(new StraitWidget(f));

  List<List<String>> _resolve(src) {
    List<List<String>> ret = new List<List<String>>();
    src.forEach((e) => ret.add(List<String>.from(e)));
    return ret;
  }
}

enum Facing { eyes, feet }
enum Dimension { overworld, the_end, the_nether }


enum ExecuteStoreResultType {result, success}
enum ExecuteStoreVarType {byte, short, int, long, float, double}

