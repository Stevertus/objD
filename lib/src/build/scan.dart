import 'package:objd/src/basic/text.dart';
import 'package:objd/src/build/build_pack.dart';
import 'package:objd/src/build/build_project.dart';
import 'package:objd/core.dart';

void scan(
  Widget wid, {
  required StringBuffer commands,
  required BuildPack pack,
  BuildProject? project,
  required Context context,
}) {
  // scans Widget recursivly with defaults or with provided context and widget
  void scanWith([Context? c, Widget? w]) => scan(
        w ?? (wid.generate(context) as Widget),
        context: c ?? context,
        commands: commands,
        pack: pack,
        project: project,
      );

  if (wid is Text) return commands.writeln(_findText(wid, context));

  if (wid is Folder) {
    final ret = scanWith(
      Context.clone(context).addPath(Path.from(wid.path)),
    );
    return ret;
  }

  // check for files and packs
  if (project != null &&
      findFile(wid, context: context, pack: pack, project: project)) return;

  if (wid is Group) {
    return scanWith(
      Context.clone(context).addPrefix(wid.prefix).addSuffix(wid.suffix),
    );
  }
  if (wid is Comment && !wid.force && (wid.text == '[null]' || context.prod)) {
    return;
  }

  if (wid is Scoreboard && wid.subcommand.contains('add')) {
    if (!pack.addScoreboard(wid.name)) return;
  }

  // Other Widget
  dynamic child = wid.generate(context);
  // is module
  if (wid is Module) {
    var files = wid.registerFiles();
    // add files to child
    if (files.isNotEmpty && child is Widget) {
      child = <Widget>[child, ...files];
    }
  }

  // is single widget
  if (child is Widget) {
    return scanWith(context, child);
  }

  // is list widget
  if (child is List<Widget?>) {
    for (var x in child) {
      if (x != null) scanWith(context, x);
    }
    return;
  }
  throw 'Cannot build Widget: $wid';
}

String _findText(Text wid, Context context) {
  var suffixes = '';
  var prefixes = '';
  if (context.prefixes.isNotEmpty) {
    // join all prefixes and remove run execute
    prefixes = '${context.prefixes.join(' ').replaceAll('run execute ', '')} ';
  }
  if (context.suffixes.isNotEmpty) {
    suffixes = '${context.suffixes.join(' ')} ';
  }
  return prefixes + wid.generate(context) + suffixes;
}

bool findFile(
  Widget wid, {
  required BuildPack pack,
  required BuildProject project,
  required Context context,
}) {
  if (wid is RawFile) {
    pack.addRawFile(context.path, wid, project);
    return true;
  }
  if (wid is File) {
    if (wid.create) pack.addFile(context.path, wid, project);
    return !wid.execute;
  }
  if (wid is Extend) {
    pack.extendFile(
      context.path,
      wid,
      project,
      front: wid.first,
    );
    return true;
  }

  if (wid is Pack) {
    project.addPack(wid);
    return true;
  }

  // return value true sets end of branch
  return false;
}
