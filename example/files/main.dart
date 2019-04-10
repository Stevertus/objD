import 'package:objd/core.dart';

class MainFile extends Widget {
  /// The main file is put in a seperate widget to split the code in several files
  MainFile();

  @override
  Widget generate(Context context) {
    return For.of([
      // put your tick widgets here
      Bossbar("test:mybar").set(
	name:"My name",
	value: 5,
	max: 10,
	color: Color.Red,
	players: Entity.All()
)
    ]);
  }
}