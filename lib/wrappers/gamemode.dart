import 'package:objd/basic/command.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/build/context.dart';

class SetGamemode extends RestActionAble {
  final Entity target;
  final Gamemode mode;

  SetGamemode(this.mode, {this.target});

  @override
  generate(Context context) {
    return Command(
      'gamemode ' +
          mode.toString().split(".")[1] +
          " " +
          (target ?? Entity.Self()).toString(),
    );
  }
}
