
import 'dart:io';

main(args){
  if (args.length < 1) {
    print("Usage: new <name>");
    return;
  }
  String path = Directory.current.path  + "/" + args[0];

  _createFile(path + "/pubspec.yaml", """
name: """+args[0]+"""

dependencies:
  objd: ^0.1.0
  """);
  
  _createFile(path + "/index.dart","""
import 'package:objd/core.dart';

void main() {
  createProject(
    Project(
      name: '"""+args[0]+"""',
      target: "./",             // path for where to generate the project
      generate: ExamplePack(),  // The starting point of generation
    ),
  );
}

class ExamplePack extends Widget {
  @override
  Widget generate(Context context) {
    return Pack(
      name: '"""+args[0]+"""',
      main: File(
        path: 'main',
        child: For.of([
          
        ])
      ),
      load: File(
        path: 'load',
        child: For.of([

        ])
      ),
      files: [
        
      ]
    );
  }
}
  
""");

}

void _ensureDirExists(path){
  if(Directory(path).existsSync() == false) Directory(path).createSync(recursive: true);
}
void _createFile(name,content) async {
    dynamic path = name.split('/');
    path = path.sublist(0,path.length - 1).join('/');
    _ensureDirExists(path);
    var logFile = File(name);
    var sink = logFile.openWrite();
    sink.write(content);
    await sink.flush();
    await sink.close();
    print("Generated: " + name);
}