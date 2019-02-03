import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import './build.dart';
import './io.dart';
void createProject(Project prj) {
  // print(prj.toMap());
  generateIO(build(prj));
}

class Project {
  String target = "./";
  final String name;
  final String description;
  Widget generate;
  Project({@required this.name, @required this.generate, this.target = './',this.description = "This is a datapack generated with objd by Stevertus"});

  Map toMap() {
    return {"Project":{"name": name,"generate": generate.generate(Context(prefixes: [],packId: "")).toMap()}};
  }
}
