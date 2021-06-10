import 'package:objd/src/basic/types/condition.dart';
import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/wrappers/comment.dart';
import 'package:objd/src/basic/group.dart';
import 'package:objd/src/basic/for_list.dart';

import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/build.dart';

class If extends RestActionAble {
  late List<List<dynamic>> conds;
  List<Widget> then;
  List<Widget>? orElse;
  If? elseWidget;
  bool invert = false;
  Entity? assignTag;
  final String useTag;
  bool encapsulate;

  String targetFilePath;
  String? targetFileName;
  Predicate? predicate;

  /// The if widget accepts a Condition and runs the children if the condition is true.
  ///
  ///If just gives you an execute wrapper with if and else statements. The conditions have their own class.
  ///**Example:**
  /// ```dart
  /// If(
  /// 	Condition(Entity.Player()),
  /// 	then: [
  /// 		Log('true')
  /// 	],
  /// 	orElse: [
  /// 		Log('false')
  /// 	]
  /// )
  /// ```
  If(
    dynamic condition, {
    required this.then,
    this.orElse,
    this.targetFilePath = 'objd',
    this.targetFileName,
    this.encapsulate = true,
    this.assignTag,
    this.useTag = 'objd_isTrue',
  }) {
    getCondition(condition);
  }

  /// You can negate the Condition with `If.not`:
  /// ```dart
  /// If.not(
  /// 	Condition(Entity.Player()),
  /// 	then: [
  /// 		Log('true')
  /// 	]
  /// )
  /// ```
  If.not(
    dynamic condition, {
    required this.then,
    this.orElse,
    this.targetFilePath = 'objd',
    this.targetFileName,
    this.encapsulate = true,
    this.assignTag,
    this.useTag = 'objd_isTrue',
  }) {
    assert(then.isNotEmpty);
    invert = true;
    getCondition(condition);
  }
  void getCondition(dynamic condition) {
    if (condition is Predicate) predicate = condition;
    if (condition is Condition) {
      conds = condition.getList();
    } else {
      conds = Condition(condition).getList();
    }
  }

  @override
  Widget generate(Context context) {
    var prefixes = Condition.getPrefixes(conds, invert);

    var children = <Widget>[];
    // group into seperate file(and get if id)
    if (orElse != null || prefixes.length >= 2 || assignTag != null) {
      assignTag ??= Entity.Self();
      if (then.length > 2 && context.file.isNotEmpty) {
        then.insert(0, Comment('If statement from file: ' + context.file));
      }

      if (orElse != null && orElse!.length > 2 && context.file.isNotEmpty) {
        orElse!.insert(0, Comment('Else statement from file: ' + context.file));
      }

      children = _getTagVersion(prefixes);
    } else {
      // insert Then inline
      prefixes.forEach((prefix) {
        children.add(Group(
          prefix: 'execute ' + prefix + ' run',
          path: targetFilePath,
          generateIDs: targetFileName == null,
          filename: targetFileName ?? 'if',
          groupMin: encapsulate ? 3 : -1,
          children: then,
        ));
      });
    }
    if (elseWidget != null) children.add(elseWidget!);
    if (predicate != null) children.add(predicate!);

    return For.of(children);
  }

  List<Widget> _getTagVersion(List<String> prefixes) {
    var children = <Widget>[];
    var tag = useTag;
    var id = IndexedFile.getIndexedAndIncrease(tag);

    tag += (id > 0 ? id.toString() : '');

    prefixes.forEach((prefix) {
      children.add(
        Group(
          prefix: 'execute ' + prefix + ' run',
          children: [assignTag!.addTag(tag)],
          groupMin: encapsulate ? 3 : -1,
        ),
      );
    });
    final prefix = 'execute' +
        (assignTag == null || assignTag!.selector == 's'
            ? ''
            : ' as $assignTag');

    children.add(Group(
      prefix: '$prefix if entity @s[tag=$tag] run',
      path: targetFilePath,
      generateIDs: targetFileName == null,
      filename: targetFileName ?? 'if',
      children: then,
    ));
    if (orElse != null) {
      children.add(
        Group(
          prefix: '$prefix unless entity @s[tag=$tag] run',
          path: targetFilePath,
          filename: 'else',
          groupMin: encapsulate ? 3 : -1,
          children: orElse!,
        ),
      );
    }
    children.add(assignTag!.removeTag(tag));
    return children;
  }
}
