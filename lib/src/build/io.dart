import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'package:ansicolor/ansicolor.dart';

Future<List> generateIO(
  Map<String, String> files,
  String path, {
  bool useIsolates = false,
  bool clean = false,
}) async {
  var futures = <Future>[];

  if (clean) {
    // sort names by length to mostlikly get deepest nesting first
    var names = files.keys.toList();
    names.sort((a, b) => b.length.compareTo(a.length));
    for (final name in names) {
      await _removeFile(path + name);
    }
    return [];
  } else if (useIsolates) {
    for (final name in files.keys) {
      final port = ReceivePort();
      await Isolate.spawn(
        _createFileWithIsolate,
        _IsolateMsg(port.sendPort, path + name, files[name]!),
      );
      futures.add(port.first);
    }
  } else {
    files.forEach((name, content) {
      futures.add(_createFile(path + name, content));
    });
  }

  return Future.wait(futures);
}

String getPath(String path, String name) {
  if (!Directory(path).existsSync()) {
    throw ('Please ensure that the project path is an existing directory!');
  }
  var ppath = '$path$name/';
  _ensureDirExists(ppath);
  return ppath;
}

void _ensureDirExists(String path) {
  if (Directory(path).existsSync() == false && path.isNotEmpty) {
    Directory(path).createSync(recursive: true);
  }
}

Future<void> _removeFile(String name) async {
  dynamic path = name.split('/');
  path = path.sublist(0, path.length - 1).join('/');
  final file = File(name);
  var dir = Directory(path as String);
  if (!dir.existsSync()) return;

  final yellow = AnsiPen()..yellow();
  final children =
      dir.listSync().map((e) => e.path.replaceAll("\\", "/")).toList();
  if (children.isEmpty ||
      children.length == 1 && children.first == name.replaceAll("\\", "/")) {
    do {
      await dir.delete(recursive: true);
      print(yellow('Removed: ${dir.path}'));
      dir = dir.parent;
    } while (dir.listSync().isEmpty);
  } else if (file.existsSync()) {
    await file.delete();
    // print debug message
    print(yellow('Removed: $name'));
  }

  return;
}

Future<void> _createFile(String name, String content) async {
  dynamic path = name.split('/');
  path = path.sublist(0, path.length - 1).join('/');

  _ensureDirExists(path as String);
  await saveBytes(utf8.encode(content), name);
  // print debug message
  final yellow = AnsiPen()..yellow();
  print(yellow('Generated: $name'));
  return;
}

Future<void> _createFileWithIsolate(_IsolateMsg args) async {
  final name = args.name;
  final content = args.content.replaceAll('\\', '\u005C');
  await _createFile(name, content);
  Isolate.exit(args.port);
}

Future<bool> saveBytes(List<int> bytes, String path) async {
  //_ensureDirExists(path);
  final file = File(path);
  await file.writeAsBytes(bytes);
  return true;
}

String? readFile(String name) {
  var myfile = File(name);
  if (!myfile.existsSync()) return null;
  return myfile.readAsStringSync();
}

class _IsolateMsg {
  final SendPort port;
  final String name;
  final String content;

  _IsolateMsg(this.port, this.name, this.content);
}
