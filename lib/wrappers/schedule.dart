import 'package:objd/basic/command.dart';
import 'package:objd/basic/file.dart';
import 'package:objd/basic/group.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/build.dart';

class Schedule extends Widget {
  String _name;
  File _file;

  int ticks;

  Schedule(this._name,{@required this.ticks});
  Schedule.file(this._file,{@required this.ticks}){
    _file.execute = true;
  }

  @override
  generate(Context context) {
    if(_file != null){
      return Group(prefix:"schedule",children: [_file],suffix: " " + ticks.toString() + "t");
    }
    return Command("schedule function " + context.packId + ":" + _name + " " + ticks.toString()+ "t");
  }

}