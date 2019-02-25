import 'package:objd/basic/command.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/build/build.dart';

class Say extends Widget {
  String message;
  /// The Say Class writes a simple message or an entity in the chat.
  /// 
  /// **You can't put both parameters in Say!**
  Say({Entity entity, String msg}){
    if(entity != null && msg != null) throw("Please insert either an entity or a message!");

    if(entity != null) message = entity.toString();
    if(msg != null) message = msg;
  }
  
  @override
  Widget generate(Context context){
    return new Command('say ' + message);
  }
}
