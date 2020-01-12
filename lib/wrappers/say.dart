import 'package:objd/basic/command.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/types/entity.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';

class Say extends RestActionAble {
  String message;

  /// The Say Class writes a simple message or an entity in the chat.
  ///
  /// **You can't put both parameters in Say!**
  Say(dynamic msg) {
    if (msg is Entity) {
      message = msg.toString();
    } else if (msg is String) {
      message = msg;
    } else {
      throw ('Please insert either an entity or a string!');
    }
  }

  @override
  Widget generate(Context context) {
    return Command('say ' + message);
  }
}
