import 'package:objd/src/basic/score/score_operation.dart';

class ScoreBuilder {
  final ScoreOperation input;

  ScoreBuilder(this.input);

  List<ElementaryScoreOperation> compile() {
    if (input is ElementaryScoreOperation) {
      return [input as ElementaryScoreOperation];
    }
    return [];
  }
}
