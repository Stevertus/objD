import 'package:objd/basic/group.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/basic/rotation.dart';
import 'package:objd/build/build.dart';


// TODO: Concerns of unsolid structure, too many calls?

/// The execute command has multiple syntaxes that allow to manipulate the position, executer or condition.
class Execute extends Widget {

  List<String> _args = [];
  get args => _args;
  List<Widget> children;
  bool encapsulate; 


  Execute({
    @required this.children,
      Entity as,
      Entity at,
      dynamic location,
      String align,
      Facing anchor,
      dynamic facing,
      Rotation rotation,
      Dimension dimension,
      this.encapsulate = true,
    List<String> args
    }){
    if(args != null) _args = args;
    
    if(as != null) _args= this.as(as).args;
    if(at != null)  _args = this.at(at).args;
    if(location != null)  _args = this.positioned(location).args;
    if(align != null)  _args = this.align(align).args;
    if(anchor != null)  _args = this.anchored(anchor).args;
    if(facing != null)  _args = this.facing(facing).args;
    if(rotation != null)  _args = this.rotated(rotation).args;
    if(dimension != null)  _args = this.dimension(dimension).args;


  }

  Execute.as(Entity entity,{@required this.children, this.encapsulate = true}){
    _args = as(entity).args;
  }
  Execute.at(Entity entity,{@required this.children, this.encapsulate = true}){
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
  Execute.asat(Entity entity,{@required this.children, this.encapsulate = true}){
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
  Execute.positioned(dynamic loc,{@required this.children, this.encapsulate = true}){
    _args = positioned(loc).args;
  }
  /// Aligns the position to the corners of the block grid.
  Execute.align(String axis,{@required this.children, this.encapsulate = true}){
    _args = align(axis).args;
  }
  /// Sets the execution position(^ ^ ^) to the eyes or the feet.
  Execute.anchored(Facing anchor,{@required this.children, this.encapsulate = true}){
     _args = anchored(anchor).args;
  }
  /// Sets the execution rotation to the given rotation.
  Execute.rotated(dynamic rot,{@required this.children, this.encapsulate = true}){
     _args = rotated(rot).args;
  }

  ///Sets the execution dimension(execute in) to either `Dimension.overworld`, `Dimension.the_end` or `Dimension.the_nether`.
  Execute.dimension(Dimension dimension,{@required this.children, this.encapsulate = true}){
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
  Execute.facing(dynamic target,{@required this.children, this.encapsulate = true,Facing facing = Facing.eyes}){
     _args = this.facing(target,facing: facing).args;
  }

  @override
  Widget generate(Context context){
    return Group(children: children,prefix: 'execute ' + _args.join(" ") + ' run',groupMin: encapsulate ? 3 : -1,filename: 'execute');
  }

  Execute _addArgumentRet(String arg){
  List<String> args = new List<String>.from(this._args);
      args.add(arg);
    return new Execute(children: this.children,encapsulate: this.encapsulate, args:args);
  }

  // the entity from which the children should run
  Execute as(Entity entity){
    return _addArgumentRet( 'as ' + entity.toString());
  }

  // the entity from where the children should run
  Execute at(Entity entity){
    return _addArgumentRet( 'at ' + entity.toString());
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
  Execute asat(Entity entity) {
    return _addArgumentRet( 'as ' + entity.toString() + ' at @s');
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
  Execute positioned(dynamic loc){
    if(!(loc is Location || loc is Entity)) throw("Please insert either a Location or an Entity into Execute.positioned");
    return _addArgumentRet( 'positioned ' + (loc is Entity ? 'as ': '') + loc.toString());
  }

  /// Aligns the position to the corners of the block grid.
  Execute align(String axis){
    assert(axis.isEmpty);
     return _addArgumentRet( 'align ' + axis);
  }

  // centeres the alignment(middle of the block)
  Execute center(){
     return _addArgumentRet( 'align xyz positioned ~0.5 ~0.5 ~0.5');
  }

  /// Sets the execution position(^ ^ ^) to the eyes or the feet.
  Execute anchored(Facing anchor){
     return _addArgumentRet( 'anchored ' + anchor.toString().split('.')[1]);
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
  Execute facing(dynamic target,{Facing facing = Facing.eyes}){
     if(target is Location){
       return _addArgumentRet( 'facing ' + target.toString());
     } 
     if(target is Entity){
       return _addArgumentRet( 'facing entity' + target.toString() + ' ' + facing.toString().split('.')[1]);
     }
     throw("Please insert either a Location or an Entity into Execute.facing");
  }

  ///Sets the execution rotation to the given rotation.
  Execute rotated(dynamic rot){
     if(rot is Rotation){
       return _addArgumentRet( 'rotated ' + rot.toString());
     } 
     if(rot is Entity){
       return _addArgumentRet( 'rotated as ' + rot.toString());
     }
     throw("Please insert either a Rotation or an Entity into Execute.rotated");
  }

  ///Sets the execution dimension(execute in) to either `Dimension.overworld`, `Dimension.the_end` or `Dimension.the_nether`.
  Execute dimension(Dimension dimension){
     return _addArgumentRet( 'in ' + dimension.toString().split('.')[1]);
  }

}


enum Facing{
  eyes,
  feet
}
enum Dimension{
  overworld,
  the_end,
  the_nether
}