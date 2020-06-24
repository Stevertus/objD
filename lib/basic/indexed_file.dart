import 'package:objd/basic/file.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';

/// The IndexedFile behaves similar to File. Additionally it makes sure that each File, created with IndexedFile, is unique and does not get overwritten.
class IndexedFile extends Widget {
  static final Map<String, int> _indexed = {};

  // get the id of a name.
  static int getIndexed(String name) {
    return IndexedFile._indexed[name] != null && IndexedFile._indexed[name] > 0
        ? IndexedFile._indexed[name]
        : 0;
  }

  // get the id of a name and increase usage.
  static int getIndexedAndIncrease(String name) {
    final id = getIndexed(name);
    IndexedFile._indexed[name] = id + 1;
    return id;
  }

  final String name;
  final String custom;
  final String path;
  final String pack;
  final Widget child;
  final bool execute;

  /// The IndexedFile behaves similar to File. Additionally it makes sure that each File, created with IndexedFile, is unique and does not get overwritten.
  /// In order to do that IndexedFile saves for each inputted name an id, which gets incremented after each use.
  IndexedFile(
    this.name, {
    this.child,
    this.custom,
    this.path,
    this.execute = false,
    this.pack,
  });

  // gets the File id.
  int getId() {
    return IndexedFile.getIndexed(name);
  }

  @override
  Widget generate(Context context) {
    String _name;
    if (custom != null) {
      _name = custom;
    } else {
      IndexedFile._indexed[name] = getId() + 1;
      _name = name + getId().toString();
    }
    if (path != null) _name = path.trim() + '/' + _name;
    return File(_name, child: child, execute: execute, pack: pack);
  }
}
