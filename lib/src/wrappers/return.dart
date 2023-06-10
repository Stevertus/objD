import 'package:objd/core.dart';

class Return extends Widget {
  final int val;

  Return(this.val);

  @override
  Widget generate(Context context) {
    return Command('return $val');
  }
}
