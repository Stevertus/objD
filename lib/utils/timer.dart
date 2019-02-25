import 'package:objd/basic/file.dart';
import 'package:objd/basic/for_list.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/build.dart';
import 'package:objd/wrappers/schedule.dart';

class Timeout extends Widget {

  String name;
  String path;
  List<Widget> children;
  int ticks;

  Timeout(this.name,{@required this.children,@required this.ticks,this.path = "timers"}):assert(ticks != null);

  @override
  generate(Context context) {
    return Schedule.file(
      new File.execute(
        path: path + "/" + name,
        child:For.of(children)
      ),
      ticks: ticks,
    );
  }

}

class Timer extends Widget {
    String name;
  String path;
  List<Widget> children;
  int ticks;

  Timer(this.name,{@required this.children,@required this.ticks,this.path = "timers"}):assert(ticks != null);

  @override
  generate(Context context) {
    if(context.prod) children.add(
      Schedule(path + "/" + name,ticks:ticks)
    );
    print(children);
    return File.execute(
        path: path + "/" + name,
        child:For.of(children)
      );
  }
}