import 'package:objd/src/basic/command.dart';

import 'package:objd/src/basic/types/location.dart';
import 'package:objd/src/basic/rest_action.dart';
import 'package:objd/src/basic/types/slot.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/basic/types/item.dart';
import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/build/build.dart';

class ReplaceItem extends RestActionAble {
  Entity? entity;
  Location? loc;
  Slot slot;
  Entity? fromEntity;
  Location? fromLoc;
  Slot? fromSlot;
  Item? item;
  String? modifier;

  final _ReplaceItemType _type;

  /// Sets a specific container slot to a item for Entities.
  ReplaceItem(
    this.entity, {
    required this.item,
    required this.slot,
  }) : _type = _ReplaceItemType.replace;

  /// To set items inside a block use ReplaceItem.block:
  ///
  /// | ReplaceItem.block |                                           |
  /// | ----------------- | ----------------------------------------- |
  /// | Location          | The block location                        |
  /// | item              | the Item you want to set(required)        |
  /// | slot              | a Slot Object with the slot set(required) |
  ReplaceItem.block(
    this.loc, {
    required this.item,
    required this.slot,
  }) : _type = _ReplaceItemType.replace;

  /// ReplaceItem.modify takes a modifier path and applies it to an slot.
  ReplaceItem.modify(
    dynamic target,
    this.modifier, {
    required this.slot,
  }) : _type = _ReplaceItemType.modify {
    _setTarget(target);
  }

  /// To copy an Item from one slot to another use `ReplaceItem.copy`:
  ///
  /// | ReplaceItem.copy   |                                                   |
  /// | ------------------ | ------------------------------------------------- |
  /// | Location or Entity | the target container to copy to                   |
  /// | slot               | the slot to copy to(required)                     |
  /// | from               | another Location or Entity to copy from(required) |
  /// | fromSlot           | the slot to copy from(required)                   |
  /// | modifier           | an item modifier path                             |
  ///
  /// **Example:**
  ///
  /// ```dart
  /// ReplaceItem.copy(
  /// 	Entity.Player(),
  /// 	slot: Slot.Hotbar5,
  /// 	from: Location.here(),
  /// 	fromSlot: Slot.Container1,
  /// )
  ///
  /// ⇒ item entity @p hotbar.5 copy block ~ ~ ~ container.1
  /// ```
  ReplaceItem.copy(
    dynamic target, {
    required dynamic from,
    required this.fromSlot,
    required this.slot,
    this.modifier,
  }) : _type = _ReplaceItemType.copy {
    _setTarget(target);

    if (from is Entity) {
      fromEntity = from;
    } else if (from is Location) {
      fromLoc = from;
    } else {
      throw 'ReplaceItem has to get a from argument as Entity or Location';
    }
  }

  /// Use ReplaceItem.clear to clear a specific slot you can
  ReplaceItem.clear(
    dynamic target,
    this.slot,
  )   : item = Item(Items.air),
        _type = _ReplaceItemType.replace {
    _setTarget(target);
  }

  void _setTarget(dynamic t) {
    if (t is Entity) {
      entity = t;
    } else if (t is Location) {
      loc = t;
    } else {
      throw 'ReplaceItem has to get either an Entity or Location target';
    }
  }

  Widget _pre117() {
    assert(
      _type == _ReplaceItemType.replace && item != null,
      'Pre 1.17 ReplaceItem must use replace',
    );

    if (entity != null) {
      return Command(
        'replaceitem entity $entity ${slot.slot} ${item!.getGiveNotation()}',
      );
    }
    return Command(
      'replaceitem block $loc ${slot.slot} ${item!.getGiveNotation()}',
    );
  }

  @override
  Widget generate(Context context) {
    if (slot.slot == null) {
      throw ('The Slot for a ReplaceItem needs a slot property!');
    }

    if (context.version < 17) return _pre117();

    var cmd = ['item'];
    cmd.add(entity != null ? 'entity $entity' : 'block $loc');

    cmd.add(slot.slot!);

    cmd.add(_type.toString().split('.')[1]);

    if (_type == _ReplaceItemType.replace && item != null) {
      cmd.add(item!.getGiveNotation());
    }

    if (_type == _ReplaceItemType.copy && fromSlot != null) {
      cmd.add(fromEntity != null ? 'entity $fromEntity' : 'block $fromLoc');
      cmd.add(fromSlot!.slot!);
    }

    if (modifier != null) {
      cmd.add(modifier!);
    }

    return Command(cmd.join(' '));
  }
}

enum _ReplaceItemType { replace, copy, modify }
