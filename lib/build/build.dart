import 'package:objd/basic/group.dart';
import 'package:objd/build/buildProject.dart';
import 'package:objd/build/create_project.dart';
import 'package:objd/basic/text.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/basic/pack.dart';
import 'package:objd/basic/file.dart';
import 'package:objd/basic/scoreboard.dart';
import 'package:objd/basic/extend.dart';
import 'package:objd/build/findPack.dart';

import 'context.dart';
import 'buildFile.dart';
export 'context.dart';
export 'buildFile.dart';


Map build(Project prj) {
  var ret = BuildProject(prj);
  print(ret);
  return {};
  //return _rekBuild(prj.generate,ret: {"test": "test"}, context: Context(prefixes: [], packId: ""));
}