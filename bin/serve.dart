import 'package:path/path.dart' as p;
import 'package:watcher/watcher.dart';
import './run.dart' as run;
main(List args){

  if (args.length < 2) {
    print("Usage: serve <directory path> <root file>");
    return;
  }

  var watcher = DirectoryWatcher(p.absolute(args[0]));

  watcher.events.listen((event) {
    if(event.path.split('.').last == "dart") run.main(args.sublist(1));
  });
}