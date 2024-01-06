// ignore_for_file: public_member_api_docs, sort_constructors_first
library score;

import 'package:objd/src/basic/command.dart';
import 'package:objd/src/basic/file.dart';
import 'package:objd/src/basic/for_list.dart';
import 'package:objd/src/basic/score/score_builder.dart';
import 'package:objd/src/basic/score/score_condition.dart';
import 'package:objd/src/basic/score/score_export.dart';
import 'package:objd/src/basic/scoreboard.dart';
import 'package:objd/src/basic/types/condition.dart';
import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/context.dart';
import 'package:objd/src/wrappers/comment.dart';
import 'package:objd/src/wrappers/data.dart';
import 'package:objd/src/wrappers/execute.dart';
import 'package:objd/src/wrappers/if.dart';

abstract mixin class ScoreStoreable implements Widget {
  // block, bossbar, entity, score, storage
  Widget get_assignable_right(Context context) => generate(context);

  ScoreOperation toScore({Score? out}) => StoreScoreOperation(
        out ?? Score.tmp(),
        this,
      );

  BinaryScoreOperation operator +(dynamic other) => toScore() + other;
  BinaryScoreOperation operator -(dynamic other) => toScore() - other;
  BinaryScoreOperation operator %(dynamic other) => toScore() % other;
  BinaryScoreOperation operator /(dynamic other) => toScore() / other;
  BinaryScoreOperation operator *(dynamic other) => toScore() * other;
  // TODO: Not finished, refactor of If needed
  // ScoreCondition operator >(dynamic other) => toScore() > other;
  // ScoreCondition operator >=(dynamic other) => toScore() >= other;
  // ScoreCondition operator <=(dynamic other) => toScore() <= other;
  // ScoreCondition operator <(dynamic other) => toScore() < other;
  // ScoreCondition operator &(dynamic other) => toScore() & other;
}

abstract mixin class ScoreAssignable {
  // block, bossbar, entity, score, storage
  String get_assignable_left();

  ScoreStoreable toStorable();

  Widget setTo(dynamic other);
  Widget operator >>(dynamic other) => setTo(other);
  Widget operator <<(dynamic other) => setTo(other);
}

sealed class ScoreOperation extends Widget implements ScoreStoreable {
  /// add
  @override
  @override
  BinaryScoreOperation operator +(dynamic other) => switch (other) {
        int val => add(val),
        ScoreOperation s => addScore(s),
        ScoreStoreable s => addScore(s.toScore()),
        _ => throw ('Please use either a Score or an Int in the operator +')
      };

  /// subtract
  @override
  BinaryScoreOperation operator -(dynamic other) => switch (other) {
        int val => subtract(val),
        ScoreOperation s => subtractScore(s),
        ScoreStoreable s => subtractScore(s.toScore()),
        _ => throw ('Please use either a Score or an Int in the operator -')
      };

  /// modulo by
  @override
  BinaryScoreOperation operator %(dynamic other) => switch (other) {
        int val => modulo(Score.con(val)),
        ScoreOperation s => modulo(s),
        ScoreStoreable s => modulo(s.toScore()),
        _ => throw ('Please use either a Score or an Int in the operator %')
      };

  /// divide by
  @override
  BinaryScoreOperation operator /(dynamic other) => switch (other) {
        int val => divideByScore(Score.con(val)),
        ScoreOperation s => divideByScore(s),
        ScoreStoreable s => divideByScore(s.toScore()),
        _ => throw ('Please use either a Score or an Int in the operator /')
      };

  /// multiply by
  @override
  BinaryScoreOperation operator *(dynamic other) => switch (other) {
        int val => multiplyByScore(Score.con(val)),
        ScoreOperation s => multiplyByScore(s),
        ScoreStoreable s => multiplyByScore(s.toScore()),
        _ => throw ('Please use either a Score or an Int in the operator *')
      };

  /// adds a value to the score
  BinaryScoreOperation add([int val = 1]) => BinaryScoreOperation(
        this,
        val >= 0 ? ScoreOperator.Addition : ScoreOperator.Subtraction,
        Score.con(val.abs()),
      );

