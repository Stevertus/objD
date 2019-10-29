
class Range<T> {

  final T min,max;

  Range(this.min,this.max);

  Range.max(this.max): min = null;

  Range.min(this.min): max = null;

  Map<String, T> getJson() {
    Map<String, T> ret = {};
    if(max != null) ret['max'] = max;
    if(min != null) ret['min'] = min;
    return ret;
  }

}