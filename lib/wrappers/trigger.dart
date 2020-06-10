import 'package:meta/meta.dart';
import 'package:objd/core.dart';

class Trigger extends RestActionAble {
  String objective = '';
  Score enableScore;
  String _mode;
  bool addNew;

  Trigger(this.objective, {this.addNew = true});
  Trigger.set(this.objective, {@required int value, this.addNew = true}) {
    _mode = 'set ' + value.toString();
  }
  Trigger.add(this.objective, {@required int value, this.addNew = true}) {
    _mode = 'add ' + value.toString();
  }
  Trigger.enable(this.enableScore, {this.addNew = true}) {
    _mode = 'enable';
  }

  @override
  Widget generate(Context context) {
    var command = Command('trigger ${objective} ' + (_mode ?? ''));

    if (_mode == 'enable') {
      command = Command('scoreboard players enable ' +
          enableScore.entity.toString() +
          ' ' +
          enableScore.score);
    }

    if (addNew != null && addNew) {
      return For.of([Scoreboard.trigger(objective), command]);
    }
    return command;
  }
}
