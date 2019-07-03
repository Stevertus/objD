import 'package:objd/core.dart';
// import all the files:
import '../files/load.dart';
import '../files/main.dart';

class ExamplePack extends Widget {
  
  /// There is a folder for all packs inside a project, I recommend to give each pack an own widget
  ExamplePack();


  @override
  Widget generate(Context context) {
    return Pack(
      name: "mypack", // name of the subpack
      modules: [
        
      ],
      main: File(     // definining a file that runs every tick
        'main',
        child: MainFile()
      ),
      load: File(     // definining a file that runs on reload
        'load',
        child: LoadFile()
      ),
      files: [
        
      ]
    );
  }
}