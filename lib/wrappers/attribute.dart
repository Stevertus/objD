import 'package:meta/meta.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/types/attribute.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/build/build.dart';

/// The Attribute Widget adds certain abilities to an entity. This Widget gives you a varienty of methods to modify speed, attack damage, health and more.
class Attribute extends RestActionAble {
  final Entity target;
  final AttributeType attribute;
  String uuid;
  String name;
  double scale;
  double value;
  AttributeModifier modifyType;
  final _AttributeType _type;

  /// adds a modifier with an uuid
  Attribute.add(
    this.target,
    this.attribute, {
    @required this.uuid,
    @required this.value,
    @required this.name,
    this.modifyType = AttributeModifier.add,
  })  : _type = _AttributeType.add,
        assert(uuid != null),
        assert(value != null);

  /// sets the base modifier to a value
  Attribute.set(
    this.target,
    this.attribute, {
    @required this.value,
  })  : _type = _AttributeType.set,
        assert(value != null);

  /// removes a modifier with an uuid again
  Attribute.remove(
    this.target,
    this.attribute, {
    @required this.uuid,
  })  : _type = _AttributeType.remove,
        assert(uuid != null);

  ///gets the calculated modifier(with base, armor and custom)
  Attribute.get(
    this.target,
    this.attribute, {
    this.scale,
  }) : _type = _AttributeType.get;

  /// gets the base modifier
  Attribute.get_base(
    this.target,
    this.attribute, {
    this.scale,
  }) : _type = _AttributeType.get_base;

  /// gets the modifiers value by uuid
  Attribute.get_modifier(
    this.target,
    this.attribute, {
    @required this.uuid,
    this.scale,
  })  : _type = _AttributeType.get_modifier,
        assert(uuid != null);

  @override
  Widget generate(Context context) {
    var cmd = 'attribute $target $attribute ';

    switch (_type) {
      case _AttributeType.set:
        cmd += 'base set $value';
        break;
      case _AttributeType.get_base:
        cmd += 'base get';
        break;
      case _AttributeType.get_modifier:
        cmd += 'modifier value get $uuid';
        break;
      case _AttributeType.remove:
        cmd += 'modifier remove $uuid';
        break;
      case _AttributeType.add:
        var modify = 'add';
        if (modifyType == AttributeModifier.multiply) {
          modify = 'multiply';
        } else if (modifyType == AttributeModifier.multiply_base) {
          modify = 'multiply_base';
        }
        cmd += 'modifier add $uuid $name $value $modify';
        break;

      default:
        cmd += 'get';
    }

    if (scale != null) cmd += ' $scale';

    return Command(cmd);
  }
}

enum AttributeModifier { add, multiply, multiply_base }
enum _AttributeType { add, set, get, get_base, get_modifier, remove }
