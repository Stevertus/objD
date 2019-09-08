import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:colorize/colorize.dart';
import 'package:objd/build/buildPack.dart';
import 'package:objd/build/buildProject.dart';
void generateIO(BuildProject prj,GenOptions options) {

  if(!prj.isGen) return;

  if(options.prod)  prj.name += "(prod)";
  String path = options.output != null ? getPath(options.output,"") : getPath(prj.path,prj.name);
  color('Saving Datapack ' + prj.name + ' and its files...',front: Styles.BLUE);


  
  // create mcmeta
  if(!options.minified && prj.isGenMeta){
    Map<String,dynamic> mcmeta = {"pack":{"pack_format":1,"description":prj.description}};
    _createFile(path + 'pack.mcmeta', json.encode(mcmeta));
  } 

  _ensureDirExists(path + 'data/minecraft/tags/functions');

  Map<String,dynamic> tickJson = {"values":[]};
  Map<String,dynamic> loadJson = {"values":[]};

  if(prj.packs != null && prj.packs.isNotEmpty){
    prj.packs.forEach((pack) {
      if(pack.isGen){
        // only run if should generate
        if(!options.minified){
          if(pack.load != null && pack.load.length > 0 && pack.isGenLoad){
            loadJson["values"].add(pack.name + ":" + pack.load);
          }  
          if(pack.main != null && pack.main.length > 0 && pack.isGenMain){
            tickJson["values"].add(pack.name + ":" + pack.main);
          }  
        }
        _createPack(path + 'data/', pack);
      }
    });
  }
  if(!options.minified){
    if(tickJson["values"].isNotEmpty) _createFile(path + 'data/minecraft/tags/functions/tick.json', json.encode(tickJson));
    if(loadJson["values"].isNotEmpty) _createFile(path + 'data/minecraft/tags/functions/load.json', json.encode(loadJson));
  }
  if(options.debugFile) _createFile(path + 'objd.json', json.encode(prj.toMap()));
}

String getPath(String path, String name){
    if(!Directory(path).existsSync()) throw('Please ensure that the project path is an existing directory!');
    String ppath = path + name + '/';
   _ensureDirExists(ppath);
   return ppath;
}

void _createPack(path,BuildPack pack){
  Stopwatch stopwatch = new Stopwatch()..start();
  List<Future> futures = [];
  
    _ensureDirExists(path + pack.name + '/functions');

  if(pack.files != null && pack.files.length > 0){
    pack.files.forEach((filepath,file) {
        if(file.isGen) futures.add(_createFile(path + pack.name + '/functions/' + filepath + '.mcfunction', file.commands.join("\n")));
    }); 


    Future.wait(futures).then((res){
      print("Generated Files for ${pack.name} in ${stopwatch.elapsedMilliseconds}ms");
    });
  }
}
void _ensureDirExists(path){
  if(Directory(path).existsSync() == false) Directory(path).createSync(recursive: true);
}

Future _createFile(String name,String content) async {
    content = content.replaceAll("\\", "\u005C");
    dynamic path = name.split('/');
    path = path.sublist(0,path.length - 1).join('/');
    _ensureDirExists(path);
    var logFile = File(name);
    var sink = logFile.openWrite();
    sink.write(content);
    await sink.flush();
    await sink.close();
    color("Generated: " + name,front: Styles.LIGHT_YELLOW);
    return "";
}

readFile(String name) {
  File myfile = File(name);
  if(!myfile.existsSync()) return null;
  return myfile.readAsStringSync();
}

class GenOptions {
  bool minified = false;
  bool prod = false;
  bool debugFile = false;
  bool hotreload = false;
  String output;

  GenOptions(List<String> args){
    if(args.contains("--hotreload") || args.contains("-r")){
      hotreload = true;
      debugFile = true;
    } 
    if(args.contains("--min")) minified = true;
    if(args.contains("--prod") || args.contains("-p")){
      prod = true;
      minified = false;
      hotreload = false;
    }
    if(args.contains("--debug") || args.contains("-d")){
      debugFile = true;
    } 
    if(args.contains("--out")){
      int index = args.indexOf("--out");
      if(index < args.length -1){
        output = args[index + 1];
      }
    } 
  }

}