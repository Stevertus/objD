
import 'package:objd/core.dart';

class Advancement extends Widget {
  Entity entity;
  bool revoke;
  String mode;
  String advancement;
  String criterium;

  Advancement.grant(this.entity,this.advancement,{this.mode = "only",this.criterium }){
    revoke = false;
  }
  Advancement.revoke(this.entity,this.advancement,{this.mode = "only",this.criterium }){
    revoke = true;
  }
  Advancement.everything(this.entity,{this.revoke = false}){
    this.mode = "everything";
  }
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