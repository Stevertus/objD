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
  String loadFile;
  String mainFile;

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
    this.prefixes,
    this.prod = false,
    this.suffixes,
    this.packId = '',
    this.file = '',
    this.loadFile = 'load',
    this.mainFile = 'main',
  }) {
    prefixes ??= [];
    suffixes ??= [];
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
        );

  Context addPrefix(String prev) {
    if (prev == null) return this;
    prefixes.add(prev);
    return this;
  }

  Context addSuffix(String suf) {
    if (suf == null) return this;
    suffixes.add(suf);
    return this;
  }
}
