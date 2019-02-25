import 'package:objd/basic/text.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/build.dart';

class Comment extends Widget {
  String text;
  /// The Comment widget generates a simple line with some annotations(# ...).
  Comment(this.text);
  /// The Comment features a simple line break.
  Comment.LineBreak() {
    text = "";
  }

  @override
  Widget generate(Context context) {
    return text != "" ? new Text("# " + text) : new Text("");
  }
}
