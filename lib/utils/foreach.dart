

import 'package:meta/meta.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/file.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/group.dart';
import 'package:objd/basic/score.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';
import 'package:objd/wrappers/if.dart';

/// The ForEach Loop repeats a set of commands for each value in a Score.
/// Therefore a file is called recursively and a counter score is increased.
class ForEach extends Widget {

  Score score;
  Score _countScore;
  int from;
  int step;
  Entity counter;
  Function(Widget) then;
/// The ForEach Loop repeats a set of commands for each value in a Score.
/// Therefore a file is called recursively and a counter score is increased.
///
/// | constructor |  |
/// |--|--|
/// |Score| the score to iterate through |
/// |then| A Function that takes in the count Score |
/// |from| the initial value for the counter(default = 0) |
/// |counter| an Entity to hold the count value(default = #objd_foreach) |
/// |step| how much to increase or decrease the counter each time(default = 1) |
  ForEach(this.score,{@required this.then, this.from=0,this.counter,this.step = 1}){
    if(counter == null) counter = Entity.PlayerName("#objd_foreach");
    _countScore = Score(counter, "objd_count");
  }

  @override
  Widget generate(Context context) {

    Group gr = new Group(filename: "foreach",children: [
      then(_countScore),
      step < 0 ? _countScore.subtract(-step) : _countScore.add(step),
      If(_countScore.isSmallerOrEqual(score),Then:[File.recursive()])
    ]);

    return For.of([
      _countScore.set(from),
      If(_countScore.isSmaller(score),Then:[
        gr
      ])
    ]);
  }
}