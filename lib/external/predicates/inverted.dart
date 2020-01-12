import 'package:objd/external/predicates/tag.dart';

class Inverted extends Tag {
  final Tag term;

  Inverted(this.term);

  @override
  Map<String, dynamic> getJson() => {
        'condition': 'minecraft:inverted',
        'terms': term.getJson(),
      };
}
