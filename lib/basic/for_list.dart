import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/widget.dart';
import 'package:meta/meta.dart';
import 'package:objd/build/build.dart';

class For extends RestActionAble {
  List<Widget> _list;

  int get length => _list.length;
  List<Widget> get children => _list;

  /// The For class enables you to add multiple endpoints to one Widget.
  ///
  ///There is always a List of Widgets involved.
  /// ```dart
  /// For(
  /// 	from: 0,
  /// 	to: 5,
  /// 	create: (index){
  /// 		return Command('/say ' + index.toString())
  /// 	}
  /// )
  /// ```
  For({
    @required Widget Function(int) create,
    @required int to,
    int from = 0,
    int step = 1,
  }) {
    _list = [];
    for (var i = from; i <= to; i += step) {
      _list.add(create(i));
    }
  }

  /// There is an Constructor for looping through a given list of widgets:
  /// ```dart
  /// For.of(List<Widget>[
  /// 		Command('say 1'),
  /// 		Command('say 2'),
  /// 		Command('say 3')
  /// 	]
  /// )
  /// ```
  For.of(this._list);

  @override
  List<Widget> generate(Context context) {
    return _list;
  }

  @override
  Map toMap() => {
        'For': _list.map((x) => x.toMap()),
      };
}
