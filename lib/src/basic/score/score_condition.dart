// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objd/src/basic/score/score_export.dart';
import 'package:objd/src/basic/types/condition.dart';
import 'package:objd/src/basic/types/entity.dart';

sealed class ScoreCondition extends Condition {
  final bool invert;
  //TODO: refactor
  ScoreCondition._(String generated, {this.invert = false})
      // ignore: deprecated_member_use_from_same_package
      : super.raw(generated, invert: invert);
}

class MatchesScoreCondition extends ScoreCondition {
  // TODO: Implement for general ScoreOperations, refactor of If necessary
  final Score score;
  final Range range;

  MatchesScoreCondition(this.score, this.range, {super.invert = false})
      : super._('score $score matches $range');

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
  // TODO: Implement for general ScoreOperations, refactor of If necessary
  final Score left;
  final ConditionalOperator operation;
  final Score right;

  BinaryScoreCondition(this.left, this.operation, this.right)
      : super._('score $left ${operation.op} $right');

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
