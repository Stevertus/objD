import 'package:objd/src/basic/command.dart';

import 'package:objd/src/basic/rest_action.dart';
import 'package:objd/src/basic/widget.dart';
import 'package:objd/src/basic/types/block.dart';
import 'package:objd/src/basic/types/area.dart';
import 'package:objd/src/build/build.dart';

class Fill extends RestActionAble {
  Area area;
  Block block;
  String type = '';

  /// Fill acts similar to setblock, but fills a whole area instead.
  Fill(this.block, {required this.area});
  Fill.destroy(this.block, {required this.area}) {
    type = 'destroy';
  }
  Fill.hollow(this.block, {required this.area}) {
    type = 'hollow';
  }
  Fill.outline(this.block, {required this.area}) {
    type = 'outline';
  }
  Fill.keep(this.block, {required this.area}) {
    type = 'keep';
  }
  Fill.replace(this.block, {required this.area, Block replace}) {
    if (replace != null) type = 'replace ' + replace.toString();
  }

  @override
  Widget generate(Context context) {
    if (type.isNotEmpty) type = ' ' + type;
    return Command(
        'fill ' + area.getCoordinates() + ' ' + block.toString() + type);
  }
}
