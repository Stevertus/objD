import 'package:objd/basic/types/condition.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/build/build.dart';
import 'package:objd/wrappers/if.dart';

class Tag extends RestActionAble {
  // static prefix

  /// Often you find yourself giving all tags a prefix especially for your project. This can get very repetitive and annoying, so objD has this prefix built in.
  static String prefix;

  bool value;
  Entity entity;
  String tag;

  ///A tag saves a boolean value with an entity inside the game.
  Tag(this.tag, {this.entity, this.value = true}) {
    entity ??= Entity.Selected();
    if (prefix != null && !tag.contains(prefix)) tag = prefix + tag;
  }

  Tag add() => Tag(tag, entity: entity, value: true);
  Tag remove() => Tag(tag, entity: entity, value: false);

  /// With the toggle method you can toggle the value(invert the tag). This is done with a temporary tag:
  /// ```dart
  /// Tag('mytag',entity:Entity.Selected()).toggle()
  /// ⇒ execute if entity @s[tag=mytag] run tag @s add objd_temp
  /// ⇒ execute if entity @s[tag=objd_temp] run tag @s remove mytag
  /// ⇒ execute if entity @s[tag=!objd_temp] run tag @s add mytag
  /// ⇒ tag @s remove objd_temp
  /// ```
  Widget toggle({String temp = 'objd_temp'}) {
    var tempTag = Tag(temp, entity: entity);
    return For.of([
      If(this, then: [tempTag]),
      If(tempTag, then: [Tag(tag, entity: entity, value: false)]),
      If(entity.copyWith().not(tags: [temp]),
          then: [Tag(tag, entity: entity, value: true)]),
      tempTag.remove()
    ]);
  }

  /// The `removeIfExists` method removes the tag and may execute some action before if the tag exists.
  /// ```dart
  /// Tag('mytag',entity:Entity.Selected()).removeIfExists(
  /// 	then: Say(msg:'removed')
  /// ) // optional argument
  /// ⇒ execute if entity @s[tag=mytag] run say removed
  /// ⇒ execute if entity @s[tag=mytag] run tag @s remove mytag
  /// ```
  If removeIfExists({Widget then}) {
    return If(this, then: [then, remove()]);
  }

  /// Checks if the Tag is a certain value and returns a Condition to use in If.
  Condition operator &(bool other) {
    if (other != null && other) return Condition.tag(this);
    return Condition.not(Condition.tag(this));
  }

  /// Assignees a new boolean value to the Tag(removes or adds the tag).
  Tag operator >>(bool other) {
    if (other != null && other) return Tag(tag, entity: entity, value: true);
    return Tag(tag, entity: entity, value: false);
  }

  String getEntity() {
    return entity.copyWith(tags: [tag]).toString();
  }

  Command getCommand() {
    return value
        ? Command('tag ' + entity.toString() + ' add ' + tag)
        : Command('tag ' + entity.toString() + ' remove ' + tag);
  }

  @override
  Widget generate(Context context) {
    return getCommand();
  }
}
