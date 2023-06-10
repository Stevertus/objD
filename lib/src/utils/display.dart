import 'package:objd/src/basic/types/transformation.dart';
import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/wrappers/data.dart';
import 'package:objd/src/wrappers/summon.dart';

/// An AreaEffectCloud can be created with the Summon Widget, but there is also a specific Widget with special properties for an AreaEffectCloud.
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

  Display.item(
    Location location,
    Item this.item, {
    TextComponent? name,
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
          name: name,
          nbt: nbt,
          age: age,
          tags: tags,
        );
  Display.block(
    Location location,
    Block this.block, {
    TextComponent? name,
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
          name: name,
          nbt: nbt,
          age: age,
          tags: tags,
        );

  Display.text(
    Location location,
    this.text, {
    TextComponent? name,
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
          name: name,
          nbt: nbt,
          age: age,
          tags: tags,
        );

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
