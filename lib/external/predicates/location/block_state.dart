import 'package:gson/gson.dart';
import 'package:objd/basic/types/block.dart';
import 'package:objd/external/predicates/tag.dart';

class BlockState extends Tag {
  final Block block;
  final Map<String, dynamic> properties;

  BlockState(this.block, [this.properties]);

  @override
  Map<String, dynamic> getJson() {
    var ret = <String, dynamic>{
      'condition': 'minecraft:block_state_property',
    };

    if (properties != null && properties.isNotEmpty) {
      ret['properties'] = properties
          .map<String, String>((key, val) => MapEntry(key, gson.encode(val)));
    }
    return ret;
  }
}
