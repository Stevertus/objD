import 'package:objd/core.dart';

/// Checks whether the player updated or downdated your datapack.

class VersionCheck extends Widget {
  String score;
  int currentVersion;
  List<Widget> onUpdate;
  List<Widget> onDowndate;
  Widget Function(Score) then;

  /// Checks whether the player updated or downdated your datapack.
  ///
  /// | constructor |  |
  /// |--|--|
  /// |int| the datapacks current version |
  /// |onDowndate| a List of Widgets that are executed if it detects that you have downgraded |
  /// |onUpdate| a List of Widgets that are executed if it detects that you have upgraded |
  /// |then| a Function that takes in the used Score and reacts respectively returning a Widget(optional) |
  /// |score| change the scores name(optional) |
  ///
  /// **Example:**
  ///
  /// ```dart
  /// VersionCheck(
  /// 	2,
  /// 	onDowndate: [Log('Notice: You installed an older version')],
  /// 	onUpdate: [Log('Thank your for updating the pack!')],
  /// )
  /// ```
  VersionCheck(
    this.currentVersion, {
    this.score = 'objd_data',
    this.onDowndate,
    this.onUpdate,
    this.then,
  });

  @override
  Widget generate(Context context) {
    var s = Scoreboard(score);
    var prev = s['build_number.prev'];
    var current = s['build_number'];

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
