import 'package:objd/core.dart';

void main() {
  createProject(
    Project(
      name: 'test3',
      target: "./",             // path for where to generate the project
      generate: ExamplePack(),  // The starting point of generation
    ),
  );
}

class ExamplePack extends Widget {
  @override
  Widget generate(Context context) {
    return Pack(
      name: 'test3',
      main: File(
        path: 'main',
        child: For.of([
          
        ])
      ),
      load: File(
        path: 'load',
        child: For.of([

        ])
      ),
      files: [
        
      ]
    );
  }
}
  
