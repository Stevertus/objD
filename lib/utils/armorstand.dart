import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/types/item.dart';
import 'package:objd/basic/types/location.dart';
import 'package:objd/basic/types/rotation.dart';
import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/context.dart';
import 'package:objd/wrappers/summon.dart';

class ArmorStand extends RestActionAble {
  TextComponent name;
  Map<String, dynamic> nbt;
  Location location;

  bool invulnerable, gravity, small, nameVisible, glowing;

  Item mainHand, offHand, head, chest, legs, boots;

  List<String> tags;
  int fire;
  Rotation rotation;
  List<Summon> passengers;

  /// An ArmorStand can be created with the Summon Widget, but there is also a specific Widget with special properties for an ArmorStand.
  ArmorStand(
    this.location, {
    this.name,
    this.nameVisible,
    this.nbt,
    bool invisible,
    this.invulnerable,
    bool marker,
    bool hasArms,
    bool basePlate,
    this.mainHand,
    this.offHand,
    this.head,
    this.chest,
    this.legs,
    this.boots,
    this.gravity,
    this.glowing,
    this.fire,
    this.small,
    this.passengers,
    this.tags,
    this.rotation,
  }) {
    nbt ??= {};

    _addBoolNbt(marker, 'Marker');
    _addBoolNbt(hasArms, 'ShowArms');
    _addBoolNbt(invisible, 'Invisible');
    if (basePlate != null) _addBoolNbt(!basePlate, 'NoBasePlate');
    _addSlots();

    // TODO: Pose
  }
  void _addSlots() {
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
  }

  /// Often times you need a static ArmorStand that just acts as a marker for a location, there is ArmorStand.staticMarker that sets properties automatically.
  ArmorStand.staticMarker(
    this.location, {
    this.name,
    this.nameVisible,
    this.nbt,
    bool invisible = true,
    this.invulnerable = true,
    this.gravity = false,
    this.mainHand,
    this.offHand,
    this.head,
    this.chest,
    this.legs,
    this.boots,
    this.glowing,
    this.fire,
    this.small,
    this.passengers,
    this.tags,
    this.rotation,
  }) {
    nbt ??= {};

    _addBoolNbt(true, 'Marker');
    _addBoolNbt(invisible, 'Invisible');
    _addSlots();
  }

  void _addBoolNbt(bool value, String path) {
    if (value != null) nbt[path] = value ? 1 : 0;
  }

  @override
  Widget generate(Context context) {
    return Summon(Entities.armor_stand,
        location: location,
        tags: tags,
        name: name,
        nameVisible: nameVisible,
        nbt: nbt,
        invulnerable: invulnerable,
        glowing: glowing,
        gravity: gravity,
        small: small,
        passengers: passengers,
        rotation: rotation);
  }
}
