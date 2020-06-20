import 'package:objd/basic/file.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';

/// A Module extends the functionality of a Widget. It allows deeper intregration and file generation.
///
/// The Module is therefore mostly used in your tick function or with the modules provider of the Pack.
///
/// It is supposed to make the concept of animations, timers and continuous ticks easier and gives an high level interface to add complex operations to objD.
///
/// ### Definition
/// A Module has like a Widget a generate method to return the underlying tree and a registerFiles method.
///
/// ```dart
/// class ExampleModule extends Module {
/// 	Widget generate(Context context){
/// 		return ...
/// 	}
/// 	List<File> registerFiles(){
/// 		return [
/// 			File(...)
/// 			...
/// 		]
/// 	}
/// }
/// ```
/// The registered files are just added to the pack as if they were defined in it or in the Widget tree.
///
/// A Module can still be used as a widget everywhere and also handles conditions and groups.

abstract class Module extends RestActionAble {
  @override
  Widget generate(Context context);
  List<File> registerFiles();
}
