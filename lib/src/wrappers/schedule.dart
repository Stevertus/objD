import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';

class Schedule extends RestActionAble {
  final String _name;
  File? _file;
  ScheduleMode? mode;

  int ticks;

  Schedule(this._name, {required this.ticks, this.mode});
  Schedule.file(this._file, {required this.ticks, this.mode})
      : assert(_file != null),
        _name = _file!.path {
    _file!.execute = true;
  }

  /// Appends a Scheduled Function to the current Schedule.
  Schedule.append(this._name, {required this.ticks})
      : mode = ScheduleMode.append;

  Schedule.clear(this._name)
      : ticks = 0,
        mode = ScheduleMode.clear;

  /// Appends a Scheduled File to the current Schedule.
  Schedule.appendFile(this._file, {required this.ticks})
      : assert(_file != null),
        mode = ScheduleMode.append,
        _name = _file!.path;

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
        children: [_file!],
        suffix: ' ${ticks}t${getMode()}',
      );
    }
    if (mode == ScheduleMode.clear) {
      return Command('schedule clear ${context.packId}:$_name');
    }

    return Command(
      'schedule function ${context.packId}:$_name ${ticks}t${getMode()}',
    );
  }
}

enum ScheduleMode {
  append,
  replace,
  clear,
}
