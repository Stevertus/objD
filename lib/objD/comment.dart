import 'package:objd/basic/text.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/build.dart';

class Comment extends Widget {
  String text;
  Comment(this.text);
  Comment.LineBreak() {
    text = "";
  }

  @override
  Widget generate(Context context) {
    return text != "" ? new Text("# " + text) : new Text("");
  }
}
