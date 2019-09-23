import 'package:objd/basic/command.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/rest_action.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/block.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/basic/widgets.dart';
import 'package:objd/build/build.dart';
import 'package:gson/gson.dart';

class SetBlock extends RestActionAble {
  Location location;
  Block block;
  Map<String, dynamic> nbt;

  /// The SetBlock Command Class sets a Block at the specified location.
  SetBlock(
    this.block, {
    @required this.location,
    this.nbt,
  });

  @override
  Widget generate(Context context) {
    return Command(
      'setblock ' +
          location.toString() +
          ' ' +
          block.toString() +
          (nbt == null ? '' : gson.encode(nbt)),
    );
  }
}
