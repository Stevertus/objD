import 'package:objd/basic/widget.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/build/build.dart';
import 'package:meta/meta.dart';

class File extends Widget {
  Widget child;
  String path;
  bool execute;
  File({@required this.path, this.child, this.execute = false}){
    this.path.replaceAll('.mcfunction', '');
    if(this.path.substring(0,1) == '/') this.path = this.path.substring(1);
  }
  File.execute({@required this.path, this.child}){
    this.path.replaceAll('.mcfunction', '');
    if(this.path.substring(0,1) == '/') this.path = this.path.substring(1);
    execute = true;
  }

    @override
  Widget generate(Context context) {
      return Command('function '+context.packId+':' + path);;
  }

  @override
  Map toMap(){
    return {'File':{'path':path,'child':child.toMap(),'execute':execute}};
  }
}
