import 'package:objd/src/basic/types/entity.dart';
import 'package:objd/src/basic/types/location.dart';
import 'package:objd/src/basic/widgets.dart';
import 'package:objd/src/wrappers/summon.dart';

/// Added in Minecraft 1.17 this entity only exists serversides and thus has no performance constraints for the client.
class Marker extends Summon {
  Map<String, dynamic>? data;

  /// Added in Minecraft 1.17 this entity only exists serversides and thus has no performance constraints for the client. Best used to save locations and even custom nbt data with the data field.
  Marker(
    Location location, {
    Map<String, dynamic>? nbt,
    this.data,
    List<String>? tags,
  }) : super(
          Entities.marker,
          location: location,
          nbt: nbt,
          tags: tags,
        );

  @override
  Map<String, dynamic> getNbt([bool useId = true]) {
    final nbt = super.getNbt(useId);
    if (data != null) {
      nbt['data'] = data;
    }
    return nbt;
  }
}
