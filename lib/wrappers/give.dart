import 'package:objd/basic/command.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/item.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';

class Give extends RestActionAble {
  Entity entity;
  Item item;

  /// Gives a item to a player.
  Give(this.entity, {@required this.item}) : assert(item != null);

  @override
  Widget generate(Context context) {
    return Command('give ' + entity.toString() + ' ' + item.getGiveNotation());
  }
}
