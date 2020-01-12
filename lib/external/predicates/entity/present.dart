import 'package:objd/external/predicates/tag.dart';

class EntityPresent extends Tag {
  @override
  Map<String, dynamic> getJson() => {
        'condition': 'minecraft:entity_present',
      };
}
