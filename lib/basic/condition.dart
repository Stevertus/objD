import 'package:meta/meta.dart';
import 'package:objd/basic/area.dart';
import 'package:objd/basic/block.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/basic/score.dart';
import 'package:objd/basic/tag.dart';

/// The Condition class defines conditions for the if widget and more. It can also combines conditions and generates an argument list.
class Condition {
  List<Condition> _children = [];
  _ConditionType type;
  _ConditionUtil _generated;

  /// The Condition class defines conditions for the if widget and more. It can also combines conditions and generates an argument list.
  ///  A condition can accept many values and this makes the Condition very complex. 
  /// 
/// | The argument can be a... | and generates e.g ||
/// |--|--|--|
/// | Entity | if entity @s |
/// | Score | if score @s objective matches 5| Attention! This needs a score condition method!
/// | Location | unless block ~ ~2 ~ air | Just checks weather a block is present
/// | Condition | if entity @s if block ~ ~ ~ stone | Yes, you can nest Conditions like Widgets and combine them.
  Condition(dynamic cond) {
    _setCond(cond);
  }

  /// checks the value of a score 
  /// Attention! This needs a score condition method!
  Condition.score(Score cond) {
    _setCond(cond);
  }
  /// checks whether a block is at a given location
  Condition.block(Location cond,{@required Block block}) {
    _setCond(cond,block: block);
  }
  /// checks whether an area matches another area of blocks
  Condition.blocks(Area cond,{@required Location compare}) {
    assert(compare != null);
    _setCond(cond,target: compare);
  }
  /// checks if the entity exists
  Condition.entity(Entity cond) {
    _setCond(cond);
  }
  // checks if the tag exists
  Condition.tag(Tag cond) {
    _setCond(cond);
  }
  /// accepts same dynamic condition types as Condition but negates them
  ///(if ⇒ unless, unless ⇒  if)
  Condition.not(dynamic cond) {
    type = _ConditionType.invert;
    _setCond(cond, invert: true);
  }
  /// accepts a list of dynamic condition types, that all have to be true to trigger
  Condition.and(List<dynamic> conds) {
    type = _ConditionType.and;
    conds.forEach((cond) {
      if(cond is Condition) _children.add(cond);
      else _children.add(new Condition(cond));
    });
  }
  /// accepts a list of dynamic condition types, but just one has to be true to trigger
  Condition.or(List<dynamic> conds) {
    type = _ConditionType.or;
    conds.forEach((cond) {
      if(cond is Condition) _children.add(cond);
      else _children.add(new Condition(cond));
    });
  }

  _setCond(dynamic cond, {bool invert = false, Block block, Location target}) {
    switch (_getType(cond)) {
      case "Condition":
        _children.add(cond);
        if (invert) _children.forEach((child) => child._invertGenerated());
        break;
      case "Entity":
        _generated =
            new _ConditionUtil("entity " + cond.toString(), invert: invert);
        break;
      case "Block":
        _generated =
            new _ConditionUtil("block ~ ~ ~ " + cond.toString(), invert: invert);
        break;
      case "Score":
        if(cond.getString().isEmpty) throw("Please insert a score condition method into a condidition!");
        _generated =
            new _ConditionUtil("score " + cond.getString(), invert: invert);
        break;
      case "Tag":
        _generated =
            new _ConditionUtil("entity " + cond.getEntity(), invert: invert);
        break;
      case "Location":
        if(block == null) _generated = new _ConditionUtil("block " + cond.toString() + " minecraft:air", invert: !invert);
        else _generated = new _ConditionUtil("block " + cond.toString() + " " + block.toString(), invert: invert);
        break;
      case "Area":
        if(target != null) "Please use Condition.blocks to test for an area of blocks!";        
        _generated = new _ConditionUtil("blocks " + cond.getCoordinates() + " " + target.toString(), invert: invert);
        break;
      default: throw(" A Condition can just take in another Condition, Entity, Block, Score or Tag!");
    }
  }

  _invertGenerated() {
    if (_generated != null) _generated.invert = !_generated.invert;
    if (_children != null)
      _children.forEach((child) => child._invertGenerated());
  }

  String _getType(dynamic cond) {
    if (cond is Condition) return "Condition";
    if (cond is Entity) return "Entity";
    if (cond is Location) return "Location";
    if (cond is Area) return "Area";
    if (cond is Block) return "Block";
    if (cond is Score) return "Score";
    if (cond is Tag) return "Tag";
    return null;
  }

  List<List<_ConditionUtil>> getList() {
    List<List<_ConditionUtil>> list = [[]];
        _children.forEach((child) {
          if (list.length == 1 && list[0].isEmpty)
            list = child.getList();
          // is and
          else if (type == _ConditionType.and) {
            list = child.getList().map((inner){
              list.forEach((inner2) {
                inner.insertAll(0,inner2);
              });
              return inner;
            }).toList();
          }
          else {
           // is or
            list.addAll(child.getList());
          }

        });
    if (_generated != null) {
      list.forEach((outer) {
        outer.insert(0, _generated);
      });
    }

    return list;
  }

 static List<String> getPrefixes(List<List<_ConditionUtil>> conds,[bool invert = false]){
  return conds.map((outer) {
      return outer
          .map((inner) {
            String key = "if";
            if (invert ^ inner.invert) {
              key = "unless";
            }
            if (inner.str.isNotEmpty) return key + " " + inner.str;
          })
          .join(" ")
          .replaceAll("null ", "");
    }).toList();
  }
}

class _ConditionUtil {
  bool invert = false;
  String str;
  _ConditionUtil(this.str, {this.invert = false});

  @override
  String toString() {
    return "Condition: " + str + ", Not: " + invert.toString();
  }
}

enum _ConditionType {
  and,
  or,
  invert
}