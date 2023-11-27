import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';
import 'package:gson/gson.dart';

class Data extends RestActionAble {
  dynamic target;
  late String _type;
  late String _typeValue;
  final String _subcommand;
  String get subcommand => _subcommand;
  String path = '';
  num? scale;
  String? datatype;
  Score? score;
  DataModify? modify;

  Map<String, dynamic>? nbt;
  String? strNbt;

  String get type => _type;
  String get typeValue => _typeValue;

  /// The Data Widgets allows you to edit nbt data of Entities or Blocks.
  /// ```dart
  /// Data(
  /// 	Entity.Selected(),
  /// 	nbt: {
  /// 		'Invisible':1,
  /// 		'NoGravity':1
  /// 	}
  /// )
  /// ⇒ data merge entity @s {'Invisible':1,'NoGravity':1}
  /// ```
  Data(this.target,
      {this.nbt = const {}, String type = 'merge', this.path = '', this.scale})
      : _subcommand = type {
    handleTarget(target);
  }
  Data.merge(this.target, {this.nbt = const {}, this.strNbt})
      : _subcommand = 'merge' {
    handleTarget(target);
  }
  Data._(this.target, {required this.path, this.scale}) : _subcommand = 'get' {
    handleTarget(target);
  }
  Data.remove(this.target, {required this.path}) : _subcommand = 'remove' {
    handleTarget(target);
  }

  static DataGet get(dynamic target, {required String path, num? scale}) =>
      DataGet(
        target,
        path: path,
        scale: scale,
      );

  /// You can also convert a score directly to a nbt field with Data.fromScore:
  ///
  /// |Data.fromScore| |
  /// |--|--|
  /// |dynamic|The target Entity OR Location which you want to modify|
  /// |path|the nbt path you want to copy to|
  /// |score|The source Score|
  /// |scale|optional int (default = 1)|
  /// |datatype| a Java datatype for the score(default = byte) |

  Data.fromScore(
    this.target, {
    required this.path,
    required this.score,
    this.scale = 1,
    this.datatype = 'byte',
  }) : _subcommand = 'score' {
    handleTarget(target);
  }

  /// The modify operation is also available, yet a bit more complex.
  ///
  /// So this is split up into a seperate class: DataModify
  /// ```dart
  /// Data.modify(
  /// 	Entity.Selected(),
  /// 	path: 'my_Custom_Path',
  /// 	modify: DataModify.set(
  /// 		'hey' // or {'nbt':'here'} or 56
  /// 	),
  /// )
  /// ⇒ data modify @s my_Custom_Path set value 'hey'
  /// ```
  Data.modify(this.target, {required this.path, required this.modify})
      : _subcommand = 'modify' {
    handleTarget(target);
  }

  /// A handy shortcut to copy data quickly is the Data.copy constructor, which just copies a property from one path to another.
  Data.copy(
    this.target, {
    required this.path,
    required dynamic from,
    required String fromPath,
  }) : _subcommand = 'modify' {
    handleTarget(target);
    modify = DataModify.set(from, fromPath: fromPath);
  }
  void handleTarget(dynamic target) {
    _typeValue = target.toString();
    if (target is DataStorage) {
      _type = 'storage';
    } else if (target is Entity) {
      _type = 'entity';
    } else if (target is Location) {
      _type = 'block';
    } else {
      throw ('Please insert either an entity or location into data');
    }
  }

  String getTarget([Context? c]) {
    if (target is DataStorage) {
      return 'storage ${(target as DataStorage).toString(c)}';
    }
    return '$_type $_typeValue';
  }

  @override
  Widget generate(Context context) {
    switch (_subcommand) {
      case 'merge':
        return Command('data merge ${getTarget(context)} ${_getNbt()}');
      case 'get':
        throw Deprecated("Moved to DataGet");
      case 'remove':
        return Command('data remove ${getTarget(context)} $path');
      case 'modify':
        return Command('data modify ${getTarget(context)} $path $modify');
      case 'score':
        return Command(
          'execute store result ${getTarget(context)} $path $datatype $scale run scoreboard players get ${score?.entity.toString()} ${score?.score}',
        );
    }
    throw ('Invalid subcommand!');
  }

