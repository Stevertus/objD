main(List<String> args) {
  
  print("""
Helpmenu for objD:
Use objd [command] [args] or pub global run objd:[command] [args] to run commands

* new [project_name] - generates a new project from a boilerplate

* run [project_root] - builds one project

* serve [directory] [project_root] - watches the directory to change and builds the project on change

* objd - opens this help menu
""");

}