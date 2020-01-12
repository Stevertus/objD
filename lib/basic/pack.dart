import 'package:objd/basic/widget.dart';
import 'package:objd/basic/file.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/build/build.dart';

import 'module.dart';

class Pack extends Widget {
  String name;
  File main;
  File load;
  List<Module> modules;
  List<File> files;

  /// A pack is logically the next step after a Project. This defines a sub-pack with an name again that will be our namespace afterwards.
  ///
  /// Here we can also define included files as well as the main and load function:
  /// ```dart
  /// Pack(
  /// 	name:"tpcraft",
  /// 	main: File(...),
  /// 	load: File(...),
  /// 	files: List<File> [
  /// 		File(...)
  /// 	]
  /// )
  /// ```
  Pack({@required this.name, this.main, this.load, this.files, this.modules}) {
    if (name != name.toLowerCase()) {
      throw ('Please not that the name of a pack must be lowercase! for pack:' +
          name);
    }
    if (modules != null) {
      if (main == null) {
        main = File('main', child: For.of(modules));
      } else {
        main.child = For.of([...modules, main.child]);
      }
    }
  }

  @override
  Widget generate(Context context) {
    return For.of([main, load]);
  }

  @override
  Map toMap() {
    return {
      'Pack': {
        'name': name,
        'main': main == null ? null : main.toMap(),
        'load': load == null ? null : load.toMap(),
        'modules':
            modules == null ? null : modules.map((x) => x.toMap()).toList(),
        'files': files == null ? null : files.map((x) => x.toMap()).toList(),
      }
    };
  }
}
