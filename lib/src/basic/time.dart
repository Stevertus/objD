const int _TICKSINDAY = 24000;
const int _TICKSINSECOND = 20;

class Time {
  final int ticks;
  double get days => ticks / _TICKSINDAY;
  double get seconds => ticks / _TICKSINSECOND;
  final bool isInfinite;

  const Time(this.ticks) : isInfinite = false;

  const Time.infinite()
      : isInfinite = true,
        ticks = -1;

  const Time.seconds(int seconds)
      : ticks = seconds * _TICKSINSECOND,
        isInfinite = false;
  const Time.days(int days)
      : ticks = days * _TICKSINDAY,
        isInfinite = false;

  factory Time.duration({
    int ticks = 0,
    num? days,
    num? seconds,
    num? minutes,
  }) =>
      Time(ticks +
          ((days ?? 0) * _TICKSINDAY +
                  (seconds ?? 0 + (minutes ?? 0) * 60) * _TICKSINSECOND)
              .toInt());

  @override
  String toString() {
    if (ticks % (_TICKSINDAY / 2) == 0) {
      return '${ticks / _TICKSINDAY}d'.replaceFirst('.0d', 'd');
    }
    if (ticks % (_TICKSINSECOND / 4) == 0) {
      return '${ticks / _TICKSINSECOND}s'.replaceFirst('.0s', 's');
    }
    return ticks.toString();
  }

  int compareTo(Time other) {
    return ticks.compareTo(other.ticks);
  }

  /// Adds this Duration and [other] and
  /// returns the sum as a new Duration object.
  Time operator +(Time other) {
    return Time(ticks + other.ticks);
  }

  /// Subtracts [other] from this Duration and
  /// returns the difference as a new Duration object.
  Time operator -(Time other) {
    return Time(ticks - other.ticks);
  }

  /// Multiplies this Time by the given [factor] and returns the result
  /// as a new Time object.
  ///
  /// Note that when [factor] is a double, and the duration is greater than
  /// 53 bits, precision is lost because of double-precision arithmetic.
  Time operator *(num factor) {
    return Time((ticks * factor).round());
  }

  /// Divides this Time by the given [quotient] and returns the truncated
  /// result as a new Duration object.
  ///
  /// Throws an [UnsupportedError] if [quotient] is `0`.
  Time operator ~/(int quotient) {
    // By doing the check here instead of relying on "~/" below we get the
    // exception even with dart2js.
    if (quotient == 0) throw UnsupportedError("Dividing by 0");
    return Time(ticks ~/ quotient);
  }

  /// Whether this [Time] is shorter than [other].
  bool operator <(Time other) => ticks < other.ticks;

  /// Whether this [Time] is longer than [other].
  bool operator >(Time other) => ticks > other.ticks;

  /// Whether this [Time] is shorter than or equal to [other].
  bool operator <=(Time other) => ticks <= other.ticks;

  /// Whether this [Time] is longer than or equal to [other].
  bool operator >=(Time other) => ticks >= other.ticks;
}

extension NumTimeExtensions on num {
  Time get ticks => Time(round());
  Time get seconds => Time.duration(seconds: this);
  Time get minutes => Time.duration(minutes: this);
  Time get days => Time.duration(days: this);
}
