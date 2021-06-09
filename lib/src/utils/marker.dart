import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/types/location.dart';
import 'package:objd/src/basic/text_components.dart';
import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/wrappers/summon.dart';

/// An AreaEffectCloud can be created with the Summon Widget, but there is also a specific Widget with special properties for an AreaEffectCloud.
class Marker extends Summon {
  Map<String, dynamic>? data;

  /// An AreaEffectCloud can be created with the Summon Widget, but there is also a specific Widget with special properties for an AreaEffectCloud.
  Marker(
    Location location, {
    Map<String, dynamic>? nbt,
    this.data,
    List<String>? tags,
  }) : super(
          Entities.area_effect_cloud,
          nbt: nbt,
          tags: tags,
        );

  @override
  Map<String, dynamic> getNbt([bool useId = true]) {
    final nbt = super.getNbt(useId);
    if (data != null) {
      nbt['data'] = data;
    }
    return nbt;
  }
}
