

import 'package:objd/basic/pack.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/context.dart';

findPack(Widget wid){
  if(wid is Pack) return wid;
  return findPack(wid.generate(new Context(prod: false)));
}