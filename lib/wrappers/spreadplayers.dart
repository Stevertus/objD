import 'package:meta/meta.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';

class SpreadPlayers extends RestActionAble {
  final Entity target;
  final Location center;
  final double distance;
  final double maxRange;
  final double maximumHeight;
  final bool respectTeams;

  /// The Spawnpoint Widget sets a players spawnpoint to the current or specified [position]
  SpreadPlayers(
    this.center, {
    @required this.target,
    @required this.distance,
    @required this.maxRange,
    this.maximumHeight,
    this.respectTeams = false,
  })  : assert(center != null),
        assert(distance != null),
        assert(target != null),
        assert(maxRange != null);

  @override
  Widget generate(Context context) {
    var locations = center.toString().split(' ');
    locations.removeAt(1);

    return Command(
      'spreadplayers ${locations.join(' ')} $distance $maxRange${maximumHeight == null ? '' : ' under ' + maximumHeight.toString()} $respectTeams $target',
    );
  }
}
