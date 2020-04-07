import 'package:objd/core.dart';

/// The advancement gives you a convenient interface to trigger or revoke specific advancements and advancement groups. It implements the advancement command.
class Advancement extends RestActionAble {
  Entity entity;
  bool revoke;
  String mode;
  String advancement;
  String criteria;

  /// This gives the advancement to the player:
  ///
  /// |Advancement.grant| |
  /// |--|--|
  /// |Entity| the target player |
  /// |String| your advancement |
  /// |mode| the advancement mode(default = only, modes are also separate constructors) |
  /// |criteria| optional String criteria for an advancement|
  Advancement.grant(this.entity, this.advancement,
      {this.mode = 'only', this.criteria}) {
    revoke = false;
  }

  /// You can also revoke an Advancement
  Advancement.revoke(this.entity, this.advancement,
      {this.mode = 'only', this.criteria}) {
    revoke = true;
  }

  /// Every mode also has a separated named constructor:
  ///
  ///|Advancement.everything| Unlocks everything |
  ///|--|--|
  ///|Entity| the target player |
  ///|revoke| set true if you want to revoke |
  Advancement.everything(this.entity, {this.revoke = false}) {
    mode = 'everything';
  }

  /// Every mode also has a separated named constructor:
  ///
  ///|Advancement.only| Only unlocks on Advancement |
  ///|--|--|
  ///|Entity| the target player |
  ///|String | your advancement|
  ///|revoke| set true if you want to revoke |
  ///|criteria|optional String for an advancement|
  Advancement.only(this.entity, this.advancement,
      {this.revoke = false, this.criteria}) {
    mode = 'only';
  }
  Advancement.from(this.entity, this.advancement, {this.revoke = false}) {
    mode = 'from';
  }
  Advancement.until(this.entity, this.advancement, {this.revoke = false}) {
    mode = 'until';
  }
  Advancement.through(this.entity, this.advancement, {this.revoke = false}) {
    mode = 'through';
  }

  @override
  Widget generate(Context context) {
    var res = 'advancement ';
    res += revoke ? 'revoke' : 'grant';
    res += ' ${entity.toString()} $mode $advancement';
    if (criteria != null) res += ' $criteria';
    return Command(res);
  }
}
