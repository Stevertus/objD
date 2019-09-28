import 'package:meta/meta.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/basic/score.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';
import 'package:gson/gson.dart';

class Data extends RestActionAble {
  dynamic target;
  String _type;
  String _typeValue;
  String _subcommand;
  String get subcommand => _subcommand;
  String path = "";
  num scale;
  String datatype;
  Score score;
  DataModify modify;

  Map<String,dynamic> nbt;
  String strNbt;

   String get type => _type;
   String get typeValue => _typeValue;
  /// The Data Widgets allows you to edit nbt data of Entities or Blocks.
/// ```dart
/// Data(
/// 	Entity.Selected(),
/// 	nbt: {
/// 		"Invisible":1,
/// 		"NoGravity":1
/// 	}
/// )
/// ⇒ data merge entity @s {"Invisible":1,"NoGravity":1}
/// ```
  Data(this.target,{this.nbt = const {}, String type = "merge"}){
    handleTarget(target);
    _subcommand = type;
  }
  Data.merge(this.target,{this.nbt = const {},this.strNbt}){
    handleTarget(target);
    _subcommand = "merge";
  }
  Data.get(this.target,{@required this.path, this.scale = 1}){
    handleTarget(target);
    _subcommand = "get";
  }
  Data.remove(this.target,{@required this.path}){
    handleTarget(target);
    _subcommand = "remove";
  }
/// You can also convert a score directly to a nbt field with Data.fromScore:
/// 
/// |Data.fromScore| |
/// |--|--|
/// |dynamic|The target Entity OR Location which you want to modify|
/// |path|the nbt path you want to copy to|
/// |score|The source Score|
/// |scale|optional int (default = 1)|
/// |datatype| a Java datatype for the score(default = byte) |

  Data.fromScore(this.target,{@required this.path, @required this.score, this.scale = 1, this.datatype = "byte"}){
    handleTarget(target);
    _subcommand = "score";
  }
  /// The modify operation is also available, yet a bit more complex.
  /// 
  /// So this is split up into a seperate class: DataModify
/// ```dart
/// Data.modify(
/// 	Entity.Selected(),
/// 	path: "my_Custom_Path",
/// 	modify: DataModify.set(
/// 		"hey" // or {"nbt":"here"} or 56
/// 	),
/// )
/// ⇒ data modify @s my_Custom_Path set value "hey"
/// ```
  Data.modify(this.target,{@required this.path,@required this.modify}){
    handleTarget(target);
    _subcommand = "modify";
  }
  /// A handy shortcut to copy data quickly is the Data.copy constructor, which just copies a property from one path to another.
  Data.copy(this.target,{@required this.path, @required dynamic from, @required String fromPath}){
    handleTarget(target);
     _subcommand = "modify";
    this.modify = DataModify.set(
      from,
      fromPath: fromPath
    );
  }
  handleTarget(dynamic target){
    _typeValue = target.toString();
    if(target is DataStorage){
      _type = "storage";
    } else if(target is Entity){
      _type = "entity";
    } else if(target is Location){
      _type = "block";
    } else {throw("Please insert either an entity or location into data");}
  }

  String getTarget(){
    return _type + ' ' + _typeValue;
  }

  @override
  Widget generate(Context context){
    switch (_subcommand) {
      case "merge": return Command('data merge ' + getTarget() + ' ' + _getNbt());
      case "get": return Command('data get ' + getTarget() + ' ' + path + ' ' + (scale < 0.000001 ? scale.toStringAsFixed(10): scale.toString()));
      case "remove": return Command('data remove ' + getTarget() + ' ' + path);
      case "modify": return Command('data modify ' + getTarget() + ' ${path} ${modify}');
      case "score": return Command('execute store result ' + getTarget() + ' ${path} ${datatype} ${scale} run scoreboard players get ${score.entity.toString()} ${score.score}');
    }
    throw("Invalid subcommand!");
  }

  String _getNbt(){
    if(strNbt != null && strNbt.isNotEmpty) return strNbt;
    return gson.encode(nbt);
  }
}
/// There are five sub operations again: set, merge, prepend, append and insert.
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
    if(value is Map) return this.value = gson.encode(value);
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

class DataStorage {
  final String name;

  const DataStorage(this.name);

  @override
  String toString() {
    return name;
  }
}
