import 'package:objd/core.dart';

/// The RandomScore Widget assigns a random value to a score using the UUID of an AreaEffectCloud.
class RandomScore extends RestActionAble {
  String targetFilePath;
  String? targetFileName;

  Entity entity;
  String objective;
  int to;
  int from;
  final int _diff;

  /// The RandomScore Widget assigns a random value to a score using the UUID of an AreaEffectCloud.
  RandomScore(
    this.entity, {
    this.from = 0,
    required this.to,
    this.objective = 'objd_random',
    this.targetFilePath = 'objd',
    this.targetFileName,
  }) : _diff = to - from + 1;

  Score get score => Score(entity, objective);

  @override
  Widget generate(Context context) {
    final s = Scoreboard(objective);

    return For.of([
      Score(Entity.PlayerName('#max'), objective).set(_diff),
      Group(
        path: targetFilePath,
        filename: targetFileName ?? 'random',
        generateIDs: targetFileName == null,
        children: [
          Comment('Random UUID Generator from ${context.file}'),
          AreaEffectCloud(Location.here(), tags: ['objd_random']),
          // TODO: Add back in
          // s[entity].setToWidget(
          //   Data.get(
          //     Entity(tags: ['objd_random'], limit: 1).sort(Sort.nearest),
          //     path: context.version > 15 ? 'UUID[0]' : 'UUIDMost',
          //     scale: (context.version > 15 ? 1000 : 1) * 0.0000000001,
          //   ),
          // ),
          s[entity].modulo(
            s['#max'],
          ),
        ],
      ),
      if (from > 0) score.add(from),
      if (from < 0) score.subtract(-from),
    ]);
  }
}
