import 'dart:convert';
import 'package:ansicolor/ansicolor.dart';
import 'package:objd/src/build/buildPack.dart';
import 'package:objd/src/build/buildProject.dart';
import 'package:objd/src/build/io_ex.dart';

void reloadProject(BuildProject prj) {
  final color = AnsiPen()..cyan();
  print(color('Doing Hotreload...'));

  var file = readFile(prj.path + '/${prj.name}/objd.json');
  if (file == null) return;

  var old = json.decode(file) as Map<String, dynamic>;
  var newPrj = prj.toMap();

  if (old.toString() == newPrj.toString()) {
    prj.isGen = false;
    color.yellow();
    print(color('Project did not change!'));
    return;
  }
  if (old['description'] == newPrj['description']) prj.isGenMeta = false;
  if (old['packs'] == null) return;
  prj.packs.forEach((pack) {
    var i = prj.packs.indexOf(pack);
    var newPack = newPrj['packs'][i] as Map;
    var oldPack = (old['packs'] as List)[i] as Map<String, dynamic> /*?*/;
    if (oldPack == null) return;

    reloadPack(pack, oldPack, newPack);
  });
}

void reloadPack(BuildPack pack, Map<String, dynamic> old, Map newPack) {
  if (old.toString() == newPack.toString()) {
    pack.isGen = false;
    final yellow = AnsiPen()..yellow();
    print(yellow('Pack ${pack.name} did not change!'));
    return;
  }
  if (old['name'] == newPack['name']) {
    if (old['load'] == newPack['load']) pack.isGenLoad = false;
    if (old['main'] == newPack['main']) pack.isGenMain = false;

    if (newPack['files'] != null) {
      //if(old['files'].toString() == newPack['files'].toString()) return;
      for (var file in newPack['files'].keys) {
        if (old['files'][file] != null &&
            old['files'][file].toString() ==
                newPack['files'][file].toString()) {
          pack.files[file] /*!*/ .isGen = false;
        }
      }
    }
  }
}
