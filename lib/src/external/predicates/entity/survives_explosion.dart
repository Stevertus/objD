import 'package:objd/src/external/predicates/tag.dart';

class SurvivesExplosion extends Tag {
  @override
  Map<String, dynamic> getJson() => {
        'condition': 'minecraft:survives_explosion',
      };
}
