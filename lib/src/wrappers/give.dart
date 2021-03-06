import 'package:objd/src/basic/command.dart';

import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/basic/types/item.dart';
import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';

class Give extends RestActionAble {
  Entity entity;
  Item item;

  /// Gives a item to a player.
  Give(this.entity, {required this.item}) : assert(item != null);

  @override
  Widget generate(Context context) {
    return Command('give ' + entity.toString() + ' ' + item.getGiveNotation());
  }
}
