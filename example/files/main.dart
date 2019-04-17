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
),
File("test"),
Extend("test",child: Say(msg:"my mes")),
Pack(name: "hello",main:File("main",child:For.of([File("test"),Execute.as(Entity.All(),children: [Say(msg: "Hello"),Say(msg: "Hello"),Say(msg: "Hello")]),Execute.as(Entity.All(),children: [Say(msg: "Hello"),Say(msg: "Hello"),Say(msg: "Hello")]),Schedule("myname",ticks:5)])))
    ]);
  }
}