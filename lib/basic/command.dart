import './widget.dart';
import 'package:objd/build/build.dart';
import './text.dart';
import './for_list.dart';

class CommandList extends Widget {
  List _commands;
  CommandList(List commands) {
    if (commands[0] is String)
      _commands = commands.map((x) => Command(x)).toList();
    else if (commands[0] is Command)
      _commands = commands;
    else
      throw ('Please insert a string or a list into CommandList');
  }
  CommandList.str(String str) {
    _commands = str
        .replaceAll(new RegExp(r'[ \t]{2,}'), '')
        .split('\n')
        .where((i) => i.length > 0 && i != ' ')
        .map((x) => Command(x))
        .toList();
  }
  @override
  Widget generate(Context context) {
    return For.of(_commands);
  }
  int get length => _commands.length;
  @override
  Map toMap() {
    return {'commands': _commands.map((x) => x.toMap())};
  }
}

class Command extends Widget {

  String _command;
  Command(this._command) {
    if (_command.length > 0 && _command.substring(0, 1) == "/") {
      _command = _command.substring(1);
    }
  }
  @override
  Widget generate(Context context) {
    return Text(_command);
  }

  @override
  Map toMap() {
    return {'command': _command};
  }
}
