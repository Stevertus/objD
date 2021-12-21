import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';
import 'package:objd/src/wrappers/if.dart';
import 'package:objd/src/wrappers/schedule.dart';

class Timeout extends RestActionAble {
  String name;
  String path;
  List<Widget> children;
  int ticks;

  Timeout(
    this.name, {
    required this.children,
    required this.ticks,
    this.path = 'timers',
  });

  @override
  Widget generate(Context context) {
    return Schedule.file(
      File.execute(path + '/' + name, child: For.of(children)),
      ticks: ticks,
    );
  }
}

class Timer extends RestActionAble {
  final bool _stop;

  String name;
  String path;
  List<Widget> children;
  int ticks;
  bool infinite;

  Timer(
    this.name, {
    required this.children,
    required this.ticks,
    this.path = 'timers',
    this.infinite = true,
  }) : _stop = false;

  Timer.stop(this.name)
      : _stop = true,
        path = 'timers',
        ticks = 0,
        infinite = true,
        children = const [];

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
