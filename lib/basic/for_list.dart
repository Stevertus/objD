import 'package:objd/basic/widget.dart';
import 'package:meta/meta.dart';
import 'package:objd/build/build.dart';

class For extends Widget {
  List<Widget> _list;
  For({@required Function create, @required int to, int from = 0,int step =1}){
    for (var i = from; i <= to; i+= step) {
      _list[i] = create(i);
    }
  }
  For.of(this._list);
    int get length => _list.length;
    List<Widget> get children => _list;
  @override
  List<Widget> generate(Context context) {
      return _list;
  }
  @override
  Map toMap() => {'For':_list.map((x) => x.toMap())};
}