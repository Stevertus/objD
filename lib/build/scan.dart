import 'package:objd/basic/extend.dart';
import 'package:objd/basic/file.dart';
import 'package:objd/basic/group.dart';
import 'package:objd/basic/pack.dart';
import 'package:objd/basic/text.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/build/buildFile.dart';
import 'package:objd/build/buildPack.dart';
import 'package:objd/build/buildProject.dart';
import 'package:objd/build/context.dart';

scan(Widget wid,
    {BuildFile file, BuildPack pack, BuildProject project, Context context}) {
  file.add(_findText(wid, context));
  if(findFile(wid,context: context,pack: pack,project: project)) return;

  if (wid is Group) {
    scan(
      wid.generate(context),
      context:
          Context.clone(context).addPrefix(wid.prefix).addSuffix(wid.suffix),
      file: file,
      pack: pack,
      project: project,
    );
    return;
  }

  if (wid is Widget) {
    dynamic child = wid.generate(context);
    // is single widget
    if (child is Widget){
      scan(
        child,
        file: file,
        pack: pack,
        project: project,
        context: context,
      );
      return;
    }      

    // is list widget
    if (child is List<Widget>) {
      child.forEach((x) {
        scan(
          x,
          file: file,
          pack: pack,
          project: project,
          context: context,
        );
      });
    }
    //throw "Cannot build Widget: " + wid.toString();
  }
}

String _findText(Widget wid, Context context) {
  if (wid is Text) {
    String suffixes = "";
    String prefixes = "";
    if (context.prefixes.length > 0)
      prefixes = context.prefixes.join(' ') + ' ';
    if (context.suffixes.length > 0)
      suffixes = context.suffixes.join(' ') + ' ';
    return prefixes + wid.generate(context) + suffixes;
  }
  return "";
}

bool findFile(Widget wid,{BuildPack pack, BuildProject project, Context context}){
  if( wid is File){
    if(wid.create) pack.addFile(wid,project);
    return !wid.execute;
  }
  if( wid is Extend){
    pack.extendFile(wid,front: wid.first);
    return true;
  }

  if( wid is Pack){
    project.addPack(wid);
    return true;
  }

  // return value true sets end of branch
  return false;
}