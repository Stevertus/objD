import 'package:gson/gson.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/types/entity.dart' as e;
import 'package:objd/external/predicates/entity/entity.dart';
import 'package:objd/external/predicates/range.dart';
import 'package:objd/external/predicates/tag.dart';

// Hey, I'am building a predicate generator right now. I was wondering what the damage_source_properties tag is doing.

class Properties extends Tag {
  final Entity entity;
  final e.EntityType type;
  final Tag predicate;
  final Map<String, dynamic> nbt;
  final bool is_on_fire;
  final bool is_sneaking;
  final bool is_sprinting;
  final bool is_swimming;
  final bool is_baby;
  final Range level;
  final e.Gamemode gamemode;
  final List<Stat> stats;
  final Map<String, bool> recipes;
  final Map<String, dynamic> advancements;
  final String team;

  Properties({
    this.entity = const Entity.This(),
    this.type,
    this.nbt,
    this.is_baby,
    this.is_on_fire,
    this.is_sneaking,
    this.is_sprinting,
    this.is_swimming,
    this.predicate,
    this.level,
    this.gamemode,
    this.stats,
    this.recipes,
    this.advancements,
    this.team,
  });

  @override
  Map<String, dynamic> getJson() {
    Map<String, dynamic> ret = {
      "condition": "minecraft:entity_properties",
      "entity": entity.toString(),
      "predicate": predicate?.getJson() ?? {},
    };
    Map<String, bool> flags = {};
    if (is_baby != null) flags["is_baby"] = is_baby;
    if (is_on_fire != null) flags["is_on_fire"] = is_on_fire;
    if (is_sneaking != null) flags["is_sneaking"] = is_sneaking;
    if (is_sprinting != null) flags["is_sprinting"] = is_sprinting;
    if (is_swimming != null) flags["is_swimming"] = is_swimming;

    if (flags.isNotEmpty) ret["predicate"]["flags"] = flags;

    Map<String, dynamic> player = {};

    if (level != null) player["level"] = level.getJson();
    if (gamemode != null) player["gamemode"] = gamemode.toString();
    if (stats != null) player["stats"] = stats.map((s) => s.getJson()).toList();
    if (recipes != null) player["recipes"] = recipes;
    if (advancements != null) player["advancements"] = advancements;
    if (advancements != null) player["advancements"] = advancements;

    if (player.isNotEmpty) ret["predicate"]["player"] = player;

    if (nbt != null && nbt.isNotEmpty) {
      ret["predicate"]["nbt"] = gson.encode(nbt);
    }
    if (type != null) ret["predicate"]["type"] = type.toString();
    if (team != null) ret["predicate"]["team"] = team;

    return ret;
  }
}

class Stat {
  final String type;
  final String stat;
  final Range<int> value;

  Stat(this.stat, {@required this.type, @required this.value});

  Map<String, dynamic> getJson() => {
        "type": type,
        "stat": stat,
        "value": value.getJson(),
      };
}
