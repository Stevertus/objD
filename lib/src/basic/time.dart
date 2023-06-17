const int _TICKSINDAY = 24000;
const int _TICKSINSECOND = 20;

/// Object that represents time in minecraft. Usually translated into ticks (20ticks = 1 second).
/// A **more intuitive** way is to use built in getters on the `num` type and operators.
///
/// On any number(`int, double, ...`) you can call `.ticks, .seconds, .minutes` and `.days`
/// ```dart
/// t = 2400.ticks,
/// t = 90.seconds,
/// t = 1.5.minutes,
/// ```
class Time {
  final int ticks;
  double get days => ticks / _TICKSINDAY;
  double get seconds => ticks / _TICKSINSECOND;
  final bool isInfinite;

  /// Object that represents time in minecraft. Usually translated into ticks (20ticks = 1 second).
  ///
  /// You can directly construct the time from the integer number of ticks:
  /// ```dart
  /// var t = Time(2400);
  /// ```
  /// A **more intuitive** way is to use built in getters on the `num` type and operators.
  ///
  /// On any number(`int, double, ...`) you can call `.ticks, .seconds, .minutes` and `.days`:
  ///
  /// ```dart
  /// t = 2400.ticks,
  /// t = 90.seconds,
  /// t = 1.5.minutes,
  /// ```
  ///
  /// Also all common math and comparison operators are available:
  ///
  /// ```dart
  /// t = 1.minutes + 30.seconds
  /// t += 20.seconds
  /// if(t > 10.seconds) {
  /// 	// do something conditional
  /// }
  /// ```

// Using this style is highly recommended, as it leads to readable and understandable code.
  ///
  const Time(this.ticks) : isInfinite = false;

  /// In case of the [Effect](/wrappers/#effect) widget, it might be useful to pass infinite time.
  /// This can be done with `Time.infinite()`. \
  /// Otherwise when a finite time is expected, an error is thrown.
  const Time.infinite()
      : isInfinite = true,
        ticks = -1;

  const Time.seconds(int seconds)
      : ticks = seconds * _TICKSINSECOND,
        isInfinite = false;
  const Time.minutes(int minutes)
      : ticks = minutes * 60 * _TICKSINSECOND,
        isInfinite = false;
  const Time.days(int days)
      : ticks = days * _TICKSINDAY,
        isInfinite = false;

  /// For a handy interface which does the conversions automatically, use `Time.duration`:
  /// | Time.duration |                                   |
  /// | ------------- | --------------------------------- |
  /// | ticks         | integer number of ticks(optional) |
  /// | days          | number of ingame days(optional)   |
  /// | minutes       | number of minutes(optional)       |
  /// | seconds       | number of seconds(optional)       |
  ///
  /// So we can write 1min 30s the following ways(also using fractional timesteps):
  ///
  /// ```dart
  /// t = Time.seconds(90),
  /// t = Time.duration(minutes: 1.5),
  /// t = Time.duration(minutes: 1, seconds: 30),
  /// ```

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

  /// In commands when Time is used, string are generated dynamically.
  /// When days can be expressed in `0.5` steps, the suffix `d` is generated.
  /// When seconds can be expressed in `0.25` steps, the suffix `s` is generated.
  ///
  /// So **a word of warning**, even when providing integer ticks, objD can decide to simplify the commands.
  /// For example `Time(10)` becomes `0.5s`. This behaviour might change in the future, if there are serious concerns.
  ///
  /// In case you want to have just the ticks, either use `.ticks` on a Time object or call `toString` with `reduce` set to false: `Time(10).toString(reduce=false) => 10`.
  @override
  String toString({bool reduce = true}) {
    if (isInfinite) throw "Called .toString on an infinite time";

    if (reduce && ticks % (_TICKSINDAY / 2) == 0) {
      return '${ticks / _TICKSINDAY}d'.replaceFirst('.0d', 'd');
    }
    if (reduce && ticks % (_TICKSINSECOND / 4) == 0) {
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
  /// result as a new Time object.
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
