/// The `@Pck()` annotation works similar to @Func. You annotate a File List variable and it generates a Widget for this Pack.
class Pck {
  final String name;
  final String main;
  final String load;

  /// The `@Pck()` annotation works similar to @Func. You annotate a File List variable and it generates a Widget for this Pack.
  ///
  /// | @Pck |                           |
  /// | ---- | ------------------------- |
  /// | name | namespace of this pack    |
  /// | main | path of the main function |
  /// | load | path of the load function |
  ///
  /// ```dart
  /// @Pck(name: 'namespace', main: 'main', load: 'load')
  /// final List<File> myPack = [
  ///   LoadFile,
  ///   MainFile
  /// ]
  /// ```
  const Pck({
    this.name,
    this.main,
    this.load,
  });
}
