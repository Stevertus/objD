import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';

/// The PassTrait Functionality allows you to pass data down your widget tree without struggles.

class PassTrait<T> extends Widget {
  final Widget child;
  final T trait;

  /// The PassTrait Functionality allows you to pass data down your widget tree without struggles. Imagine having one unique value in your pack that special widgets below it regardless of their position or parent should know of.
  /// The PassTrait Widget injects your value in the Context, allowing you to access it everywhere.
  ///
  /// ```dart
  /// PassTrait(
  /// 	10.0,
  /// 	child: ...
  /// )
  /// ```
  ///
  /// In some other Widgets generate function you can retrieve the value by using PassTrait.of now. The values are passed by type, so you can just get one value per type(of course custom classes are also valid):
  ///
  /// ```dart
  ///   @override
  ///   Widget generate(Context context) {
  ///     var value = PassTrait.of<double>(context); // => 10.0
  ///     return ...;
  ///   }
  /// ```
  PassTrait(this.trait, {@required this.child});

  /// You can retrieve the value by using PassTrait.of. The values are passed by type, so you can just get one value per type(of course custom classes are also valid):
  static T of<T>(Context c) => c.traitOf<T>();

  @override
  Widget generate(Context context) {
    context.passTrait(trait);
    return child;
  }
}
