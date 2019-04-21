

import 'package:objd/basic/pack.dart';
import 'package:objd/build/buildPack.dart';
import 'package:objd/build/project.dart';
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
      packs.first.generate(prj:this);
    }

    addPack(Pack pack){
      if(packs.any((pac) => pack.name == pac.name)) throw("You specified two packs with the same name!");
      packs.add(BuildPack(pack));
      packs.last.generate(prj:this);
    }

  Map toMap() {
    return {
      "name": name,
      "path": path,
      "packs": packs.map((pack) => pack.toMap()).toList(),
      "description":description
    };
  }
}