import 'dart:math';

import 'package:gson/values.dart';
import 'package:objd/src/basic/score.dart';
import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/types/location.dart';

/// Maybe you already wondered what this context argument here is.
///
/// The Context is a way to get certain important information from the parents.
///
/// You can use this context to build more modular Widgets and don't need to hardcode certain files and the pack id:
///
/// ```dart
/// class LoadWidget extends Widget {
/// 	@override
/// 	Widget generate(Context context){
/// 		return Command(
///       'function '
///       + context.packId + ':'
///       + context.loadFile
///     )
/// 	}
/// }
/// ```
class Context {
  List<String> prefixes;
  List<String> suffixes;
  bool prod;
  String packId;
  String file;
  String? loadFile;
  String? mainFile;
  double version;
  Path path;
  final Map<Type, dynamic> _heredityTraits;
  final Map<String, String?> macros;

  /// Maybe you already wondered what this context argument here is
  /// The Context is a way to get certain important information from the parents.
  /// You can use this context to build more modular Widgets and don't need to hardcode certain files and the pack id:
  ///
  /// ```dart
  /// class LoadWidget extends Widget {
  /// 	@override
  /// 	Widget generate(Context context){
  /// 		return Command('function ' + context.packId + ':' + context.loadFile)
  /// 	}
  /// }
  /// ```
  Context({
    this.prefixes = const [],
    this.prod = false,
    this.suffixes = const [],
    this.packId = '',
    this.file = '',
    this.loadFile = 'load',
    this.mainFile = 'main',
    this.version = 20.4,
    this.path = const Path([]),
    Map<String, String?>? macros,
    Map<Type, dynamic>? traits,
  })  : _heredityTraits = traits ?? {},
        macros = macros ?? {};

  Context.clone(Context context)
      : this(
          prefixes: List<String>.from(context.prefixes),
          suffixes: List<String>.from(context.suffixes),
          prod: context.prod,
          packId: context.packId,
          file: context.file,
          loadFile: context.loadFile,
          mainFile: context.mainFile,
          traits: context._heredityTraits,
          macros: Map.of(context.macros),
          version: context.version,
          path: context.path.copyWith(),
        );

  Context addPrefix(String? prev) {
    if (prev == null) return this;
    prefixes.add(prev);
    return this;
  }

  Context addSuffix(String? suf) {
    if (suf == null) return this;
    suffixes.add(suf);
    return this;
  }

  Context addPath(Path p) {
    path = path.join(p);
    return this;
  }

  void passTrait<T>(T t) {
    _heredityTraits[T] = t;
  }

  T traitOf<T>() {
    return (_heredityTraits[T] as T);
  }

  String stringArgument(String name) {
    macros['\${$name}'] = name;
    return '\${$name}';
  }

  int intArgument(String name) {
    int i = 0;
    const limit = 0x3FFFFFFF;
    do {
      i = Random().nextInt(limit) + limit;
    } while (macros.containsKey(i.toString()));
    macros[i.toString()] = name;
    return i;
  }

  double doubleArgument(String name) {
    return buildArgument(
      name,
      (d) => (d, Double(d).toString()),
      replaceDouble: true,
    );
  }

  Entity entityArgument(String name) {
    return buildArgument(
      name,
      (d) => (Entity(level: Range.exact(d)), null),
    );
  }

  Score scoreArgument(String name) {
    return buildArgument(
      name,
      (d) {
        return (
          Score(Entity(level: Range.to(d)), d.toString(), addNew: false),
          null
        );
      },
    );
  }

  Location locationArgument(String name) {
    return buildArgument(
      name,
      (d) => (Location.local(x: d, y: d, z: d), null),
    );
  }

  T buildArgument<T>(
    String name,
    (T, String?) Function(double) builder, {
    bool replaceDouble = false,
  }) {
    double num = 0;
    late T t;
    String? str;
    do {
      num = (Random().nextDouble() * 2 - 1) * double.maxFinite / 2;
      (t, str) = builder(num);
    } while (macros.containsKey(str ?? t.toString()) ||
        macros.containsKey(num.toString()));

    macros[str ?? t.toString()] = name;
    macros[num.toString()] = replaceDouble ? name : null;
    return t;
  }

  T argument<T>(String name) => switch (T) {
        const (String) => stringArgument(name) as T,
        const (int) => intArgument(name) as T,
        const (double) => doubleArgument(name) as T,
        const (Score) => scoreArgument(name) as T,
        const (Entity) => entityArgument(name) as T,
        const (Location) => locationArgument(name) as T,
        _ => throw ArgumentError('Unsupported argument type $T'),
      };
}

// A simple utility to collect path segments and generate a String
class Path {
  final List<String> segments;
  final String? filename;
  final String? filetype;

  const Path(this.segments, {this.filename, this.filetype});

  Path join(Path p) => Path(
        segments + p.segments,
        filename: p.filename ?? filename,
        filetype: p.filetype ?? filetype,
      );
  Path append(String path, {String? type}) => join(Path.from(path, type: type));

  factory Path.from(String path, {String? type}) {
    final segs = path.split('/');
    segs.removeWhere((s) => s.isEmpty);

    String? name;
    if (segs.isNotEmpty) {
      final file = segs.last.split('.');
      if (file.length == 2 && file.last.isNotEmpty || type != null) {
        type ??= file.last;
        name = file.first;
        segs.removeLast();
      }
    }
    return Path(segs, filename: name, filetype: type);
  }

  bool get isEmpty => segments.isEmpty && filename == null;
  bool get isNotEmpty => !isEmpty;

  Path copyWith({
    List<String>? segments,
    String? filename,
    String? filetype,
  }) {
    return Path(
      segments ?? this.segments,
      filename: filename ?? this.filename,
      filetype: filetype ?? this.filetype,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Path && other.hashCode == hashCode;
  }

  @override
  int get hashCode {
    return segments.fold<int>(
          filename.hashCode,
          (acc, s) => acc ^ s.hashCode,
        ) ^
        filetype.hashCode;
  }

  @override
  String toString({bool withExtension = true}) => [
        ...segments,
        if (filename != null)
          filename! + (withExtension ? '.${filetype ?? 'json'}' : ''),
      ].join('/');
}
