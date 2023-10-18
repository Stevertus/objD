library score;

import 'package:objd/src/basic/command.dart';
import 'package:objd/src/basic/score/score.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/context.dart';

abstract interface class ScoreAssignable {
  // block, bossbar, entity, score, storage
  String get_assignable_right();
}

sealed class ScoreOperation extends Widget implements ScoreAssignable {
  void build() {
    print('test');
  }

  @override
  String get_assignable_right() {
    throw UnimplementedError();
  }
}

sealed class ElementaryScoreOperation extends ScoreOperation {}

sealed class BinaryScoreOperation extends ScoreOperation {
  final ScoreOperation left;
  final ScoreOperation right;

  BinaryScoreOperation(this.left, this.right);
}

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
}

final class StoreScoreOperation extends ElementaryScoreOperation {
  final ScoreAssignable left;
  final ScoreAssignable right;

  StoreScoreOperation(this.left, this.right);

  @override
  generate(Context context) => Command('execute store result ' // TODO:
      );
}

final class AssignScoreOperation extends ElementaryScoreOperation {
  final Score left;
  final Score right;

  AssignScoreOperation(this.left, this.right);

  @override
  generate(Context context) =>
      Command('scoreboard players operation $left = $right');
}

final class ElementaryBinaryScoreOperation extends ElementaryScoreOperation {
  final Score left;
  final Score right;

  final ScoreOperator operation;

  ElementaryBinaryScoreOperation({required this.left, required this.right, required this.operation);

  @override
  generate(Context context) =>
      Command('scoreboard players operation $left ${operation.op} $right');
}

final class AddScoreOperation extends BinaryScoreOperation {
  final ScoreOperation left;
  final ScoreOperation right;

  AddScoreOperation(this.left, this.right) : super(left, right);

  @override
  generate(Context context) {
    // TODO: implement generate
    throw UnimplementedError();
  }
}

enum ScoreOperator {
  Addition("+="),
  Subtraction("-="),
  Multiplication("*="),
  Division("/="),
  Modulus("%="),
  Assign("="),
  Min("<"),
  Max(">"),
  Swap("><");

  final String op;
  const ScoreOperator(this.op);
}
