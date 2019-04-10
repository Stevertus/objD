
import 'new.dart' as newProject;
import 'run.dart' as runProject;
import 'serve.dart' as serveProject;

main(List<String> args) {

  String subcommand;
  if(args.length > 0){
    subcommand = args[0];
    args.removeAt(0);
  }

switch (subcommand) {
  case "new": return newProject.main(args);
  case "run": return runProject.main(args);
  case "serve": return serveProject.main(args);
  default:showHelp();
}

}

showHelp(){
    print("""
Helpmenu for objD:
Use objd [command] [args] or pub global run objd:[command] [args] to run commands

* new [project_name] - generates a new project from a boilerplate

* run [project_root] - builds one project

* serve [directory] [project_root] - watches the directory to change and builds the project on change

* help - opens this help menu
""");
}