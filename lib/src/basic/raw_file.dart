import 'package:objd/core.dart';

/// The RawFile Widget enables you to generate your own Files right in the Widget tree. Here you can define your own file extension, the file path and the content.
class RawFile extends Widget {
  final String name;
  final String content;
  final String path;
  final bool inheritFolder;

  /// The RawFile Widget enables you to generate your own Files right in the Widget tree. Here you can define your own file extension, the file path and the content.
  ///
  /// |constructor | |
  /// |--|--|
  /// |String|the name of the file(with the file extension)|
  /// |String| the content of the file |
  /// |path|changes the default path(in your pack) of the new file|
  ///
  /// **Example:**
  /// ```dart
  /// RawFile(
  /// 	"predicate.json",
  /// 	'{...}',
  /// 	path: "/predicates",
  /// )
  /// ```
  RawFile(
    this.name,
    this.content, {
    this.path = '/',
    this.inheritFolder = true,
  });

  Path fullPath([Path? p]) => inheritFolder && p != null
      ? p.append(path + name)
      : Path.from(path + name);

  @override
  Widget generate(Context context) {
    return Comment.Null();
  }
}
