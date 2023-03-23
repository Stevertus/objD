import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/build/build.dart';
import 'package:gson/gson.dart';

class SetBlock extends RestActionAble {
  Location location;
  Block block;
  Map<String, dynamic>? nbt;

  /// The SetBlock Command Class sets a Block at the specified location.
  SetBlock(
    this.block, {
    this.location = const Location.here(),
    this.nbt,
  });

  @override
  Widget generate(Context context) {
    return Command(
      'setblock $location $block${nbt == null ? '' : gson.encode(nbt)}',
    );
  }
}
