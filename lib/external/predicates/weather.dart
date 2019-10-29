import 'package:objd/external/predicates/tag.dart';

class Weather extends Tag {
  final bool raining;
  final bool thundering;

  Weather({this.raining, this.thundering});

  @override
  Map<String, dynamic> getJson() {
    Map<String, dynamic> ret = {
      "condition": "minecraft:weather_check",
    };
    if (raining != null) ret['raining'] = raining;
    if (thundering != null) ret['thundering'] = thundering;
    return ret;
  }
}
