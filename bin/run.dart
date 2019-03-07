import 'dart:io';


main(args){

  if (args.length < 1) {
    print("Usage: run <root file>");
    return;
  }

  Process.run('dart',args).then((ProcessResult results){
    print(results.stderr);
    print(results.stdout);
  });
}