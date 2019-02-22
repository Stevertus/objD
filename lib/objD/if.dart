import 'package:objd/basic/command.dart';
import 'package:objd/basic/condition.dart';
import 'package:objd/objD/comment.dart';
import 'package:objd/basic/group.dart';
import 'package:objd/basic/for_list.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/build.dart';

class If extends Widget {
  List<List<dynamic>> conds;
  List<Widget> Then;
  If elseWidget;
  bool invert = false;

  /// The if widget accepts a Condition and runs the children if the condition is true.
  ///
  ///If just gives you an execute wrapper with if and else statements. The conditions have their own class.
  ///**Example:**
  /// ```dart
  /// If(
  /// 	Condition(Entity.Player()),
  /// 	Then: [
  /// 		Say(msg:"true")
  /// 	],
  /// 	Else: [
  /// 		Say(msg:"false")
  /// 	]
  /// )
  /// ```
  If(dynamic condition, {@required this.Then, List<Widget> Else}) {
    assert(Then != null);
    assert(Then.isNotEmpty);
    if (Else != null) {
      elseWidget = If.not(condition, Then: Else);
    }
    getCondition(condition);
  }

  /// You can negate the Condition with `If.not`:
  /// ```dart
  /// If.not(
  /// 	Condition(Entity.Player()),
  /// 	Then: [
  /// 		Say(msg:"true")
  /// 	]
  /// )
  /// ```
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
    //print(conds);
    List<String> prefixes = Condition.getPrefixes(conds, this.invert);

    List<Widget> children = [];
    // group into seperate file(and get if id)
    if (Then.length >= 3) {
      print("test");
      if (context.file.isNotEmpty)
        Then.insert(0, Comment("If statement from file: " + context.file));
      children.add(Group(
          prefix: "execute " + prefixes[0] + " run",
          filename: "if",
          children: Then));
      Group group = children[0];
      prefixes.forEach((prefix) {
        if (prefixes.indexOf(prefix) != 0) {
          children.add(Group(prefix: "execute " + prefix + " run", children: [
            Command("function " + context.packId + ":" + group.getPath())
          ]));
        }
      });
    } else {
      // insert Then inline
      prefixes.forEach((prefix) {
          children.add(Group(
          prefix: "execute " + prefix + " run",
          filename: "if",
          children: Then));
      });
    }
    if (elseWidget != null) children.add(elseWidget);

    return For.of(children);
  }
}
