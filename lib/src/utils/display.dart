import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/wrappers/summon.dart';

const inf = -2147483648;

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
  final BillbordType? billbordType;
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
    this.billbordType,
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
    this.billbordType,
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
    this.billbordType,
    this.alignment,
    this.textOpacity,
    this.seeThrough,
    this.lineWidth,
  })  : item = null,
        block = null,
        itemDisplay = null,
        super(
          Entities.block_display,
          location: location,
          name: name,
          nbt: nbt,
          age: age,
          tags: tags,
        );

  @override
  Map<String, dynamic> getNbt([bool useId = true]) {
    final nbt = super.getNbt(useId);

    void addIfExist(dynamic val, String tag) {
      if (val != null) nbt[tag] = val;
    }

    addIfExist(billbordType?.name, 'billbord');
    addIfExist(shadowRadius, 'shadow_radius');
    addIfExist(shadowStrength, 'shadow_strength');
    addIfExist(viewRange, 'view_range');
    addIfExist(interpolationDuration?.ticks, 'interpolation_duration');
    addIfExist(startInterpolation?.ticks, 'start_interpolation');
    addIfExist(alignment?.name, 'alignment');
    addIfExist(textOpacity, 'textOpacity');
    addIfExist(seeThrough, 'see_through');
    addIfExist(item, 'item');
    addIfExist(block, 'block_state');
    addIfExist(text, 'text');
    addIfExist(lineWidth, 'lineWidth');
    return nbt;
  }
}

enum BillbordType { fixed, horizontal, center }

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