  String _getNbt() {
    if (strNbt != null && strNbt!.isNotEmpty) return strNbt!;
    return gson.encode(nbt);
  }
}

class DataGet extends Data with ScoreStoreable {
  DataGet(super.target, {required super.path, super.scale});

  @override
  Command generate(Context context) {
    final cmd = ['data get', getTarget(context), path];

    if (scale != null) {
      cmd.add(
        scale! < 0.000001 ? scale!.toStringAsFixed(10) : scale.toString(),
      );
    }

    return Command(cmd.join(' '));
  }
}

/// There are five sub operations again: set, merge, prepend, append and insert.
class DataModify {
  String type;
  late String value;
  late String fromSource;
  String? fromType;
  String fromPath;
  int? start;
  int? end;
  int? index;
  DataModify.set(dynamic value, {this.fromPath = ''}) : type = 'set' {
    _checkValue(value);
  }
  DataModify.merge(dynamic value, {this.fromPath = ''}) : type = 'merge' {
    _checkValue(value);
  }
  DataModify.prepend(dynamic value, {this.fromPath = ''}) : type = 'prepend' {
    _checkValue(value);
  }
  DataModify.append(dynamic value, {this.fromPath = ''}) : type = 'append' {
    _checkValue(value);
  }
  DataModify.insert(dynamic value, {this.fromPath = '', this.index = 0})
      : type = 'insert' {
    _checkValue(value);
  }
  DataModify.setString(
    dynamic value, {
    this.fromPath = '',
    this.start,
    this.end,
  }) : type = 'set string' {
    _checkValue(value);
    assert(fromType != null, 'string cannot get a value');
  }
  DataModify.mergeString(
    dynamic value, {
    this.fromPath = '',
    this.start,
    this.end,
  }) : type = 'merge string' {
    _checkValue(value);
    assert(fromType != null, 'string cannot get a value');
  }
  DataModify.prependString(
    dynamic value, {
    this.fromPath = '',
    this.start,
    this.end,
  }) : type = 'prepend string' {
    _checkValue(value);
    assert(fromType != null, 'string cannot get a value');
  }
  DataModify.appendString(
    dynamic value, {
    this.fromPath = '',
    this.start,
    this.end,
  }) : type = 'append string' {
    _checkValue(value);
    assert(fromType != null, 'string cannot get a value');
  }
  DataModify.insertString(
    dynamic value, {
    this.fromPath = '',
    this.start,
    this.end,
    this.index = 0,
  }) : type = 'insert string' {
    _checkValue(value);
    assert(fromType != null, 'string cannot get a value');
  }
  String _checkValue(dynamic value) {
    fromSource = '';
    if (value is Map || value is List) return this.value = gson.encode(value);
    if (value is num || value is String) return this.value = value.toString();
    this.value = '';
    if (value is DataStorage) {
      fromType = 'storage';
      return fromSource = value.name;
    }
    if (value is Entity) {
      fromType = 'entity';
      return fromSource = value.toString();
    }
    if (value is Location) {
      fromType = 'block';
      return fromSource = value.toString();
    }
    throw ('Please insert a Map, number, String, Entity, DataStorage or Location as value for Data Modify!');
  }

  @override
  String toString() {
    if (end != null) {
      assert(start != null && start! <= end!, 'start must be less than end!');
    }

    final b = CommandBuilder(type)
        .number(index)
        .when(
          fromType != null,
          then: '$fromType $fromSource $fromPath',
          prefix: type.contains('string') || fromType == null ? null : 'from ',
          otherwise: 'value $value',
        )
        .number(start)
        .number(end);

    return b.command;
  }
}

class DataStorage {
  final String name;
  final bool autoNamespace;

  const DataStorage(this.name, {this.autoNamespace = true});

  @override
  String toString([Context? context]) {
    return context != null && autoNamespace ? '${context.packId}:$name' : name;
  }
}
