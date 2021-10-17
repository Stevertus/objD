import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/rest_action.dart';
import 'package:objd/src/basic/score.dart';
import 'package:objd/src/basic/text_components.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/context.dart';
import 'package:objd/src/wrappers/comment.dart';
import 'package:objd/src/wrappers/tellraw.dart';

/// The log widgets displays a console logging in the players chat.
class Log extends RestActionAble {
  final _LogType _type;
  final dynamic msg;
  Entity? to;
  final Color color;
  final String? desc;

  /// The log widgets displays a console logging in the players chat. That way you can quickly check execution times, score values and entities.
  Log(this.msg, {this.to, this.desc, this.color = Color.DarkAqua})
      : _type = _LogType.CONSOLE {
    to ??= Entity.All();
  }

  /// Log.debug can be used to highlight a important debug message in bold red
  Log.debug(this.msg, {this.to, this.desc, this.color = Color.Red})
      : _type = _LogType.DEBUG {
    to ??= Entity.All();
  }

  /// Log.info shows a small info message
  Log.info(this.msg, {this.to, this.desc, this.color = Color.Gray})
      : _type = _LogType.INFO {
    to ??= Entity.All();
  }

  @override
  Widget generate(Context context) {
    if (context.prod) return Comment.Null();

    var text = TextComponent('undefined');
    if (msg is num || msg is bool) text = TextComponent(msg.toString());
    if (msg is String) text = TextComponent(msg as String);
    if (msg is Score) text = TextComponent.score(msg as Score);
    if (msg is Entity) text = TextComponent.selector(msg as Entity);
    return Tellraw(to!, show: [
      TextComponent(
        '[${_type.toString().split('.')[1]}] ',
        color: color,
        bold: _type == _LogType.DEBUG ? true : null,
      ),
      if (desc != null) TextComponent('$desc '),
      text
    ]);
  }
}

enum _LogType {
  CONSOLE,
  DEBUG,
  INFO,
}
