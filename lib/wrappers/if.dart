import 'package:objd/basic/condition.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/wrappers/comment.dart';
import 'package:objd/basic/group.dart';
import 'package:objd/basic/for_list.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/build.dart';

class If extends RestActionAble {
  List<List<dynamic>> conds;
  List<Widget> Then;
  List<Widget> Else;
  If elseWidget;
  bool invert = false;
  Entity assignTag;
  bool encapsulate;

  String targetFilePath;
  String targetFileName;

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
  If(dynamic condition,
      {@required this.Then,
      this.Else,
      this.targetFilePath = "objd",
      this.targetFileName,
      this.encapsulate = true,
      this.assignTag}) {
    assert(Then != null);
    assert(Then.isNotEmpty);
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
  If.not(dynamic condition,
      {@required this.Then,
      this.Else,
      this.targetFilePath = "objd",
      this.targetFileName,
      this.encapsulate = true,
      this.assignTag}) {
    assert(Then != null);
    assert(Then.isNotEmpty);
    invert = true;
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
    List<String> prefixes = Condition.getPrefixes(conds, this.invert);

    List<Widget> children = [];
    // group into seperate file(and get if id)
    if (Else != null || prefixes.length >= 2 || this.assignTag != null) {
      if (this.assignTag == null) this.assignTag = Entity.Player();
      if (Then.length > 2 && context.file.isNotEmpty)
        Then.insert(0, Comment("If statement from file: " + context.file));
      if (Else != null && Else.length > 2 && context.file.isNotEmpty)
        Else.insert(0, Comment("Else statement from file: " + context.file));
      children = _getTagVersion(prefixes);
      // if (context.file.isNotEmpty)
      //   Then.insert(0, Comment("If statement from file: " + context.file));
      // children.add(Group(
      //     prefix: "execute " + prefixes[0] + " run",
      //     filename: "if",
      //     children: Then));
      // Group group = children[0];
      // prefixes.forEach((prefix) {
      //   if (prefixes.indexOf(prefix) != 0) {
      //     children.add(Group(prefix: "execute " + prefix + " run", children: [
      //       Command("function " + context.packId + ":" + group.getPath())
      //     ]));
      //   }
      // });
    } else {
      // insert Then inline
      prefixes.forEach((prefix) {
        children.add(Group(
          prefix: "execute " + prefix + " run",
          path: targetFilePath,
          generateIDs: targetFileName == null,
          filename: targetFileName ?? "if",
          groupMin: encapsulate ? 3 : -1,
          children: Then,
        ));
      });
    }
    if (elseWidget != null) children.add(elseWidget);

    return For.of(children);
  }

  List<Widget> _getTagVersion(List<String> prefixes) {
    List<Widget> children = [];
    int id = IndexedFile.getIndexed("if");
    prefixes.forEach((prefix) {
      children.add(
        Group(
          prefix: "execute " + prefix + " run",
          children: [assignTag.addTag("objd_isTrue" + id.toString())],
        ),
      );
    });
    children.add(Group(
      prefix: "execute as " +
          assignTag.toString() +
          " if entity @s[tag=objd_isTrue" +
          id.toString() +
          "] run",
      path: targetFilePath,
      generateIDs: targetFileName == null,
      filename: targetFileName ?? "if",
      children: Then,
    ));
    if (this.Else != null) {
      children.add(Group(
        prefix: "execute as " +
            assignTag.toString() +
            " unless entity @s[tag=objd_isTrue" +
            id.toString() +
            "] run",
        path: targetFilePath,
        filename: "else",
        children: Else,
      ));
    }
    children.add(assignTag.removeTag("objd_isTrue" + id.toString()));
    return children;
  }
}
