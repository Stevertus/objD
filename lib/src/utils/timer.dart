import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';
import 'package:objd/src/wrappers/if.dart';
import 'package:objd/src/wrappers/schedule.dart';

class Timeout extends RestActionAble {
  String name;
  String path;
  List<Widget> children;
  Time ticks;

  /// A Timeout is a simple delay in your code. It is done with the Schedule Command and generates a File under the hood.
  Timeout(
    this.name, {
    required this.children,
    required this.ticks,
    this.path = 'timers',
  });

  @override
  Widget generate(Context context) {
    return Schedule.file(
      File.execute('$path/$name', child: For.of(children)),
      ticks: ticks,
    );
  }
}

class Timer extends RestActionAble {
  final bool _stop;

  String name;
  String path;
  List<Widget> children;
  Time ticks;
  bool infinite;

  /// A Timer is very similar to a Timeout, but instead of delaying the code it is run over and over again always delayed by the ticks. \
  /// In the end it creates a loop with slower tick speed as 20t/s to perform some operations more performant.
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
        ticks = const Time(0),
        infinite = true,
        children = const [];

  @override
  Widget generate(Context context) {
    if (_stop == true) return Entity.All().addTag('objd_$name');

    //if(context.prod){
    if (infinite) {
      children.add(Schedule('$path/$name', ticks: ticks));
    } else {
      children.addAll([
        If(Condition.not(Entity.All(tags: ['objd_$name'])),
            then: [Schedule('$path/$name', ticks: ticks)]),
        Entity.All().removeTag('objd_$name')
      ]);
    }

    //}

    return File.execute('$path/$name', child: For.of(children));
  }
}
