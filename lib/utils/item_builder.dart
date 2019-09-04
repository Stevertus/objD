
import 'package:meta/meta.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/build.dart';

class ItemBuilder<T> extends Widget {


  final List<T> items;
  final Widget Function(T) build;

  ItemBuilder({@required this.items,@required this.build});

  @override
  Widget generate(Context context) => For.of(items.map<Widget>(build).toList());

}