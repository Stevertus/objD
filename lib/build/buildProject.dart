

import 'package:objd/basic/pack.dart';
import 'package:objd/build/buildPack.dart';
import 'package:objd/build/create_project.dart';
import 'package:objd/build/findPack.dart';

class BuildProject {
    List<BuildPack> packs;
    String path;
    String name;
    String description;

    BuildProject(Project prj){
      path = prj.target;
      name = prj.name;
      description = prj.description;
      packs = [
        BuildPack(findPack(prj.generate))
      ];
    }

    addPack(Pack pack){
      if(packs.any((pac) => pack.name == pac.name)) throw("You specified two packs with the same name!");
      packs.add(BuildPack(pack));
      // TODO: Generate Pack
    }

        @override
  String toString() {
    return {
      "name": name,
      "path": path,
      "packs": packs.map((pack) => pack.toString()).toList(),
      "description":description
    }.toString();
  }
}