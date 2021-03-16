import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/context.dart';

class Folder extends Widget {
  String path;
  Widget child;

  Folder(
    this.path, {
    required this.child,
  });

  @override
  Widget generate(Context context) => child;
}
