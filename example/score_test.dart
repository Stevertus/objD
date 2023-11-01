import 'package:objd/core.dart';

void main(List<String> args) {
  var s1 = Score(Entity.All(), "s1");
  var s2 = Score.Self('s2');
  var t = (s1 + s2) +
      s1 / (s2 + 2) +
      (Bossbar("test") << s1) +
      Bossbar("test").get(BossbarOption.value);

  //print(t);
  print(s1 + (s2 + s1));

  final (_, ops) = t.copy();
  //print(getCommands(For.of(ops)).join('\n'));
  print(getCommands(s1 + s2 + s1).join('\n')); //TODO: Caveat s1 + s2 != s2 + s1
}
