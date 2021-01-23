import 'package:objd/src/basic/command.dart';
import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/rest_action.dart';
import 'package:objd/src/build/context.dart';

/// Puts a spectator(@s) into an entity.
class Spectate extends RestActionAble {
  final Entity target;

  Spectate(this.target);

  @override
  Command generate(Context context) {
    return Command('spectate ' + target.toString());
  }
}
