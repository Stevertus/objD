// import the core of the framework:
import 'package:objd/core.dart';
// import the custom pack:
import './packs/examplePack.dart';

void main() {
  createProject(
    Project(
      name: "folder name",
      target: "./",             // path for where to generate the project
      generate: ExamplePack(),  // The starting point of generation
    ),
  );
}
