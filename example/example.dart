import 'package:objd/core.dart';

main() {
  createProject(Project(
      target: "./example/", name: "example Datapack", generate: mainWidget()));
}

class mainWidget extends Widget {
  Score hey2 = Score(Entity.Selected(),"hey2");
  @override
  Widget generate(Context context) {
    return Pack(
      name: 'example',
      main: File(
        path: 'main',
        child: For.of([
          Scoreboard.add("hey"),
          hey2.set(10),
          Score(Entity.Selected(),"hey").subtractScore(Score(Entity.Selected(),"hey2")),
          hey2.setToResult(Command("say hjey")),
          Scoreboard.setdisplay("hey2"),
          ReplaceItem(
              Entity.Player(area: [
                Location.here(),
                Location.glob(x: null, y: 10, z: 100)
              ]),
              slot: "hotbar.0",
              item: Item(
                ItemType.iron_axe,
                damage: 5,
                nbt: {"test": 1},
              )),
          Data.modify(
            Entity.Selected(),
            path: "test",
            modify: DataModify.insert(
              Location("~ ~5 ~"),
              fromPath: "Items[0].id",
              index: 2,
            ),
          )
        ]),
      ),
      load:File(
        path: "load2",
        child: Scoreboard.add("hey5"),
      ),
      files: [
        File(
          path: "tes",
          child: For.of(
            [
              Say(msg: "fgf"),
              Extend(
                "main",
                first: true,
                child: Say(msg: "hey"),
              ),
            ],
          ),
        ),
        File(
            execute: true,
            path: 'test',
            child: Execute(
              as: Entity.Player(),
              at: Entity.Selected(),
              encapsulate: false,
              children: List.generate(
                100,
                (i) => SetBlock(
                      Block.stone,
                      location: Location.rel(x: 0, y: i + 0.0, z: 0),
                    ),
              ),
            )),
      ],
    );
  }
}
