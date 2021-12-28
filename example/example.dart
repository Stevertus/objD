// import the core of the framework:

import 'package:objd/core.dart';
// import the custom pack:
import 'packs/example_pack.dart';

void main(List<String> args) {
  createProject(
    Project(
      name: 'folder name',
      version: 18,
      target: './', // path for where to generate the project
      generate: ExamplePack(), // The starting point of generation
    ),
    args,
  );
}
