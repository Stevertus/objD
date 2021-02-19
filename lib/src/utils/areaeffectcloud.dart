import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/types/location.dart';
import 'package:objd/src/basic/text_components.dart';
import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/wrappers/summon.dart';

const inf = -2147483648;

/// An AreaEffectCloud can be created with the Summon Widget, but there is also a specific Widget with special properties for an AreaEffectCloud.
class AreaEffectCloud extends Summon {
  int radius, applicationDelay, duration, waitTime;

  /// An AreaEffectCloud can be created with the Summon Widget, but there is also a specific Widget with special properties for an AreaEffectCloud.
  AreaEffectCloud(
    Location location, {
    TextComponent name,
    Map<String, dynamic> nbt,
    int age,
    List<String> tags,
    this.radius,
    this.applicationDelay,
    this.duration,
    this.waitTime,
  }) : super(
          Entities.area_effect_cloud,
          name: name,
          nbt: nbt,
          age: age,
          tags: tags,
        );

  /// To keep the entity alive there is `AreaEffectCloud.persistent` that sets the age to multiple years.
  AreaEffectCloud.persistent(
    Location location, {
    TextComponent name,
    Map<String, dynamic> nbt,
    List<String> tags,
    this.radius,
    this.applicationDelay,
  })  : duration = -1,
        waitTime = inf,
        super(
          Entities.area_effect_cloud,
          name: name,
          nbt: nbt,
          age: inf,
          tags: tags,
        );

  @override
  Map<String, dynamic> getNbt([bool useId = true]) {
    final nbt = super.getNbt(useId);

    void _addIfExist(dynamic val, String tag) {
      if (val != null) nbt[tag] = val;
    }

    _addIfExist(radius, 'Radius');
    _addIfExist(applicationDelay, 'ReapplicationDelay');
    _addIfExist(duration, 'Duration');
    _addIfExist(waitTime, 'WaitTime');
    return nbt;
  }
}
