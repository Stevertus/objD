import 'dart:convert';

import 'package:objd/basic/raw_file.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';
import 'package:objd/external/predicates/tag.dart';

class Predicate extends Widget {
  final String name;
  final Tag contents;

  Predicate(this.name, {this.contents});

  @override
  Widget generate(Context context) {
    return RawFile(
        name + '.json', contents != null ? json.encode(contents.getJson()) : '',
        path: '/predicates/');
  }
}
