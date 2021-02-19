import 'package:objd/src/basic/command.dart';
import 'package:objd/src/basic/types/rotation.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/text_components.dart';
import 'package:objd/src/basic/types/location.dart';
import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';
import 'package:objd/src/wrappers/effect.dart';
import 'package:gson/gson.dart';

class Summon extends RestActionAble {
  Map<String, dynamic> nbt;
  Location location;
  EntityType type;
  TextComponent name;
  bool nameVisible,
      invulnerable,
      persistent,
      noAI,
      silent,
      gravity,
      glowing,
      small;
  int fire, age;
  Rotation rotation;
  List<Effect> effects;
  List<Summon> passengers;
  List<String> tags;

  /// The summon class creates a new entity at a given location.
  Summon(
    this.type, {
    this.name,
    this.nameVisible,
    this.nbt,
    this.location = const Location.here(),
    this.invulnerable,
    this.persistent,
    this.noAI,
    this.silent,
    this.gravity,
    this.glowing,
    this.passengers,
    this.effects,
    this.tags,
    this.fire,
    this.small,
    this.age,
    this.rotation,
  });

  /// If you have an existing Summon object(or Armorstand) you can invoke `.select` to give you a corresponding `Entity` selector.
  ///
  /// ```dart
  /// Summon(Entities.chicken, tags: ['sel']).select(limit: 1)
  /// ⇒ @e[type=chicken, tag: sel, limit: 1]
  /// ```
  ///
  /// For the options you can also set the used selector and whether to use tags or type.
  Entity select({
    String selector = 'e',
    bool useType = true,
    bool useTags = true,
    int limit,
  }) =>
      Entity(
        selector: selector,
        tags: useTags ? tags : null,
        type: useType ? type : null,
        limit: limit,
      );

  Map<String, dynamic> getNbt([bool useId = true]) {
    var nbt = Map<String, dynamic>.from(this.nbt ?? {});

    void _addBoolNbt(bool value, String path) {
      if (value != null) nbt[path] = value ? 1 : 0;
    }

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
      nbt['Passengers'] = passengers.map((pass) => pass.getNbt()).toList();
    }
    if (fire != null && fire > 0) nbt['Fire'] = fire;
    if (rotation != null) nbt['Rotation'] = [rotation.x, rotation.y];
    if (age != null) nbt['Age'] = age;

    if (useId) nbt['id'] = type.type;
    return nbt;
  }

  Map getMap() => getNbt();

  @override
  Widget generate(Context context) {
    return Command(
      'summon ' +
          type.toString() +
          ' ' +
          location.toString() +
          ' ' +
          gson.encode(
            getNbt(false),
          ),
    );
  }
}
