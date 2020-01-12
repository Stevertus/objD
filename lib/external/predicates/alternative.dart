import 'package:objd/external/predicates/inverted.dart';
import 'package:objd/external/predicates/tag.dart';

class Alternative extends Tag {
  final List<Tag> terms;

  Alternative(this.terms);

  static Inverted and(List<Tag> terms) => Inverted(
        Alternative(
          terms.map((t) => Inverted(t)).toList(),
        ),
      );

  @override
  Map<String, dynamic> getJson() => {
        'condition': 'minecraft:alternative',
        'terms': terms.map((t) => t.getJson()).toList(),
      };
}
