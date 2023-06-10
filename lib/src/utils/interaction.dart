import 'package:objd/core.dart';
import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/wrappers/summon.dart';

/// An AreaEffectCloud can be created with the Summon Widget, but there is also a specific Widget with special properties for an AreaEffectCloud.
class Interaction extends Summon {
  final double? width;
  final double? height;
  final bool? response;

  Interaction(
    Location location, {
    TextComponent? name,
    Map<String, dynamic>? nbt,
    int? age,
    List<String>? tags,
    this.height,
    this.width,
    this.response,
  }) : super(
          Entities.interaction,
          location: location,
          name: name,
          nbt: nbt,
          age: age,
          tags: tags,
        );

  Execute onInteract({Entity? select, required List<Widget> run}) =>
      Execute(as: select ?? this.select(), children: [
        Execute.on(Relation.target, children: run),
        Data.remove(Entity.Self(), path: "interaction"),
      ]).If(Condition.data(Data.get(Entity.Self(), path: "interaction")));
  Execute onAttack({Entity? select, required List<Widget> run}) =>
      Execute(as: select ?? this.select(), children: [
        Execute.on(Relation.attacker, children: run),
        Data.remove(Entity.Self(), path: "attack"),
      ]).If(Condition.data(Data.get(Entity.Self(), path: "attack")));
  @override
  Map<String, dynamic> getNbt([bool useId = true]) {
    final nbt = super.getNbt(useId);

    void addIfExist(dynamic val, String tag) {
      if (val != null) nbt[tag] = val;
    }

    addIfExist(height, 'height');
    addIfExist(width, 'width');
    addIfExist(response, 'response');
    return nbt;
  }
}
