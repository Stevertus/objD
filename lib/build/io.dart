import 'dart:io';
import 'dart:convert';
import 'package:colorize/colorize.dart';
void generateIO(Map prj) {;
  if(Directory(prj['path']).existsSync() == false) throw('Please ensure that the project path is a existing directory!');
  String path = prj['path'] + prj['name'] + '/';
  _ensureDirExists(path);

  Map<String,dynamic> mcmeta = {"pack":{"pack_format":1,"description":prj['description']}};

  _createFile(path + 'pack.mcmeta', json.encode(mcmeta));
  _ensureDirExists(path + 'data/minecraft/tags/functions');

  Map<String,dynamic> tickJson = {"values":[]};
  Map<String,dynamic> loadJson = {"values":[]};

  if(prj['packs'] != null && prj['packs'].length > 0){
    prj['packs'].forEach((pack) {
      if(pack['load'] != null && pack['load'].length >= 0) loadJson["values"].add(pack['name'] + ":" + pack['load']);
      if(pack['main'] != null && pack['main'].length >= 0) tickJson["values"].add(pack['name'] + ":" + pack['main']);
        _createPack(path + 'data/', pack);
    });
  }
  _createFile(path + 'data/minecraft/tags/functions/tick.json', json.encode(tickJson));
  _createFile(path + 'data/minecraft/tags/functions/load.json', json.encode(loadJson));
}
void _createPack(path,Map pack){
  _ensureDirExists(path + pack['name'] + '/functions');
  if(pack['files'] != null && pack['files'].length > 0){
    pack['files'].forEach((file) {
        _createFile(path + pack['name'] + '/functions/' + file.path + '.mcfunction', file.generate(pack));
    });
  }
  color('Creating Datapack ' + pack['name'] + ' and its files...',front: Styles.BLUE);
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
    color("Generated: " + name,front: Styles.YELLOW);
}