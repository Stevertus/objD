import 'package:gson/gson.dart';
import 'package:objd/basic/parsable.dart';
import 'package:objd/basic/score.dart';
import 'package:objd/basic/area.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/rotation.dart';
import 'package:objd/basic/tag.dart';
import 'package:objd/wrappers/team.dart';
class Selector {

   String selector;
  int limit;
  List<dynamic> tags;
  Team team;
  List<Score> scores;
  Map<String,dynamic> nbt;
  String strNbt;
  EntityType type;
  Area area;
  Range distance;
  Range level;
  Gamemode gamemode;
  String name;
  Rotation isRotated;
  Range horizontalRotation;
  Range verticalRotation;
  Sort sorting;
  String playerName;

   /// Create entity selector (default selector: @e)
  Selector({
    this.selector = 'e',
    this.limit,
    this.tags,
    this.team,
    this.scores,
    this.nbt,
    this.strNbt,
    this.type,
    this.area,
    this.distance,
    this.level,
    this.gamemode, 
    this.name,
    this.isRotated, 
    this.horizontalRotation, 
    this.verticalRotation,
    this.sorting,
    this.playerName}) {_fix();}

   /// Create entity selector @s
  Selector.Selected({
    this.limit,
    this.tags,
    this.team,
    this.scores,
    this.nbt,
    this.strNbt,
    this.type,
    this.area,
    this.distance,
    this.level,
    this.gamemode, 
    this.name,
    this.isRotated, 
    this.horizontalRotation, 
    this.verticalRotation,
    this.sorting,
    this.playerName}) {
      this.selector = "s";
      _fix();
    }

   /// Create entity selector @p
  Selector.Player({
    this.limit,
    this.tags,
    this.team,
    this.scores,
    this.nbt,
    this.strNbt,
    this.type,
    this.area,
    this.distance,
    this.level,
    this.gamemode, 
    this.name,
    this.isRotated, 
    this.horizontalRotation, 
    this.verticalRotation,
    this.sorting,
    this.playerName}) {
      this.selector = "p";
      _fix();
    }

   /// Create entity selector @a
  Selector.All({
    this.limit,
    this.tags,
    this.team,
    this.scores,
    this.nbt,
    this.strNbt,
    this.type,
    this.area,
    this.distance,
    this.level,
    this.gamemode, 
    this.name,
    this.isRotated, 
    this.horizontalRotation, 
    this.verticalRotation,
    this.sorting,
    this.playerName}) {
      this.selector = "a";
      _fix();
    }

   /// Create entity selector @r
  Selector.Random({
    this.limit,
    this.tags,
    this.team,
    this.scores,
    this.nbt,
    this.strNbt,
    this.type,
    this.area,
    this.distance,
    this.level,
    this.gamemode, 
    this.name,
    this.isRotated,
    this.horizontalRotation,
    this.verticalRotation,
    this.sorting,
    this.playerName}) {
      this.selector = "r";
      _fix();
    }

   /// Copy a selector
  Selector.clone(Selector s){
    List<Score> scores;
    if(s.scores != null) {
      List<Score> scores = s.scores;
      s.scores = [];
      scores.forEach((score) { s.scores.add(Score(score.entity,score.score,addNew: false,commands: score.commands)); });
    }

     this.selector = s.selector;
    this.playerName = s.playerName;
    this.limit = s.limit;
    this.tags = List<dynamic>.from(s.tags);
    this.team = s.team;
    this.scores = scores;
    this.nbt = gson.decode(gson.encode(s.nbt));
    this.strNbt = s.strNbt;
    this.type = s.type;
    this.area = s.area;
    this.distance = s.distance;
    this.level = s.level;
    this.gamemode = s.gamemode;
    this.name = s.name;
    this.isRotated = s.isRotated;
    this.horizontalRotation = s.horizontalRotation;
    this.verticalRotation = s.verticalRotation;
    this.sorting = s.sorting;
  }

