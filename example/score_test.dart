import 'package:objd/core.dart';

void main(List<String> args) {
  var s1 = Score(Entity.All(), "s1");
  var s2 = Score.Self('s2');
  var t = (s1 + s2) + s1 / (s2 + 2);

  print(t);

  final (_, ops) = t.copy();
  print(getCommands(For.of(ops)).join('\n'));
}
