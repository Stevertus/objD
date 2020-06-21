import 'package:objd/basic/group.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/wrappers/data.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/types/condition.dart';
import 'package:objd/basic/scoreboard.dart';
import 'package:objd/build/build.dart';
import 'package:objd/wrappers/if.dart';

class Score extends RestActionAble {
  List<Widget> _commands = [];

  /// Get commands
  List<Widget> get commands => _commands;
  Entity entity;
  String score;
  String _strGen = '';

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
  /// Score(Entity.Selected(),'score',addNew: true)
  ///```

  Score(this.entity, this.score, {bool addNew = true, List<Widget> commands}) {
    if (commands != null) _commands = commands;
    if (addNew) {
      _commands.add(
        Scoreboard(score),
      );
    }
    if (Scoreboard.prefix != null && !score.contains(Scoreboard.prefix)) {
      score = Scoreboard.prefix + score;
    }
  }

  /// same as Score() but with a predefined entity(Entity.Selected(),)
  /// ```dart
  /// Score.fromSelected('objective').set(3)
  /// ⇒ scoreboard players set @s objective 3
  /// ```
  Score.fromSelected(this.score, {bool addNew = true}) {
    entity = Entity.Selected();
    if (addNew) {
      _commands.add(
        Scoreboard(score),
      );
    }
    if (Scoreboard.prefix != null && !score.contains(Scoreboard.prefix)) {
      score = Scoreboard.prefix + score;
    }
  }
  Score.str(this._strGen, {this.score = '', String match = '0'}) {
    _match = match;
  }

  /// Do you need constant values with scores? objD got you covered with `Score.con`:
  ///
  /// |Score.con| |
  /// |--|--|
  /// |int| a constant number |
  /// |addNew|bool whether it should add objd_consts itself if it does not exist(default = true)|

  /// This will automatically create a scoreboard called `objd_consts` and set the value to the fake entity `#[value]`
  ///
  /// **Example:**
  /// ```dart
  /// Score.con(5)
  /// ⇒ scoreboard players set #5 objd_consts 5
  /// ```
  Score.con(int number, {bool addNew = true}) {
    score = 'objd_consts';
    if (Scoreboard.prefix != null && !score.contains(Scoreboard.prefix)) {
      score = Scoreboard.prefix + score;
    }
    entity = Entity.PlayerName(
      '#' + number.toString(),
    );

    if (addNew) {
      _commands.add(
        Scoreboard(score),
      );
    }
    _commands.add(
      set(number),
    );
  }

  String _getESStr({Entity entity, String score}) {
    entity ??= this.entity;
    score ??= this.score;
    return entity.toString() + ' ' + score;
  }

  Score addCommandRet(Command command) {
    var commands = List<Widget>.from(_commands);
    commands.add(command);
    return Score(entity, score, addNew: false, commands: commands);
  }

  /// add
  Score operator +(dynamic other) {
    if (other is int) return add(other);
    if (other is Score) return addScore(other);
    throw ('Please use either a Score or an Int in the operator +');
  }

  /// subtract
  Score operator -(dynamic other) {
    if (other is int) return subtract(other);
    if (other is Score) return subtractScore(other);
    throw ('Please use either a Score or an Int in the operator -');
  }

  /// modulo by
  Score operator %(dynamic other) {
    if (other is int) {
      return modulo(
        Score.con(other),
      );
    }
    if (other is Score) return modulo(other);
    throw ('Please use either a Score or an Int in the operator %');
  }

  /// divide by
  Score operator /(dynamic other) {
    if (other is int) {
      return divideByScore(
        Score.con(other),
      );
    }
    if (other is Score) return divideByScore(other);
    throw ('Please use either a Score or an Int in the operator /');
  }

  /// multiply by
  Score operator *(dynamic other) {
    if (other is int) {
      return multiplyByScore(
        Score.con(other),
      );
    }
    if (other is Score) return multiplyByScore(other);
    throw ('Please use either a Score or an Int in the operator /');
  }

  /// greater than
  Score operator >(dynamic other) {
    if (other is int) {
      return matchesRange(
        Range.from(other + 1),
      );
    }
    if (other is Score) return isBigger(other);
    throw ('Please use either a Score or an Int in the operator >');
  }

