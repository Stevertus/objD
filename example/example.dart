import 'package:objd/core.dart';

main() {
  createProject(Project(
      target: "./example/", name: "example Datapack", generate: mainWidget()));
}

class mainWidget extends Widget {
  Score hey2 = Score(Entity.PlayerName("hi"), "hey2");
  @override
  Widget generate(Context context) {
    return Pack(
      name: 'example',
      main: File(
        path: 'main',
        child: For.of([
          If(
              Condition.and([
                Condition.not(Entity.Player()),
                Condition.or([
                  Entity.Random(),
                  Condition.blocks(
                    Area(x1: 0, y1: 0, z1: 0, x2: 10, y2: 10, z2: 10),
                    compare: Location('~ ~ ~'),
                  ),
                  Condition.not(
                    Condition.score(Score(Entity.Selected(), "test")
                        .matchesRange(Range(from: 0, to: 5))),
                  ),
                ]),
              ]),
              Then: [Say(msg: "I'm done")]),
          Comment.LineBreak(),
          If(
              Condition.or([
                Condition.blocks(
                    Area.fromLocations(
                        Location.rel(x: 1, y: 10, z: 5), Location.here()),
                    compare: Location("~ ~10 ~")),
                Condition.not(Entity(
                    area: Area.fromLocations(
                        Location.rel(x: 1, y: 10, z: 5), Location.here())))
              ]),
              Then: [
                Say(msg: "hello"),
                Say(entity: Entity()),
                Say(msg: "Hello")
              ]),
          If(Condition.and([Entity.Selected(), Condition.not(Entity.Player())]),
              Then: [
                Say(msg: "hey"),
                Say(entity: Entity()),
                Say(msg: "Hello")
              ]),
          Execute.asat(Entity.All(), children: [hey2.get()])
              .anchored(Facing.feet)
              .positioned(Location("~ ~10 ~"))
              .dimension(Dimension.the_end),
          Scoreboard.add("hey"),
          hey2.set(10),
          Score(Entity.Selected(), "hey")
              .subtractScore(Score(Entity.Selected(), "hey2")),
          hey2.setToResult(Command("say hjey")),
          Scoreboard.setdisplay("hey2"),
          ReplaceItem(Entity.Player(),
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
      load: File(
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
        File.execute(
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
