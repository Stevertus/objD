import 'package:objd/core.dart';

class MainFile extends Widget {
  /// The main file is put in a seperate widget to split the code in several files
  MainFile();

  @override
  Widget generate(Context context) {
    return For.of([
      File("test", child: Log(1)),
      Comment("test"),
      // put your tick widgets here
      If(Entity(), Then: [
        Log("1"),
        Log("2"),
        Log("2"),
        Log("2"),
        Log("2"),
        Comment.Null(),
        Extend("test", child: Log("true")),
        Score(Entity.All(), "t").set(5),
        //RandomScore(Entity.All(),to: 10),
        Tellraw(Entity(), show: [TextComponent.space(5)])
      ]),
      Give(Entity(), item: Item.Book([BookPage(TextComponent.space(100))])),
      ForEach(Score(Entity.All(), "t"), then: (score) {
        return Log(score);
      }),
      Raycast(Entity.All(),max:10,onhit: [Log("hit")],ray:(stop, hit){
        return stop();
      })
    ]);
  }
}
