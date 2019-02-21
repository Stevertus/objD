import './widget.dart';
import 'package:objd/build/build.dart';
import './text.dart';
import './for_list.dart';

class CommandList extends Widget {
  List _commands;
  /// There is a more efficient way to list raw Minecraft commands. 
  /// 
  /// The CommandList Widget allows you to input a List of Commands, a List of Strings representing a command or a multiline string.
  /// 
  /// This has basically the same function as For.of just for commands.
/// ```dart
/// CommandList(List<Command>[
/// 		Command('say 1'),
/// 		Command('say 2'),
/// 		Command('say 3')
/// ]),
/// ```
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
  /// A Command is a raw action, that is executed by Minecraft directly.
  /// ```dart
  /// Command('/say hey')
  /// ==> say hey
  /// ```
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
