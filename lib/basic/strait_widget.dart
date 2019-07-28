import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/build/build.dart';

class StraitWidget extends Widget {
  
  /**
   * Used by external functions that generate content for the actual widget. 
   * ```dart
   * StraitWidget.builder.create(...)
   * ```
   */
  static RestActionBuilder builder = new RestActionBuilder([]);
  
  /// The result of the StraitWidget generation
  List<Widget> result;

  /**
   * A StraitWidget is as Strait running widget, it executes your Method and gets the output. You need a StraitWidget around every strait content
   * ```dart
   * StraitWidget((List<Widget> cont) {
   *  ...
   * });
   * ```
   */
  StraitWidget(Function(List<Widget>) strait) {

    List<Widget> content = [];
    RestActionBuilder b = StraitWidget.builder;
    StraitWidget.builder = RestActionBuilder(content);

    dynamic ret = strait(content);

    // Proccess return (if given)
    if(ret != null) {
      if(ret is RestAction) {
        if(ret.called) ret.queue();
      }
      else if(ret is List<RestAction>) ret.forEach((e) {
        if(!e.called) e.queue();
      });
      else if(ret is Widget) content.add(ret);
      else if(ret is List<Widget>) content.addAll(ret);
    }

    StraitWidget.builder = b;
    result = content;

  }

  @override
  Widget generate(Context context) {
    return For.of(result);
  }
}