  /// less than
  Score operator <(dynamic other) {
    if (other is int) {
      return matchesRange(
        Range.to(other + -1),
      );
    }
    if (other is Score) return isSmaller(other);
    throw ('Please use either a Score or an Int in the operator >');
  }

  /// bigger or equal
  Score operator >=(dynamic other) {
    if (other is int) {
      return matchesRange(
        Range.from(other),
      );
    }
    if (other is Score) return isBiggerOrEqual(other);
    throw ('Please use either a Score or an Int in the operator >=');
  }

  /// less or equal
  Score operator <=(dynamic other) {
    if (other is int) {
      return matchesRange(
        Range.to(other),
      );
    }
    if (other is Score) return isSmallerOrEqual(other);
    throw ('Please use either a Score or an Int in the operator <=');
  }

  /// matches
  Score operator &(dynamic other) {
    if (other is int) return matches(other);
    if (other is Range) return matchesRange(other);
    if (other is Score) return isEqual(other);
    throw ('Please use either a Score, Range or an Int in the operator &');
  }

  /// assign value(int, Score, Data or Condition)
  Score operator >>(dynamic other) {
    if (other is int) return set(other);
    if (other is Score) return setEqual(other);
    if (other is Data) return setToData(other);
    if (other is Condition) return setToCondition(other);
    if (other is Command) return setToResult(other);
    throw ('Please use either a Score, Data, Condition, Command or an Int in the operator >>');
  }

  /// sets the score to a given value of int
  Score set(int val) {
    return addCommandRet(
      Command(
        'scoreboard players set ' + _getESStr() + ' ' + val.toString(),
      ),
    );
  }

  /// resets the value of a score
  Score reset() {
    return addCommandRet(
      Command(
        'scoreboard players reset ' + _getESStr(),
      ),
    );
  }

  /// adds a value to the score
  Score add([int val = 1]) {
    return addCommandRet(
      Command(
        'scoreboard players add ' + _getESStr() + ' ' + val.toString(),
      ),
    );
  }

  /// subtracts a value from the score
  Score subtract([int val = 1]) {
    return addCommandRet(
      Command(
        'scoreboard players remove ' + _getESStr() + ' ' + val.toString(),
      ),
    );
  }

  /// gets the value of the score to work with it further
  Score get() {
    return addCommandRet(
      Command(
        'scoreboard players get ' + _getESStr(),
      ),
    );
  }

  // all operations
  /// sets this score equal to another
  Score setEqual(Score score) {
    return addCommandRet(
      Command(
        'scoreboard players operation ' + isEqual(score).getString(),
      ),
    );
  }

  /// swaps two scores
  Score swapWith(Score score) {
    return addCommandRet(
      Command(
        'scoreboard players operation ' +
            _getESStr() +
            ' >< ' +
            _getESStr(entity: score.entity, score: score.score),
      ),
    );
  }

  /// compares two scores and sets the smallest to this one
  Score setToSmallest(Score score) {
    return addCommandRet(
      Command(
        'scoreboard players operation ' + isSmaller(score).getString(),
      ),
    );
  }

  /// compares two scores and sets the biggest to this one
  Score setToBiggest(Score score) {
    return addCommandRet(
      Command(
        'scoreboard players operation ' + isBigger(score).getString(),
      ),
    );
  }

  /// adds another score to this one
  Score addScore(Score score) {
    return addCommandRet(
      Command(
        'scoreboard players operation ' +
            _getESStr() +
            ' += ' +
            _getESStr(entity: score.entity, score: score.score),
      ),
    );
  }

  /// subtracts another score from this one
  Score subtractScore(Score score) {
    return addCommandRet(
      Command(
        'scoreboard players operation ' +
            _getESStr() +
            ' -= ' +
            _getESStr(entity: score.entity, score: score.score),
      ),
    );
  }

  /// sets this score to the result of the multiplication
  Score multiplyByScore(Score score) {
    return addCommandRet(
      Command(
        'scoreboard players operation ' +
            _getESStr() +
            ' *= ' +
            _getESStr(entity: score.entity, score: score.score),
      ),
    );
  }

