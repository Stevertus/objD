import 'package:objd/basic/widget.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/build/build.dart';
import 'package:meta/meta.dart';

class File extends Widget {
  Widget child;
  String path;
  bool execute;
  /// The file class simply generates a new mcfunction file with content and a path.
  /// 
  /// The File class can be used as often as you want and where you want, so you can also define a new file in a For container for example.
  /// ```dart
  /// File(
	/// 	path:"main",
	/// 	child: File.execute( // same as execute: true
	/// 		path: 'new'
	/// 		child: Command(...)
	/// 	)
	/// )
  /// ```
  File({@required this.path, this.child, this.execute = false}){
    this.path.replaceAll('.mcfunction', '');
    if(this.path.substring(0,1) == '/') this.path = this.path.substring(1);
  }
  /// the execute subconstructor adds an execution statement forwarding to the new file into the original
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
