import 'package:objd/src/external/predicates/tag.dart';

class KilledByPlayer extends Tag {
  final bool inverse;

  KilledByPlayer([this.inverse = false]);

  @override
  Map<String, dynamic> getJson() => {
        'condition': 'minecraft:entity_present',
        'inverse': inverse,
      };
}
