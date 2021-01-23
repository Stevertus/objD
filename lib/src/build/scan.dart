import 'package:objd/src/basic/extend.dart';
import 'package:objd/src/basic/file.dart';
import 'package:objd/src/basic/group.dart';
import 'package:objd/src/basic/module.dart';
import 'package:objd/src/basic/pack.dart';
import 'package:objd/src/basic/scoreboard.dart';
import 'package:objd/src/basic/text.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/build/buildFile.dart';
import 'package:objd/src/build/buildPack.dart';
import 'package:objd/src/build/buildProject.dart';
import 'package:objd/src/build/context.dart';
import 'package:objd/core.dart';
import 'package:objd/src/wrappers/comment.dart';

void scan(
  Widget wid, {
  BuildFile file,
  BuildPack pack,
  BuildProject project,
  Context context,
}) {
  file.add(_findText(wid, context));
  if (findFile(wid, context: context, pack: pack, project: project)) return;

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
  if (wid is Comment && !wid.force && (wid.text == '[null]' || context.prod)) {
    return;
  }

  if (wid is Scoreboard && wid.subcommand == 'add') {
    if (!pack.addScoreboard(wid.name)) return;
  }

  if (wid is Widget) {
    dynamic child = wid.generate(context);
    // is module
    if (wid is Module) {
      var files = wid.registerFiles();
      // add files to child
      if (files != null && files.isNotEmpty && child is Widget) {
        child = <Widget>[(child as Widget), ...files];
      }
    }

    // is single widget
    if (child is Widget) {
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
    //throw 'Cannot build Widget: ' + wid.toString();
  }
}

String _findText(Widget wid, Context context) {
  if (wid is Text) {
    var suffixes = '';
    var prefixes = '';
    if (context.prefixes.isNotEmpty) {
      prefixes = context.prefixes.join(' ') + ' ';
    }
    if (context.suffixes.isNotEmpty) {
      suffixes = context.suffixes.join(' ') + ' ';
    }
    return prefixes + wid.generate(context) + suffixes;
  }
  return '';
}

bool findFile(
  Widget wid, {
  BuildPack pack,
  BuildProject project,
  Context context,
}) {
  if (wid is RawFile) {
    pack.addRawFile(wid, project);
    return true;
  }
  if (wid is File) {
    if (wid.create) pack.addFile(wid, project);
    return !wid.execute;
  }
  if (wid is Extend) {
    pack.extendFile(wid, front: wid.first);
    return true;
  }

  if (wid is Pack) {
    project.addPack(wid);
    return true;
  }

  // return value true sets end of branch
  return false;
}
