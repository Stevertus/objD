import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/build/build.dart';
import 'package:objd/wrappers/if.dart';

class Tag extends RestActionAble {
  bool value;
  Entity entity;
  String tag;

  ///A tag saves a boolean value with an entity inside the game.
  Tag(this.tag, {this.entity, this.value = true}) {
    if (this.entity == null) this.entity = Entity.Selected();
  }

  Tag add() => Tag(tag, entity: entity, value: true);
  Tag remove() => Tag(tag, entity: entity, value: false);

  /// With the toggle method you can toggle the value(invert the tag). This is done with a temporary tag:
  /// ```dart
  /// Tag("mytag",entity:Entity.Selected()).toggle()
  /// ⇒ execute if entity @s[tag=mytag] run tag @s add objd_temp
  /// ⇒ execute if entity @s[tag=objd_temp] run tag @s remove mytag
  /// ⇒ execute if entity @s[tag=!objd_temp] run tag @s add mytag
  /// ⇒ tag @s remove objd_temp
  /// ```
  toggle({String temp = "objd_temp"}) {
    var tempTag = Tag(temp, entity: entity);
    return For.of([
      If(this, Then: [tempTag]),
      If(tempTag, Then: [Tag(tag, entity: entity, value: false)]),
      If(Tag("!" + temp, entity: entity),
          Then: [Tag(tag, entity: entity, value: true)]),
      tempTag.remove()
    ]);
  }

  /// The `removeIfExists` method removes the tag and may execute some action before if the tag exists.
  /// ```dart
  /// Tag("mytag",entity:Entity.Selected()).removeIfExists(
  /// 	then: Say(msg:"removed")
  /// ) // optional argument
  /// ⇒ execute if entity @s[tag=mytag] run say removed
  /// ⇒ execute if entity @s[tag=mytag] run tag @s remove mytag
  /// ```
  If removeIfExists({Widget then}) {
    return If(this, Then: [then, this.remove()]);
  }

  String getEntity() {
    var args = Map.from(entity.arguments);
    if (args['tag'] == null) args['tag'] = [];
    args['tag'].add(tag);
    return entity.toString(args);
  }

  Command getCommand() {
    return value
        ? Command('tag ' + entity.toString() + " add " + tag)
        : Command('tag ' + entity.toString() + " remove " + tag);
  }

  @override
  generate(Context context) {
    return getCommand();
  }
}
