import 'package:objd/src/basic/pack.dart';
import 'package:objd/src/build/build.dart';
import 'package:objd/src/build/build_pack.dart';
import 'package:objd/src/build/find_pack.dart';

class BuildProject {
  late List<BuildPack> packs;
  String path;
  String name;
  String description;
  int pack_format;
  bool prod;
  bool isGen = true;
  bool isGenMeta = true;
  Context context;

  BuildProject(Project prj, {this.prod = false})
      : path = prj.target,
        name = prj.name,
        description = prj.description,
        pack_format = prj.getPackFormat(),
        context = Context(prod: false, version: prj.version) {
    packs = findPacks(prj.generate, context: context)
        .map(
          (pack) => BuildPack(
            pack,
            c: context,
          ),
        )
        .toList();
    context.prod = prod;
    // generate all the packs that were initially found
    for (var p in List.from(packs)) {
      p.generate(prj: this);
    }
  }

  void addPack(Pack pack) {
    if (packs.any((pac) => pack.name == pac.name)) {
      throw ('You specified two packs with the same name!');
    }
    packs.add(BuildPack(pack));
    packs.last.generate(prj: this);
  }

  Map toMap() => {
        'name': name,
        'path': path,
        'pack_format': pack_format,
        'packs': packs.map((pack) => pack.toMap()).toList(),
        'description': description
      };
}
