import 'package:objd/basic/command.dart';
import 'package:objd/objD/comment.dart';
import 'package:objd/basic/group.dart';
import 'package:objd/basic/for_list.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/score.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/basic/rotation.dart';
import 'package:objd/build/build.dart';

class If extends Widget {
  List<List<_ConditionUtil>> conds;
  List<Widget> Then;
  If elseWidget;
  bool invert = false;

  If(dynamic condition, {@required this.Then, List<Widget> Else}) {
    assert(Then != null);
    assert(Then.isNotEmpty);
    if (Else != null) {
      elseWidget = If.not(condition, Then: Else);
    }
    getCondition(condition);
  }
  If.not(dynamic condition, {@required this.Then, List<Widget> Else}) {
    assert(Then != null);
    assert(Then.isNotEmpty);
    invert = true;
    if (Else != null) {
      elseWidget = If(condition, Then: Else);
    }
    getCondition(condition);
  }
  getCondition(dynamic condition) {
    if (condition is Condition)
      this.conds = condition.getList();
    else
      this.conds = new Condition(condition).getList();
  }

  @override
  generate(Context context) {
    List<String> prefixes = conds.map((outer) {
      return outer
          .map((inner) {
            String key = "if";
            if (this.invert ^ inner.invert) {
              key = "unless";
            }
            if (inner.str.isNotEmpty) return key + " " + inner.str;
          })
          .join(" ")
          .replaceAll("null ", "");
    }).toList();

    List<Widget> children = [];
    if(context.file.isNotEmpty) Then.insert(0, Comment("If statement from file: " + context.file));
    children.add(Group(prefix: "execute " + prefixes[0] + " run",filename:"if", children: Then));
    Group group = children[0];
    prefixes.forEach((prefix) {
      if(prefixes.indexOf(prefix) != 0){
        children.add(Group(prefix:"execute " + prefix + " run",children:[Command("function " + context.packId + ":" + group.getPath())]));
      }
    });
    if (elseWidget != null) children.add(elseWidget);

    return For.of(children);
  }
}

class Condition {
  List<Condition> _children = [];
  _ConditionType type;
  _ConditionUtil _generated;

  Condition(dynamic cond) {
    _setCond(cond);
  }
  Condition.not(dynamic cond) {
    type = _ConditionType.invert;
    _setCond(cond, invert: true);
  }
  Condition.and(List<Condition> conds) {
    type = _ConditionType.and;
    conds.forEach((cond) {
      assert(cond is Condition);
      _setCond(cond);
    });
  }
  Condition.or(List<dynamic> conds) {
    type = _ConditionType.or;
    conds.forEach((cond) {
      _setCond(cond);
    });
  }

  _setCond(dynamic cond, {bool invert = false}) {
    switch (_getType(cond)) {
      case "Condition":
        _children.add(cond);
        if (invert) _children.forEach((child) => child._invertGenerated());
        break;
      case "Entity":
        _generated =
            new _ConditionUtil("entity " + cond.toString(), invert: invert);
        break;
      default:
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
    if (cond is Rotation) return "Rotation";
    if (cond is Score) return "Score";
    return null;
  }

  List<List<_ConditionUtil>> getList() {
    List<List<_ConditionUtil>> list = [[]];
    if (_children != null) {
      if (type == "and") {
        //list.addAll(_children.map((x) => x.getList()));
      } else {
        _children.forEach((child) {
          if (list.length == 1 && list[0].isEmpty)
            list = child.getList();
          else if (type == _ConditionType.and) {
            child.getList().forEach((outer){
              list[0].addAll(outer);
            });
          }
          else
            list.addAll(child.getList());
        });
      }
    }

    if (_generated != null) {
      list.forEach((outer) {
        outer.insert(0, _generated);
      });
    }

    return list;
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