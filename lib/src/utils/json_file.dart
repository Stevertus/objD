import 'dart:convert';

import 'package:gson/gson.dart';
import 'package:objd/src/basic/raw_file.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/context.dart';

class JsonFile extends Widget {
  final String path;
  final Map<String, dynamic>? contents;
  final List<dynamic>? contentsList;
  final bool useGson;

  /// As a way to easily generate .json files, you can use the JsonFile wrapper. Just provide a map and a path
  ///
  /// | constructor |                                           |
  /// | ----------- | ----------------------------------------- |
  /// | String      | path of the file(without .json extension) |
  /// | Map         | the content of the file                   |
  /// | useGson     | whether to generate gson or plain json    |
  JsonFile(this.path, this.contents, {this.useGson = false})
      : contentsList = null;

  /// As a way to easily generate .json files, you can use the JsonFile wrapper. Just provide a list and a path
  ///
  /// | constructor |                                           |
  /// | ----------- | ----------------------------------------- |
  /// | String      | path of the file(without .json extension) |
  /// | Map         | the content of the file                   |
  /// | useGson     | whether to generate gson or plain json    |
  JsonFile.list(this.path, this.contentsList, {this.useGson = false})
      : contents = null;

  @override
  Widget generate(Context context) {
    return RawFile(
      path + '.json',
      useGson
          ? gsonEncode(contents ?? contentsList)
          : jsonEncode(contents ?? contentsList),
    );
  }
}
