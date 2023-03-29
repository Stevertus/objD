

const _TICKSINDAY = 24000;
const _TICKSINSECOND = 20;

class Duration {
  final int ticks;
  double get days => ticks / _TICKSINDAY;
  double get seconds => ticks / _TICKSINSECOND;

  Duration(int ticks, {double? days, double? seconds}): this.ticks = ticks + ((days ?? 0) + (seconds ?? 0)).toInt();

@override
  String toString() {
    if(ticks % _TICKSINDAY == 0) return '${ticks / _TICKSINDAY}d' ;
    if(ticks % _TICKSINSECOND == 0) return '${ticks / _TICKSINSECOND}d';
    return ticks.toString() ;
  }
}