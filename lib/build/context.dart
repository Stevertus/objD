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
  ///       + context.packId + ":" 
  ///       + context.loadFile
  ///     )
  /// 	}
  /// }
  /// ```
class Context {
  List<String> prefixes;
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
  /// 		return Command('function ' + context.packId + ":" + context.loadFile)
  /// 	}
  /// }
  /// ```
  Context(
      {this.prefixes,
      this.packId = "",
      this.file = "",
      this.loadFile = "load",
      this.mainFile = "main"}) {
    if (prefixes == null) prefixes = [];
  }

  Context.clone(Context context)
      : this(
            prefixes: new List<String>.from(context.prefixes),
            packId: context.packId,
            file: context.file,
            loadFile: context.loadFile,
            mainFile: context.mainFile);

  Context addPrefix(String prev) {
    prefixes.insert(0, prev);
    return this;
  }
}
