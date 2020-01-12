import 'package:objd/external/predicates/range.dart';
import 'package:objd/external/predicates/tag.dart';

class Time extends Tag {
  final Range value;
  final int period;

  Time({this.value, this.period});

  @override
  Map<String, dynamic> getJson() {
    var ret = <String, dynamic>{
      'condition': 'minecraft:time_check',
    };
    if (value != null) ret['value'] = value.getJson();
    if (period != null) ret['period'] = period;
    return ret;
  }
}
