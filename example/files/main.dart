import 'package:objd/core.dart';

class MainFile extends Widget {
  /// The main file is put in a seperate widget to split the code in several files
  MainFile();

  @override
  Widget generate(Context context) {
    return For.of([
      // put your tick widgets here
      Raycast(Entity.Selected(),onhit: [Say("Hi")],step: 0.25,ray: (stop,hit){return For.of([Say("Hi")]);})
    ]);
  }
}