  /// sets this score to the result of the division
  Score divideByScore(Score score) {
    return addCommandRet(
      Command(
        'scoreboard players operation ' +
            _getESStr() +
            ' /= ' +
            _getESStr(entity: score.entity, score: score.score),
      ),
    );
  }

  /// sets this score to the remainder of the division
  Score modulo(Score score) {
    return addCommandRet(
      Command(
        'scoreboard players operation ' +
            _getESStr() +
            ' %= ' +
            _getESStr(entity: score.entity, score: score.score),
      ),
    );
  }

  /// sets the score to an nbt value
  Score setToData(Data data) {
    if (!data.isGetting) {
      throw ('Please set a score to Data.get and not Data.' + data.subcommand);
    }
    return addCommandRet(
      Command(
        'execute store result score ' +
            _getESStr() +
            ' run data get ' +
            data.getTarget() +
            ' ' +
            data.path +
            ' ' +
            (data.scale ?? 1).toString(),
      ),
    );
  }

  /// sets the score to the success of the given command
  Score setToResult(Command command, {bool useSuccess = false}) {
    return addCommandRet(
      Command(
        'execute store ' +
            (useSuccess ? 'success' : 'result') +
            ' score ' +
            _getESStr() +
            ' run ' +
            command.toMap()['command'].toString(),
      ),
    );
  }

  /// sets the score to the result of the given Widget
  /// JUST one Command should be the input
  Group setToWidget(Widget widget, {bool useSuccess = false}) {
    return Group(
      prefix: 'execute store ' +
          (useSuccess ? 'success' : 'result') +
          ' score ' +
          _getESStr() +
          ' run',
      children: [widget],
    );
  }

  /// sets the score to the success of the given condition result
  Score setToCondition(Condition cond, {bool useSuccess = false}) {
    return addCommandRet(
      Command(
        'execute store ' +
            (useSuccess ? 'success' : 'result') +
            ' score ' +
            _getESStr() +
            ' ' +
            Condition.getPrefixes(cond.getList())[0],
      ),
    );
  }

  /// finds the smallest value in a list of scores
  Widget findSmallest(List<Score> scores, {int min}) {
    return For(
        to: scores.length - 1,
        create: (int i) {
          var ret = setToSmallest(scores[i]);
          if (min != null) {
            return If(
              scores[i].matchesRange(
                Range.from(min),
              ),
              then: [ret],
            );
          }
          return ret;
        });
  }

  /// finds the biggest value in a list of scores
  Widget findBiggest(List<Score> scores, {int max}) {
    return For(
        to: scores.length - 1,
        create: (int i) {
          var ret = setToBiggest(scores[i]);
          if (max != null) {
            return If(
              scores[i].matchesRange(
                Range.to(max),
              ),
              then: [ret],
            );
          }
          return ret;
        });
  }

  /// tests

  Score isEqual(Score score) {
    return Score.str(
      _getESStr() + ' = ' + _getESStr(entity: score.entity, score: score.score),
    );
  }

  Score isSmaller(Score score) {
    return Score.str(
      _getESStr() + ' < ' + _getESStr(entity: score.entity, score: score.score),
    );
  }

  Score isSmallerOrEqual(Score score) {
    return Score.str(
      _getESStr() +
          ' <= ' +
          _getESStr(entity: score.entity, score: score.score),
    );
  }

  Score isBiggerOrEqual(Score score) {
    return Score.str(
      _getESStr() +
          ' >= ' +
          _getESStr(entity: score.entity, score: score.score),
    );
  }

  Score isBigger(Score score) {
    return Score.str(
      _getESStr() + ' > ' + _getESStr(entity: score.entity, score: score.score),
    );
  }

  String _match = '0';
  String getMatch() => _match;
  Score matches(int value) {
    _match = value.toString();
    return Score.str(_getESStr() + ' matches ' + _match,
        score: score, match: _match);
  }

  Score matchesRange(Range range) {
    _match = range.toString();
    return Score.str(_getESStr() + ' matches ' + _match,
        score: score, match: _match);
  }

  @override
  Widget generate(Context context) {
    return For.of(_commands);
  }

  @override
  Map toMap() {
    return {'Score': For.of(_commands).toMap()};
  }

  String getString() {
    return _strGen;
  }
}
