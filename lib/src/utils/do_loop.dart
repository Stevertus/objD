import 'package:objd/core.dart';

/// This Loop repeats a set of widget as long/until a condition is/becomes true.
/// The Loop uses a Grouped File and Recursion to repeat commands.
class Do extends RestActionAble {
  Condition cond;
  bool testBefore;
  bool _isWhile;
  Location translate;
  List<Widget> then;

  /// This Loop repeats a set of widget as long a condition is true.
  /// The Loop uses a Grouped File and Recursion to repeat commands.
  ///
  /// | Do.While|  |
  /// |--|--|
  /// |Condition or conditional value| a condition to test for each iteration |
  /// |then| a List of Widgets to execute each time |
  /// |testBefore| test before entering the loop if condition is true(optional) |
  Do.While(
    dynamic condition, {
    this.testBefore = true,
    this.then,
    this.translate,
  }) {
    _setValues(true, condition);
  }

  /// This Loop repeats a set of widget until a condition becomes true.
  /// The Loop uses a Grouped File and Recursion to repeat commands.
  ///
  /// | Do.Until|  |
  /// |--|--|
  /// |Condition or conditional value| a condition to test for each iteration |
  /// |then| a List of Widgets to execute each time |
  /// |testBefore| test before entering the loop if condition is false(optional) |
  Do.Until(
    dynamic condition, {
    this.testBefore = true,
    this.then,
    this.translate,
  }) {
    _setValues(false, condition);
  }
  void _setValues(bool iswhile, condition) {
    _isWhile = iswhile;
    if (condition is Condition) {
      cond = condition;
    } else {
      cond = Condition(condition);
    }
  }

  @override
  Widget generate(Context context) {
    if (!_isWhile) {
      cond = Condition.not(cond);
    }
    var ex = Execute(If: cond, children: [File.recursive()]);
    if (translate != null) ex = ex.positioned(translate);
    then.add(ex);
    var gr = Group(filename: 'doloop', children: then, groupMin: 0);
    if (testBefore) return If(cond, then: [gr]);
    return gr;
  }
}
