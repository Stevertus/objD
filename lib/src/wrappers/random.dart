import 'package:objd/core.dart';

class Random extends RestActionAble {
  final Range range;
  final bool roll;
  final String? sequence;

  /// generate a random value from a given Range.
  ///
  /// | constructor |                                                      |
  /// | ----------- | ---------------------------------------------------- |
  /// | Range       | the range to take values from                        |
  /// | roll        | if true announces the value in the chat(random roll) |
  /// | sequence    | sequence to pull deterministic values from(optional) |
  ///
  /// ```dart
  /// Random(Range(from: 1, to: 5), roll: false, sequence: 'my_sequence')
  /// ⇒ random value 1..5 my_sequence
  /// ```
  Random(this.range, {this.roll = false, this.sequence});

  /// Using Random.reset, you can reset a particular sequence. You can specify a seed value and whether to include the sequence name and world in the generation of numbers.
  /// | Random.reset      |                                                                                           |
  /// | ----------------- | ----------------------------------------------------------------------------------------- |
  /// | String            | sequence id                                                                               |
  /// | seed              | integer seed value(optional)                                                              |
  /// | includeWorldSeed  | set to false if sequence should be independent of your world (optional, seed is required) |
  /// | includeSequenceId | set to false to make sequence independent of the id (optional, seed is required)          |
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
