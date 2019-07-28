import 'package:objd/build/buildProject.dart';
import 'package:objd/build/project.dart';
import 'package:objd/build/reloader.dart' as hotreload;
export 'package:objd/build/project.dart';
export 'package:objd/build/context.dart';
import './io.dart';
/// builds a project and generates the files. Should be placed in the main method.
/// 
/// Takes in a [Project]
/// ```dart
///main() {
/// // create Project takes in one project and compiles it
/// createProject()
///}
///```
void createProject(Project prj,[List<String> args = const []]) {
  Stopwatch stopwatch = new Stopwatch()..start();
  GenOptions opt = GenOptions(args);
  BuildProject bPrj = BuildProject(prj,prod: opt.prod);

  if(opt.hotreload) hotreload.reloadProject(bPrj);

  generateIO(bPrj,opt);
  print("Total Generation Time: ${stopwatch.elapsedMilliseconds}ms");
}

