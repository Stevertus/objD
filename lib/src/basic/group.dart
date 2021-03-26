import 'package:objd/src/basic/indexed_file.dart';
import 'package:objd/src/basic/rest_action.dart';
import 'package:objd/src/basic/strait_widget.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/basic/for_list.dart';
import 'package:objd/src/build/build.dart';

class Group extends RestActionAble {
  String? prefix;
  String? suffix;
  String? filename;
  String path;
  List<Widget> children;
  int groupMin;
  bool generateIDs;

  /// The group groups actions similar to for but has an option to prefix each action and encapsulate the content in a new file.
  ///
  /// If the children length is larger or equal groupMin a new file is created in `/objD/`(the working directory for objectiveD) and executed.
  /// ```dart
  /// Group(
  /// 	prefix: "execute as @e run "
  /// 	children: List<Widget>[
  /// 		Command('say 1'),
  /// 		Command('say 2'),
  /// 		Command('say 3')
  /// 	],
  /// 	filename: "asgroup",
  /// 	groupMin: 2
  /// ),
  /// ```
  Group({
    this.prefix,
    required this.children,
    this.suffix,
    this.path = 'objd',
    this.groupMin = 3,
    this.filename,
    this.generateIDs = true,
  });

  @override
  Widget generate(Context context) {
    // check if new file is needed
    if (groupMin > -1 && children.isNotEmpty) {
      var childrenNum = children.length;
      // add all widget generated from a strait widget
      if (children.first is StraitWidget) {
        childrenNum += (children.first as StraitWidget).result.length;
      }
      if (childrenNum >= groupMin) {
        return IndexedFile(
          generateIDs && filename != null ? filename! : 'group',
          execute: true,
          child: For.of(children),
          custom: generateIDs && filename != null ? null : filename,
          path: path,
        );
      }
    }
    return For.of(children);
  }
}
