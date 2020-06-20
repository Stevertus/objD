import 'package:objd/basic/command.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';

/// The Enchant Widget gives the currently holding item of a [target] an [enchantment]
class Enchant extends RestActionAble {
  final Entity target;
  final String enchantment;
  final int level;

  /// The Enchant Widget gives the currently holding item of a [target] an [enchantment]
  Enchant(this.target, this.enchantment, {this.level});

  @override
  Widget generate(Context context) {
    var cmd = 'enchant ';
    cmd += target.toString() + ' $enchantment';
    if (level != null) cmd += ' $level';

    return Command(cmd);
  }
}
