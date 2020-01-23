import 'package:objd/basic/command.dart';
import 'package:objd/basic/file.dart';
import 'package:objd/basic/group.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';

class Schedule extends RestActionAble {
  String _name;
  File _file;
  ScheduleMode mode;

  int ticks;

  Schedule(this._name, {@required this.ticks, this.mode})
      : assert(ticks != null);
  Schedule.file(this._file, {@required this.ticks, this.mode})
      : assert(ticks != null) {
    _file.execute = true;
  }

  /// Appends a Scheduled Function to the current Schedule.
  Schedule.append(this._name, {@required this.ticks}) : assert(ticks != null) {
    mode = ScheduleMode.append;
  }
  Schedule.clear(this._name) {
    mode = ScheduleMode.clear;
  }

  /// Appends a Scheduled File to the current Schedule.
  Schedule.appendFile(this._file, {@required this.ticks})
      : assert(ticks != null) {
    mode = ScheduleMode.append;
  }

  @override
  Widget generate(Context context) {
    String getMode() {
      if (mode == null) return '';
      if (mode == ScheduleMode.append) return ' append';
      return ' replace';
    }

    if (_file != null) {
      return Group(
        prefix: 'schedule',
        children: [_file],
        suffix: ' ' + ticks.toString() + 't' + getMode(),
      );
    }
    if (mode == ScheduleMode.clear) {
      return Command('schedule clear ' + context.packId + ':' + _name);
    }

    return Command('schedule function ' +
        context.packId +
        ':' +
        _name +
        ' ' +
        ticks.toString() +
        't' +
        getMode());
  }
}

enum ScheduleMode {
  append,
  replace,
  clear,
}
