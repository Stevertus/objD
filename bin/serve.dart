import 'package:path/path.dart' as p;
import 'package:watcher/watcher.dart';
import './run.dart' as run;
main(List args){

  if (args.length < 2) {
    print("Usage: serve <directory path> <root file>");
    return;
  }

  var watcher = DirectoryWatcher(p.absolute(args[0]));

    print("objD will now watch all your files in ${args[0]} and generate the datapack itself");
    args = args.sublist(1);
    run.main(args);
  args.add("-min");
  watcher.events.listen((event) {
    if(event.path.split('.').last == "dart") run.main(args);
  });
}