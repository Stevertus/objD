import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/types/location.dart';
import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/context.dart';
import 'package:objd/wrappers/summon.dart';

/// An AreaEffectCloud can be created with the Summon Widget, but there is also a specific Widget with special properties for an AreaEffectCloud.
class AreaEffectCloud extends RestActionAble {
  TextComponent name;
  Map<String, dynamic> nbt;
  Location location;

  int age;

  List<String> tags;

  /// An AreaEffectCloud can be created with the Summon Widget, but there is also a specific Widget with special properties for an AreaEffectCloud.
  AreaEffectCloud(
    this.location, {
    this.name,
    this.nbt,
    this.age,
    this.tags,
    int radius,
    int applicationDelay,
    int duration,
    int waitTime,
  }) {
    nbt ??= {};

    _addIfExist(radius, 'Radius');
    _addIfExist(applicationDelay, 'ReapplicationDelay');
    _addIfExist(duration, 'Duration');
    _addIfExist(waitTime, 'WaitTime');
  }

  void _addIfExist(dynamic val, String tag) {
    if (val != null) nbt[tag] = val;
  }

  /// To keep the entity alive there is `AreaEffectCloud.persistent` that sets the age to multiple years.
  AreaEffectCloud.persistent(
    this.location, {
    this.name,
    this.nbt,
    this.tags,
    int radius,
    int applicationDelay,
  }) {
    nbt ??= {};
    var inf = -2147483648;

    age = inf;
    _addIfExist(radius, 'Radius');
    _addIfExist(applicationDelay, 'ReapplicationDelay');
    _addIfExist(-1, 'Duration');
    _addIfExist(inf, 'WaitTime');
  }

  @override
  Widget generate(Context context) {
    return Summon(
      Entities.area_effect_cloud,
      location: location,
      tags: tags,
      name: name,
      nbt: nbt,
      age: age,
    );
  }
}
