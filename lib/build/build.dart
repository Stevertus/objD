import 'dart:convert';

import 'package:objd/build/buildProject.dart';
import 'package:objd/build/gen_options.dart';
import 'package:objd/build/project.dart';
import 'package:objd/build/reloader.dart' as hotreload;
import 'package:objd/core.dart';
export 'package:objd/build/project.dart';
export 'package:objd/build/context.dart';
import 'io_ex.dart' as io;

/// builds a project and generates the files. Should be placed in the main method.
///
/// Takes in a [Project]
/// ```dart
///main() {
/// // create Project takes in one project and compiles it
/// createProject()
///}
///```

void createProject(Project prj, [List<String> args = const []]) {
  Stopwatch stopwatchAll = Stopwatch()..start();
  GenOptions opt = GenOptions(args);
  BuildProject bPrj = BuildProject(prj, prod: opt.prod);

  if (opt.hotreload) hotreload.reloadProject(bPrj);

  if (opt.prod) bPrj.name += " (prod)";

  String path = opt.output != null
      ? io.getPath(opt.output, "")
      : io.getPath(bPrj.path, bPrj.name);

  Stopwatch stopwatchFiles = Stopwatch()..start();

  io.generateIO(_getFiles(bPrj, opt), path).then((v) {
    print(
      "Finished saving ${v.length} files in: ${stopwatchFiles.elapsedMilliseconds}ms",
    );
    print("Total Time: ${stopwatchAll.elapsedMilliseconds}ms");
  });
}

Map getJsonMap(Project prj, [List<String> args = const []]) {
  GenOptions opt = GenOptions(args);
  return BuildProject(prj, prod: opt.prod).toMap();
}

Map<String, String> getAllFiles(Project prj, [List<String> args = const []]) {
  GenOptions opt = GenOptions(args);
  return _getFiles(BuildProject(prj, prod: opt.prod), opt);
}

Map<String, String> _getFiles(BuildProject prj, GenOptions options) {
  Map<String, String> files = {};

  // create mcmeta
  if (!options.minified && prj.isGenMeta) {
    Map<String, dynamic> mcmeta = {
      "pack": {"pack_format": 1, "description": prj.description}
    };
    files['pack.mcmeta'] = json.encode(mcmeta);
  }

  Map<String, dynamic> tickJson = {"values": []};
  Map<String, dynamic> loadJson = {"values": []};

  if (prj.packs != null && prj.packs.isNotEmpty) {
    prj.packs.forEach((pack) {
      if (pack.isGen) {
        // only run if should generate
        if (!options.minified) {
          // add load and main
          if (pack.load != null && pack.load.isNotEmpty && pack.isGenLoad) {
            loadJson["values"].add(pack.name + ":" + pack.load);
          }
          if (pack.main != null && pack.main.isNotEmpty && pack.isGenMain) {
            tickJson["values"].add(pack.name + ":" + pack.main);
          }
        }
        // add all pack relevant files

        // add raw files
        if (pack.rawFiles != null && pack.rawFiles.isNotEmpty) {
          pack.rawFiles.forEach((filepath, file) {
            files["data/" + pack.name + filepath] = file;
          });
        }

        // add functions
        if (pack.files != null && pack.files.isNotEmpty) {
          pack.files.forEach((filepath, file) {
            if (file.isGen) {
              files["data/" +
                  pack.name +
                  '/functions/' +
                  filepath +
                  '.mcfunction'] = file.commands.join("\n");
            }
          });
        }
      }
    });
  }

  // add minecraft relevant stuff
  if (!options.minified) {
    if (tickJson["values"] != null && (tickJson["values"] as List).isNotEmpty) {
      files['data/minecraft/tags/functions/tick.json'] = json.encode(tickJson);
    }
    if (loadJson["values"] != null && (loadJson["values"] as List).isNotEmpty) {
      files['data/minecraft/tags/functions/load.json'] = json.encode(loadJson);
    }
  }

  return files;
}
