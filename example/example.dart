// import the core of the framework:
import 'package:objd/core.dart';
// import the custom pack:
import './packs/examplePack.dart';

void main(List<String> args) {

  print(gsonEncode(gsonEncode({"test":{"value":1.8,"str":"hi","arr":[10]}})));

  createProject(
    Project(
      name: "folder name",
      target: "./",             // path for where to generate the project
      generate: ExamplePack(),  // The starting point of generation
    ),
    args
  );
}
