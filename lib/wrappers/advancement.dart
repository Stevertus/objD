import 'package:objd/core.dart';

/// The advancement gives you a convenient interface to trigger or revoke specific advancements and advancement groups. It implements the advancement command.
class Advancement extends RestActionAble {
  Entity entity;
  bool revoke;
  String mode;
  String advancement;
  String criterium;

/// This gives the advancement to the player:
///
/// |Advancement.grant| |
/// |--|--|
/// |Entity| the target player |
/// |String| your advancement |
/// |mode| the advancement mode(default = only, modes are also seperate constructors) |
/// |criterium| optional String criterium for an advancement|
  Advancement.grant(this.entity,this.advancement,{this.mode = "only",this.criterium }){
    revoke = false;
  }
/// You can also revoke an Advancement
  Advancement.revoke(this.entity,this.advancement,{this.mode = "only",this.criterium }){
    revoke = true;
  }
/// Every mode also has a seperated named constructor:
///
///|Advancement.everything| Unlocks everything |
///|--|--|
///|Entity| the target player |
///|revoke| set true if you want to revoke |
  Advancement.everything(this.entity,{this.revoke = false}){
    this.mode = "everything";
  }
/// Every mode also has a seperated named constructor:
///
///|Advancement.only| Only unlocks on Advancment |
///|--|--|
///|Entity| the target player |
///|String | your advancement|
///|revoke| set true if you want to revoke |
///|criterium|optional String for an advancement|
  Advancement.only(this.entity,this.advancement,{this.revoke = false,this.criterium }){
    this.mode = "only";
  }
  Advancement.from(this.entity,this.advancement,{this.revoke = false }){
    this.mode = "from";
  }
  Advancement.until(this.entity,this.advancement,{this.revoke = false }){
    this.mode = "until";
  }
  Advancement.through(this.entity,this.advancement,{this.revoke = false }){
    this.mode = "through";
  }

  @override
  Widget generate(Context context) {
    String res = "advancement ";
    res += revoke ? "revoke" : "grant";
    res += " ${entity.toString()} $mode $advancement";
    if(criterium != null) res += " $criterium";
    return Command(res);
  }
}