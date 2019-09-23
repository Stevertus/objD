import 'dart:convert';
import 'package:colorize/colorize.dart';
import 'package:objd/build/buildPack.dart';
import 'package:objd/build/buildProject.dart';
import 'package:objd/build/io.dart';

reloadProject(BuildProject prj) {
  color("Doing Hotreload...", front: Styles.CYAN);

  String file = readFile(prj.path + "/${prj.name}/objd.json");
  if (file == null) return;

  Map<String, dynamic> old = json.decode(file) as Map<String, dynamic>;
  Map<dynamic, dynamic> newPrj = prj.toMap();

  if (old.toString() == newPrj.toString()) {
    prj.isGen = false;
    color("Project did not change!", front: Styles.LIGHT_YELLOW);
    return;
  }
  if (old["description"] == newPrj["description"]) prj.isGenMeta = false;
  if (old["packs"] == null) return;
  prj.packs.forEach((pack) {
    int i = prj.packs.indexOf(pack);
    Map newPack = (newPrj["packs"] as Map<int, dynamic>)[i] as Map;
    Map<String, dynamic> oldPack =
        (old["packs"] as Map<int, dynamic>)[i] as Map<String, dynamic>;
    if (oldPack == null) return;

    reloadPack(pack, oldPack, newPack);
  });
}

reloadPack(BuildPack pack, Map<String, dynamic> old, Map newPack) {
  if (old.toString() == newPack.toString()) {
    pack.isGen = false;
    color("Pack ${pack.name} did not change!", front: Styles.LIGHT_YELLOW);
    return;
  }
  if (old["name"] == newPack["name"]) {
    if (old["load"] == newPack["load"]) pack.isGenLoad = false;
    if (old["main"] == newPack["main"]) pack.isGenMain = false;

    if (newPack["files"] != null) {
      //if(old["files"].toString() == newPack["files"].toString()) return;
      for (var file in newPack["files"].keys) {
        if (old["files"][file] != null &&
            old["files"][file].toString() ==
                newPack["files"][file].toString()) {
          pack.files[file].isGen = false;
        }
      }
    }
  }
}
