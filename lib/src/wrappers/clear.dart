import 'package:objd/core.dart';

/// The Clear Widget removes Items from the inventory of an specified Entity.
class Clear extends RestActionAble {
  Entity target;
  Item item;

  /// The Clear Widget removes Items from the inventory of an specified Entity.
  Clear(this.target, this.item);

  @override
  Widget generate(Context context) {
    return Command(
      'clear ${target.toString()} ${item.getGiveNotation(withDamage: false)}',
    );
  }
}
