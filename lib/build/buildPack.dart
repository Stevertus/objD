import 'package:objd/basic/extend.dart';
import 'package:objd/basic/file.dart';
import 'package:objd/basic/pack.dart';
import 'package:objd/basic/raw_file.dart';
import 'package:objd/build/buildFile.dart';
import 'package:objd/build/buildProject.dart';
import 'package:objd/build/context.dart';

class BuildPack {
  String name;
  Map<String, BuildFile> files = {};
  Map<String, String> rawFiles = {};
  List<String> scoreboards;
  String main;
  String load;
  Context context;

  bool isGen = true;
  bool isGenLoad = true;
  bool isGenMain = true;

  BuildPack(Pack pack, {this.context}) {
    var stopwatch = Stopwatch()..start();
    name = pack.name;
    scoreboards = [];

    if (pack.main != null) {
      main = pack.main.path;
      files[main] = BuildFile(pack.main);
    }
    if (pack.load != null) {
      load = pack.load.path;
      files[load] = BuildFile(pack.load);
    }

    if (pack.files != null) {
      pack.files.forEach((file) => files[file.path] = BuildFile(file));
    }

    context ??= Context(packId: name, loadFile: load, mainFile: main);
    print('Compiled Pack ${name} in ${stopwatch.elapsedMilliseconds}ms');
  }

  bool addScoreboard(String name) {
    if (!scoreboards.contains(name)) {
      scoreboards.add(name);
      return true;
    }
    return false;
  }

  void addRawFile(RawFile file, BuildProject prj) {
    rawFiles[file.fullPath] = file.content;
  }

  void addFile(File file, BuildProject prj) {
    files[file.path] = BuildFile(file);
  }

  void extendFile(Extend file, {bool front, BuildProject prj}) {
    var myfile = BuildFile.extended(file);
    if (files[file.path] == null) {
      files[file.path] = myfile;
      return;
    }

    myfile.generate(context: context, pack: this, prj: prj);

    if (front) {
      files[file.path].commands.insertAll(0, myfile.commands);
    } else {
      files[file.path].commands.addAll(myfile.commands);
    }
  }

  void generate({BuildProject prj}) {
    if (prj.prod) context.prod = true;
    for (var i = 0; i < files.length; i++) {
      context.file = files.values.toList()[i].path;
      files.values.toList()[i].generate(context: context, pack: this, prj: prj);
    }
  }

  Map toMap() {
    return {
      'name': name,
      'files': files.map((key, file) => MapEntry(key, file.toMap())),
      'main': main,
      'load': load
    };
  }
}
