import 'package:objd/src/basic/types/block.dart';
import 'package:objd/src/basic/types/location.dart' as l;
import 'package:objd/src/external/predicates/range.dart';
import 'package:objd/src/external/predicates/tag.dart';
import 'package:objd/src/wrappers/execute.dart';

void _checkRangeOrDouble(dynamic val) {
  if (val != null) {
    assert(val is Range || val is num,
        'Please provide either a Range or a double value!');
  }
}

class Location extends Tag {
  final String? biome;
  final String? feature;
  final Block? block;
  final Block? fluid;
  final Map<String, dynamic>? blockState;
  final dynamic light;
  final dynamic x;
  final dynamic y;
  final dynamic z;
  final l.Location? offset;
  final dynamic dimension;
  final Tag? predicate;

  Location({
    this.predicate,
    this.biome,
    this.block,
    this.blockState,
    this.dimension,
    this.feature,
    this.fluid,
    this.light,
    this.x,
    this.y,
    this.z,
    this.offset,
  }) {
    _checkRangeOrDouble(light);
    _checkRangeOrDouble(x);
    _checkRangeOrDouble(y);
    _checkRangeOrDouble(z);
  }

  Map<String, dynamic> _convertBlock(Block block, [bool isFluid = false]) {
    var ret = <String, dynamic>{};
    if (block.id.isNotEmpty) {
      if (isFluid) {
        ret['fluid'] = block.id;
      } else {
        ret['block'] = block.id;
      }
    }
    if (block.tag != null) ret['tag'] = block.tag;
    if (block.nbt != null) ret['nbt'] = block.nbt;
    if (block.states != null) ret['state'] = block.states;
    if (blockState != null && blockState!.isNotEmpty) {
      ret['state'] = blockState!.map(
        (key, val) {
          _checkRangeOrDouble(val);
          if (val is Range) return MapEntry(key, val.getJson());
          return MapEntry(key, val);
        },
      );
    }

    return ret;
  }

  @override
  Map<String, dynamic> getJson() {
    var ret = <String, dynamic>{
      'condition': 'minecraft:location_check',
      'predicate': predicate?.getJson() ?? {},
    };

    if (block != null) ret['predicate']['block'] = _convertBlock(block!);
    if (fluid != null) ret['predicate']['fluid'] = _convertBlock(fluid!);
    if (biome != null) ret['predicate']['biome'] = biome;
    if (dimension != null) {
      if (dimension is Dimension) {
        ret['predicate']['dimension'] = dimension.toString().split('.')[1];
      } else {
        ret['predicate'] = dimension.toString();
      }
    }
    if (feature != null) ret['predicate']['feature'] = feature;
    if (light != null) {
      ret['predicate']['light'] = {
        'light': light is Range ? light.getJson() : light,
      };
    }
    if (x != null || y != null || z != null) ret['predicate']['position'] = {};
    if (x != null) {
      ret['predicate']['position']['x'] = x is Range ? x.getJson() : x;
    }
    if (y != null) {
      ret['predicate']['position']['y'] = y is Range ? y.getJson() : y;
    }
    if (z != null) {
      ret['predicate']['position']['z'] = z is Range ? z.getJson() : z;
    }

    if (offset != null) {
      if (offset!.x != 0) ret['predicate']['offsetX'] = offset!.x;
      if (offset!.y != 0) ret['predicate']['offsetY'] = offset!.y;
      if (offset!.z != 0) ret['predicate']['offsetZ'] = offset!.z;
    }

    return ret;
  }
}
