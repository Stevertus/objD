import 'package:objd/external/predicates/tag.dart';

class DamageSource extends Tag {
  final Map<String, dynamic> properties;

  DamageSource(this.properties);

  @override
  Map<String, dynamic> getJson() => {
        'condition': 'minecraft:damage_source_properties',
        'properties': properties,
      };
}
