import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/types/item.dart';
import 'package:objd/src/basic/types/location.dart';
import 'package:objd/src/basic/types/pose.dart';
import 'package:objd/src/basic/types/rotation.dart';
import 'package:objd/src/basic/text_components.dart';
import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/wrappers/summon.dart';

class ArmorStand extends Summon {
  bool marker, hasArms, basePlate, invisible;

  Item mainHand, offHand, head, chest, legs, boots;
  final Pose pose;

  /// An ArmorStand can be created with the Summon Widget, but there is also a specific Widget with special properties for an ArmorStand.
  ArmorStand(
    Location location, {
    TextComponent name,
    bool nameVisible,
    Map<String, dynamic> nbt,
    List<String> tags,
    this.invisible,
    bool invulnerable,
    this.marker,
    this.hasArms,
    this.basePlate,
    this.mainHand,
    this.offHand,
    this.head,
    this.chest,
    this.legs,
    this.boots,
    bool gravity,
    bool glowing,
    int fire,
    bool small,
    List<Summon> passengers,
    Rotation rotation,
    this.pose,
  }) : super(
          Entities.armor_stand,
          location: location,
          nbt: nbt,
          tags: tags,
          name: name,
          nameVisible: nameVisible,
          invulnerable: invulnerable,
          glowing: glowing,
          gravity: gravity,
          small: small,
          passengers: passengers,
          rotation: rotation,
          fire: fire,
        );

  /// Often times you need a static ArmorStand that just acts as a marker for a location, there is ArmorStand.staticMarker that sets properties automatically.
  ArmorStand.staticMarker(
    Location location, {
    TextComponent name,
    bool nameVisible,
    Map<String, dynamic> nbt,
    this.invisible = true,
    bool invulnerable = true,
    bool gravity = false,
    this.mainHand,
    this.offHand,
    this.head,
    this.chest,
    this.legs,
    this.boots,
    bool glowing,
    int fire,
    bool small,
    List<Summon> passengers,
    Rotation rotation,
    List<String> tags,
    this.pose,
  })  : marker = true,
        super(
          Entities.armor_stand,
          location: location,
          nbt: nbt,
          tags: tags,
          name: name,
          nameVisible: nameVisible,
          invulnerable: invulnerable,
          glowing: glowing,
          gravity: gravity,
          small: small,
          passengers: passengers,
          rotation: rotation,
          fire: fire,
        );

  void _addBoolNbt(Map<String, dynamic> nbt, bool value, String path) {
    if (value != null) nbt[path] = value ? 1 : 0;
  }

  void _addSlots(Map<String, dynamic> nbt) {
    if ((mainHand != null || offHand != null) && nbt['HandItems'] == null) {
      nbt['HandItems'] = [{}, {}];
    }
    if (!(head == null && chest == null && legs == null && boots == null)) {
      nbt['ArmorItems'] = [{}, {}, {}, {}];
    }

    if (mainHand != null) nbt['HandItems'][0] = mainHand.getMap();
    if (offHand != null) nbt['HandItems'][1] = offHand.getMap();
    if (head != null) nbt['ArmorItems'][3] = head.getMap();
    if (chest != null) nbt['ArmorItems'][2] = chest.getMap();
    if (legs != null) nbt['ArmorItems'][1] = legs.getMap();
    if (boots != null) nbt['ArmorItems'][0] = boots.getMap();
    if (pose != null) nbt['Pose'] = pose.getMap();
  }

  @override
  Map<String, dynamic> getNbt([bool useId = true]) {
    final nbt = super.getNbt(useId);

    _addBoolNbt(nbt, marker, 'Marker');
    _addBoolNbt(nbt, hasArms, 'ShowArms');
    _addBoolNbt(nbt, invisible, 'Invisible');
    if (basePlate != null) _addBoolNbt(nbt, !basePlate, 'NoBasePlate');
    _addSlots(nbt);

    return nbt;
  }
}
