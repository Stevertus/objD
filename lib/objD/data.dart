import 'package:meta/meta.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/build/build.dart';
import 'dart:convert';

class Data extends Widget {
  String _type;
  String _typeValue;
  String _subcommand;
  get subcommand => _subcommand;
  String path = "";
  num scale;
  DataModify modify;

  Map<String,dynamic> nbt;

  Data(dynamic target,{this.nbt = const {}, String type = "merge"}){
    handleTarget(target);
    _subcommand = type;
  }
  Data.merge(dynamic target,{this.nbt = const {}}){
    handleTarget(target);
    _subcommand = "merge";
  }
  Data.get(dynamic target,{@required this.path, this.scale = 1}){
    handleTarget(target);
    _subcommand = "get";
  }
  Data.remove(dynamic target,{@required this.path}){
    handleTarget(target);
    _subcommand = "remove";
  }
  Data.modify(dynamic target,{@required this.path,@required this.modify}){
    handleTarget(target);
    _subcommand = "modify";
  }
  Data.copy(dynamic target,{@required this.path, @required dynamic from, @required String fromPath}){
    handleTarget(target);
     _subcommand = "modify";
    this.modify = new DataModify.set(
      from,
      fromPath: fromPath
    );
  }
  handleTarget(dynamic target){
    _typeValue = target.toString();
    if(target is Entity){
      _type = "entity";
    } else if(target is Location){
      _type = "block";
    } else throw("Please insert either an entity or location into data");
  }

  String getTarget(){
    return _type + ' ' + _typeValue;
  }

  @override
  Widget generate(Context context){
    switch (_subcommand) {
      case "merge": return new Command('data merge ' + getTarget() + ' ' + json.encode(nbt));
      case "get": return new Command('data get ' + getTarget() + ' ' + path + ' ' + scale.toString());
      case "remove": return new Command('data remove ' + getTarget() + ' ' + path);
      case "modify": return new Command('data modify ' + getTarget() + ' ' + modify.toString());
    }
    return new Command("");
  }
}
class DataModify {
  String type;
  String value;
  String fromSource;
  String fromType;
  String fromPath;
  int index;
  DataModify.set(dynamic value,{this.fromPath = ""}){
    type = "set";
    _checkValue(value);
  }
  DataModify.merge(dynamic value,{this.fromPath = ""}){
    type = "merge";
    _checkValue(value);
  }
  DataModify.prepend(dynamic value,{this.fromPath = ""}){
    type = "prepend";
    _checkValue(value);
  }
  DataModify.append(dynamic value,{this.fromPath = ""}){
    type = "append";
    _checkValue(value);
  }
  DataModify.insert(dynamic value,{this.fromPath = "",this.index = 0}){
    type = "insert";
    _checkValue(value);
  }
  _checkValue(dynamic value){
    if(value is Map) return this.value = json.encode(value);
    if(value is num || value is String) return this.value = value.toString();
    if(value is Entity){
      fromType = "entity";
      return fromSource = value.toString();
    }
    if(value is Location){
      fromType = "block";
      return fromSource = value.toString();
    }
    throw("Please insert a Map, number, String, Entity or Location as value for Data Modify!");
  }

  @override
  String toString() {
    String str = type;
    if(index != null) str += " " + index.toString();
    if(fromType != null){
      str += " from ";
      str += fromType + " " + fromSource + " " + fromPath;
    } 
    else {
      str += " value " + value;
    }
    return str;
  }
}