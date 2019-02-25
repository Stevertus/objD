import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import './build.dart';
import './context.dart';
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
void createProject(Project prj) {
  // print(prj.toMap());
  generateIO(build(prj));
}

class Project {
  String target = "./";
  final String name;
  final String description;
  Widget generate;
  /// The project is a special Widget which is just defined once. 
/// 
/// It contains some built options, like description or name, but also the entire underlying tree of packs, files and actions.
/// 
/// ```dart
///main() {
///// create Project takes in one project and compiles it
///createProject(
///	Project(
///	name:  "tested",
///	generate:  mainWidget(),
///	));
///}
///```
  Project({@required this.name, @required this.generate, this.target = './',this.description = "This is a datapack generated with objd by Stevertus"});

  Map toMap() {
    return {"Project":{"name": name,"generate": generate.generate(Context(prefixes: [],suffixes: [],packId: "")).toMap()}};
  }
}
