import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';
import 'package:objd/core.dart';
import 'package:objd/wrappers/data.dart';

//// The Storage Widget gives you easy tools to store and receive nbt data globally.
class Storage extends Widget {
  _StorageType _type;
  final String name;
  final bool autoNamespace;
  Map<String, dynamic> nbt;
  String key;
  DataModify _modify;
  Data data;
  Score score;
  double scale;
  String datatype;

  /// The Storage Widget gives you easy tools to store and receive nbt data globally.
  /// A Store takes in a name, by default it already uses the current pack namespace.

  /// **Example:**
  /// ```dart
  /// var storage = Storage('mystorage',autoNamespace:true)
  /// ```
  Storage(
    this.name, {
    this.autoNamespace = true,
  });

  /// Here you can set one key to a specific value.
  Storage.set(
    this.name, {
    this.autoNamespace = true,
    @required this.key,
    @required dynamic value,
  })  : nbt = {key: value},
        _type = _StorageType.merge;

  /// But of course you can also insert a Map with multiple keys and values.
  Storage.merge(
    this.name, {
    this.autoNamespace = true,
    @required this.nbt,
  })  : assert(nbt != null),
        _type = _StorageType.merge;

  /// To get a value back, use Storage.get.
  Storage.get(
    this.name, {
    this.autoNamespace = true,
    this.scale = 1,
    @required this.key,
  })  : assert(key != null),
        _type = _StorageType.get;

  /// Removes certain Nbt Data.
  Storage.remove(
    this.name, {
    this.autoNamespace = true,
    @required this.key,
  })  : assert(key != null),
        _type = _StorageType.remove;

  /// Modifies Nbt Data(look at [Data Widget](/basics#data)).
  Storage.modify(
    this.name, {
    @required String toPath,
    this.autoNamespace = true,
    @required DataModify modify,
  })  : assert(modify != null),
        assert(toPath != null),
        _modify = modify,
        key = toPath,
        _type = _StorageType.modify;

  /// Copies Nbt Data from a **Data.get** Widget.
  Storage.copyData(
    this.name, {
    this.autoNamespace = true,
    @required this.key,
    @required this.data,
  })  : assert(data != null),
        assert(key != null),
        assert(data.subcommand == 'get',
            'You have to insert a Data.get into copyData!'),
        _type = _StorageType.data;

  /// Similar to copyData is copyScore which copies the value of a score into a nbt path.
  Storage.copyScore(
    this.name, {
    this.autoNamespace = true,
    this.scale = 1,
    this.datatype = 'byte',
    @required this.key,
    @required this.score,
  })  : assert(score != null),
        assert(key != null),
        _type = _StorageType.score;

  /// Here you can set one key to a specific value.
  Storage set(
    String key,
    dynamic value,
  ) =>
      Storage.set(name, autoNamespace: autoNamespace, key: key, value: value);

  /// Of course you can also insert a Map with multiple keys and values.
  Storage merge(
    Map<String, dynamic> nbt,
  ) =>
      Storage.merge(name, autoNamespace: autoNamespace, nbt: nbt);

  ///To get a value back, use Storage.get.
  Storage get(
    String key,
  ) =>
      Storage.get(name, autoNamespace: autoNamespace, key: key);

  ///Removes certain Nbt Data.
  Storage remove(
    String key,
  ) =>
      Storage.remove(name, autoNamespace: autoNamespace, key: key);

  ///Modifies Nbt Data(look at [Data Widget](/basics#data)).
  Storage modify(
    DataModify modify,
  ) =>
      Storage.modify(name, autoNamespace: autoNamespace, modify: modify);

  ///Copies Nbt Data from a **Data.get** Widget.
  Storage copyData(
    String key, {
    Data data,
  }) =>
      Storage.copyData(name,
          autoNamespace: autoNamespace, key: key, data: data);

  ///Similar to copyData is copyScore which copies the value of a score into a nbt path.
  Storage copyScore(
    String key, {
    double scale = 1,
    String datatype = 'byte',
    Score score,
  }) =>
      Storage.copyScore(name,
          autoNamespace: autoNamespace,
          key: key,
          datatype: datatype,
          score: score);

  Data toData([DataStorage target]) {
    target ??= DataStorage(name);

    if (_type == _StorageType.merge) return Data.merge(target, nbt: nbt);
    if (_type == _StorageType.get) {
      return Data.get(target, path: key, scale: scale);
    }
    if (_type == _StorageType.remove) return Data.remove(target, path: key);
    if (_type == _StorageType.modify) {
      return Data.modify(
        target,
        path: key,
        modify: _modify,
      );
    }
    if (_type == _StorageType.data) {
      return Data.modify(
        target,
        path: key,
        modify: DataModify.set(data.target, fromPath: data.path),
      );
    }
    if (_type == _StorageType.score) {
      return Data.fromScore(
        target,
        path: key,
        score: score,
        scale: 1,
        datatype: datatype,
      );
    }
    return null;
  }

  @override
  Widget generate(Context context) {
    var target = DataStorage(autoNamespace != null && autoNamespace
        ? context.packId + ':$name'
        : name);

    var data = toData(target);

    if (data != null) {
      return data;
    } else {
      return Comment.Null();
    }
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
