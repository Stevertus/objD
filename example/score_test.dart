import 'package:objd/core.dart';

void main(List<String> args) {
  var s1 = Score(Entity.All(), "s1");
  var s2 = Score.Self('s2');
  var t = Bossbar("test").get(BossbarOption.value) + 1;

  print(t);
  // print(s1 + (s2 + s1));

  final (_, ops) = t.copy();
  print(ops);
  //print(getCommands(For.of(ops)).join('\n'));
  print(getCommands(t).join('\n')); //TODO: Caveat s1 + s2 != s2 + s1
}
