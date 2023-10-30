// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objd/src/basic/score/score_export.dart';
import 'package:objd/src/basic/types/condition.dart';
import 'package:objd/src/basic/types/entity.dart';

sealed class ScoreCondition extends Condition {
  ScoreCondition() : super(null);
}

class MatchesScoreCondition extends ScoreCondition {
  final ScoreOperation score;
  final Range range;

  MatchesScoreCondition(
    this.score,
    this.range,
  );

  String getMatch() => range.toString();

  @override
  String toString() {
    final lStr =
        score.toString().splitMapJoin('\n', onNonMatch: (s) => ' | $s');
    final rStr = range.toString();

    return [lStr, 'matches', rStr].join('\n');
  }
}

class BinaryScoreCondition extends ScoreCondition {
  final ScoreOperation left;
  final ConditionalOperator operation;
  final ScoreOperation right;

  BinaryScoreCondition(this.left, this.operation, this.right);

  @override
  String toString() {
    final lStr = left.toString().splitMapJoin('\n', onNonMatch: (s) => ' | $s');
    final rStr =
        right.toString().splitMapJoin('\n', onNonMatch: (s) => ' | $s');

    return [lStr, operation.op, rStr].join('\n');
  }
}

enum ConditionalOperator {
  Bigger(">"),
  BiggerEqual(">="),
  Equal("="),
  LessEqual("<="),
  Less("<");

  final String op;
  const ConditionalOperator(this.op);
}
