
import 'package:objd/core.dart';

class RawFile extends Widget {
  final String name;
  final String content;
  final String path;

  RawFile(this.name,this.content,{this.path = "/"});

  String get fullPath => path + name;

  @override
  generate(Context context) {
    return null;
  }
}