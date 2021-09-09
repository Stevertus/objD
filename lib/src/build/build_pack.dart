import 'package:objd/src/basic/extend.dart';
import 'package:objd/src/basic/file.dart';
import 'package:objd/src/basic/pack.dart';
import 'package:objd/src/basic/raw_file.dart';
import 'package:objd/src/build/build_file.dart';
import 'package:objd/src/build/build_project.dart';
import 'package:objd/src/build/context.dart';

class BuildPack {
  String name;
  Map<Path, BuildFile> files = {};
  Map<Path, String> rawFiles = {};
  List<String> scoreboards;
  Path? main;
  Path? load;
  late Context context;

  bool isGen = true;
  bool isGenLoad = true;
  bool isGenMain = true;

  BuildPack(
    Pack pack, {
    Context? c,
  })  : name = pack.name,
        scoreboards = [] {
    var stopwatch = Stopwatch()..start();

    context = Context.clone(c ?? Context())
      ..packId = name
      ..loadFile = load?.toString()
      ..mainFile = main?.toString();

    if (pack.load != null) {
      load = pack.load!.fullPath(context.path);
      files[load!] = BuildFile(pack.load!);
    }

    if (pack.main != null) {
      main = pack.main!.fullPath(context.path);
      files[main!] = BuildFile(pack.main!);
    }

    if (pack.files != null) {
      for (var file in pack.files!) {
        files[file.fullPath(context.path)] = BuildFile(file);
      }
    }
    print('Compiled Pack $name in ${stopwatch.elapsedMilliseconds}ms');
    stopwatch.stop();
  }

  bool addScoreboard(String name) {
    if (!scoreboards.contains(name)) {
      scoreboards.add(name);
      return true;
    }
    return false;
  }

  void addRawFile(Path folder, RawFile file, BuildProject prj) {
    rawFiles[file.fullPath(folder)] = file.content;
  }

  void addFile(Path folder, File file, BuildProject prj) {
    files[file.fullPath(folder)] = BuildFile(file);
  }

  void extendFile(
    Path folder,
    Extend file,
    BuildProject prj, {
    bool front = false,
  }) {
    var myfile = BuildFile.extended(file);
    final path = file.fullPath(folder);

    myfile.generate(context: context, pack: this, prj: prj);

    if (files[path] == null) {
      files[path] = myfile;
      return;
    }

    if (front) {
      final str = files[path]!.commands.toString();
      files[path]!.commands.clear();
      // switch order
      files[path]!.commands.write(myfile.commands);
      files[path]!.commands.write(str);
    } else {
      files[path]!.commands.write(myfile.commands);
    }
  }

  void generate({required BuildProject prj}) {
    if (prj.prod) context.prod = true;

    // goes through all files (also considering added files while generating previous)
    for (var i = 0; i < files.length; i++) {
      final path = files.keys.toList()[i];
      context.file = path.toString();
      files[path]!.generate(
        context: context,
        pack: this,
        prj: prj,
      );
    }
  }

  Map toMap() {
    return {
      'name': name,
      'files': files.map((key, file) => MapEntry(key.toString(), file.toMap())),
      'main': main.toString(),
      'load': load.toString()
    };
  }
}
