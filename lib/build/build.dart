
import 'dart:convert';

import 'package:objd/build/buildProject.dart';
import 'package:objd/build/project.dart';
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
  generateIO(BuildProject(prj,prod: opt.prod),opt);
  print("Total Generation Time: ${stopwatch.elapsedMilliseconds}ms");
}

