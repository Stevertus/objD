import 'package:objd/core.dart';
import 'package:objd/src/utils/json_file.dart';

const _CHARS = '#PSVXBJFA';

String _replaceCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) +
      newChar +
      oldString.substring(index + 1);
}

/// A basic recipe takes in ingredient Items with the slot and a result Item.
class Recipe extends Widget {
  final String name;
  final RecipeType type;
  final bool exactlyPlaced;
  final int? exactResult;

  final Item result;
  final Map<int, Item> ingredients;

  final double experience;
  final int cookingtime;

  final int? id;
  static int recipeId = 0;

  /// A basic recipe takes in ingredient Items with the slot and a result Item.
  /// The recipes of a craftingtable are instantiated in the recipes field. A basic recipe takes in ingredient Items with the slot and a result Item.
  ///
  /// |Recipe|  |
  /// |--|--|
  /// | Map<slot,Item> | The ingredients as a Map with the Slot(1 to 9) on the one side and your Item on the other |
  /// |Item| your result Item|
  /// | name           | name of your recipe file(default = recipe)                                                |
  /// |id| overrides the automatically generated id(optional) |
  /// |exactlyPlaced| bool that requires to leave all unused slots empty(default = false) |
  /// |exactResult| a number that limits the result count(optional) |
  ///
  /// **Example:**
  /// ```dart
  /// Recipe(
  ///           {
  ///             1: Item(Blocks.oak_planks),
  ///             2: Item(Blocks.oak_planks),
  ///             4: Item(Blocks.oak_planks),
  ///             5: Item(Blocks.oak_planks),
  ///           },
  ///           Item(Blocks.crafting_table,Count:2,nbt:{'MyNBT':1})
  /// )
  /// ```
  /// You can also set the Count variable of any of the items to generate a ratio. In this case you craft 2 craftingtables out of 4 oak_planks.
  Recipe(
    this.ingredients,
    this.result, {
    this.name = 'recipe',
    this.id,
    this.exactlyPlaced = false,
    this.exactResult,
    this.type = RecipeType.shaped,
    this.experience = 0.1,
    this.cookingtime = 200,
  })  : assert(name != null),
        assert(type != null);

  /// The API also supports shapeless crafting. That means you can set the ingredients in any shape and it would be the same result.
  ///
  /// |Recipe.shapeless|  |
  /// |--|--|
  /// | List\<Item> | The ingredients in any shape(without slots) |
  /// |...| stays the same|
  ///
  /// **Example:**
  ///
  /// ```dart
  /// Recipe.shapeless(
  ///     [
  ///        Item(Blocks.oak_planks),
  ///        Item(Items.diamond)
  ///     ],
  ///     Item(Items.diamond_sword)
  /// )
  /// ```
  factory Recipe.shapeless(
    List<Item> ingreds,
    Item result, {
    String name = 'recipe',
    int? id,
    bool exactlyPlaced = false,
    int? exactResult,
  }) {
    var ingredients = <int, Item>{};
    for (var i = 0; i < ingreds.length; i++) {
      ingredients[i + 1] = ingreds[i];
    }

    return Recipe(
      ingredients,
      result,
      id: id,
      name: name,
      type: RecipeType.shapeless,
      exactlyPlaced: exactlyPlaced,
      exactResult: exactResult,
    );
  }

  /// Since smelting requires just one ingredient, just give it an Item and its result. Futhermore you can change the cooktime and experience gained:
  ///
  /// | Recipe.smelting |                                                                               |
  /// | --------------- | ----------------------------------------------------------------------------- |
  /// | Item            | The ingredient (without slot)                                                 |
  /// | cooktime        | The cook time of the recipe in ticks(default = 200)                           |
  /// | experience      | output experience as double(default = 0.1)                                    |
  /// | type            | Can be changed to RecipeType.blasting, smoking or campfire_cooking (optional) |
  /// | ...             | stays the same                                                                |
  Recipe.smelting(
    Item ingredient,
    this.result, {
    this.name = 'recipe',
    this.id,
    this.exactlyPlaced = false,
    this.exactResult,
    this.experience = 0.1,
    this.cookingtime = 200,
    this.type = RecipeType.smelting,
  }) : ingredients = {1: ingredient};

  /// For smithing you can define an additional item on top to the base item:
  ///
  /// | Recipe.smithing |                 |
  /// | --------------- | --------------- |
  /// | Item            | The ingredient  |
  /// | Item            | result Item     |
  /// | addition        | additional Item |
  /// | ...             | stays the same  |
  Recipe.smithing(
    Item base,
    this.result, {
    Item? addition,
    this.name = 'recipe',
    this.id,
    this.exactlyPlaced = false,
    this.exactResult,
    this.type = RecipeType.smithing,
  })  : experience = 0.1,
        cookingtime = 200,
        ingredients = {
          1: base,
          ...(addition != null ? {2: addition} : {})
        };

  /// Want to stay close to the original minecraft notation and want to prove a pattern? You can also do that with:
  ///
  /// | Recipe.pattern    |                                                                                                   |
  /// | ----------------- | ------------------------------------------------------------------------------------------------- |
  /// | List\<String>     | Each String of Length 3 represents one row in the crafting grid, use the same char for same items |
  /// | Map\<String,Item> | For each used character in the pattern, define a corresponding item                               |
  /// | ...               | stays the same                                                                                    |
  factory Recipe.pattern(
    List<String> pattern,
    Map<String, Item> keys,
    Item result, {
    int? id,
    String name = 'recipe',
    bool exactlyPlaced = false,
    int? exactResult,
    RecipeType type = RecipeType.shaped,
  }) {
    var ingredients = <int, Item>{};
    var i = 1;
    pattern.forEach((String row) {
      if (row.isNotEmpty && row[0] != ' ') ingredients[i] = keys[row[0]]!;
      if (row.length > 1 && row[1] != ' ') ingredients[i + 1] = keys[row[1]]!;
      if (row.length > 2 && row[2] != ' ') ingredients[i + 2] = keys[row[2]]!;
      i += 3;
    });

    return Recipe(
      ingredients,
      result,
      id: id,
      name: name,
      type: type,
      exactlyPlaced: exactlyPlaced,
      exactResult: exactResult,
    );
  }

