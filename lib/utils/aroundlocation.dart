

import 'package:meta/meta.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';

class AroundLocation extends Widget {

  double rel;
  Function build;


  AroundLocation(this.rel,{@required this.build});

  @override
  Widget generate(Context context) {
    return For.of([
      build(Location.rel(x:rel,y:0,z:0)),
      build(Location.rel(x:-rel,y:0,z:0)),
      build(Location.rel(x:0,y:rel,z:0)),
      build(Location.rel(x:0,y:-rel,z:0)),
      build(Location.rel(x:0,y:0,z:rel)),
      build(Location.rel(x:0,y:0,z:-rel)),
    ]);
  }
}