  /// subtracts a value from the score
  BinaryScoreOperation subtract([int val = 1]) => BinaryScoreOperation(
        this,
        val >= 0 ? ScoreOperator.Subtraction : ScoreOperator.Addition,
        Score.con(val.abs()),
      );

  /// gets the value of the score to work with it further
  // TODO
  Widget get() => For.of([this, Command('scoreboard players get $this')]);

  // binary operations

  /// adds another score to this one
  BinaryScoreOperation addScore(ScoreOperation score) =>
      BinaryScoreOperation(this, ScoreOperator.Addition, score);

  /// subtracts another score from this one
  BinaryScoreOperation subtractScore(ScoreOperation score) =>
      BinaryScoreOperation(this, ScoreOperator.Subtraction, score);

  /// sets this score to the result of the multiplication
  BinaryScoreOperation multiplyByScore(ScoreOperation score) =>
      BinaryScoreOperation(this, ScoreOperator.Multiplication, score);

  /// sets this score to the result of the division
  BinaryScoreOperation divideByScore(ScoreOperation score) =>
      BinaryScoreOperation(this, ScoreOperator.Division, score);

  /// sets this score to the remainder of the division
  BinaryScoreOperation modulo(ScoreOperation score) =>
      BinaryScoreOperation(this, ScoreOperator.Modulo, score);

  //TODO: Move Condition Operators here

  void build() {
    print('test');
  }

  (Score, List<ElementaryScoreOperation>) copy({
    Score? out,
    ScoreBuilder? builder,
    bool compact = false,
  }) {
    out ??= Score.tmp();

    builder ??= ScoreBuilder();

    return (out, [out, ...builder.compile(this, out: out)]);
  }

  @override
  ScoreOperation toScore({Score? out}) =>
      out == null ? this : BinaryScoreOperation.assign(out, this);

  //TODO: Multistep
  @override
  Widget get_assignable_right(Context context) => generate(context);
}

sealed class ElementaryScoreOperation extends ScoreOperation {}

final class IncrementScoreOperation extends ElementaryScoreOperation {
  final Score score;
  final int increment;

  IncrementScoreOperation(this.score, this.increment);

  @override
  generate(Context context) => Command(
        increment > 0
            ? 'scoreboard players add $score $increment'
            : 'scoreboard players remove $score ${-increment}',
      );

  @override
  String toString() => '$score += $increment';
}

final class SetScoreOperation extends ElementaryScoreOperation {
  final Score score;
  final int value;

  SetScoreOperation(this.score, this.value);

  @override
  generate(Context context) => Command('scoreboard players set $score $value');

  @override
  String toString() => 'set $score = $value';
}

final class ResetScoreOperation extends ElementaryScoreOperation {
  final Score score;

  ResetScoreOperation(this.score);

  @override
  generate(Context context) => For.of([
        score,
        Command('scoreboard players reset $score'),
      ]);

  @override
  String toString() => 'reset $score';
}

final class StoreScoreOperation extends ElementaryScoreOperation {
  final ScoreAssignable left;
  final Widget right;
  final bool useSuccess;

  StoreScoreOperation(this.left, this.right, {this.useSuccess = false});

  @override
  Widget generate(Context context) => For.of([
        if (left is Score) left as Score,
        Execute.internal_store_command(
          left.get_assignable_left(),
          right is ScoreStoreable
              ? (right as ScoreStoreable).get_assignable_right(context)
              : right.generate(context),
          useSuccess,
        )
      ]);

  @override
  String toString() => [
        '  | store ${left.get_assignable_left()}',
        '<<',
        '  | $right',
      ].join('\n');

  @override
  (Score, List<ElementaryScoreOperation>) copy({
    Score? out,
    ScoreBuilder? builder,
    bool compact = false,
  }) {
    final (copyScore, ops) = switch ((left, compact)) {
      (Score s, true) => s.copy(out: out, builder: builder, compact: compact),
      _ => super.copy(out: out, builder: builder, compact: compact)
    };
    return (copyScore, [StoreScoreOperation(copyScore, right), ...ops]);
  }
}

final class StoreConditionScoreOperation extends ElementaryScoreOperation {
  final ScoreAssignable left;
  final Condition right;
  final bool useSuccess;

