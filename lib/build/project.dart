

import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';

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
