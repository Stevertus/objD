import 'package:objd/external/predicates/tag.dart';

class KilledByPlayer extends Tag {
  final bool inverse;

  KilledByPlayer([this.inverse]);

  @override
  Map<String, dynamic> getJson() => {
        'condition': 'minecraft:entity_present',
        'inverse': inverse ?? false,
      };
}
