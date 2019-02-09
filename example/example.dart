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
          ReplaceItem(Entity.Player(),
              slot: "hotbar.0",
              item: Item(
                ItemType.iron_axe,
                damage: 5,
                nbt: {"test": 1},
              )),
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
