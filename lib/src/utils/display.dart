import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/wrappers/data.dart';
import 'package:objd/src/wrappers/summon.dart';

/// Spawns an diplay entity used to display and animate text, items and blocks in the world, having the following common fields.
class Display extends Summon {
  final Block? block;
  final Item? item;
  final TextComponent? text;
  final Time? interpolationDuration;
  final Time? startInterpolation;
  final double? shadowRadius;
  final double? shadowStrength;
  final double? viewRange;
  final BillboardType? billboardType;
  final Transformation? transformation;
  final ItemDisplay? itemDisplay;

  final TextAlignment? alignment;
  final int? textOpacity;
  final bool? seeThrough;
  final int? lineWidth;

  /// Spawns an diplay entity used to display and animate items in the world.

  Display.item(
    Location location,
    Item this.item, {
    Map<String, dynamic>? nbt,
    int? age,
    List<String>? tags,
    this.interpolationDuration,
    this.startInterpolation,
    this.shadowRadius,
    this.shadowStrength,
    this.viewRange,
    this.billboardType,
    this.transformation,
    this.itemDisplay,
  })  : block = null,
        text = null,
        alignment = null,
        textOpacity = null,
        seeThrough = null,
        lineWidth = null,
        super(
          Entities.item_display,
          location: location,
          nbt: nbt,
          age: age,
          tags: tags,
        );

  /// Spawns an diplay entity used to display and animate blocks in the world.

  Display.block(
    Location location,
    Block this.block, {
    Map<String, dynamic>? nbt,
    int? age,
    List<String>? tags,
    this.interpolationDuration,
    this.startInterpolation,
    this.shadowRadius,
    this.shadowStrength,
    this.viewRange,
    this.billboardType,
    this.transformation,
  })  : item = null,
        text = null,
        itemDisplay = null,
        alignment = null,
        textOpacity = null,
        seeThrough = null,
        lineWidth = null,
        super(
          Entities.block_display,
          location: location,
          nbt: nbt,
          age: age,
          tags: tags,
        );

  /// Spawns an diplay entity used to display and animate text in the world.
  Display.text(
    Location location,
    this.text, {
    Map<String, dynamic>? nbt,
    int? age,
    List<String>? tags,
    this.interpolationDuration,
    this.startInterpolation,
    this.shadowRadius,
    this.shadowStrength,
    this.viewRange,
    this.billboardType,
    this.alignment,
    this.textOpacity,
    this.seeThrough,
    this.lineWidth,
    this.transformation,
  })  : item = null,
        block = null,
        itemDisplay = null,
        super(
          Entities.text_display,
          location: location,
          nbt: nbt,
          age: age,
          tags: tags,
        );

  /// Given the entity to animate, duration, start time, and animatable fields, this constructs a data command.
  /// | Display.animate |                                                                                                  |
  /// | --------------- | ------------------------------------------------------------------------------------------------ |
  /// | Entity          | Display entity to animate                                                                        |
  /// | Time            | duration of the animation                                                                        |
  /// | start           | time to wait until animation starts(default=0t)                                                  |
  /// | shadowRadius    | double size of the shadow (optional)                                                             |
  /// | shadowStrength  | double strength of the shadow (optional)                                                         |
  /// | transformation  | a Transformation object describing the scale, rotation and translation of the display (optional) |
  /// | textOpacity     | Alpha value of rendered text. Alpha value is from 0 to 255. (optional)                           |

  static Data animate(
    Entity entity,
    Time duration, {
    Time start = const Time(0),
    double? shadowStrength,
    Transformation? transformation,
    double? shadowRadius,
    int? textOpacity,
  }) =>
      set(
        entity,
        duration: duration,
        start: start,
        shadowRadius: shadowRadius,
        shadowStrength: shadowStrength,
        textOpacity: textOpacity,
        transformation: transformation,
      );

  /// Given the entity and display fields, this constructs a data command setting the values.
  static Data set(
    Entity entity, {
    Time? duration,
    Time? start,
    double? shadowStrength,
    Transformation? transformation,
    double? shadowRadius,
    int? textOpacity,
  }) {
    final data = Display.text(
      Location.here(),
      TextComponent.none(),
      shadowRadius: shadowRadius,
      shadowStrength: shadowStrength,
      transformation: transformation,
      textOpacity: textOpacity,
      interpolationDuration: duration,
      startInterpolation: start,
    ).getNbt(false);
    data.remove('text');
    return Data.merge(entity, nbt: data);
  }

  @override
  Map<String, dynamic> getNbt([bool useId = true]) {
    final nbt = super.getNbt(useId);

    void addIfExist(dynamic val, String tag) {
      if (val != null) nbt[tag] = val;
    }

    addIfExist(billboardType?.name, 'billboard');
    addIfExist(itemDisplay?.name, 'display');
    addIfExist(shadowRadius, 'shadow_radius');
    addIfExist(shadowStrength, 'shadow_strength');
    addIfExist(viewRange, 'view_range');
    addIfExist(interpolationDuration?.ticks, 'interpolation_duration');
    addIfExist(startInterpolation?.ticks, 'start_interpolation');
    addIfExist(alignment?.name, 'alignment');
    addIfExist(textOpacity, 'textOpacity');
    addIfExist(seeThrough, 'see_through');
    addIfExist(item?.getMap(), 'item');
    addIfExist(block?.getBlockState(), 'block_state');
    addIfExist(text?.toJson(), 'text');
    addIfExist(lineWidth, 'line_width');
    addIfExist(transformation?.toMap(), 'transformation');
    return nbt;
  }
}

enum BillboardType { fixed, horizontal, center }

enum ItemDisplay {
  none,
  thirdperson_lefthand,
  thirdperson_righthand,
  firstperson_lefthand,
  firstperson_righthand,
  head,
  gui,
  ground,
  fixed,
}

enum TextAlignment { center, left, right }
