import 'package:meta/meta.dart';
import 'package:objd/core.dart';

/// The RandomScore Widget assigns a random value to a score using the UUID of an areaeffectcloud.
class RandomScore extends Widget {
  String targetFilePath;
  String targetFileName;

  Entity entity;
  String objective;
  int to;
  int from;
  int _diff;
  /// The RandomScore Widget assigns a random value to a score using the UUID of an areaeffectcloud.
  RandomScore(this.entity,
      {this.from = 0,
      @required this.to,
      this.objective = "objd_random",
      this.targetFilePath = "objd",
      this.targetFileName}) {
    _diff = to - from + 1;
  }

  Score get score => Score(entity, objective);

  @override
  Widget generate(Context context) {
    return For.of([
      Score(Entity.PlayerName("#max"), objective).set(_diff),
      Group(
          path: targetFilePath,
          filename: targetFileName ?? "random",
          generateIDs: targetFileName == null,
          children: [
            Comment("Random UUID Generator from ${context.file}"),
            AreaEffectCloud(Location.here(), tags: ["objd_random"]),
            Score(entity, objective).setToResult(Command(
                "data get entity @e[tag=objd_random,sort=nearest,limit=1] UUIDMost 0.0000000001")),
            Score(entity, objective)
                .modulo(Score(Entity.PlayerName("#max"), objective))
          ]),
      from > 0 ? score.add(from) : null
      // File.execute(
      //     path: targetFilePath.isNotEmpty
      //         ? targetFilePath + "/" + targetFileName
      //         : targetFileName,
      //     child: For.of([
      //       Comment("Random UUID Generator from ${context.file}"),
      //       AreaEffectCloud(Location.here(), tags: ["objd_random"]),
      //       Score(entity, objective).setToResult(Command("data get entity @e[tag=objd_random,sort=nearest,limit=1] UUIDMost 0.0000000001")),
      //       Score(entity, objective)
      //           .modulo(Score(Entity.PlayerName("#max"), objective))
      //     ]))
    ]);
  }
}
