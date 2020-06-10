import 'package:objd/basic/command.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';

class Spawnpoint extends RestActionAble {
  final Entity entity;
  final Location position;

  /// The Spawnpoint Widget sets a players spawnpoint to the current or specified [position]
  Spawnpoint({this.entity, this.position});

  @override
  Widget generate(Context context) {
    var cmd = 'spawnpoint';
    if (entity != null) {
      cmd += ' ' + entity.toString();
      if (position != null) cmd += ' ' + position.toString();
    }

    return Command(cmd);
  }
}
