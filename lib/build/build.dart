import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:objd/build/buildProject.dart';
import 'package:objd/build/gen_options.dart';
import 'package:objd/build/project.dart';
import 'package:objd/build/reloader.dart' as hotreload;
import 'package:objd/core.dart';
import 'io_ex.dart' as io;

export 'package:objd/build/project.dart';
export 'package:objd/build/context.dart';

/// builds a project and generates the files. Should be placed in the main method.
///
/// Takes in a [Project]
/// ```dart
///void main(args) {
///   // create Project takes in one project and compiles it
///   createProject(
///     Project(...),
///     args
///   )
///}
///```

void createProject(Project prj, [List<String> args = const []]) {
  var stopwatchAll = Stopwatch()..start();
  var opt = GenOptions(args);
  var bPrj = BuildProject(prj, prod: opt.prod);

  if (opt.hotreload) hotreload.reloadProject(bPrj);

  if (opt.generateZip) {
    saveAsZip(
      _getFiles(bPrj, opt),
      opt.output ?? bPrj.path + bPrj.name + '.zip',
    );
  } else {
    var path = opt.output != null
        ? io.getPath(opt.output, '')
        : io.getPath(bPrj.path, bPrj.name);
    var stopwatchFiles = Stopwatch()..start();

    io.generateIO(_getFiles(bPrj, opt), path).then((v) {
      print(
        'Finished saving ${v.length} files in: ${stopwatchFiles.elapsedMilliseconds}ms',
      );
      print('Total Time: ${stopwatchAll.elapsedMilliseconds}ms');
    });
  }
}

/// This function gets a json representation(Map) of the tree structure before generating the files. This is the same that is used as the `objd.json` output in debug mode.
Map getJsonMap(Project prj, [List<String> args = const []]) {
  var opt = GenOptions(args);
  return BuildProject(prj, prod: opt.prod).toMap();
}

/// `getAllFiles` accepts, just like createProject, your Project and optionally arguments. It then generates the widget tree and builds the files, but instead of saving them to your machine, returns them as a Dart Map(filename-content).
Map<String, String> getAllFiles(Project prj, [List<String> args = const []]) {
  var opt = GenOptions(args);
  return _getFiles(BuildProject(prj, prod: opt.prod), opt);
}

Map<String, String> _getFiles(BuildProject prj, GenOptions options) {
  var files = <String, String>{};

  // create mcmeta
  if (!options.minified && prj.isGenMeta) {
    Map mcmeta = <String, dynamic>{
      'pack': {'pack_format': 1, 'description': prj.description}
    };
    files['pack.mcmeta'] = json.encode(mcmeta);
  }

  Map tickJson = <String, dynamic>{'values': []};
  Map loadJson = <String, dynamic>{'values': []};

  if (prj.packs != null && prj.packs.isNotEmpty) {
    prj.packs.forEach((pack) {
      if (pack.isGen) {
        // only run if should generate
        if (!options.minified) {
          // add load and main
          if (pack.load != null && pack.load.isNotEmpty && pack.isGenLoad) {
            loadJson['values'].add(pack.name + ':' + pack.load);
          }
          if (pack.main != null && pack.main.isNotEmpty && pack.isGenMain) {
            tickJson['values'].add(pack.name + ':' + pack.main);
          }
        }
        // add all pack relevant files

        // add raw files
        if (pack.rawFiles != null && pack.rawFiles.isNotEmpty) {
          pack.rawFiles.forEach((filepath, file) {
            files['data/' + pack.name + filepath] = file;
          });
        }

        // add functions
        if (pack.files != null && pack.files.isNotEmpty) {
          pack.files.forEach((filepath, file) {
            if (file.isGen) {
              files['data/' +
                  pack.name +
                  '/functions/' +
                  filepath +
                  '.mcfunction'] = file.commands.join('\n');
            }
          });
        }
      }
    });
  }

  // add minecraft relevant stuff
  if (!options.minified) {
    if (tickJson['values'] != null && (tickJson['values'] as List).isNotEmpty) {
      files['data/minecraft/tags/functions/tick.json'] = json.encode(tickJson);
    }
    if (loadJson['values'] != null && (loadJson['values'] as List).isNotEmpty) {
      files['data/minecraft/tags/functions/load.json'] = json.encode(loadJson);
    }
  }

  // add objd.json
  if (options.debugFile) {
    files['objd.json'] = json.encode(prj.toMap());
  }

  return files;
}

/// When you want to save it as any other Archive or want to implement own generation, you can get the Archive instance with all files added by calling getArchive with the files Map.
/// Read the documentation of the archive package to see what you are able to do: https://pub.dev/documentation/archive

Archive getArchive(Map<String, String> files) {
  final archive = Archive();
  files.forEach((name, content) {
    final rawData = utf8.encode(content);
    archive.addFile(ArchiveFile(name, rawData.length, rawData));
  });

  return archive;
}

/// Saves or downloads(depending on platform) the project as a zip archive. Accepts a file Map(filename-content), most likely from getAllFiles, and a path to save to(must include filename + `.zip` extension)
void saveAsZip(Map<String, String> files, String path) {
  var stopwatch = Stopwatch()..start();
  final bytes = ZipEncoder().encode(getArchive(files));
  io.saveBytes(bytes, path).then((v) {
    print(
      'Finished saving the Zip file ${path} in: ${stopwatch.elapsedMilliseconds}ms',
    );
    stopwatch.stop();
  });
}
