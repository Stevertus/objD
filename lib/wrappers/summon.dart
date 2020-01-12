import 'package:objd/basic/command.dart';
import 'package:objd/basic/types/rotation.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/types/location.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';
import 'package:objd/wrappers/effect.dart';
import 'package:gson/gson.dart';

class Summon extends RestActionAble {
  Map<String, dynamic> nbt;
  Location location;
  EntityType type;

  /// The summon class creates a new entity at a given location.
  Summon(
    this.type, {
    TextComponent name,
    bool nameVisible,
    this.nbt,
    this.location,
    bool invulnerable,
    bool persistent,
    bool noAI,
    bool silent,
    bool gravity,
    bool glowing,
    List<Summon> passengers,
    List<Effect> effects,
    List<String> tags,
    int fire,
    bool small,
    int age,
    Rotation rotation,
  }) {
    location ??= Location.here();
    nbt ??= {};

    if (name != null) nbt['CustomName'] = name.toJson();
    _addBoolNbt(invulnerable, 'Invulnerable');
    _addBoolNbt(silent, 'Silent');
    _addBoolNbt(small, 'Small');
    _addBoolNbt(glowing, 'Glowing');
    _addBoolNbt(nameVisible, 'CustomNameVisible');
    _addBoolNbt(persistent, 'PersistenceRequired');
    _addBoolNbt(noAI, 'NoAI');
    if (gravity != null) _addBoolNbt(!gravity, 'NoGravity');
    if (tags != null && tags.isNotEmpty) {
      nbt['Tags'] = Tag.prefix != null
          ? tags
              .map((String t) => t.contains(Tag.prefix) ? t : Tag.prefix + t)
              .toList()
          : tags;
    }
    if (effects != null && effects.isNotEmpty) {
      nbt['ActiveEffects'] = effects.map((effect) => effect.getMap()).toList();
    }
    if (passengers != null) {
      nbt['Passengers'] = passengers.map((pass) => pass.getMap()).toList();
    }
    if (fire != null && fire > 0) nbt['Fire'] = fire;
    if (rotation != null) nbt['Rotation'] = [rotation.x, rotation.y];
    if (age != null) nbt['Age'] = age;
  }

  Map getMap() {
    var ret = Map.from(nbt);
    ret['id'] = type.type;
    return ret;
  }

  void _addBoolNbt(bool value, String path) {
    if (value != null) nbt[path] = value ? 1 : 0;
  }

  @override
  Widget generate(Context context) {
    return Command('summon ' +
        type.toString() +
        ' ' +
        location.toString() +
        ' ' +
        gson.encode(nbt));
  }
}