   /// Parse a Selector, for example:
  /// ```dart
  /// Selector s = Selector.parse("@a[nbt={a:1b},level=1..3,gamemode=survival,sort=nearest,x=10,dx=10,scores={score=..10,score2=99..}]");
  /// ```
  Selector.parse(String selector) {
    Parsable p = new Parsable(selector);
    if(p.actual() != "@") throw p.error("Selector has to start with a \"@\"-symbol");
    p.skip();
    Map<String, double> ranges = {};
    if(p.actual() != "e" && p.actual() != "a" && p.actual() != "s" && p.actual() != "p" && p.actual() != "r") throw p.error('The secound letter of a selector has to be "a", "e", "p", "r" or "s"');
    this.selector = p.actual();
    if(!p.ended) p.skip();
    if(p.actual() == "[") {
      p.skip();
      bool foundComma = true;
      while(p.actual() != "]") {
        if(!foundComma) throw p.error("Expecting \",\" or \"]\"");
        if(!new RegExp(r"[a-z]").hasMatch(p.actual())) throw p.error("Needing letter a-z or \"]\"");
        String key = "";
        while(new RegExp(r"[a-z]").hasMatch(p.actual())){
          key += p.next();
        } 
        if(p.next() != "=") throw p.error("Expecting \"=\"");
        switch (key) {
          case "scores":
            if(p.actual() != "{") { throw p.error("Expecting \"{\""); }
            bool comma = true;
            p.skip();
            while(p.actual() != "}"){
              if(!comma) throw p.error("Expecting \",\" or \"}\"");
              String score = _parseString(p);
              if(p.next() != "=") throw p.error("Expecting \"=\"");
              Range r = _parseRange(p);
              if(this.scores == null) { scores = []; }
              scores.add(Score.fromSelected(score).matchesRange(r));
              if(p.actual() == ",") {
                comma = true;
                p.skip();
              }
            } 
            p.skip();
            break;
          case "gamemode": this.gamemode = _parseKeyword(p, {"survival": Gamemode.survival,"creative": Gamemode.creative,"adventure": Gamemode.adventure,"spectator": Gamemode.spectator}); break;
          case "sort": this.sorting = _parseKeyword(p, {"nearest": Sort.nearest,"furthest": Sort.furthest,"random": Sort.random,"arbitrary": Sort.arbitrary}); break;
          case "x":  ranges[key] = _parseDouble(p); break;
          case "y":  ranges[key] = _parseDouble(p); break;
          case "z":  ranges[key] = _parseDouble(p); break;
          case "dx": ranges[key] = _parseDouble(p); break;
          case "dy": ranges[key] = _parseDouble(p); break;
          case "dz": ranges[key] = _parseDouble(p); break;
          case "nbt": if(nbt == null) { nbt = gson.decoder.decode(p); } else { nbt.addAll(gson.decoder.decode(p)); } break;
          case "tag": if(this.tags == null) { this.tags = [_parseString(p)]; } else { this.tags.add(_parseString(p)); } break;
          case "name": this.name = gson.decoder.decodeString(p); break;
          case "team": this.team = new Team(_parseString(p)); break;
          case "type": this.type = new EntityType(_parseString(p)); break;
          case "limit": limit = _parseInt(p); break;
          case "level": this.level = _parseRange(p); break;
          case "x_rotation": this.verticalRotation = _parseRange(p); break;
          case "y_rotation": this.horizontalRotation = _parseRange(p); break;
          case "distance": this.distance = _parseRange(p); break;
          default: p.goBack(2); throw p.error("Unknown key \"$key\"",from: key.length - 1); break;
        }
        if(p.actual() == ",") {foundComma = true; p.skip();}
      }
    }
    if(ranges.isNotEmpty) { this.area = Area.fromRanges(ranges: ranges); }

   }

   dynamic _parseKeyword(Parsable p, Map<String,dynamic> keywordmap) {
    String keyword = _parseString(p);
    dynamic ret;
    keywordmap.forEach((k, v) { if(keyword == k) ret = v; });
    if(ret == null) { p.goBack(1); throw p.error("Unexpected value \"$keyword\"",from: keyword.length - 1); }
    return ret;
  }

   Range _parseRange(Parsable p) {
    String number1 = "", number2 = "";
    bool range = false;
    while(new RegExp(r"[0-9\.]").hasMatch(p.actual())) {
      if(p.actual() == "." && p.peek(1) == ".") break;
      number1 += p.next();
    }
    if(p.actual() == "." && p.peek(1) == ".") {
      p.skip(); p.skip();
      range = true;
    }
    while(new RegExp(r"[0-9\.]").hasMatch(p.actual())){
      number2 += p.next();
    } 
    if(!range) return Range.exact(int.parse(number1));
    if(number1 != "" && number2 != "") return Range(from: num.parse(number1), to: num.parse(number2));
    if(number1 != "" && number2 == "") return Range(from: num.parse(number1));
    if(number1 == "" && number2 != "") return Range(to: num.parse(number2));
    throw p.error("Can't use range without number");
  }

   void _fix() {
    List<dynamic> tags = this.tags;
    this.tags = [];
    tags.forEach((tag){
      if(tag is Tag){
        this.tags.add(tag.tag);
      } 
      else if(tag is String) {
        this.tags.add(tag);
      } 
      else {throw("Please insert a Tag or String as tag into Entity!");}
    });
  }

   Selector sort(Sort s) {
    Selector clone = Selector.clone(this);
    clone.sorting = s;
    return clone;
  }

   int _parseInt(Parsable p) {
    String number = "";
    while(new RegExp(r"[0-9]").hasMatch(p.actual())) {
      number += p.next();
    }
    return int.parse(number);
  }

   double _parseDouble(Parsable p) {
    String number = "";

     while(new RegExp(r"[0-9.]").hasMatch(p.actual())) {
      number += p.next();
    }
    return double.parse(number);
  }

   String _parseString(Parsable p) {
    String str = "";
    while(new RegExp(r"[\w-]").hasMatch(p.actual())) str += p.next();
    return str;
  }

   @override
  String toString() {
    return Entity.Select(this).toString();
  }
} 