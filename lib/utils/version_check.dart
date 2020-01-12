import 'package:objd/core.dart';

class VersionCheck extends Widget {
  String score;
  int currentVersion;
  List<Widget> onUpdate;
  List<Widget> onDowndate;
  Widget Function(Score) then;

  VersionCheck(
    this.currentVersion, {
    this.score = "objd_data",
    this.onDowndate,
    this.onUpdate,
    this.then,
  });

  @override
  generate(Context context) {
    var s = Scoreboard(score);
    var prev = s["build_number.prev"];
    var current = s["build_number"];

    return For.of([
      prev >> current,
      current >> currentVersion,
      if (onUpdate != null)
        If(
          prev < current,
          then: onUpdate,
        ),
      If(
        prev > current,
        then: [
          if (onDowndate != null) ...onDowndate,
          current >> prev,
        ],
      ),
      if (then != null) then(current),
      prev.reset(),
    ]);
  }
}