  StoreConditionScoreOperation(this.left, this.right,
      {this.useSuccess = false});

  @override
  Widget generate(Context context) => For.of([
        if (left is Score) left as Score,
        Command(
          'execute store ${useSuccess ? 'success' : 'result'} ${left.get_assignable_left()} ${Condition.getPrefixes(right.getList())[0]}',
        )
      ]);

  @override
  String toString() => [
        '  | store ${left.get_assignable_left()}',
        '<<',
        '  | $right',
      ].join('\n');

  @override
  (Score, List<ElementaryScoreOperation>) copy({
    Score? out,
    ScoreBuilder? builder,
    bool compact = false,
  }) {
    final (copyScore, ops) = switch ((left, compact)) {
      (Score s, true) => s.copy(out: out, builder: builder, compact: compact),
      _ => super.copy(out: out, builder: builder, compact: compact)
    };
    return (
      copyScore,
      [StoreConditionScoreOperation(copyScore, right), ...ops]
    );
  }
}

final class ElementaryBinaryScoreOperation extends ElementaryScoreOperation {
  final Score left;
  final Score right;

  final ScoreOperator operation;

  ElementaryBinaryScoreOperation(
    this.left,
    this.operation,
    this.right,
  );

  ElementaryBinaryScoreOperation.assign(this.left, this.right)
      : operation = ScoreOperator.Assign;

  @override
  Widget generate(Context context) =>
      Command('scoreboard players operation $left ${operation.op} $right');

  @override
  String toString() => '$left ${operation.op} $right';
}

// final class AssignScoreOperation extends ElementaryScoreOperation {
//   final Score left;
//   final ScoreAssignable right;

//   AssignScoreOperation(this.left, this.right);

//   @override
//   Widget generate(Context context) => Command(
//         'scoreboard players operation $left = ${right.get_assignable_right()}',
//       );

//   @override
//   String toString() => [
//         '  | $left',
//         '<<',
//         '  | ${right.get_assignable_right()}',
//       ].join('\n');
// }

class BinaryScoreOperation extends ScoreOperation {
  final ScoreOperation left;
  final ScoreOperation right;

  final ScoreOperator operation;

  BinaryScoreOperation(this.left, this.operation, this.right);

  BinaryScoreOperation.assign(this.left, this.right)
      : operation = ScoreOperator.Assign;

  @override
  Widget generate(Context context) {
    final ScoreBuilder builder = ScoreBuilder();

    final (rScore, rActions) = right.copy(compact: true, builder: builder);

    print(left);

    if (left is Score) {
      return For.of([
        left,
        ...rActions,
        ...builder.compileBinary(left, operation, rScore),
      ]);
    }

    if (left case StoreScoreOperation(right: ScoreAssignable store)) {
      final (lScore, lActions) = left.copy(compact: true, builder: builder);
      return For.of([
        ...lActions,
        ...rActions,
        ...builder.compileBinary(lScore, operation, rScore),
        store << lScore
      ]);
    }

    final (lScore, lActions) = left.copy(builder: builder);

    return For.of([
      ...lActions,
      ...rActions,
      ...builder.compileBinary(lScore, operation, rScore),
    ]);
  }

  @override
  String toString() {
    final lStr = left.toString().splitMapJoin('\n', onNonMatch: (s) => ' | $s');
    final rStr =
        right.toString().splitMapJoin('\n', onNonMatch: (s) => ' | $s');

    return [lStr, operation.op, rStr].join('\n');
  }
}

enum ScoreOperator {
  Addition("+="),
  Subtraction("-="),
  Multiplication("*="),
  Division("/="),
  Modulo("%="),
  Assign("="),
  Min("<"),
  Max(">"),
  Swap("><");

  final String op;
  const ScoreOperator(this.op);
}

class ConstScore extends Score {
  final int value;

  ConstScore(
    this.value, {
    bool addNew = true,
    String type = 'dummy',
  }) : super(
          Entity.PlayerName(
            '#$value',
          ),
          'objd_consts',
          addNew: addNew,
          type: type,
        );
}

