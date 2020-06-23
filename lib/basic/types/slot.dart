/// The Slot object gives you certain utils to manipulate Inventories and Containers with the Item, Replaceitem or Data.
class Slot {
  final int id;
  final String slot;

  /// The Slot object gives you certain utils to manipulate Inventories and Containers with the Item, Replaceitem or Data.
  /// Every Slot has a String(slot) like `inventory.10` used in replaceitem and an id like `19` that is used with nbt data.
  /// objD should change between these values automatically for the specific usecase.
  const Slot({this.slot, this.id});

  ///**Slot.inv** takes in two numbers, like `2,6`
  ///The first number represents the row in the inventory, so the second row
  ///And the second number is the sixth slot of that row.
  ///
  /// objD calculates the corresponding Slot. In this case `inventory.14`.
  /// > Notice: also the hotbar can be calculated with this. It is the 4th row

  static Slot inv(int row, [int col]) {
    var res = 0;

    if (col != null) {
      if (col > 0) res = col - 1;
      if (row > 0) res += (row - 1) * 9;
    } else {
      res = row - 1;
    }

    if (res > 26) {
      return Slot(slot: 'hotbar.${res - 27}', id: res - 27);
    } else {
      return Slot(slot: 'inventory.$res', id: res + 9);
    }
  }

  ///used to mark a 3x3 space inside a conventional container.
  ///takes in two numbers, like Slot.inv or one number from 1-9. The start options marks the upper left.
  static Slot craft(int row, [int col, int start = 1]) {
    var res = 0;
    if (col != null) {
      if (col > 0) res = col - 1;
      if (row > 0) res += (row - 1) * 3;
    } else {
      res = row - 1;
    }

    if (res > 5) {
      res = start + 18 + (res - 6);
    } else if (res > 2) {
      res = start + 9 + (res - 3);
    } else {
      res += start;
    }

    return Slot(slot: 'container.$res', id: res);
  }

  /// **Slot.chest** takes in numbers, like `5,6` and an optional boolean for using an enderchest
  /// And does exactly the same as slot.inv but with a container, like a chest.
  static Slot chest(int row, [int col, bool enderchest = false]) {
    var res = 0;

    if (col != null) {
      if (col > 0) res = col - 1;
      if (row > 0) res += (row - 1) * 9;
    } else {
      res = row - 1;
    }

    if (enderchest) {
      return Slot(slot: 'enderchest.$res', id: res);
    }

    return Slot(slot: 'container.$res', id: res);
  }

  /// **Slot.drop** takes in numbers, like `1,3`
  /// This calculates the rows and columns for a 3x3 Container like a Dropper or a Dispenser.
  ///Therefore just values from 1 to 3 are allowed.
  static Slot drop(int row, [int col]) {
    var res = 0;

    if (col != null) {
      if (col > 0) res = col - 1;
      if (row > 0) res += (row - 1) * 3;
    } else {
      res = row - 1;
    }

    return Slot(slot: 'container.$res', id: res);
  }

