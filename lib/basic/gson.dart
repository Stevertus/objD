import 'dart:convert';

String gsonEncode(dynamic obj) {
  if(obj is bool) return obj ? "1b" : "0b";
  if(obj is double) return obj.toString()+"d";
  if(obj is CustomValue) return obj.toString();
  if(obj is List) {
    List<String> cont = [];
    obj.forEach((e)=>cont.add(gsonEncode(e)));
    return "["+cont.join(",")+"]";
  }
  if(obj is Map) {
    //Map<String,String> cont = {};
    String cont = "";
    obj.forEach((k,v)=>cont += ",${k}:${gsonEncode(v)}");
    return "{" + cont.substring(1) + "}";
  }
  return jsonEncode(obj);
}

class CustomValue {
  dynamic design;
  StrDesign(dynamic design) {
    this.design = design;
  }

  @override
  String toString() {
    return design.toString();
  }
}