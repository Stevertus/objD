typedef Vec3 = (double, double, double);

class Transformation {
  /// Rotation after scaling
  final Vec3 right_rotation;

  /// Rotation before scaling
  final Vec3 left_rotation;

  /// scaling(1 being the default size)
  final Vec3 scale;

  /// translation, shifting the display
  final Vec3 translation;

  /// An object describing the scale, rotation and translation
  Transformation({
    this.right_rotation = (0, 0, 0),
    this.left_rotation = (0, 0, 0),
    this.scale = (1, 1, 1),
    this.translation = (0, 0, 0),
  });

  /// scales display entity
  factory Transformation.scale(double x, double y, double z) =>
      Transformation(scale: (x, y, z));

  /// shifts display entity
  factory Transformation.translate(double x, double y, double z) =>
      Transformation(translation: (x, y, z));

  /// rotates display entity
  factory Transformation.rotate(double x, double y, double z) =>
      Transformation(right_rotation: (x, y, z));

  /// scales all axies uniformly
  factory Transformation.scaleAll(double scale) =>
      Transformation(scale: (scale, scale, scale));

  factory Transformation.centered({
    Vec3 scale = (1, 1, 1),
    Vec3 right_rotation = (0, 0, 0),
    Vec3 left_rotation = (0, 0, 0),
  }) =>
      Transformation(
        scale: scale,
        right_rotation: right_rotation,
        left_rotation: left_rotation,
        translation: (-scale.$1 / 2, -scale.$2 / 2, -scale.$3 / 2),
      );

  List<double> _toList(Vec3 vec) {
    final (x, y, z) = vec;
    return [x, y, z];
  }

  Map<String, List<double>> toMap() => {
        'right_rotation': [..._toList(right_rotation), 1],
        'left_rotation': [..._toList(left_rotation), 1],
        'scale': _toList(scale),
        'translation': _toList(translation),
      };
}
