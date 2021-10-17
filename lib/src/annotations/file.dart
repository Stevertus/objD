/// Writing Minecrafts functions annotations becomes really easy. Just annotate a Widget variable that should be inside of your function with `@Func()`:

class Func {
  final String? name;
  final String? path;
  final String? pack;
  final bool? execute;
  final bool? create;

  /// Writing Minecrafts functions annotations becomes really easy. Just annotate a Widget variable that should be inside of your function with `@Func()`:
  /// ```dart
  /// @Func()
  /// final Widget load = Say('Hello');
  /// ```
  /// Inside the parentheses of `@Func()` you can also provide various parameters to customize the file generation:
  ///
  /// | @Func   |                                                                          |
  /// | ------- | ------------------------------------------------------------------------ |
  /// | name    | Provide a custom filename different from the variable name               |
  /// | path    | Give a custom path for your function                                     |
  /// | execute | whether to execute your File(when included somewhere in the widget tree) |
  /// | create  | whether to actually create the file or not                               |
  const Func({
    this.name,
    this.pack,
    this.path = '/',
    this.execute,
    this.create,
  });
}
