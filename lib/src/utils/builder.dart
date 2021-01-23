import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/build.dart';

/// The Builder Widget embeds a builder function in your Widget Tree. Here you can provide a similar method to the generate method of a Widget. This allows you to define new variables, make calculations and conditions.
class Builder extends Widget {
  final BuilderFunction build;

  /// The Builder Widget embeds a builder function in your Widget Tree. Here you can provide a similar method to the generate method of a Widget. This allows you to define new variables, make calculations and conditions.
  Builder(this.build);

  @override
  Widget generate(Context context) => build(context);
}

/// a Function that takes in the context and returns a Widget.
typedef BuilderFunction = Widget Function(Context);
