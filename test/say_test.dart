import 'package:objd/core.dart';
import 'package:test/test.dart';

void main() {
  group('Say', () {
    test('string', () {
      expect(
        getCommands(Say("Hello")),
        ["say Hello"],
      );
    });
    test('entity', () {
      final e = Entity.Self();

      expect(
        getCommands(Say(e)),
        ["say $e"],
      );
    });
  });
}
