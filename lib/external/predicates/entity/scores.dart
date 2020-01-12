import 'package:objd/external/predicates/entity/entity.dart';
import 'package:objd/external/predicates/range.dart';
import 'package:objd/external/predicates/tag.dart';

class Scores extends Tag {
  final Map<String, dynamic> scores;

  final Entity entity;

  Scores(this.scores, [this.entity = const Entity.This()]);

  @override
  Map<String, dynamic> getJson() => {
        'condition': 'minecraft:entity_scores',
        'entity': entity.toString(),
        'scores': scores.map((name, range) {
          if (range is int) return MapEntry(name, range);
          if (range is Range) return MapEntry(name, range.getJson());

          throw ('A score value must be int or Range!');
        }),
      };
}
