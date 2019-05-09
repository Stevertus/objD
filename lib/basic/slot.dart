import 'package:objd/core.dart';

class Slot {
  final int id;
  final String slot;
  const Slot({this.slot,this.id});

  static Slot inv(double n){
    int res = 0;
    int row = n.toInt();
    int col = (n*10).toInt() - row * 10;

    if(col > 0) res = col - 1;
    if(row > 0) res += (row -1) * 9;

    if(res > 26){
      return Slot(slot:"hotbar.${res - 27}",id:res - 27);
    } else {
      return Slot(slot:"inventory.$res",id:res + 9);
    }
  }
  static Slot chest(double n){
    int res = 0;
    int row = n.toInt();
    int col = (n*10).toInt() - row * 10;

    if(col > 0) res = col - 1;
    if(row > 0) res += (row -1) * 9;

    return Slot(slot: "container.$res",id:res);
  }
  static Slot drop(double n){
    int res = 0;
    int row = n.toInt();
    int col = (n*10).toInt() - row * 10;

    if(col > 0) res = col - 1;
    if(row > 0) res += (row -1) * 3;

    return Slot(slot: "container.$res",id:res);
  }

// Hotbar
static const Hotbar0 = const Slot(slot:"hotbar.0",id:0);
static const Hotbar1 = const Slot(slot:"hotbar.1",id:1);
static const Hotbar2 = const Slot(slot:"hotbar.2",id:2);
static const Hotbar3 = const Slot(slot:"hotbar.3",id:3);
static const Hotbar4 = const Slot(slot:"hotbar.4",id:4);
static const Hotbar5 = const Slot(slot:"hotbar.5",id:5);
static const Hotbar6 = const Slot(slot:"hotbar.6",id:6);
static const Hotbar7 = const Slot(slot:"hotbar.7",id:7);
static const Hotbar8 = const Slot(slot:"hotbar.8",id:8);

// Inventory
static const Inventory0 = const Slot(slot:"inventory.0",id:9);
static const Inventory1 = const Slot(slot:"inventory.1",id:10);
static const Inventory2 = const Slot(slot:"inventory.2",id:11);
static const Inventory3 = const Slot(slot:"inventory.3",id:12);
static const Inventory4 = const Slot(slot:"inventory.4",id:13);
static const Inventory5 = const Slot(slot:"inventory.5",id:14);
static const Inventory6 = const Slot(slot:"inventory.6",id:15);
static const Inventory7 = const Slot(slot:"inventory.7",id:16);
static const Inventory8 = const Slot(slot:"inventory.8",id:17);
static const Inventory9 = const Slot(slot:"inventory.9",id:18);
static const Inventory10 = const Slot(slot:"inventory.10",id:19);
static const Inventory11 = const Slot(slot:"inventory.11",id:20);
static const Inventory12 = const Slot(slot:"inventory.12",id:21);
static const Inventory13 = const Slot(slot:"inventory.13",id:22);
static const Inventory14 = const Slot(slot:"inventory.14",id:23);
static const Inventory15 = const Slot(slot:"inventory.15",id:24);
static const Inventory16 = const Slot(slot:"inventory.16",id:25);
static const Inventory17 = const Slot(slot:"inventory.17",id:26);
static const Inventory18 = const Slot(slot:"inventory.18",id:27);
static const Inventory19 = const Slot(slot:"inventory.19",id:28);
static const Inventory20 = const Slot(slot:"inventory.20",id:29);
static const Inventory21 = const Slot(slot:"inventory.21",id:30);
static const Inventory22 = const Slot(slot:"inventory.22",id:31);
static const Inventory23 = const Slot(slot:"inventory.23",id:32);
static const Inventory24 = const Slot(slot:"inventory.24",id:33);
static const Inventory25 = const Slot(slot:"inventory.25",id:34);
static const Inventory26 = const Slot(slot:"inventory.26",id:35);

// Chest Container
static const Container0 = const Slot(slot:"container.0",id:0);
static const Container1 = const Slot(slot:"container.1",id:1);
static const Container2 = const Slot(slot:"container.2",id:2);
static const Container3 = const Slot(slot:"container.3",id:3);
static const Container4 = const Slot(slot:"container.4",id:4);
static const Container5 = const Slot(slot:"container.5",id:5);
static const Container6 = const Slot(slot:"container.6",id:6);
static const Container7 = const Slot(slot:"container.7",id:7);
static const Container8 = const Slot(slot:"container.8",id:8);
static const Container9 = const Slot(slot:"container.9",id:9);
static const Container10 = const Slot(slot:"container.10",id:10);
static const Container11 = const Slot(slot:"container.11",id:11);
static const Container12 = const Slot(slot:"container.12",id:12);
static const Container13 = const Slot(slot:"container.13",id:13);
static const Container14 = const Slot(slot:"container.14",id:14);
static const Container15 = const Slot(slot:"container.15",id:15);
static const Container16 = const Slot(slot:"container.16",id:16);
static const Container17 = const Slot(slot:"container.17",id:17);
static const Container18 = const Slot(slot:"container.18",id:18);
static const Container19 = const Slot(slot:"container.19",id:19);
static const Container20 = const Slot(slot:"container.20",id:20);
static const Container21 = const Slot(slot:"container.21",id:21);
static const Container22 = const Slot(slot:"container.22",id:22);
static const Container23 = const Slot(slot:"container.23",id:23);
static const Container24 = const Slot(slot:"container.24",id:24);
static const Container25 = const Slot(slot:"container.25",id:25);
static const Container26 = const Slot(slot:"container.26",id:26);
static const Container27 = const Slot(slot:"container.27",id:27);
static const Container28 = const Slot(slot:"container.28",id:28);
static const Container29 = const Slot(slot:"container.29",id:29);
static const Container30 = const Slot(slot:"container.30",id:30);
static const Container31 = const Slot(slot:"container.31",id:31);
static const Container32 = const Slot(slot:"container.32",id:32);
static const Container33 = const Slot(slot:"container.33",id:33);
static const Container34 = const Slot(slot:"container.34",id:34);
static const Container35 = const Slot(slot:"container.35",id:35);
static const Container36 = const Slot(slot:"container.36",id:36);
static const Container37 = const Slot(slot:"container.37",id:37);
static const Container38 = const Slot(slot:"container.38",id:38);
static const Container39 = const Slot(slot:"container.39",id:39);
static const Container40 = const Slot(slot:"container.40",id:40);
static const Container41 = const Slot(slot:"container.41",id:41);
static const Container42 = const Slot(slot:"container.42",id:42);
static const Container43 = const Slot(slot:"container.43",id:43);
static const Container44 = const Slot(slot:"container.44",id:44);
static const Container45 = const Slot(slot:"container.45",id:45);
static const Container46 = const Slot(slot:"container.46",id:46);
static const Container47 = const Slot(slot:"container.47",id:47);
static const Container48 = const Slot(slot:"container.48",id:48);
static const Container49 = const Slot(slot:"container.49",id:49);
static const Container50 = const Slot(slot:"container.50",id:50);
static const Container51 = const Slot(slot:"container.51",id:51);
static const Container52 = const Slot(slot:"container.52",id:52);
static const Container53 = const Slot(slot:"container.53",id:53); 

// Enderchest
static const Enderchest0 = const Slot(slot:"enderchest.0",id:0);
static const Enderchest1 = const Slot(slot:"enderchest.1",id:1);
static const Enderchest2 = const Slot(slot:"enderchest.2",id:2);
static const Enderchest3 = const Slot(slot:"enderchest.3",id:3);
static const Enderchest4 = const Slot(slot:"enderchest.4",id:4);
static const Enderchest5 = const Slot(slot:"enderchest.5",id:5);
static const Enderchest6 = const Slot(slot:"enderchest.6",id:6);
static const Enderchest7 = const Slot(slot:"enderchest.7",id:7);
static const Enderchest8 = const Slot(slot:"enderchest.8",id:8);
static const Enderchest9 = const Slot(slot:"enderchest.9",id:9);
static const Enderchest10 = const Slot(slot:"enderchest.10",id:10);
static const Enderchest11 = const Slot(slot:"enderchest.11",id:11);
static const Enderchest12 = const Slot(slot:"enderchest.12",id:12);
static const Enderchest13 = const Slot(slot:"enderchest.13",id:13);
static const Enderchest14 = const Slot(slot:"enderchest.14",id:14);
static const Enderchest15 = const Slot(slot:"enderchest.15",id:15);
static const Enderchest16 = const Slot(slot:"enderchest.16",id:16);
static const Enderchest17 = const Slot(slot:"enderchest.17",id:17);
static const Enderchest18 = const Slot(slot:"enderchest.18",id:18);
static const Enderchest19 = const Slot(slot:"enderchest.19",id:19);
static const Enderchest20 = const Slot(slot:"enderchest.20",id:20);
static const Enderchest21 = const Slot(slot:"enderchest.21",id:21);
static const Enderchest22 = const Slot(slot:"enderchest.22",id:22);
static const Enderchest23 = const Slot(slot:"enderchest.23",id:23);
static const Enderchest24 = const Slot(slot:"enderchest.24",id:24);
static const Enderchest25 = const Slot(slot:"enderchest.25",id:25);
static const Enderchest26 = const Slot(slot:"enderchest.26",id:26); 

static const MainHand = const Slot(slot: "weapon.mainhand",id:-1);
static const OffHand = const Slot(slot: "weapon.offhand",id:-106);

static const Head = const Slot(slot: "armor.head",id:103);
static const Chest = const Slot(slot: "armor.chest",id:102);
static const Legs = const Slot(slot: "armor.legs",id:101);
static const Feet = const Slot(slot: "armor.feet",id:100);

@override
  String toString() {
    return {"slot":slot,"id":id}.toString();
  }
}