  /// With objD you can also import usual minecraft recipes in json data. objD automatically parses that and converts it to a command.
  factory Recipe.fromJson(
    Map<String, dynamic> json, {
    int? id,
    bool exactlyPlaced = false,
    int? exactResult,
  }) {
    bool exists(String key, [value]) {
      if (value != null) return json[key] != null && json[key] == value;
      return json[key] != null;
    }

    var ingredients = <int, Item>{};
    RecipeType? type;

    if (exists('type')) {
      if (json['type'] == 'minecraft:crafting_shapeless') {
        type = RecipeType.shapeless;
      } else {
        type = RecipeType.values.firstWhere((t) =>
            (json['type'] as String).contains(t.toString().split('.')[1]));
      }
    }
    type ??= RecipeType.shaped;

    var i = 1;
    if (exists('ingredients')) {
      json['ingredients'].forEach((Map<String, dynamic> item) {
        ingredients[i] = Item.fromJson(item);
        i++;
      });
    }

    late Item result;

    if (exists('result')) {
      result = Item.fromJson(json['result'] as Map<String, dynamic>);
    } else {
      throw 'Recipe without result field detected';
    }
    // key-item paired items
    var items = <String, Item>{};

    if (exists('key')) {
      var keys = json['key'] as Map<String, dynamic>;
      items = keys
          .map((k, v) => MapEntry(k, Item.fromJson(v as Map<String, dynamic>)));
    }

    return Recipe.pattern(
      (json['pattern'] ?? []) as List<String>,
      items,
      result,
      type: type,
      id: id,
      exactlyPlaced: exactlyPlaced,
      exactResult: exactResult,
    );
  }

  @override
  Widget generate(Context context) {
    var n = IndexedFile.getIndexedAndIncrease(name).toString();
    if (n == '0') n = '';
    if (!name.contains('.json')) n += '.json';
    return JsonFile(
      'recipes/' + name + n,
      toJson(),
    );
  }

  MapEntry<List<String>, Map<String, Item>> getPattern() {
    final items = <Item, String>{};
    var pattern = [' ' * 3, ' ' * 3, ' ' * 3];

    ingredients.forEach((k, item) {
      // If the item is not known
      if (!items.containsValue(item)) {
        // choose a new key from _CHARS
        items[item] = _CHARS[items.length];
      }

      k--;

      pattern[k ~/ 3] = _replaceCharAt(pattern[k ~/ 3], k % 3, items[item]!);
    });

    if (!exactlyPlaced) {
      // remove empty columns
      if (pattern[0][2] == ' ' &&
          pattern[1][2] == ' ' &&
          pattern[2][2] == ' ') {
        pattern = pattern.map((row) => row.substring(0, 2)).toList();
      }

      if (pattern[0][0] == ' ' &&
          pattern[1][0] == ' ' &&
          pattern[2][0] == ' ') {
        pattern = pattern.map((row) => row.substring(1)).toList();

        // check second column if first is cleared
        if (pattern[0][0] == ' ' &&
            pattern[1][0] == ' ' &&
            pattern[2][0] == ' ') {
          pattern = pattern.map((row) => row.substring(1)).toList();
        }
      }

      // remove empty rows
      if (pattern.first.trimLeft().isEmpty) {
        pattern = pattern.sublist(1);
        // check second row if first is done
        if (pattern.first.trimLeft().isEmpty) pattern = pattern.sublist(1);
      } else if (pattern[1].trimLeft().isEmpty) {
        pattern = [pattern[0], pattern[2]];
      }

      if (pattern.last.trimLeft().isEmpty) {
        pattern = pattern.sublist(0, pattern.length - 1);
      }
    }

    return MapEntry(pattern, items.map((k, v) => MapEntry(v, k)));
  }

  Map<String, dynamic> toJson() {
    final dat = <String, dynamic>{};

    switch (type) {
      case RecipeType.shaped:
        {
          dat['type'] = 'crafting_shaped';
          final p = getPattern();
          dat['pattern'] = p.key;
          dat['key'] = p.value.map((k, v) => MapEntry(k, v.getMap(false)));
          break;
        }
      case RecipeType.shapeless:
        {
          dat['type'] = 'crafting_shapeless';
          dat['ingredients'] =
              ingredients.values.map((i) => i.getMap(false)).toList();
          break;
        }
      case RecipeType.smithing:
        {
          dat['type'] = 'smithing';
          dat['base'] = ingredients.values.first.getMap(false);
          if (ingredients.length > 1) {
            dat['add'] = ingredients.values.toList()[1].getMap(false);
          }
          break;
        }
      default:
        {
          dat['type'] = type.toString().split('.')[1];
          dat['ingredient'] = ingredients.values.first.getMap(false);
          dat['result'] = 'minecraft:' + result.getId();
        }
    }

    dat['type'] = 'minecraft:' + dat['type'].toString();

    return dat;
  }
}

enum RecipeType {
  shaped,
  shapeless,
  smelting,
  blasting,
  campfire_cooking,
  smoking,
  stonecutting,
  smithing
}
