import 'package:objd/build/build.dart';

/// A widget is the base element for basically everything in objD.
abstract class Widget {
   generate(Context context);
   toMap() => null;
}