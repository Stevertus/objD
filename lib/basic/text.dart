import 'package:objd/basic/rest_action.dart';
import 'package:objd/build/build.dart';

class Text extends RestActionAble {
  final String _str;
  Text(this._str);
  @override
  String generate(Context context) {
    return _str;
  }

  @override
  Map toMap() {
    return {'Text': _str};
  }
}
