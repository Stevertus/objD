import 'package:objd/basic/command.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';

/// Kills an Entity. It defaults to Entity.Self.
class Kill extends RestActionAble {
  Entity target;

  /// Kills an Entity. It defaults to Entity.Self.
  Kill([this.target]);

  @override
  Widget generate(Context context) {
    if (target == null) return Command('kill');
    return Command('kill ' + target.toString());
  }
}
