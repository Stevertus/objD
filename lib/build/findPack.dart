

import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/pack.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';

Widget findPack(Widget wid){
  if(wid is Pack) return wid;
  if(wid is For) {
    for (var child in wid.children) {
      var res = findPack(child);
      if(res is Pack) return res;
    }
  }
  // maybe add a limit here
  return findPack(wid.generate( Context(prod: false)) as Widget);
}