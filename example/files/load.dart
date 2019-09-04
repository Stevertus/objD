import 'package:objd/basic/indexed_file.dart';
import 'package:objd/core.dart';

class LoadFile extends Widget {
  /// The load file is put in a seperate widget to split the code in several files
  LoadFile();

  @override
  Widget generate(Context context) {

    Score s1 = Score.fromSelected("t");
    Score s2 = Score.fromSelected("t");

    return For.of([
      // put your load widgets here
      Execute.asat(Entity.Self(),children: [Log("t")]),
      Group(children: [s1,s1,s1]),
      IndexedFile("test"),
      If(s1 < 1,Then: [Log("ahh"),s1,s1]),
      If(s1 < 1,Then: [Log("ahh"),s1,s1]),
    ]);
  }
}