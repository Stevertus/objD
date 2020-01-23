import 'package:objd/basic/command.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/build/context.dart';

/// Puts a spectator(@s) into an entity.
class Spectate extends RestActionAble {
  final Entity target;

  Spectate(this.target);

  @override
  Command generate(Context context) {
    return Command('spectate ' + target.toString());
  }
}
