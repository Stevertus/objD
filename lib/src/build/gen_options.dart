class GenOptions {
  bool minified = false;
  bool prod = false;
  bool debugFile = false;
  bool hotreload = false;
  bool generateZip = false;
  bool useIsolates = false;
  bool clean = false;
  String? output;

  GenOptions(List<String> args) {
    if (args.contains('--hotreload') || args.contains('-r')) {
      hotreload = true;
      debugFile = true;
    }
    if (args.contains('--min')) minified = true;
    if (args.contains('--prod') || args.contains('-p')) {
      prod = true;
      generateZip = true;
      minified = false;
      hotreload = false;
    }
    if (args.contains('--debug') || args.contains('-d')) {
      debugFile = true;
    }
    if (args.contains('--clean') || args.contains('-c')) {
      clean = true;
    }
    if (args.contains('--useIsolates')) {
      useIsolates = true;
    }
    if (args.contains('--zip') || args.contains('-z')) {
      generateZip = true;
      hotreload = false;
    }
    if (args.contains('--no-zip') || args.contains('-no-z')) {
      generateZip = false;
    }
    if (args.contains('--out')) {
      var index = args.indexOf('--out');
      if (index < args.length - 1) {
        output = args[index + 1];
      }
    }
  }
}
