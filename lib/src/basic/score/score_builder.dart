import 'package:objd/src/basic/score/score.dart';

class ScoreBuilder {
  List<ElementaryScoreOperation> compile(ScoreOperation input, {Score? out}) {
    return switch (input) {
      BinaryScoreOperation(
        left: final left,
        operation: final operation,
        right: final right
      ) =>
        compileBinary(left, operation, right, out: out),
      IncrementScoreOperation(score: final score) => [
          input,
          if (out != null) ElementaryBinaryScoreOperation.assign(out, score),
        ],
      SetScoreOperation(score: final score) => [
          input,
          if (out != null) ElementaryBinaryScoreOperation.assign(out, score),
        ],
      ResetScoreOperation(score: final score) => [
          input,
          if (out != null) ElementaryBinaryScoreOperation.assign(out, score),
        ],
      StoreScoreOperation(left: final left) => [
          input,
          if (out != null) StoreScoreOperation(out, left.toStorable())
        ],
      ElementaryBinaryScoreOperation(left: final left) => [
          input,
          if (out != null) ElementaryBinaryScoreOperation.assign(out, left)
        ],
      Score score => [
          score,
          if (out != null) ElementaryBinaryScoreOperation.assign(out, score),
        ],
    };
  }

  List<ElementaryScoreOperation> compileBinary(
      ScoreOperation left, ScoreOperator operator, ScoreOperation right,
      {Score? out}) {
    if (operator == ScoreOperator.Assign) {
      assert(left is ScoreAssignable, "Tried to assign $right to $left");
      final (tmpRight, prevactions) = right.copy(compact: true);

      if (left is Score) {
        if (right is ConstScore) {
          return [SetScoreOperation(left, right.value)];
        }

        return [
          ...prevactions,
          ElementaryBinaryScoreOperation.assign(left, tmpRight)
        ];
      }
      return [
        ...prevactions,
        StoreScoreOperation(left as ScoreAssignable, tmpRight)
      ];
    }

    var leftActions = compile(left, out: out);
    if (out == null) {
      if (left is Score) {
        out ??= left;
      } else {
        (out, leftActions) = left.copy();
      }
    }

    if (right is ConstScore) {
      switch (operator) {
        case ScoreOperator.Assign:
          return [...leftActions, SetScoreOperation(out, right.value)];

        case ScoreOperator.Addition:
          return [...leftActions, IncrementScoreOperation(out, right.value)];
        case ScoreOperator.Subtraction:
          return [...leftActions, IncrementScoreOperation(out, -right.value)];
        default:
      }
    }

    final (tmpRight, rightActions) = right.copy(compact: true);

    // other operators
    return [
      ...leftActions,
      ...rightActions,
      ElementaryBinaryScoreOperation(
        out,
        operator,
        tmpRight,
      )
    ];
  }
}
