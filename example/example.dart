import 'package:objd/core.dart';

main() {
  createProject(Project(
      target: "./example/", name: "example Datapack", generate: mainWidget()));
}

class mainWidget extends Widget {
  @override
  Widget generate(Context context) {
    return Pack(
      name: 'example',
      main: File(
        path: 'main',
        child: For.of([
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
