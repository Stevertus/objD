import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';
import 'package:objd/core.dart';
import 'package:objd/wrappers/data.dart';

class Storage extends Widget {
  final _StorageType _type;
  final String name;
  final bool autoNamespace;
  Map<String, dynamic> nbt;
  String key;
  DataModify modify;
  Data data;
  Score score;
  double scale;
  String datatype;

  Storage.set(
    this.name, {
    this.autoNamespace = true,
    @required this.key,
    @required dynamic value,
  }) : nbt = {key: value}, _type = _StorageType.merge;
  Storage.merge(
    this.name, {
    this.autoNamespace = true,
    @required this.nbt,
  }) : assert(nbt != null), _type = _StorageType.merge;

  Storage.get(
    this.name, {
    this.autoNamespace = true,
    @required this.key,
  }) : assert(key != null), _type = _StorageType.get;

  Storage.remove(
    this.name, {
    this.autoNamespace = true,
    @required this.key,
  }) : assert(key != null), _type = _StorageType.remove;

  Storage.modify(
    this.name, {
    this.autoNamespace = true,
    @required this.modify,
  }) : assert(modify != null), _type = _StorageType.modify;

  Storage.copyData(
    this.name, {
    this.autoNamespace = true,
    @required this.key,
    @required this.data,
  }) : assert(data != null), assert(key != null), assert(data.subcommand == "get","You have to insert a Data.get into copyData!"), _type = _StorageType.data;
  
  Storage.copyScore(
    this.name, {
    this.autoNamespace = true,
    this.scale = 1,
    this.datatype,
    @required this.key,
    @required this.score,
  }) : assert(score != null), assert(key != null), _type = _StorageType.score;

  @override
  generate(Context context) {

    var target = DataStorage(
      autoNamespace != null && autoNamespace ? context.packId + ':$name' : name
    );

    if(_type == _StorageType.merge) return Data.merge(target,nbt: nbt);
    if(_type == _StorageType.get) return Data.get(target,path:key);
    if(_type == _StorageType.remove) return Data.remove(target,path:key);
    if(_type == _StorageType.modify) return Data.modify(target,path:key,modify: modify);
    if(_type == _StorageType.data) return Data.modify(target,path:key,modify: DataModify.set(data.target,fromPath: data.path));
    if(_type == _StorageType.score) return Data.fromScore(target,path:key,score:score,scale:1,datatype: datatype);
  }
}

enum _StorageType {
  merge,
  get,
  remove,
  modify,
  data,
   score,
}