

import 'package:objd/basic/extend.dart';
import 'package:objd/basic/file.dart';
import 'package:objd/basic/pack.dart';
import 'package:objd/build/buildFile.dart';

class BuildPack {
    String name;
    Map<String,BuildFile> files = {};
    List<String> scoreboards;
    String main;
    String load;

    BuildPack(Pack pack){
      name = pack.name;
      scoreboards = [];

      if(pack.main != null) {
        main = pack.main.path;
        files[main] = BuildFile(pack.main);
      }
      if(pack.load != null) {
        load = pack.load.path;
        files[load] = BuildFile(pack.load);
      }

      pack.files.forEach((file) => files[file.path] = BuildFile(file));
    }

    addScoreboard(String name){
      if(!scoreboards.contains(name)) scoreboards.add(name);
    }

    addFile(File file){
      files[file.path] = new BuildFile(file);
      // TODO: Build file
    }

    extendFile(Extend file,{bool front}){

    }

    @override
  String toString() {
    return {
      "name": name,
      "files": files.map((key,file) => MapEntry(key,file.toString())),
      "main":main,
      "load":load
    }.toString();
  }
}