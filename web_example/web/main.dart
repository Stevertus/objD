import 'dart:html';
import 'package:objd/core.dart' as objd
    show Project, Pack, File, getAllFiles, saveAsZip;

void main() {
  final files = objd.getAllFiles(
    objd.Project(
        name: 'test',
        description: 'my Project',
        generate: objd.Pack(name: 'test', main: objd.File('main'))),
    [],
  );

  querySelector('#output').text = '$files';

  querySelector('#download').onClick.listen((e) {
    objd.saveAsZip(files, 'test.zip');
  });
}
