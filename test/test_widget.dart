import 'package:objd/core.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart' show isTest;

@isTest
void command(String name, Widget w, String command, {Context? context}) {
  test(name, () {
    expect(
      getCommands(
        w,
        context: context ?? Context(packId: 'test', version: 20.4),
      ),
      [command],
    );
  });
}

@isTest
void commands(
  String name,
  Widget w,
  List<String> commands, {
  Context? context,
}) {
  test(name, () {
    expect(
      getCommands(
        w,
        context: context ?? Context(packId: 'test', version: 20.4),
      ),
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
