import 'package:objd/basic/text.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';

class Comment extends RestActionAble {
  String text;
  bool force = false;
  /// The Comment widget generates a simple line with some annotations(# ...).
  Comment(this.text,{this.force = false});
  /// The Comment features a simple line break.
  Comment.LineBreak() {
    text = "";
  }
  Comment.Null() {
    text = "[null]";
  }

  @override
  Widget generate(Context context) {
    return text != "" ? Text("# " + text) : Text("");
  }
}
