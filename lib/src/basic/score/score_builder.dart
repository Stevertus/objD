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
          if (out != null) AssignScoreOperation(out, score),
        ],
      SetScoreOperation(score: final score) => [
          input,
          if (out != null) AssignScoreOperation(out, score),
        ],
      ResetScoreOperation(score: final score) => [
          input,
          if (out != null) AssignScoreOperation(out, score),
        ],
      StoreScoreOperation(left: final left) => [
          input,
          if (out != null) StoreScoreOperation(out, left)
        ],
      ElementaryBinaryScoreOperation(left: final left) => [
          input,
          if (out != null) AssignScoreOperation(out, left)
        ],
      AssignScoreOperation(left: final left) => [
          input,
          if (out != null) AssignScoreOperation(out, left),
        ],
      Score score => [
          score,
          if (out != null) AssignScoreOperation(out, score),
        ],
    };
  }

  List<ElementaryScoreOperation> compileBinary(
      ScoreOperation left, ScoreOperator operator, ScoreOperation right,
      {Score? out}) {
    if (operator == ScoreOperator.Assign) {
      assert(left is ScoreStoreable, "Tried to assign $right to $left");
      final (tmpRight, prevactions) = right.copy(compact: true);

      if (left is Score) {
        if (right is ConstScore) {
          return [SetScoreOperation(left, right.value)];
        }

        return [...prevactions, AssignScoreOperation(left, tmpRight)];
      }
      return [
        ...prevactions,
        StoreScoreOperation(left as ScoreStoreable, tmpRight)
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

    final (tmpRight, rightActions) = right.copy(compact: true);

    // other operators
    return [
      ...leftActions,
      ...rightActions,
      ElementaryBinaryScoreOperation(
        left: out,
        right: tmpRight,
        operation: operator,
      )
    ];
  }
}
