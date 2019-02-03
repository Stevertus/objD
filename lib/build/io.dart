import 'dart:io';
import 'package:colorize/colorize.dart';
void generateIO(Map prj) {;
  if(Directory(prj['path']).existsSync() == false) throw('Please ensure that the project path is a existing directory!');
  String path = prj['path'] + prj['name'] + '/';
  _ensureDirExists(path);
  _createFile(path + 'pack.mcmeta', prj['description']);
  _ensureDirExists(path + 'data/minecraft/tags/functions');
  _createFile(path + 'data/minecraft/tags/functions/tick.json', 'test');
  _createFile(path + 'data/minecraft/tags/functions/load.json', 'test');

  if(prj['packs'] != null && prj['packs'].length > 0){
    prj['packs'].forEach((pack) {
        _createPack(path + 'data/', pack);
    });
  }
}
void _createPack(path,Map pack){
  _ensureDirExists(path + pack['name'] + '/functions');
  if(pack['files'] != null && pack['files'].length > 0){
    pack['files'].forEach((file) {
        _createFile(path + pack['name'] + '/functions/' + file.path + '.mcfunction', file.generate(pack['name']));
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