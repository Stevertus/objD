
import 'package:objd/basic/widget.dart';
import 'package:objd/build/build.dart';

class Builder extends Widget {

  final BuilderFunction build;

  Builder(this.build);

  @override
  Widget generate(Context context) => build(context);

}
typedef BuilderFunction = Widget Function(Context);