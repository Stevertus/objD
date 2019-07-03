import 'package:objd/basic/file.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';

abstract class Module extends Widget {
  Widget generate(Context context);
  List<File> registerFiles();
}