  Slot clone() {
    return Slot(id: id, slot: slot);
  }

// Hotbar
  static const Hotbar0 = Slot(slot: 'hotbar.0', id: 0);
  static const Hotbar1 = Slot(slot: 'hotbar.1', id: 1);
  static const Hotbar2 = Slot(slot: 'hotbar.2', id: 2);
  static const Hotbar3 = Slot(slot: 'hotbar.3', id: 3);
  static const Hotbar4 = Slot(slot: 'hotbar.4', id: 4);
  static const Hotbar5 = Slot(slot: 'hotbar.5', id: 5);
  static const Hotbar6 = Slot(slot: 'hotbar.6', id: 6);
  static const Hotbar7 = Slot(slot: 'hotbar.7', id: 7);
  static const Hotbar8 = Slot(slot: 'hotbar.8', id: 8);

// Inventory
  static const Inventory0 = Slot(slot: 'inventory.0', id: 9);
  static const Inventory1 = Slot(slot: 'inventory.1', id: 10);
  static const Inventory2 = Slot(slot: 'inventory.2', id: 11);
  static const Inventory3 = Slot(slot: 'inventory.3', id: 12);
  static const Inventory4 = Slot(slot: 'inventory.4', id: 13);
  static const Inventory5 = Slot(slot: 'inventory.5', id: 14);
  static const Inventory6 = Slot(slot: 'inventory.6', id: 15);
  static const Inventory7 = Slot(slot: 'inventory.7', id: 16);
  static const Inventory8 = Slot(slot: 'inventory.8', id: 17);
  static const Inventory9 = Slot(slot: 'inventory.9', id: 18);
  static const Inventory10 = Slot(slot: 'inventory.10', id: 19);
  static const Inventory11 = Slot(slot: 'inventory.11', id: 20);
  static const Inventory12 = Slot(slot: 'inventory.12', id: 21);
  static const Inventory13 = Slot(slot: 'inventory.13', id: 22);
  static const Inventory14 = Slot(slot: 'inventory.14', id: 23);
  static const Inventory15 = Slot(slot: 'inventory.15', id: 24);
  static const Inventory16 = Slot(slot: 'inventory.16', id: 25);
  static const Inventory17 = Slot(slot: 'inventory.17', id: 26);
  static const Inventory18 = Slot(slot: 'inventory.18', id: 27);
  static const Inventory19 = Slot(slot: 'inventory.19', id: 28);
  static const Inventory20 = Slot(slot: 'inventory.20', id: 29);
  static const Inventory21 = Slot(slot: 'inventory.21', id: 30);
  static const Inventory22 = Slot(slot: 'inventory.22', id: 31);
  static const Inventory23 = Slot(slot: 'inventory.23', id: 32);
  static const Inventory24 = Slot(slot: 'inventory.24', id: 33);
  static const Inventory25 = Slot(slot: 'inventory.25', id: 34);
  static const Inventory26 = Slot(slot: 'inventory.26', id: 35);

// Chest Container
  static const Container0 = Slot(slot: 'container.0', id: 0);
  static const Container1 = Slot(slot: 'container.1', id: 1);
  static const Container2 = Slot(slot: 'container.2', id: 2);
  static const Container3 = Slot(slot: 'container.3', id: 3);
  static const Container4 = Slot(slot: 'container.4', id: 4);
  static const Container5 = Slot(slot: 'container.5', id: 5);
  static const Container6 = Slot(slot: 'container.6', id: 6);
  static const Container7 = Slot(slot: 'container.7', id: 7);
  static const Container8 = Slot(slot: 'container.8', id: 8);
  static const Container9 = Slot(slot: 'container.9', id: 9);
  static const Container10 = Slot(slot: 'container.10', id: 10);
  static const Container11 = Slot(slot: 'container.11', id: 11);
  static const Container12 = Slot(slot: 'container.12', id: 12);
  static const Container13 = Slot(slot: 'container.13', id: 13);
  static const Container14 = Slot(slot: 'container.14', id: 14);
  static const Container15 = Slot(slot: 'container.15', id: 15);
  static const Container16 = Slot(slot: 'container.16', id: 16);
  static const Container17 = Slot(slot: 'container.17', id: 17);
  static const Container18 = Slot(slot: 'container.18', id: 18);
  static const Container19 = Slot(slot: 'container.19', id: 19);
  static const Container20 = Slot(slot: 'container.20', id: 20);
  static const Container21 = Slot(slot: 'container.21', id: 21);
  static const Container22 = Slot(slot: 'container.22', id: 22);
  static const Container23 = Slot(slot: 'container.23', id: 23);
  static const Container24 = Slot(slot: 'container.24', id: 24);
  static const Container25 = Slot(slot: 'container.25', id: 25);
  static const Container26 = Slot(slot: 'container.26', id: 26);
  static const Container27 = Slot(slot: 'container.27', id: 27);
  static const Container28 = Slot(slot: 'container.28', id: 28);
  static const Container29 = Slot(slot: 'container.29', id: 29);
  static const Container30 = Slot(slot: 'container.30', id: 30);
  static const Container31 = Slot(slot: 'container.31', id: 31);
  static const Container32 = Slot(slot: 'container.32', id: 32);
  static const Container33 = Slot(slot: 'container.33', id: 33);
  static const Container34 = Slot(slot: 'container.34', id: 34);
  static const Container35 = Slot(slot: 'container.35', id: 35);
  static const Container36 = Slot(slot: 'container.36', id: 36);
  static const Container37 = Slot(slot: 'container.37', id: 37);
  static const Container38 = Slot(slot: 'container.38', id: 38);
  static const Container39 = Slot(slot: 'container.39', id: 39);
  static const Container40 = Slot(slot: 'container.40', id: 40);
  static const Container41 = Slot(slot: 'container.41', id: 41);
  static const Container42 = Slot(slot: 'container.42', id: 42);
  static const Container43 = Slot(slot: 'container.43', id: 43);
  static const Container44 = Slot(slot: 'container.44', id: 44);
  static const Container45 = Slot(slot: 'container.45', id: 45);
  static const Container46 = Slot(slot: 'container.46', id: 46);
  static const Container47 = Slot(slot: 'container.47', id: 47);
  static const Container48 = Slot(slot: 'container.48', id: 48);
  static const Container49 = Slot(slot: 'container.49', id: 49);
  static const Container50 = Slot(slot: 'container.50', id: 50);
  static const Container51 = Slot(slot: 'container.51', id: 51);
  static const Container52 = Slot(slot: 'container.52', id: 52);
  static const Container53 = Slot(slot: 'container.53', id: 53);

// Enderchest
  static const Enderchest0 = Slot(slot: 'enderchest.0', id: 0);
  static const Enderchest1 = Slot(slot: 'enderchest.1', id: 1);
  static const Enderchest2 = Slot(slot: 'enderchest.2', id: 2);
  static const Enderchest3 = Slot(slot: 'enderchest.3', id: 3);
  static const Enderchest4 = Slot(slot: 'enderchest.4', id: 4);
  static const Enderchest5 = Slot(slot: 'enderchest.5', id: 5);
  static const Enderchest6 = Slot(slot: 'enderchest.6', id: 6);
  static const Enderchest7 = Slot(slot: 'enderchest.7', id: 7);
  static const Enderchest8 = Slot(slot: 'enderchest.8', id: 8);
  static const Enderchest9 = Slot(slot: 'enderchest.9', id: 9);
  static const Enderchest10 = Slot(slot: 'enderchest.10', id: 10);
  static const Enderchest11 = Slot(slot: 'enderchest.11', id: 11);
  static const Enderchest12 = Slot(slot: 'enderchest.12', id: 12);
  static const Enderchest13 = Slot(slot: 'enderchest.13', id: 13);
  static const Enderchest14 = Slot(slot: 'enderchest.14', id: 14);
  static const Enderchest15 = Slot(slot: 'enderchest.15', id: 15);
  static const Enderchest16 = Slot(slot: 'enderchest.16', id: 16);
  static const Enderchest17 = Slot(slot: 'enderchest.17', id: 17);
  static const Enderchest18 = Slot(slot: 'enderchest.18', id: 18);
  static const Enderchest19 = Slot(slot: 'enderchest.19', id: 19);
  static const Enderchest20 = Slot(slot: 'enderchest.20', id: 20);
  static const Enderchest21 = Slot(slot: 'enderchest.21', id: 21);
  static const Enderchest22 = Slot(slot: 'enderchest.22', id: 22);
  static const Enderchest23 = Slot(slot: 'enderchest.23', id: 23);
  static const Enderchest24 = Slot(slot: 'enderchest.24', id: 24);
  static const Enderchest25 = Slot(slot: 'enderchest.25', id: 25);
  static const Enderchest26 = Slot(slot: 'enderchest.26', id: 26);

  static const MainHand = Slot(slot: 'weapon.mainhand', id: -1);
  static const OffHand = Slot(slot: 'weapon.offhand', id: -106);

  static const Head = Slot(slot: 'armor.head', id: 103);
  static const Chest = Slot(slot: 'armor.chest', id: 102);
  static const Legs = Slot(slot: 'armor.legs', id: 101);
  static const Feet = Slot(slot: 'armor.feet', id: 100);

  @override
  String toString() {
    return {'slot': slot, 'id': id}.toString();
  }
}
