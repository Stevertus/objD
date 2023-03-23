import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';

class Give extends RestActionAble {
  Entity entity;
  Item item;

  /// Gives a item to a player.
  Give(this.entity, {required this.item});

  @override
  Widget generate(Context context) {
    return Command('give $entity ${item.getGiveNotation()}');
  }
}
