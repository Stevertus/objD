/// This can automatically generate a main function with all necessary pieces to actually generate all packs and files.
class Prj {
  final String? name;
  final int? version;
  final String? target;
  final String? description;
  final bool genMain;

  /// This can automatically generate a main function with all necessary pieces to actually generate all packs and files.
  ///
  /// | @Prj        |                                                                                                   |
  /// | ----------- | ------------------------------------------------------------------------------------------------- |
  /// | name        | Name of the datapack                                                                              |
  /// | version     | targeted minecraft version(as integer)                                                            |
  /// | target      | directory to generate the datapack in                                                             |
  /// | description | a description for the pack.mcdata                                                                 |
  /// | genMain     | set this to false if you dont want a main function generated(will be generate\_[varname] instead) |
  /// ```dart
  /// @Prj(
  ///   name: 'My awesome Datapack',
  ///   target: './datapacks/',
  ///   version: 7,
  ///   description: 'A simple dp for demonstrating annotations',
  /// )
  /// final myProject = NamespacePack();
  /// ```
  const Prj({
    this.name,
    this.version,
    this.target,
    this.description,
    this.genMain = true,
  });
}
