import 'package:objd/core.dart';

class Trigger extends RestActionAble {
  String objective = '';
  Score? enableScore;
  final String _mode;
  bool addNew;

  Trigger(this.objective, {this.addNew = true}) : _mode = '';
  Trigger.set(this.objective, {required int value, this.addNew = true})
      : _mode = 'set $value';
  Trigger.add(this.objective, {required int value, this.addNew = true})
      : _mode = 'add $value';
  Trigger.enable(this.enableScore, {this.addNew = true}) : _mode = 'enable';

  @override
  Widget generate(Context context) {
    var command = Command('trigger $objective ' + _mode);

    if (enableScore != null && _mode == 'enable') {
      command = Command('scoreboard players enable ' +
          enableScore!.entity.toString() +
          ' ' +
          enableScore!.score);
    }

    if (addNew) {
      return For.of([Scoreboard.trigger(objective), command]);
    }
    return command;
  }
}
