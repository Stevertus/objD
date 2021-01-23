import 'package:objd/src/basic/types/condition.dart';
import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/file.dart';
import 'package:objd/src/basic/for_list.dart';
import 'package:meta/meta.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';
import 'package:objd/src/wrappers/if.dart';
import 'package:objd/src/wrappers/schedule.dart';

class Timeout extends RestActionAble {
  String name;
  String path;
  List<Widget> children;
  int ticks;

  Timeout(this.name,
      {@required this.children, @required this.ticks, this.path = 'timers'})
      : assert(ticks != null);

  @override
  Widget generate(Context context) {
    return Schedule.file(
      File.execute(path + '/' + name, child: For.of(children)),
      ticks: ticks,
    );
  }
}

class Timer extends RestActionAble {
  bool _stop;

  String name;
  String path;
  List<Widget> children;
  int ticks;
  bool infinite;

  Timer(
    this.name, {
    @required this.children,
    @required this.ticks,
    this.path = 'timers',
    this.infinite = true,
  }) : assert(ticks != null);

  Timer.stop(this.name) {
    _stop = true;
  }
  @override
  Widget generate(Context context) {
    if (_stop == true) return Entity.All().addTag('objd_' + name);

    //if(context.prod){
    if (infinite) {
      children.add(Schedule(path + '/' + name, ticks: ticks));
    } else {
      children.addAll([
        If(Condition.not(Entity.All(tags: ['objd_' + name])),
            then: [Schedule(path + '/' + name, ticks: ticks)]),
        Entity.All().removeTag('objd_' + name)
      ]);
    }

    //}

    return File.execute(path + '/' + name, child: For.of(children));
  }
}
