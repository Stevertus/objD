import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';

/// Kills an Entity. It defaults to Entity.Self.
class Kill extends RestActionAble {
  Entity? target;

  /// Kills an Entity. It defaults to Entity.Self.
  Kill([this.target]);

  @override
  Widget generate(Context context) {
    if (target == null) return Command('kill');
    return Command('kill $target');
  }
}
