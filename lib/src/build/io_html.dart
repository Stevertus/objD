import 'dart:async';

import 'dart:html';

Future<List> generateIO(Map<String, String> files, String path) =>
    throw UnsupportedError('objd web mode');

String getPath(String path, String name) =>
    throw UnsupportedError('objd web mode');

String? readFile(String name) => throw UnsupportedError('objd web mode');

Future<bool> saveBytes(List<int> bytes, String path) async {
  final blob = Blob(
    [bytes],
    'application/octet-stream',
  );
  final url = Url.createObjectUrlFromBlob(blob);
  final link = AnchorElement();
  link.href = url;
  link.download = path;
  link.click();
  return true;
}
