import 'package:meta/meta.dart';
import 'package:objd/src/basic/for_list.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/build.dart';

/// The ItemBuilder provides an interface to convert a List into Widgets using a Builder.
class ItemBuilder<T> extends Widget {
  final List<T> items;
  final Widget Function(T) build;

  /// The ItemBuilder provides an interface to convert a List into Widgets using a Builder.
  /// Each Item maps to a new Widget that you return in the build Function.
  ///
  /// | constructor\<T\> |  |
  /// |--|--|
  /// |items| the List of Type T |
  /// |build| the build function, takes in one item(type T) and returns a Widget |

  ItemBuilder({@required this.items, @required this.build});

  @override
  Widget generate(Context context) => For.of(items.map<Widget>(build).toList());
}
