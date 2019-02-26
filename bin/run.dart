import 'dart:io';


main(args){

  if (args.length < 1) {
    print("Usage: run <directory path> <root file>");
    return;
  }

  Process.run('dart',args).then((ProcessResult results){
    print(results.stdout);
  });
}