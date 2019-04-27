import 'package:objd/core.dart';

class Do extends Widget {
  Condition cond;
  bool testBefore;
  bool _isWhile;
  List<Widget> then;
  Do.While(dynamic condition,{this.testBefore = true,this.then}){
    _setValues(true, condition);
  }
  Do.Until(dynamic condition,{this.testBefore = true,this.then}){
    _setValues(false, condition);
  }
  _setValues(iswhile,condition){
    _isWhile = iswhile;
    if(condition is Condition) cond = condition;
    else cond = new Condition(condition);
  }

  @override
  Widget generate(Context context) {
    if(!_isWhile){
      cond = Condition.not(cond);
    }
    then.add(If(cond,Then:[File.recursive()]));
    Group gr = Group(
      filename: "doloop",
      children: then,
      groupMin: 0
    );
    if(testBefore) return If(cond,Then:[gr]);
    return gr;
  }
}