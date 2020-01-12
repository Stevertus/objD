import 'dart:async';
import 'dart:io';
import 'package:colorize/colorize.dart';

Future<List> generateIO(Map<String, String> files, String path) async {
  List<Future> futures = [];

  files.forEach((name, content) {
    futures.add(_createFile(path + name, content));
  });

  return Future.wait(futures);
}

String getPath(String path, String name) {
  if (!Directory(path).existsSync()) {
    throw ('Please ensure that the project path is an existing directory!');
  }
  String ppath = path + name + '/';
  _ensureDirExists(ppath);
  return ppath;
}

void _ensureDirExists(String path) {
  if (Directory(path).existsSync() == false && path.isNotEmpty) {
    Directory(path).createSync(recursive: true);
  }
}

Future _createFile(String name, String content) async {
  content = content.replaceAll("\\", "\u005C");
  dynamic path = name.split('/');
  path = path.sublist(0, path.length - 1).join('/');
  _ensureDirExists(path as String);
  var logFile = File(name);
  var sink = logFile.openWrite();
  sink.write(content);
  await sink.flush();
  await sink.close();
  color("Generated: " + name, front: Styles.LIGHT_YELLOW);
  return "";
}

String readFile(String name) {
  File myfile = File(name);
  if (!myfile.existsSync()) return null;
  return myfile.readAsStringSync();
}
