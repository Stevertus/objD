import 'dart:convert';
import 'package:ansicolor/ansicolor.dart';
import 'package:objd/src/build/build_pack.dart';
import 'package:objd/src/build/build_project.dart';
import 'package:objd/src/build/io_ex.dart';

void reloadProject(BuildProject prj) {
  final color = AnsiPen()..cyan();
  print(color('Doing Hotreload...'));

  final file = readFile('${prj.path}/${prj.name}/objd.json');
  if (file == null) return;

  final newPrj = prj.toMap();

  final old = json.decode(file) as Map<String, dynamic>;

  if (old.toString() == newPrj.toString()) {
    prj.isGen = false;
    color.yellow();
    print(color('Project did not change!'));
    return;
  }

  if (old['description'] == newPrj['description']) prj.isGenMeta = false;
  if (old['packs'] == null) return;

  // go through each pack
  for (var i = 0; i < prj.packs.length; i++) {
    final newPack = newPrj['packs'][i] as Map;
    final oldPack = (old['packs'] as List)[i] as Map<String, dynamic>?;
    if (oldPack == null) return;

    reloadPack(prj.packs[i], oldPack, newPack);
  }
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

    if (pack.files.isNotEmpty) {
      if (old['files'].toString() == newPack['files'].toString()) return;
      for (var file in pack.files.keys) {
        final path = file.toString();
        if (old['files'][path] != null &&
            old['files'][path].toString() ==
                newPack['files'][path].toString()) {
          pack.files[file]!.isGen = false;
        }
      }
    }
  }
}
