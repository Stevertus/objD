import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/wrappers/data.dart';
import 'package:objd/src/wrappers/execute.dart';
import 'package:objd/src/wrappers/summon.dart';

/// Spawns an interaction entity. Can be used to detect player left/right clicks efficiently.
class Interaction extends Summon {
  final double? width;
  final double? height;
  final bool? response;

  /// Spawns an interaction entity. Can be used to detect player left/right clicks efficiently.
  Interaction(
    Location location, {
    Map<String, dynamic>? nbt,
    int? age,
    List<String>? tags,
    this.height,
    this.width,
    this.response,
  }) : super(
          Entities.interaction,
          location: location,
          nbt: nbt,
          age: age,
          tags: tags,
        );

  /// In your tick function, you can use `.onInteract()`  to detect the interaction.
  /// This uses the execute on command, and removes the interaction nbt data if present:
  Execute onInteract({Entity? select, required List<Widget> run}) =>
      Execute(as: select ?? this.select(), children: [
        Execute.on(Relation.target, children: run),
        Data.remove(Entity.Self(), path: "interaction"),
      ]).If(Condition.data(Data.get(Entity.Self(), path: "interaction")));

  /// In your tick function, you can use `.onAttack()`  to detect the interaction.
  /// This uses the execute on command, and removes the interaction nbt data if present:
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
