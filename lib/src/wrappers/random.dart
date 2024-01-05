import 'package:objd/core.dart';

class Random extends RestActionAble {
  final Range range;
  final bool roll;
  final String? sequence;

  Random(this.range, {this.roll = false, this.sequence});

  static reset(
    String sequence, {
    int? seed,
    bool? includeWorldSeed,
    bool? includeSequenceId,
  }) =>
      _RandomReset(
        sequence,
        seed: seed,
        includeWorldSeed: includeWorldSeed,
        includeSequenceId: includeSequenceId,
      );

  @override
  CommandBuilder generate(Context context) {
    return CommandBuilder('random')
        .when(roll, then: 'roll', otherwise: 'value')
        .string(range.toString())
        .when(sequence != null, then: sequence);
  }
}

class _RandomReset extends RestActionAble {
  final String sequence;
  final int? seed;
  final bool? includeWorldSeed;
  final bool? includeSequenceId;

  _RandomReset(
    this.sequence, {
    this.seed,
    this.includeWorldSeed,
    this.includeSequenceId,
  });

  @override
  Widget generate(Context context) {
    assert(
      context.version >= 20.2,
      "Random reset requires at least version 20.2",
    );

    if (includeWorldSeed != null) {
      assert(seed != null, "seed must be set to use includeWorldSeed");
    }
    if (includeSequenceId != null) {
      assert(includeWorldSeed != null,
          "includeWorldSeed must be set to use includeSequenceId");
    }

    return CommandBuilder('random reset')
        .string(sequence)
        .when(seed != null, then: seed.toString())
        .when(includeWorldSeed != null, then: includeWorldSeed.toString())
        .when(includeSequenceId != null, then: includeSequenceId.toString());
  }
}
