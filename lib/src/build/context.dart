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
  int version;
  final Map<Type, dynamic> _heredityTraits;

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
    this.version = 17,
    Map<Type, dynamic>? traits,
  }) : _heredityTraits = traits ?? {} {
    // prefixes ??= [];
    // suffixes ??= [];
  }

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
          version: context.version,
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

  void passTrait<T>(T t) {
    _heredityTraits[T] = t;
  }

  T traitOf<T>() {
    return (_heredityTraits[T] as T);
  }
}