class Score extends ElementaryScoreOperation
    implements ScoreAssignable, ScoreStoreable {
  final Entity entity;
  String score;
  final String type;
  final bool addNew;

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

  Score(
    this.entity,
    this.score, {
    this.addNew = true,
    this.type = 'dummy',
  }) {
    if (Scoreboard.prefix != null && !score.contains(Scoreboard.prefix!)) {
      score = Scoreboard.prefix! + score;
    }
  }

  /// same as Score() but with a predefined entity(Entity.Selected(),)
  /// ```dart
  /// Score.fromSelected('objective').set(3)
  /// ⇒ scoreboard players set @s objective 3
  /// ```
  factory Score.fromSelected(
    String score, {
    bool addNew = true,
    String type = 'dummy',
  }) =>
      Score(Entity.Self(), score, addNew: addNew, type: type);

  /// same as Score() but with a predefined entity(Entity.Selected(),)
  /// ```dart
  /// Score.fromSelected('objective').set(3)
  /// ⇒ scoreboard players set @s objective 3
  /// ```
  factory Score.Self(
    String score, {
    bool addNew = true,
    String type = 'dummy',
  }) =>
      Score(Entity.Self(), score, addNew: addNew, type: type);

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
  static ConstScore con(
    int number, {
    bool addNew = true,
    String type = 'dummy',
  }) =>
      ConstScore(number, addNew: addNew, type: type);

  factory Score.PlayerName(
    String name,
    String score, {
    bool addNew = true,
    String type = 'dummy',
  }) =>
      Score(
        Entity.PlayerName(name),
        score,
        addNew: addNew,
        type: type,
      );

  factory Score.tmp({
    int len = 8,
    String score = "objd_temp",
    String alphabet =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_',
  }) =>
      Score(
        Entity.PlayerName(
          '#${Scoreboard.generateNewTempPlayerName(len: len, alphabet: alphabet)}',
        ),
        score,
      );

  @override
  String toString({Entity? entity, String? score}) {
    entity ??= this.entity;
    score ??= this.score;
    return '$entity $score';
  }

  @override
  (Score, List<ElementaryScoreOperation>) copy({
    Score? out,
    ScoreBuilder? builder,
    bool compact = false,
  }) {
    if (compact && out == null) return (this, []);
    if (out != null) {
      return (out, [out, ElementaryBinaryScoreOperation.assign(out, this)]);
    }
    return super.copy(out: out, builder: builder, compact: compact);
  }

  /// sets the score to an nbt value
  StoreScoreOperation setToData(DataGet data, {bool useSuccess = false}) =>
      StoreScoreOperation(this, data, useSuccess: useSuccess);

  /// set to functions return value(or number of commands)
  StoreScoreOperation setToFunction(File file, {bool useSuccess = false}) =>
      setToWidget(file.run(create: true));

  /// sets the score to the success of the given Command
  StoreScoreOperation setToResult(Command commmand,
          {bool useSuccess = false}) =>
      setToWidget(commmand, useSuccess: useSuccess);

  /// sets the score to the result of the given Widget
  /// JUST one Command should be the input
  StoreScoreOperation setToWidget(Widget widget, {bool useSuccess = false}) =>
      StoreScoreOperation(this, widget, useSuccess: useSuccess);

  /// sets the score to the success of the given condition result
  StoreConditionScoreOperation setToCondition(Condition cond,
          {bool useSuccess = false}) =>
      StoreConditionScoreOperation(this, cond, useSuccess: useSuccess);

  /// assign value(int, Score, Data or Condition)
  @override
  ScoreOperation setTo(dynamic other, {bool useSuccess = false}) =>
      switch (other) {
        int val => set(val),
        ScoreOperation s => setEqual(s),
        DataGet s => setToData(s, useSuccess: useSuccess),
        ScoreStoreable s =>
          StoreScoreOperation(this, s, useSuccess: useSuccess),
        Condition c => setToCondition(c, useSuccess: useSuccess),
        Widget w => setToWidget(w, useSuccess: useSuccess),
        _ =>
          throw ('Please use either a Score, Data, Condition, Command or an Int in the operator >>, got $other'),
      };

  @override
  ScoreOperation operator >>(dynamic other) => setTo(other);
  @override
  ScoreOperation operator <<(dynamic other) => setTo(other);

  /// sets the score to a given value of int
  BinaryScoreOperation set(int val) {
    // TODO: Remove, only necessary if used outside score
    // if (this is! ScoreAssignable) {
    //   throw Exception('$val can not be assigned to left Hand Side $this');
    // }

    return BinaryScoreOperation(this, ScoreOperator.Assign, Score.con(val));
  }

  ResetScoreOperation reset() => ResetScoreOperation(this);

  /// sets this score equal to another
  BinaryScoreOperation setEqual(ScoreOperation score) =>
      BinaryScoreOperation(this, ScoreOperator.Assign, score);

  /// swaps two scores
  BinaryScoreOperation swapWith(ScoreOperation score) =>
      BinaryScoreOperation(this, ScoreOperator.Swap, score);

  /// compares two scores and sets the smallest to this one
  BinaryScoreOperation setToSmallest(ScoreOperation score) =>
      BinaryScoreOperation(this, ScoreOperator.Min, score);

  /// compares two scores and sets the biggest to this one
  BinaryScoreOperation setToBiggest(ScoreOperation score) =>
      BinaryScoreOperation(this, ScoreOperator.Max, score);

  /// tests

  /// greater than
  //@override
  ScoreCondition operator >(dynamic other) => switch (other) {
        int val => matchesRange(Range.from(val + 1)),
        Score s => isBigger(s),
        // ScoreStoreable s => isBigger(s.toScore()),
        _ => throw ('Please use either a Score or an Int in the operator >')
      };

  /// less than
  //@override
  ScoreCondition operator <(dynamic other) => switch (other) {
        int val => matchesRange(Range.to(val - 1)),
        Score s => isSmaller(s),
        //ScoreStoreable s => isSmaller(s.toScore()),
        _ => throw ('Please use either a Score or an Int in the operator <')
      };

  /// bigger or equal
  //@override
  ScoreCondition operator >=(dynamic other) => switch (other) {
        int val => matchesRange(Range.from(val)),
        Score s => isBiggerOrEqual(s),
        //ScoreStoreable s => isBiggerOrEqual(s.toScore()),
        _ => throw ('Please use either a Score or an Int in the operator >=')
      };

  /// less or equal
  //@override
  ScoreCondition operator <=(dynamic other) => switch (other) {
        int val => matchesRange(Range.to(val)),
        Score s => isSmallerOrEqual(s),
        //ScoreStoreable s => isSmallerOrEqual(s.toScore()),
        _ => throw ('Please use either a Score or an Int in the operator <=')
      };

  /// matches
  //@override
  ScoreCondition operator &(dynamic other) => switch (other) {
        int val => matches(val),
        Range r => matchesRange(r),
        Score s => isEqual(s),
        //ScoreStoreable s => isEqual(s.toScore()),
        _ =>
          throw ('Please use either a Score, Range or an Int in the operator &')
      };

  BinaryScoreCondition isEqual(Score score) =>
      BinaryScoreCondition(this, ConditionalOperator.Equal, score);
  BinaryScoreCondition isSmaller(Score score) =>
      BinaryScoreCondition(this, ConditionalOperator.Less, score);
  BinaryScoreCondition isSmallerOrEqual(Score score) =>
      BinaryScoreCondition(this, ConditionalOperator.LessEqual, score);
  BinaryScoreCondition isBiggerOrEqual(Score score) =>
      BinaryScoreCondition(this, ConditionalOperator.BiggerEqual, score);
  BinaryScoreCondition isBigger(Score score) =>
      BinaryScoreCondition(this, ConditionalOperator.Bigger, score);

  MatchesScoreCondition matches(int value) =>
      MatchesScoreCondition(this, Range.exact(value));
  MatchesScoreCondition matchesRange(Range range) =>
      MatchesScoreCondition(this, range);

  /// finds the smallest value in a list of scores
  Widget findSmallest(List<Score> scores, {int? min}) {
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
  Widget findBiggest(List<Score> scores, {int? max}) {
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

  @override
  Widget generate(Context context) {
    return addNew ? Scoreboard(score, type: type) : Comment.Null();
  }

  @override
  String get_assignable_left() => 'score $this';

  @override
  Widget get_assignable_right(Context context) => get();

  @override
  ScoreStoreable toStorable() => this;
}
