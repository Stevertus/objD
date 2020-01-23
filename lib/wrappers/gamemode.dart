import 'package:objd/basic/command.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/build/context.dart';

/// Sets a players gamemode(either Gamemode.creative, Gamemode.adventure, Gamemode.survival or Gamemode.spectator) to an optional target.
///
/// **Example:**
/// ```dart
/// SetGamemode(Gamemode.adventure,target: Entity.All())
/// ⇒ gamemode creative @a
/// ```
class SetGamemode extends RestActionAble {
  final Entity target;
  final Gamemode mode;

  SetGamemode(this.mode, {this.target});

  @override
  Command generate(Context context) {
    return Command(
      'gamemode ' +
          mode.toString().split('.')[1] +
          ' ' +
          (target ?? Entity.Self()).toString(),
    );
  }
}
