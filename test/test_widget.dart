import 'package:objd/core.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart' show isTest;

@isTest
void command(String name, Widget w, String command) {
  test(name, () {
    expect(
      getCommands(w),
      [command],
    );
  });
}

@isTest
void commands(String name, Widget w, List<String> commands) {
  test(name, () {
    expect(
      getCommands(w),
      commands,
    );
  });
}

@isTest
void builder(String name, void Function() f) {
  test(name, () {
    f();
  });
}
