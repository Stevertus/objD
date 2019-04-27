
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
  objd: ^0.2.0
  """);
  
  _createFile(path + "/index.dart","""
// import the core of the framework:
import 'package:objd/core.dart';
// import the custom pack:
import './packs/examplePack.dart';

void main(List<String> args) {
  createProject(
    Project(
      name: '"""+args[0]+"""',
      target: "./",             // path for where to generate the project
      generate: ExamplePack(),  // The starting point of generation
    ),
    args
  );
}
""");
  _createFile(path + "/packs/examplePack.dart","""
import 'package:objd/core.dart';
// import all the files:
import '../files/load.dart';
import '../files/main.dart';

class ExamplePack extends Widget {
  
  /// There is a folder for all packs inside a project, I recommend to give each pack an own widget
  ExamplePack();


  @override
  Widget generate(Context context) {
    return Pack(
      name: '"""+args[0]+"""', // name of the subpack
      main: File(     // definining a file that runs every tick
        path: 'main',
        child: MainFile()
      ),
      load: File(     // definining a file that runs on reload
        path: 'load',
        child: LoadFile()
      ),
      files: [
        
      ]
    );
  }
}
""");

  _createFile(path + "/files/main.dart","""
import 'package:objd/core.dart';

class MainFile extends Widget {
  /// The main file is put in a seperate widget to split the code in several files
  MainFile();

  @override
  Widget generate(Context context) {
    return For.of([
      // put your tick widgets here
    ]);
  }
}
""");

  _createFile(path + "/files/load.dart","""
import 'package:objd/core.dart';

class LoadFile extends Widget {
  /// The load file is put in a seperate widget to split the code in several files
  LoadFile();

  @override
  Widget generate(Context context) {
    return For.of([
      // put your load widgets here
    ]);
  }
}
""");


// create vs code launch
  _createFile(path + "/.vscode/launch.json","""
{
    "version": "0.2.0",
    "configurations": [ 
        {
            "name": "Dart",
            "program": "\${workspaceFolder}/index.dart",
            "request": "launch",
            "type": "dart"
        }
    ]
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