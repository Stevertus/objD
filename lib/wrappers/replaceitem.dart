import 'package:objd/basic/command.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/types/location.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/types/slot.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/types/item.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/build/build.dart';

class ReplaceItem extends RestActionAble {
  Entity entity;
  Location _loc;
  Slot slot;
  Item item;

  /// Sets a specific container slot to a item for Entities.
  ReplaceItem(this.entity, {@required this.item, @required this.slot})
      : assert(item != null);
  ReplaceItem.block(this._loc, {@required this.item, @required this.slot})
      : assert(item != null);

  @override
  Widget generate(Context context) {
    if (slot.slot == null) {
      throw ('The Slot for a ReplaceItem needs a slot property!');
    }
    if (entity != null) {
      return Command(
        'replaceitem entity $entity ${slot.slot} ${item.getGiveNotation()}',
      );
    }
    if (_loc != null) {
      return Command(
        'replaceitem block $_loc ${slot.slot} ${item.getGiveNotation()}',
      );
    }
    throw ('You have to give an entity or a location to the replaceitem-widget');
  }
}
