class Range<T> {
  final T min, max;

  Range(this.min, this.max);

  Range.max(this.max) : min = null;

  Range.min(this.min) : max = null;

  Map<String, T> getJson() {
    var ret = <String, T>{};
    if (max != null) ret['max'] = max;
    if (min != null) ret['min'] = min;
    return ret;
  }
}
