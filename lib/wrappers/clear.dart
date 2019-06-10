import 'package:objd/core.dart';

class Clear extends Widget {

  Entity target;
  Item item;

  Clear(this.target,this.item);

  @override
  Widget generate(Context context) {
    return Command("clear ${target.toString()} ${item.getGiveNotation(withDamage:false)}");
  }
}