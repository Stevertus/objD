import 'package:gson/values.dart';

/// An armorstand Pose describing rotations of all body parts
class Pose {
  final List<double> head;
  final List<double> body;
  final List<double> lleg;
  final List<double> rleg;
  final List<double> larm;
  final List<double> rarm;

  /// An armorstand Pose describing rotations of all body parts
  ///
  /// | Pose |                                        |
  /// | ---- | -------------------------------------- |
  /// | head | List of double values for the rotation |
  /// | body | same...                                |
  /// | lleg | same...                                |
  /// | rleg | same...                                |
  /// | larm | same...                                |
  /// | rarm | same...                                |
  Pose({
    this.head,
    this.body,
    this.lleg,
    this.rleg,
    this.larm,
    this.rarm,
  });

  Pose setHead(List<double> values) => copyWith(head: values);
  Pose setBody(List<double> values) => copyWith(body: values);
  Pose setLegs(List<double> l, [List<double> r]) => copyWith(
        lleg: l,
        rleg: r ?? l,
      );
  Pose setArms(List<double> l, [List<double> r]) => copyWith(
        larm: l,
        rarm: r ?? l,
      );

  Pose copyWith({
    List<double> head,
    List<double> body,
    List<double> lleg,
    List<double> rleg,
    List<double> larm,
    List<double> rarm,
  }) {
    return Pose(
      head: head ?? this.head,
      body: body ?? this.body,
      lleg: lleg ?? this.lleg,
      rleg: rleg ?? this.rleg,
      larm: larm ?? this.larm,
      rarm: rarm ?? this.rarm,
    );
  }

  List<Float> _getFloats(List<double> v) {
    if (v.length < 3) v.addAll([0, 0, 0]);
    final res = List<Float>(3);
    for (var i = 0; i < 3; i++) {
      res[i] = Float(v[i]);
    }
    return res;
  }

  Map<String, dynamic> getMap() {
    final ret = <String, dynamic>{};
    if (head != null && head.isNotEmpty) ret['Head'] = _getFloats(head);
    if (body != null && body.isNotEmpty) ret['Body'] = _getFloats(body);
    if (lleg != null && lleg.isNotEmpty) ret['LeftLeg'] = _getFloats(lleg);
    if (rleg != null && rleg.isNotEmpty) ret['RightLeg'] = _getFloats(rleg);
    if (larm != null && larm.isNotEmpty) ret['LeftArm'] = _getFloats(larm);
    if (rarm != null && rarm.isNotEmpty) ret['RightArm'] = _getFloats(rarm);
    return ret;
  }

  factory Pose.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    /// gets double values from Float list
    List<double> _fromFloats(v) =>
        (v as List<Float>).map((f) => f.value).toList();

    return Pose(
      head: map.containsKey('Head') ? _fromFloats(map['Head']) : [],
      body: map.containsKey('Body') ? _fromFloats(map['Body']) : [],
      lleg: map.containsKey('LeftLeg') ? _fromFloats(map['LeftLeg']) : [],
      rleg: map.containsKey('RightLeg') ? _fromFloats(map['RightLeg']) : [],
      larm: map.containsKey('LeftArm') ? _fromFloats(map['LeftArm']) : [],
      rarm: map.containsKey('RightArm') ? _fromFloats(map['RightArm']) : [],
    );
  }
}
