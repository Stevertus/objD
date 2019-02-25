import 'package:objd/basic/command.dart';
import 'package:objd/basic/widget.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/text_components.dart';
import 'package:objd/basic/location.dart';
import 'package:objd/build/build.dart';
import 'dart:convert';

class Summon extends Widget {
  Map<String,dynamic> nbt;
  Location location;
  EntityType type;
  /// The summon class creates a new entity at a given location.
  Summon(this.type,{TextComponent name, this.nbt, this.location}){
        if(location == null) location = Location.here();
        if(nbt == null) nbt = {};

    if(name != null) nbt.addAll({
      "CustomName": name.toJson()
    });
  }
  
  // TODO: Tags, Scores etc

  @override
  Widget generate(Context context){
    return new Command('summon ' + type.toString() + ' ' + location.toString() + ' ' + json.encode(nbt));
  }
}
