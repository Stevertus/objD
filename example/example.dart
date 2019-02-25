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
        child: For.of(
          [
            Execute.asat(
              Entity.All(),
              children: [
                If(
                  Condition.or([
                    Condition.block(Location.rel(x: 0, y: -1, z: 0),
                        block: Block.redstone_block),
                    Condition.block(Location.rel(x: 0, y: 2, z: 0),
                        block: Block.redstone_block)
                  ]),
                  Then: [
                    Command("execute if block ~ ~ ~ stone run say hey")
                    // Title(Entity.All(),
                    //     show: [TextComponent("standing on block")])
                  ],
                  Else: [
                    // Title(Entity.All(),
                    //     show: [TextComponent("not standing on block")])
                  ],
                )
              ],
            )
          ],
        ),
      ),
      load: File(
        path: "load",
        child: For.of([
          Title.times(Entity.All(), fadein: 0, fadeout: 0),
          Tellraw(Entity.All(), show: [TextComponent("Example Loaded")]),

          Timer("timer1",ticks:100,children: [
              Say(msg:"timer")
           ]),
          Timeout("timerout1",ticks:100,children: [
              Say(msg:"timeout")
          ]),
        ]),
      ),
      files: [
        File(
          path: "tes",
          child: For.of(
            [Say(msg: "fgf")],
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
