import 'package:objd/basic/widget.dart';
import 'package:objd/objD/data.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/scoreboard.dart';
import 'package:objd/build/build.dart';


class Score extends Widget {
  List<Widget> _commands = [];
  Entity entity;
  String score;
  String _strGen = "";
/// The [Score] class is the basis for setting values, calculating with scores and checking the values.
///It implements one base class with no functionality and several methods to do actions:
///
///|constructor|  |
///|--|--|
///|Entity| the entity within the scoreboard |
///|String| the name of the objective |
///|addNew| bool whether it should add the scoreboard itself if it does not exist(default = true)|
///
///```dart
/// Score(Entity.Selected(),"score",addNew: true)
///```

  Score(this.entity, this.score, {bool addNew = true, List<Widget> commands}){
    if(commands != null) _commands = commands; 
    if(addNew) _commands.add(Scoreboard(score));
  }
  Score.str(this._strGen);

  String _getESStr({Entity entity,String score}){
    if(entity == null) entity = this.entity;
    if(score == null) score = this.score;
    return entity.toString() + " " + score;
  }
  Score addCommandRet(Command command){
    List<Widget> commands = new List<Widget>.from(_commands);
      commands.add(command);
    return new Score(this.entity,this.score,addNew: false,commands: commands);
  }


  /// sets the score to a given value of int
  Score set(int val){
    return addCommandRet(Command(
      "scoreboard players set " + _getESStr() + " " + val.toString()
    ));
  }
  /// resets the value of a score
  Score reset(){
    return addCommandRet(Command(
      "scoreboard players reset " + _getESStr()
    ));
    
  }
  /// adds a value to the score
  Score add([int val = 1]){
    return addCommandRet(Command(
      "scoreboard players add " + _getESStr() + " " + val.toString()
    ));
    
  }
  /// substracts a value from the score
  Score subtract([int val = 1]){
    return addCommandRet(Command(
      "scoreboard players remove " + _getESStr() + " " + val.toString()
    ));
    
  }
  /// gets the value of the score to work with it further
  Score get(){
    return addCommandRet(Command(
      "scoreboard players get " + _getESStr()
    ));
    
  }

  // all operations
  /// sets this score equal to another
  Score setEqual(Score score){
    return addCommandRet(Command(
      "scoreboard players operation " + isEqual(score).getString()
    ));
    
  }

  /// swaps two scores
  Score swapWith(Score score){
    return addCommandRet(Command(
      "scoreboard players operation " + _getESStr() + " >< " + _getESStr(entity: score.entity,score: score.score)
    ));
    
  }

  /// compares two scores and sets the smallest to this one
  Score setToSmallest(Score score){
    return addCommandRet(Command(
      "scoreboard players operation " + isSmaller(score).getString()
    ));
    
  }

  /// compares two scores and sets the biggest to this one
  Score setToBiggest(Score score){
    return addCommandRet(Command(
      "scoreboard players operation " + isBigger(score).getString()
    ));
    
  }

  /// adds another score to this one
  Score addScore(Score score){
    return addCommandRet(Command(
      "scoreboard players operation " + _getESStr() + " += " + _getESStr(entity: score.entity,score: score.score)
    ));
    
  }

  /// substracts another score from this one
  Score subtractScore(Score score){
    return addCommandRet(Command(
      "scoreboard players operation " + _getESStr() + " -= " + _getESStr(entity: score.entity,score: score.score)
    ));
    
  }

  /// sets this score to the result of the multiplication
  Score multiplyByScore(Score score){
    return addCommandRet(Command(
      "scoreboard players operation " + _getESStr() + " *= " + _getESStr(entity: score.entity,score: score.score)
    ));
    
  }

  /// sets this score to the result of the division
  Score divideByScore(Score score){
    return addCommandRet(Command(
      "scoreboard players operation " + _getESStr() + " /= " + _getESStr(entity: score.entity,score: score.score)
    ));
    
  }

  /// sets this score to the remainer of the division
  Score modulo(Score score){
    return addCommandRet(Command(
      "scoreboard players operation " + _getESStr() + " %= " + _getESStr(entity: score.entity,score: score.score)
    ));
    
  }

  /// sets the score to an nbt value
  Score setToData(Data data){
    if(data.subcommand != "get") throw("Please set a score to Data.get and not Data." + data.subcommand);
    return addCommandRet(Command(
      "execute store result score " + _getESStr() + " run data get " + data.getTarget() + " " + data.path + " " + (data.scale ?? 1).toString()
    ));
    
  }

  /// sets the score to the success of the given command
  Score setToResult(Command command, {bool useSuccess = false}){
    return addCommandRet(Command(
      "execute store "+(useSuccess ? "success" : "result")+" score " + _getESStr() + " run " + command.toMap()['command']
    ));
    
  }

  /// tests
  
  Score isEqual(Score score){
    return Score.str(_getESStr() + " = " + _getESStr(entity: score.entity,score: score.score));
  }
  Score isSmaller(Score score){
    return Score.str(_getESStr() + " < " + _getESStr(entity: score.entity,score: score.score));
  }
  Score isSmallerOrEqual(Score score){
    return Score.str(_getESStr() + " <= " + _getESStr(entity: score.entity,score: score.score));
  }
  Score isBiggerOrEqual(Score score){
    return Score.str(_getESStr() + " >= " + _getESStr(entity: score.entity,score: score.score));
  }
  Score isBigger(Score score){
    return Score.str(_getESStr() + " > " + _getESStr(entity: score.entity,score: score.score));
  }
  Score matches(int value){
    return Score.str(_getESStr() + " matches " + value.toString());
  }
  Score matchesRange(Range range){
    return Score.str(_getESStr() + " matches " + range.toString());
  }

  @override
  Widget generate(Context context) {
    return For.of(_commands);
  }

  @override
  Map toMap() {
    return {'Score':For.of(_commands).toMap()};
  }

  String getString() {
    return _strGen;
  }
}
