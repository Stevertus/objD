

[//]: # (main)
# objD

### **O**bjective **B**uilder **J**ust for **D**atapacks

objD is a framework for developing Datapacks for Minecraft. It uses the [Dart](https://www.dartlang.org/guides/language/language-tour) programming language.

[//]: # (why)

## Why a framework?
A framework is a set of utilities to reduce the amount of repetitive work.
I've tried many ways in the past to achieve a quick and easy way to generate Datapacks for Minecraft: A own programming language [mcscript](https://stevertus.com/mcscript), several graphical online generators at [stevertus.com](https://stevertus.com) or premade utilities.

Instead of developing a language, why not using the tools and parser an other language gives you?
By building a custom frame around it you get the **reliability** and the **extensive** debugging tools in Editors.

The generation of Datapacks is **easy**,**fast** and aims to be **less repetitive** and **modular** by utilizing the concept of Widgets as one of the main features.

[//]: # (installation)
## Installation
[Temporary]

You need the Dart SDK for this framework. Download and install it from https://www.dartlang.org/tools/sdk

I would also recommend Visual Studio Code along with the dart plugin to edit dart files very conveniently.

Make a new folder that will house your project wherever you want(I would recommend datapacks folder).

And inside of that create a file named `pubspec.yaml` and another folder called `lib`.

Open the pubspec.yaml file and add 
```yaml
dependencies:  
   objd: ^0.2
```
And run 
```
$  pub get
```
with the console in the new folder(VS code does this automatically)

[//]: # (getting_started)
## Getting started
Let's get started and create our first dart file with `lib/main.dart` file. 

Then we import the framework with:
```dart
import 'package:objd/core.dart';
```
Then we need to create a new datapack project:
```dart
void main(List<String> args){
	createProject(
		Project(
			name:"This is going to be the generated folder name",
			target:"./", // path for where to generate the project
			generate: CustomWidget() // The starting point of generation
		),
		args
	);
}
```
Next of we need to build this custom Widget:
```dart
class CustomWidget extends Widget {
	@override
	Widget generate(Context context){
		
	}
}
```
To get more details on why we build it like that, check out the [Widget]() documentation.

Like we can see the generate method, which is called on build, has to return another Widget, in our case an instance of the Pack class.
```dart
Widget generate(Context context){
	return Pack(
		name:"mypack",
		main: File( // optional
			path: 'main'
		)
	)
}
```
What we are doing right now is to generate a new subpack with a name(This will be the namespace of your functions later) and a main file(runs every tick) with the name "main.mcfunction".

You can run the project already and the result should be a pack with an empty main.mcfunction file.

So lets add some functionality to our project in our main file.
We can use the Log Widget to display a message to the player.
```dart
main: File(
	path: 'main',
	child: Log('Hello World')
)
```
But how to add a list of Actions then? Well there's also an Widget for that:
`For.of`
```dart
child: For.of(List<Widget>[
	Log('Hello World'),
	Command('setblock 0 0 0 air')
])
```
So now we have a [List](https://www.dartlang.org/guides/language/language-tour#lists) of Widget, so we can use as many as we want

[//]: # (basics/widget)
## Widget
A widget is the base element for basically everything in objD.

|property | |
|--|--|
| generate(Context) | returns the underlying Widget Tree |
| toMap() | Similar to toString, but returns a Map tree of the child in generate |

**Example:**
We can use an Widget to get or build functionality. e.g
```dart
// building our own widget:
class CustomCommand extends Widget {
	@override
	Widget generate(Context context){
		// using an existing widget
		return Command('custom')
	}
}
```
[//]: # (basics/context)
## Context
Maybe you already wondered what this context argument here is:
```dart
Widget generate(Context context){
```
The Context is a way to get certain important information from the parents.

|properties|  |
|--|--|
| packId | String of the current pack's name |
| file | the current file name|
| loadFile | the filename of your load  file|
| mainFile | the filename of your main file |
|prefixes| a List of Strings that should be added in front of actions(mainly used by Groups)|

You can use this context to build more modular Widgets and don't need to hardcode certain files and the pack id:

```dart
class LoadWidget extends Widget {
	@override
	Widget generate(Context context){
		return Command('function ' + context.packId + ":" + context.loadFile)
	}
}
```

[//]: # (basics/project)
## Project
The project is a special Widget which is just defined once. It contains some built options, like description or name, but also the entire underlying tree of packs, files and actions.

|constructor | |
|--|--|
| name | the name of the datapack folder |
| generate| a widget that defines the projects content |
| [description] | A description that will go in pack.mcmeta |

**Example:**
```dart
main() {
// create Project takes in one project and compiles it
createProject(
	Project(
	name:  "tested",
	generate:  mainWidget(),
	));
}
```

[//]: # (basics/pack)
## Pack
A pack is logically the next step. This defines a sub-pack with an name again that will be our namespace afterwards.
Here we can also define included files as well as the main and load function:

|constructor | |
|--|--|
| name | the name of the sub-pack|
| [main]| the main file that is ran every tick |
| [load] | the load file that is ran on reload |
| [files] | A List of type File witch includes other needed files |

**Example:**
```dart
Pack(
	name:"tpcraft",
	main: File(...),
	load: File(...),
	files: List<File> [
		File(...)
	]
)
```
The Pack class can be used as often as you want and where you want, so you can also define a new pack in some file.

> Notice: The namespace of the pack is accessible in these files by using the context variable. e.g:
> `Command("function" + context.packId + ":run")`

[//]: # (basics/file)
## File
The [Pack]() class already required some files. The file class simply generates a new mcfunction file with content and a path.

The File constructor has two required arguments:

|constructor | |
|--|--|
| path | the desired file path going from `/data/:packId:/functions/` on |
| child| the content of the file |
| execute | bool if the function should be executed directly(optional) |
| create | bool if the file should be created or just interpreted with execute(optional, default = true)|

The File class can be used as often as you want and where you want, so you can also define a new file in a For container for example.
**Example:**
```dart
Pack(
	name:"tpcraft",
	main: File(
		path:"main",
		// and defining a new file inside of an widget
		child: File.execute( // same as execute: true
			path: 'new'
			child: Command(...)
		)
	),
)
```

[//]: # (basics/extend)
## Extend
Extend is very similar to File, but instead of creating a new file it adds content to an existing file.

|constructor | |
|--|--|
| String | the desired file path going from `/data/:packId:/functions/` on |
| child| the additional content|
| [first] | Boolean if the content should be added in front of the original(def. false) |

So lets say we already have some files in our pack, but want to add something to the main file somewhere entirely else in our project:

```dart
Extend(
	"main",
	child: Command("say okay"),
	first: true
)
``` 
This would add the command `say okay` in front of our main.mcfunction. 

[//]: # (basics/command)
## Command
A Command is a raw action, that is executed by Minecraft directly.

|constructor | |
|--|--|
| String | the raw command in the format "/command" or "command" |

**Example:**
```dart
// using a command in a file:
File(
	path:"command",
	child: Command('/say hey')
)
// uses the say command in command.mcfunction:
say hey
```

[//]: # (basics/for)
## For
The For class enables you to add multiple endpoints to one Widget.

There is always a List of Widgets involved.

|constructor | |
|--|--|
| to | the ending index including itself |
| create | a function returning a Widget based on the index argument |
| [from] | the starting index(default 0) |
| [step ]| the value used in each iteration to increases the index(default 1) |

So the basic for class utilizes a loop from a value to another value:
```dart
File(
	path:"for",
	child: For(
		from: 0,
		to: 5,
		create: (index){
			return Command('/say ' + index.toString())
		}
	)
)
// results in:
say 0
say 1
say 2
say 3
say 4
say 5
```
There is also an other Constructor for looping through a given list of widgets:

|For.of| |
|--|--|
| List of Widgets| loops through each of these Widgets |

**Example:**
```dart
File(
	path:"for_of",
	child: For.of(List<Widget>[
		Command('say 1'),
		Command('say 2'),
		Command('say 3')
	]),
)
// results in:
say 1
say 2
say 3
```

[//]: # (basics/commandlist)
## CommandList
But there is a more efficient way to list raw Minecraft commands. The CommandList Widget allows you to input a List of Commands, a List of Strings representing a command or a multiline string.

|constructor | |
|--|--|
| List| a list of commands or strings |

This has basically the same function as For.of just for commands.
  
```dart
CommandList(List<Command>[
		Command('say 1'),
		Command('say 2'),
		Command('say 3')
]),
```
But there is also a subset which accepts one big multiline string:

|CommandList.str| |
|--|--|
| String| list of commands each on a seperate line |

```dart
CommandList.str("""
	/say 1
	/say 2
	/say 3
"""),
```
The slashes are automatically filtered out.

[//]: # (basics/group)
## Group
The group groups actions similar to for but has an option to prefix each action and encapsulate the content in a new file.

|constructor | |
|--|--|
| prefix| a prefix type of String |
|children|the underlying widgets|
|[suffix]| a String that should be added at the end |
|[filename]| the targeted filename(will be combined with an unique id) |
|[groupMin]|the minimum amount of children to encapsulate(default = 3, set to -1 to disable) |

If the children length is larger or equal groupMin a new file is created in `/objD/`(the working directory for objectiveD) and executed.
```dart
Group(
	prefix: "execute as @e run "
	children: List<Widget>[
		Command('say 1'),
		Command('say 2'),
		Command('say 3')
	],
	filename: "asgroup",
	groupMin: 2
),
```

[//]: # (basics/entity)
## Entity

|constructor | arguments are optional |
|--|--|
|selector|the entity selector(e.g p,s,e or r)|
|limit|number of matched entities|
|tags|a List of Strings or Tags that the entity should have|
|scores|a List of Score matches that the entity should match|
|team|a Team the entity has to be part of|
|type|[EntityType](), id of the entity|
|nbt|a Map of required nbt properties|
|strNbt| option to override the nbt map with a String to support expressions like `1b` |
|area|A Area where the entity should be|
|distance| [Range]() to the entity|
|level|Range of experience levels|
|gamemode|Gamemode type(e.g Gamemode.creative, Gamemode.survival)|
|horizontalRotation|Range of the horizontal facing direction|
|verticalRotation|Range of the vertical facing direction|
|playerName|a String if you prefer to use a playername instead of arguments |
|**Methods** |  |
|sort|adds a sort attribute of type [Sort]()|
| storeResult | Command, path, useSuccess |
|joinTeam|entity joins the given team|
|leaveTeam|entity leaves the current team|
|addTag|adds a new tag to the entity|
|addTags|adds multiple tags|
|removeTag| removes tag again|

storeResult stores a result or success of a command in the nbt path of an entity.
**Example:**
```dart
Entity.Selected().storeResult(
	Command('say hello'),
	path: "Invisisble",
	scale: 1,
	datatype: "byte"
	useSuccess:true
)

⇒ execute store success entity @s Invisisble byte 1 run say hello
```

|Sort|
|--|
|Sort.random|
|Sort.furthest|
|Sort.nearest|
|Sort.albitrary|

The Range class defines a range of values(e.g 3..10 in vanilla)

|Range |  |
|--|--|
|[to]|Number for the maximum range|
|[from]|Number for the minimal range|

|EntityType |  |
|--|--|
|String|String representation of the type|

There is also an EntityType for every type_id in minecraft with `EntityType.[type_id]`

```dart
Say(
	Entity(
		selector: "e",
		limit: 1,
		tags:["first","second"],
		scores:[Score(score1).matches(10)],
		team: Team("my_team"),
		type: EntityType.armor_stand,
		distance: Range(to:2),
		area: Area.fromLocations(
			// use null for a unlimited selection
			Location.glob(x: -10,y: null,z: -10), 
			Location.glob(x: 10, y: null, z: 10)
		),
		level: Range(from: 1),
		gamemode: Gamemode.creative,
		horizontalRotation: Range(from:1),
		verticalRotation: Range(from: 20, to: 80),
	).sort(Sort.random)
)

⇒ say @e[limit=1,tag=first,tag=second,scores:{test=10},team=my_team,type=armor_stand,distance=..2,x=-10,z=-10,dx=20,dz=20,level=1..,gamemode=creative,y_rotation=1..,x_rotation=20..80,sort=random]
```

|specific constructors|  |
|--|--|
|Entity.Selected(...)| creates an entity with @s|
| Entity.Player(...) | creates an entity with @p |
| Entity.PlayerName(String) | creates an entity with an implicit name |
|Entity.All(...)| creates an entity with @a|
|Entity.Random(...)| creates an entity with @r|

[//]: # (basics/tag)
## Tag
A tag saves a boolean value with an entity inside the game.

|constructor|  |
|--|--|
|String|the name of the tag|
| entity| the entity you that want to assign a tag to |
| value | the boolean value(default true) |

**Example:**
```dart
Tag("firstTag",entity:Entity.Player(),value: true)
⇒ tag @p add firstTag
```
There is also the add or remove method for changing a variable:
```dart
Tag mytag = Tag("firstTag",entity:Entity.Player())
// in generate
mytag.add(),
mytag.remove()

⇒ tag @p add firstTag
⇒ tag @p remove firstTag
```
Also consider the addTag method on an entity.
### toggle
With the toggle method you can toggle the value(invert the tag). This is done with a temporary tag:
```dart
Tag("mytag",entity:Entity.Selected()).toggle()
⇒ execute if entity @s[tag=mytag] run tag @s add objd_temp
⇒ execute if entity @s[tag=objd_temp] run tag @s remove mytag
⇒ execute if entity @s[tag=!objd_temp] run tag @s add mytag
⇒ tag @s remove objd_temp
```
### removeIfExists
The `removeIfExists` method removes the tag and may execute some action before if the tag exists.
```dart
Tag("mytag",entity:Entity.Selected()).removeIfExists(
	then: Say("removed")
) // optional argument
⇒ execute if entity @s[tag=mytag] run say removed
⇒ execute if entity @s[tag=mytag] run tag @s remove mytag
```

[//]: # (basics/scoreboard)
## Scoreboard
A scoreboard objective holds values, kind a like a Variable inside Minecraft. The Scoreboard class just handles adding or removing objectives. The value assignment is handled by the Score class.

|constructor|  |
|--|--|
|String|name of the objective(required)|
|type|the objective type (default = dummy)|
|display|TextComponent that displays the name|
|addIntoLoad|bool whether the scoreboard should be added into your load file(default = true)|

objD automatically keeps a list of all scoreboards and inserts them into the given load file, ignoring doubled names.
**Example:**
```dart
Scoreboard(
"death_count",
type: "deathCount",
display: TextComponent("This is how many deaths you have:"),
addIntoLoad: true
)
Scoreboard("death_count")

// load.mcfunction:
/scoreboard objectives add death_count deathCount [{"text":"This is how many deaths you have:"}]
```
So the second scoreboard was not added because one "death_count" already existed.

The `Scoreboard.add` constructor does exactly the same but puts the result without checking in the current file.

`Scoreboard.remove` removes an objective by its name again.

With `Scoreboard.setdisplay` you can display the values:

|Scoreboard.setdisplay|  |
|--|--|
|String|name of the objective(required)|
|display|String for display location (default = sidebar)|

[//]: # (basics/score)
## Score
The score class is the basis for setting values, calculating with scores and checking the values.
It implements one base class with no functionality and several methods to do actions:

|constructor|  |
|--|--|
|Entity| the entity within the scoreboard |
|String| the name of the objective |
|addNew| bool whether it should add the scoreboard itself if it does not exist(default = true)|

> With the addNew property it is not required to add a scoreboard before!
#### Calculations
These methods can be used to set or calculate the value:

| name | arguments |
|--|--|
| set | int |
| reset ||
| add | int |
| subtract|int|
||**The following compare another Score**|
|setEqual|Score|
|swapWith|Score|
|setToSmallest|Score|
|setToBiggest|Score|
|addScore|Score|
|subtractScore|Score|
|multiplyByScore|Score|
|divideByScore|Score|
|modulo|Score|
|setToData|Data|
|setToResult|Command,useSuccess(bool)|

> All of these methods return a new instance of Score with the calculations applied.
> So you can also chain single calculations or use multiple on one base Score.

**Examples:**
```dart
// defining scores variables inside the widget
Score base = Score(Entity.Selected(),"score",addNew: true)
Score another = Score(Entity.Selected(),"score2")
// ... in the generate method:
base.set(5).add(3).subtract(10).reset()
⇒ scoreboard players set @s score 5
⇒ scoreboard players add @s score 3
⇒ scoreboard players remove @s score 10
⇒ scoreboard players reset @s score

base.setEqual(another).swapWith(another).setToBiggest(another)
⇒ scoreboard players operation @s score = @s score2
⇒ scoreboard players operation @s score >< @s score2
⇒ scoreboard players operation @s score > @s score2

another.addScore(base).divideByScore(base).modulo(base)
⇒ scoreboard players operation @s score2 += @s score
⇒ scoreboard players operation @s score2 /= @s score
⇒ scoreboard players operation @s score2 %= @s score

// setToData must take in Data.get 
base.setToData(Data.get(Location("~ ~ ~"),"Items[0].Count"))
⇒ execute store result score @s score run data get block ~ ~ ~ Items[0].Count 1

// using success instead of result
base.setToResult(Command("say hi"),useSuccess:true) 
⇒ execute store success score @s score run say hi
```
#### Conditions
These methods can be used for example with if to match values:

| name | arguments |example Result|
|--|--|--|
|matches|int|@s score matches 5|
|matchesRange|Range|@s score matches 0..20|
|isEqual|Score|@s score = @s score2|
|isSmaller|Score|@s score < @s score2|
|isSmallerOrEqual|Score|@s score <= @s score2|
|isBigger|Score|@s score > @s score2|
|isBiggerOrEqual|Score|@s score >= @s score2|

### Constant Score
Do you need constant values with scores? objD got you covered with `Score.con`:

|Score.con| |
|--|--|
|int| a constant number |
|addNew|bool whether it should add objd_consts itself if it does not exist(default = true)|

This will automatically create a scoreboard called `objd_consts` and set the value to the fake entity `#[value]`
**Example:**
```dart
Score.con(5)
⇒ scoreboard players set #5 objd_consts 5
```
### Selected Score
Often times you want the score of a selected Entity(@s). Score.fromSelected is the same as Score but has a predefined entity.
**Example:**
```dart
Score.fromSelected("objective").set(3)
⇒ scoreboard players set @s objective 3
```

[//]: # (basics/block)
## Block
There is also a util class called Block which provides a wrapper for all available blocks in Minecraft.
**Usage:**
```dart
Block([minecraft_block_id]) // as string or
Block.[minecraft_block_id]
```
All ids can be found [here](https://minecraft.gamepedia.com/Block#List_of_blocks).
But you can also insert a block by its string:

|constructor | |
|--|--|
|String|the minecraft block id|


Example:
```dart
SetBlock(
	Block.stone,
	location: Location.here()
)
```

[//]: # (basics/location)
## Location
In the block example we already used a class called Location. This translates into Minecraft Coordinates.

|constructor | |
|--|--|
|String|the minecraft coordinate string(e.g "~ ~ ~")|

```dart
SetBlock(Block.stone,location: Location("~ 5 ~"))
```
There is also a shortcut for " ~ ~ ~ ":

|Location.here| Selects the current Position |
|--|--|

```dart
Location.here()
⇒ ~ ~ ~
```

But the Location class also provides a wrapper for global coordinates:

|Location.glob| |
|--|--|
|x|a double defining the absolute x coordinate|
|y|a double defining the absolute y coordinate|
|z|a double defining the absolute z coordinate|

```dart
Location.glob(x: 5,y: 51.5,z: 784.20) 
⇒ 5 51.5 784.2
```
And also for relative coordinates:

|Location.rel| |
|--|--|
|x|a double defining the relative x coordinate|
|y|a double defining the relative y coordinate|
|z|a double defining the relative z coordinate|

```dart
Location.rel(x: 5,y: 1.5,z: 0)
⇒ ~5 ~1.5 ~
```
And local coordinates(depends on the rotation of the head):

|Location.local| |
|--|--|
|x|a double defining the local x coordinate|
|y|a double defining the local y coordinate|
|z|a double defining the local z coordinate|

```dart
Location.local(x: 0,y: 1,z: 2.5)
⇒ ^ ^1 ^2.5
```

There is also a method for a location:

|methods|  |
|--|--|
| storeResult | Command, path, useSuccess |
This stores a result or success of a command in the nbt path of a location.
**Example:**
```dart
Location.here().storeResult(Command('say hello'),path: "Items[0].tag.command",useSuccess:true)

⇒ execute store success block ~ ~ ~ Items[0].tag.command run say hello
```
[//]: # (basics/area)
## Area
The Area class provides a way to select a three dimensional space between some locations.
Therefore it automatically builds the lowest and highest coordinates and calculates the distances.

|constructor | doubles |
|--|--|
|x1|one x corner|
|y1|one y corner|
|z1|one z corner|
|x2|second x corner|
|y2|second x corner|
|z2|second x corner|
This is especially useful for `if blocks`, Fill and Clone. 

**Example:**
```dart
Area(x1: 100, y1: -15.75, z1: 0, x2: 2, y1: 10, z2: -10)
⇒ 2 -15.75 -10 100 10 0
```
But if you would also like local or relative coordinates, you can always pass the locations directly:

|Area.fromLocations| |
|--|--|
|Location|location 1|
|Location|location 2|

[//]: # (basics/rotation)
## Rotation
The Rotation class is very similar to Location but takes in just two directions for an entities rotation:

|constructor | |
|--|--|
|String|the minecraft coordinate string(e.g "~ ~")|

|Rotation.glob| |
|--|--|
|x|int representing global x orientation|
|y|int representing global y orientation|

|Rotation.rel| |
|--|--|
|x|int representing rotation relative to the current x orientation|
|y|int representing rotation relative to the current y orientation|

**Example:**
```dart
Rotation.rel(x: 90,y: 180)
⇒ ~90 ~180

Execute.rotated(Rotation.glob(x:0,y:90),children:[
	Command("tp @s ^ ^ ^10")
])
⇒ execute rotated 0 90 run command tp @s ^ ^ ^10
```

[//]: # (basics/data)
## Data
The Data Widgets allows you to edit nbt data of Entities or Blocks.

|constructor| |
|--|--|
|dynamic|The target Entity OR Block which you want to modify|
|nbt|A Dart Map containing new nbt data|
|strNbt| option to override the nbt map with a String to support expressions like `1b` |
|type|A String defining the operation type(default=merge)|

**Example:**
```dart
Data(
	Entity.Selected(),
	nbt: {
		"Invisible":1,
		"NoGravity":1
	}
)
⇒ data merge entity @s {"Invisible":1,"NoGravity":1}
```
> There are also subconstructors for each operation type(Data.merge, Data.get, Data.remove)

And the modify operation is also available, yet a bit more complex:

|Data.modify| |
|--|--|
|dynamic|The target Entity OR Location which you want to modify|
|path|the nbt path you want to modify|
|modify|A DataModify object defining which parameters you want to modify|

So this is split up into a seperate class: 
**DataModify**
There are five sub operations again: set, merge, prepend, append and insert.
All follow this constructor rules:

|DataModify| |
|--|--|
|dynamic|The source of the modification. Can be a Map, String, Number, Entity or Location|
|fromPath|optional path for the Entity or Location source from where to read the data|

So we can for Example use
```dart
Data.modify(
	Entity.Selected(),
	path: "my_Custom_Path",
	modify: DataModify.set(
		"hey" // or {"nbt":"here"} or 56
	),
)
⇒ data modify @s my_Custom_Path set value "hey"
```
Or
So we can for Example use
```dart
Data.modify(
	Entity.Selected(),
	path: "my_Custom_Path2",
	modify: DataModify.insert(
		Entity.Selected(), // or Location... to get data from a block
		index: 2, // insert also needs an additional index
		fromPath: "my_Custom_Path"
	),
)
// this just copies one property to another
⇒ data modify @s my_Custom_Path2 insert from entity @s my_Custom_Path
```

A handy shortcut for that is the Data.copy constructor, which just copies a property from one path to another:

|Data.copy| |
|--|--|
|dynamic|The target Entity OR Location which you want to modify|
|path|the nbt path you want to copy to|
|from|The source Entity OR Block|
|fromPath|The source nbt path|

```dart
Data.copy(
	Entity.Selected(),
	path: "my_Custom_Path2",
	from: Location("~ ~-1 ~"),
	fromPath: "Items[0].tag.display.name"
)
⇒ data modify @s my_Custom_Path2 set from block ~ ~-1 ~ Items[0].tag.display.name
```

[//]: # (basics/item)
## Item
The Item class represents an item in an inventory in Minecraft. It is used in the [Give]() or Nbt Commands.

> This Class is incomplete, more functionality soon...

|constructor | |
|--|--|
|ItemType \| Block \| String|the type of item(required, see example)|
|count|Integer value for the amount of stacked items|
|name|a TextComponent showing a name|
|lore| a  List of TextComponents giving extra information|
|slot|The current slot of the item(does not work for give)|
|damage|the used durability of the item|
|model|int describing which model varient should be used|
|nbt|addional NBT as Dart Map|

**Example:**
```dart
Give(Entity.Selected(),
	item: Item(
		ItemType.iron_axe, // OR Block.stone OR "whatever id"
		count: 5,
		name: TextComponent("My Item",color:Color.Black),
		lore: [
			TextComponent("My Description",color:Color.Blue),
		],
		damage: 40,
		model: 3390001,
		nbt: {
			"customNBT":1
		}
	)
)

⇒ give  @s minecraft:iron_axe{"customNBT":1,"Damage":40,"CustomModelData":3390001,"display":{"Name":"{\"text\":\"My Item\",\"color\":\"black\"}","Lore":["{\"text\":\"My Description\",\"color\":\"blue\"}"]}} 5
```
ItemType is like EntityType or Block a utility class to provide a list of all available items.

|ItemType([minecraft_item_id])| creates a ItemType from a String |
|--|--|
|ItemType.[minecraft_item_id]|there is also an value for each item in Minecraft|

[//]: # (wrappers/main)
# Command Wrappers
In this section are a few classes that build commands with inputs(Entities, Texts, Blocks, Locations).

[//]: # (wrappers/comment)
## Comment
The Comment widget generates a simple line with some annotations(# ...).
It also features a simple line break:
**Example:**
```dart
Comment("hello world")
⇒ # hello world
Comment.LineBreak()
⇒ 

```

[//]: # (wrappers/execute)
## Execute
One of the most used commands has a widget too. The execute command has multiple syntaxes that allow to manipulate the position, executer or condition.

|constructor | |
|--|--|
|children|a List of children that should be executed(required)|
|encapsulate|weither the children should be in an extra file for a certain length |
| as | an [Entity](#entity) that runs the commands|
|at|an [Entity](#entity) from where the command should run|
|If| a Condition that must be true to execute the commands|
|location| a Location or Entity from where to run the commands |
|align| String with align statements e.g: "xyz" |
|anchor|either Facing.eyes or Facing.feet|
|facing| A Location or Entity to rotate to |
|rotation| A rotation of type [Rotation](#rotation)|
|dimension|Dimension of overworld, the_end or the_nether|
|targetFilePath|force the group to use this path instead of `/objd/`|
|targetFileName|force the group to use this name instead of automatic generated names|

All Execute classes are also an Group, so they will group commands in seperate files and allow multiple children.
Example:
```dart
Execute(
	as: Entity.player(),
	at: Entity.Selected(),
	If: Condition.entity(Entity())
	location: Location.here(),
	align: "yz",
	anchor: Facing.eyes,
	facing: Location().glob(x:0,y:0,z:0)
	rotation: Rotation.rel(x:10,y:20),
	dimension: Dimension.the_nether
	children: List<Widget> [
		Command("/say I get executed")
		Say("Me too")
	]
),

⇒ execute as @p at @s if entity @e positioned ~ ~ ~ align yz anchored eyes facing 0 0 0 rotated ~10 ~20 in the_nether run say I get executed
  execute as @p at @s if entity @e positioned ~ ~ ~ align yz anchored eyes facing 0 0 0 rotated ~10 ~20 in the_nether run say Me too
```

|Execute. as | |
|--|--|
|Entity|the entity from which the children should run|
|children|a List of children that should be executed|
|[encapsulate]|same as base |

This is just a different notation for Execute.
```dart
Execute.as(
	Entity.player(),
	children: List<Widget> [
		Command("/say I get executed")
	]
),

⇒ execute as @p run say I get executed
```

|Execute. at | |
|--|--|
|Entity|the entity from where the children should run|
|children|a List of children that should be executed|
|[encapsulate]|same as base |

```dart
Execute.at(
	Entity.player(),
	children: List<Widget> [
		Command("/say I get executed")
	]
),

⇒ execute at @p run say I get executed
```

|Execute.asat | |
|--|--|
|Entity|the entity from which and where the children should run|
|children|a List of children that should be executed|
|[encapsulate]|same as base |

Asat combines as and at to just one entity.
```dart
Execute.asat(
	Entity.player(),
	children: List<Widget> [
		Command("/say I get executed")
	]
),

⇒ execute as @p at @s run say I get executed
```

|Execute.positioned| |
|--|--|
|Entity\|Location|the new position |
|...||

Positioned sets the execution point of the command to a new Location or Entity.
```dart
Execute.positioned(
	Entity.player(), // Location...
	children: List<Widget> [
		Command("/say I get executed")
	]
),

⇒ execute positioned as @p run say I get executed
```


|Execute.align| |
|--|--|
|String|representation of the alignment |
|...||

Aligns the position to the corners of the block grid.

|Execute.anchored| |
|--|--|
|Facing|Facing.eyes or Facing.feet |
|...||

Sets the execution position(^ ^ ^) to the eyes or the feet.


|Execute.facing| |
|--|--|
|Entity or Location|the target to face(required) |
|facing| either face the Facing.eyes(default) or Facing.feet |
|...||

Sets the execution rotation so that it faces a location or an entity's feet or eyes.
**Example:**
```dart
Execute.facing(
	Entity.player(), // or Location...
	facing: Facing.feet // optional
	children: List<Widget> [
		Command("/say I get executed")
	]
)
⇒ execute facing entity @p feet run say I get executed
```


|Execute.rotated| |
|--|--|
|Rotation|the rotation object |
|...||

Sets the execution rotation to the given rotation.

|Execute.dimension| |
|--|--|
|Dimension|the given dimension type |
|...||

Sets the execution dimension(execute in) to either `Dimension.overworld`, `Dimension.the_end` or `Dimension.the_nether`.

### Methods
All of these constructors are also available as methods with some additional utils:

|Methods|  |
|--|--|
| center | centeres the alignment(middle of the block) |

That means you can chain the actions, like with score, and use multiple actions at once:

```dart
// declaring the base
Execute ex = Execute(
	children:[
		Say("Hello"),
		Command("say e")
	]
)
// in the generate method:
ex.asat(
Entity.All())
	.center()
	.positioned(Location.rel(x:0,y:20,z:0))
⇒ execute as @a at @s align xyz positioned ~0.5 ~0.5 ~0.5 positioned ~ ~20 ~ run say Hello
   execute as @a at @s align xyz positioned ~0.5 ~0.5 ~0.5 positioned ~ ~20 ~ run say e
```

[//]: # (wrappers/if)
## If
The if widget accepts a Condition and runs the children if the condition is true.
If just gives you an execute wrapper with if and else statements. The conditions have their own class.

|constructor| |
|--|--|
|Condition| the condition |
|Then|a List of Wigets that runs on match|
|Else|a List of Widget that runs if it does not match(optional)|
|targetFilePath|force the group to use this path instead of `/objd/`|
|targetFileName|force the group to use this name instead of automatic generated names|
|encapsulate| bool whether it should create a new file |

**Example:**
```dart
If(
	Condition(Entity.Player()),
	Then: [
		Log("true")
	],
	Else: [
		Log("false")
	]
)
⇒ execute if entity @p run say true
⇒ execute unless entity @p run say false
```
> Not Final! Will be done with tags later on.

You can also negate the Condition with `If.not`:
```dart
If.not(
	Condition(Entity.Player()),
	Then: [
		Log("true")
	]
)
⇒ execute unless entity @p run say true
```

[//]: # (wrappers/condition)
## Condition
The Condition class defines conditions for the if widget and more. It can also combines conditions and generates an argument list.

|constructor| |
|--|--|
|dynamic|the thing you want to test|
Well it is not as easy as it looks. A condition can accept many values and this makes the Condition very complex. 

| The argument can be a... | and generates e.g ||
|--|--|--|
| Entity | if entity @s |
| Score | if score @s objective matches 5| Attention! This needs a score condition method!
| Tag | if entity @s[tag=test] | turns a tag into an entity |
| Location | unless block ~ ~2 ~ air | Just checks whether a block is present
| Condition | if entity @s if block ~ ~ ~ stone | Yes, you can nest Conditions like Widgets and combine them.

**Examples:**
```dart
If(
	Condition(
		Entity.Selected()
	)
	,Then:[Log('entity')],
)
⇒ execute if entity @s run say entity
If(
	Condition(
		Location.here()
	),
	Then:[Say('block')],
)
⇒ execute unless block ~ ~ ~ minecraft:air run say block
If.not(
	Condition(
		Score(
			Entity.PlayerName("Stevertus"),
			"objective"
		).matches(10)
	),
	Then:[Say('score')],
)
⇒ execute unless score Stevertus objective matches 10 run say score
```

For Score, Block and Entity there is also a named constructor along with:

|Condition.blocks| |
|--|--|
|Area| the Area of blocks that you want to compare |
|compare| the lowest comparison Location of the area of the same size |

**Condition.block**: also requires a block type:
```dart
If(
	Condition.block(
		Location.here(),
		block: Block.stone
	),
	Then:[Say('stone')],
)
⇒ execute if block ~ ~ ~ minecraft:stone run say stone
```

**Condition.not**: accepts same dynamic condition types as above but negates them
(if ⇒ unless, unless ⇒  if)

**Condition.and**: accepts a list of dynamic condition types, that all have to be true to trigger:
```dart
If(
	Condition.and([
		Location.here(),
		Entity(),
		Condition(...)
	]),
	Then:[Say('true')],
)
⇒ execute unless block ~ ~ ~ minecraft:air if entity @e if ... run say true
```
**Condition.or**: accepts a list of dynamic condition types, but just one has to be true to trigger:
```dart
If(
	Condition.or([
		Location.here(),
		Entity(),
		Condition(...)
	]),
	Then:[Say('true')],
)
⇒ execute unless block ~ ~ ~ minecraft:air run tag @p add objd_isTrue1
⇒ execute if entity @e run tag @p add objd_isTrue1
⇒ execute if ... run tag @p add objd_isTrue1
⇒ execute as @p if entity @s[tag=objd_isTrue1] run say true
⇒ tag @p remove objd_isTrue1
```
> Just temporary, will be done with tags later...

With this knowledge we can build pretty complex logical conditions:
```dart
If.not(
	Condition.and([
		Condition.not(Entity.Player()),
		Condition.or([
			Entity.Random(),
			Condition.blocks(
				Area(x1: 0, y1: 0, z1: 0, x2: 10, y2: 10, z2: 10),
				compare: Location('~ ~ ~'),
			),
			Condition.not(
				Condition.score(
					Score(Entity.Selected(),"test")
					  .matchesRange(Range(from:0,to:5))	
				),
			),
		]),
	]),
	Then: [Say("I'm done")]
)
⇒ 
execute if entity @p unless entity @r run tag @p add objd_isTrue1
execute if entity @p unless blocks 0 0 0 10 10 10 ~ ~ ~ run tag @p add objd_isTrue1
execute if entity @p if score @s test matches 0..5 run tag @p add objd_isTrue1
execute as @p if entity @s[tag=objd_isTrue1] run say I'm done
tag @p remove objd_isTrue1
```
[//]: # (wrappers/team)
## Team
The team Wiget is a wrapper for the team command and allows you to group entities together and apply group rules.

There are a few constructors:

**Team(String)** - just adds a new team
**Team.add(String,[options])** - adds the team and also applies some modifiers to it(take a look at Team.modify)
**Team.empty(String)** - clears the team and removes all entities in it
**Team.join(String, Entity)** - adds the entity to the team(an entity can only be in one team at a time)
**Team.leave(Entity)** - the entity is removed from their current team

|Team.modify or Team.add| |
|--|--|
|String|name of the team|
|display|TextComponent showing the team name in chat or scoreboard|
|color| the teams Color |
|nametag| Either ModifyTeam.[always,never,hideForOtherTeam,hideForOwnTeam] |
|collision| Either ModifyTeam.[always,never,pushOtherTeams,pushOwnTeam] |
|deathMessage|Either ModifyTeam.[always,never,hideForOtherTeam,hideForOwnTeam] |
|friendlyFire|Should a member be able to hit a team mate?(bool)|
|seeInvisisble|Should a member be able to see an invisible team mate?(bool)|
|prefix| a String showing in front of a player name |
|suffix| a String showing after a player name |

**Example:**
```dart
Team.add(
	"test",
	collision:ModifyTeam.always,
	color:Color.Red,
	display:  TextComponent("Hello"),
	friendlyFire:  true,
	suffix:  "Test",
	deathMessage:  ModifyTeam.hideForOwnTeam
)
⇒ team add test
⇒ team modify test displayName {"text":"Hello"}
⇒ team modify test color red
⇒ team modify test deathMessageVisibility hideForOwnTeam
⇒ team modify test friendlyFire true
⇒ team modify test collisionRule always
⇒ team modify test suffix Test
```

[//]: # (wrappers/effect)
## Effect
This command is used to give an entity a specific effect and affect their gameplay.

|constructor| |
|--|--|
|EffectType| the kind of effect - usage: EffectType.[effect_id] |
| entity | the Entity you want to give the effect to(required) |
|duration| the amount of seconds the effect should last(default = 30) |
|amplifier| the strength of the effect(default = 1) |
|showParticles| bool if effect particles should be visible(default = true) |

**Example:**
```dart
Effect(
	EffectType.jump_boost,
	entity: Entity.Player(),
	duration: 20,
	amplifier: 3,
	showParticles: false
)
⇒ effect give @p minecraft:jump_boost 20 3 true
```

Of course you can clear an effect again:

|constructor| |
|--|--|
|Entity| the entity that you want to clear |
|EffectType| the type of effect you want to clear(optional) |

**Example:**
```dart
Effect.clear(Entity.Player(),EffectType.jump_boost)
⇒ effect clear @p minecraft:jump_boost
```

[//]: # (wrappers/setblock)
## SetBlock
The SetBlock Command Class sets a Block at the specified location:

|constructor| |
|--|--|
|Block|the Block type you want to set|
|location| where you want to set the block|
|nbt|nbt as Map for the block|

Example:
```dart
SetBlock(
	Block.stone,
	location: Location.glob(
		x: 5,
		y: 0,
		z: 20
	)
)
⇒ setblock 5 0 20 minecraft:stone
```
[//]: # (wrappers/fill)
## Fill
Fill acts similar to setblock, but fills a whole area instead.

|constructor| |
|--|--|
|Block|the fill material|
|area|the Area to fill|

> Tip: There are also constructors for Fill.destroy, Fill.hollow, Fill.outline and Fill.keep

**Example:**
```dart
Fill(
	Block.dirt,
	area: Area.fromLocations(
		Location.glob(x: 0, y: 0, z: 0),
		Location.glob(x: 10, y: 20, z: 10)
	),
)
⇒ fill 0 0 0 10 20 10 minecraft:dirt
```
You can also just replace specific other blocks:

|Fill.replace| |
|--|--|
|...|Everything the same|
|replace| the Block type you want to replace |

**Example:**
```dart
Fill.replace(
	Block.dirt,
	area: Area.fromLocations(
		Location.glob(x: 0, y: 0, z: 0),
		Location.glob(x: 10, y: 20, z: 10)
	),
	replace: Block.stone,
)
⇒ fill 0 0 0 10 20 10 minecraft:dirt replace minecraft:stone
```

[//]: # (wrappers/clone)
## Clone
The clone command clones an Area to another Location with different modes.

|constructor| |
|--|--|
|Area|The Area that you want to copy|
|to| A Location where to paste the area|

**Example:**
```dart
Clone(
	Area(x1:0,y1:0,z1:0,x2:10,y2:10,z2:10),
	to: Location.here()
)
⇒ clone 0 0 0 10 10 10 ~ ~ ~
```
There are also the masked and replace modes:

|Clone.masked or Clone.replace| |
|--|--|
|Area|...|
|to|...|
|mode| a String assembling another option(optional. either normal, force or move)|

The same goes with `Clone.filtered` but it also accepts a property called block to just copy the specified block

**Example:**
```dart
Clone.filtered(
	Area(x1:0,y1:0,z1:0,x2:10,y2:10,z2:10),
	to: Location.here(),
	block: Block.air,
	mode: "move"
)
⇒ clone 0 0 0 10 10 10 ~ ~ ~ filtered minecraft:air move
```

[//]: # (wrappers/say)
## Say
The Say Class writes a simple message or an entity in the chat.

|constructor| |
|--|--|
|msg|Message as String|
|entity| enity of type Entity|

**You can't put both parameters in Say!**

Example:
```dart
Say(
	msg: "Hello"
)
⇒ say Hello
Say(
	entity: Entity.Player()
)
⇒ say @p
```

[//]: # (wrappers/give)
## Give
Gives a item to a player.

|constructor| |
|--|--|
|Entity|The player|
|item|the Item you want to give(required) |

**Example:**
```dart
Give(Entity.Player(),
	item: Item(
		ItemType.apple,
		count: 5
	)
)

⇒ give @s minecraft:apple 5
```

[//]: # (wrappers/replaceitem)
## Replaceitem
Sets a specific container slot to a item.
* for Entities:

|constructor| |
|--|--|
|Entity|The entity|
|item|the Item you want to set(required) |
|slot|a String representation of the slot(required)|

**Example:**
```dart
Replaceitem(Entity.Player(),
	slot: "hotbar.5"
	item: Item(
		ItemType.apple,
		count: 5,
		model: 339001
	)
)

⇒ replaceitem entity @p hotbar.5 minecraft:apple{"CustomModelData":339001} 5 
```
> replaceitem block will follow

[//]: # (wrappers/particle)
## Particle
The particle command spawns particles in the world to enhance certain graphics.

|constructor| |
|--|--|
|ParticleType| the type of the particle( ParticleType.[particle_id] ) |
|location| where to show the particle(required) |
| delta | the directions in which the particle expands(Location.glob, optional) |
| speed | the speed of the expanding particle(optional, but delta required) |
| count| the amount of particles(optional, but delta required) |
| force | bool if the particle should be visible from far away(optional)|

**Example:**
```dart
Particle(
	ParticleType.flame,
	location: Location.here(),
)
⇒ particle minecraft:flame ~ ~ ~
Particle(
	ParticleType.end_rod,
	location: Location.here(),
	delta: Location.glob(x: 1,y:4,z:0),
	speed: 2
	count: 100,
	force: false
)
⇒ particle minecraft:end_rod ~ ~ ~ 1 4 0 2 100 normal 
```
For the Block and Item particle(shows item or block break) there is a named constructor:

|Particle.block or Particle.item| |
|--|--|
|Item or Block| the block or item you want to show |
| ... | same as Particle

**Example:**
```dart
Particle.block(Block.sandstone,location:Location.here())
⇒ particle minecraft:block sandstone ~ ~ ~
```

[//]: # (wrappers/summon)
## Summon
The summon class creates a new entity at a given location.

|constructor| |
|--|--|
|EntityType|the type of entity(required)|
|location| the location as type Location(default Location.here())|
|name|a TextComponent respresenting the name of the entity|
|nameVisible|bool if name is shown|
|invulnerable|bool|
|persistent|bool|
|noAI|bool|
|silent|bool|
|small|bool|
|gravity|bool (put negated value in NoGravity)|
|glowing|bool|
|passengers|List of Summon Widgets that ride the entity|
|effects|List of Effects|
|tags|List of tags as String|
|fire|ticks(int) the entity should be on fire|
|age|int|
|rotation|initial Rotation|
|nbt|additional nbt as Map(key-value pairs)|

**Example:**
```dart
Summon(
	EntityType.armor_stand,
	location: Location.rel(x: 0,y:1,z:0),
	name: TextComponent("this is my name",color: Color.DarkBlue),
	invulnerable:true,
	small: true,
	gravity: false,
	fire: 100,
	effects:[Effect(EffectType.glowing,duration: 10,showParticles:false)],
	rotation: Rotation.abs(x: 10,y:100),
	nbt: {"Invisible":1},
)
⇒ summon armor_stand ~  ~1  ~  {"Invisible":1,"CustomName":"{\"text\":\"this is my name\",\"color\":\"dark_blue\"}","Invulnerable":1,"Small":1,"NoGravity":1,"ActiveEffects":[{"Id":24,"Amplifier":0,"Duration":200,"ShowParticles":0}],"Fire":100,"Rotation":[10.0,100.0]}
```

[//]: # (wrappers/schedule)
## Schedule
Schedule schedules a file for the future. It delays its execution by the given ticks.

|constructor| |
|--|--|
|String|name of a function(without namespace)|
|ticks| the delay |

You can also use Schedule.file that requires a file instead to define both in one statement.

**Example:**
```dart
Schedule("timer",ticks:20)
⇒ schedule function example:timer 20t
```

[//]: # (wrappers/teleport)
## Teleport
Sets the location of an Entity to a new Location and Rotation(optional).

|constructor| |
|--|--|
|Entity|the entity you want to teleport(required)|
|to|the target Location(required)|
|facing| a Location or Entity to face|
|rotation|a Rotation object defining the new rotation|

**Example:**
```dart
Teleport(
	Entity.Player(),
	to: Location.glob(x: 5, y: 10, z: 5),
	facing: Location.here()
)
⇒ tp @p 5 10 5 facing ~ ~ ~
```
And you can also teleport to another entity:

|Teleport.entity| |
|--|--|
|Entity|the entity you want to teleport(required)|
|to|the target entity(required)|
|facing| a Location or Entity to face|

```dart
Teleport(
	Entity.Player(),
	to: Entity(name: "target", limit: 1)
)
⇒ tp @p @e[name="target",limit=1]
```

[//]: # (wrappers/trigger)
## Trigger
Trigger is a way to give the player(without op) permission to change his score in a scoreboard.
The permission must be granted with `Trigger.enable`:

| Trigger.enable |  |
|--|--|
|Score|the entity and score to enable|

Then you can trigger the score:

| constructor |  |
|--|--|
|String| the objective to change|
|addNew| if the objective should automatically be created(default = true)|

Or add or set a specific value:

| Trigger.add or Trigger.set|  |
|--|--|
|String| ...|
|value| an int to add to the current value(required) |
|addNew| ...|

**Example:**
```dart
Trigger.set(
	"test_objective",
	value: 5
)
⇒ trigger test_objective set 5
```

[//]: # (text/main)
# Texts and Strings

In Minecraft text in the chat or as title is defined with JSON-data. objD makes the JSON part of it easier by utilizing a few classes:

|TextComponent| |
|--|--|
|String|the text displayed (required)|
|color|a the color of the type Color|
|bold|bool whether it is bold|
|italic|bool whether it is italic|
|underlined|bool whether it is underlined|
|strikethrough|bool whether it is strikethrough|
|obfuscated|bool whether it is obfuscated|
|clickEvent|A TextClickEvent to handle left clicks|
|hoverEvent|A TextHoverEvent to handle mouse overs|
|insertion| a String witch is inserted into the input if shift left clicked|

Puuh, that are a lot of properties, we'll come to Color, TextClickEvent  and TextHoverEvent  in a bit.

**Example**
```dart
Title(
	Entity.Player(),
	show: [
		TextComponent("Hello",
			color: Color.White,
			bold: true,
			italic:true,
			underlined: true,
			strikethrough: false,
			obfuscated: false,
			clickEvent: TextClickEvent.open_url("https://stevertus.com"),
			hoverEvent: TextHoverEvent.text([TextComponent("hover me")]),
			insertion: "panic"
		)
	]
)
⇒ title @p title [{"text":"Hello","color":"white","bold":true,"italic":true,"underlined":true,"clickEvent":{"action":"open_url","value":"https://stevertus.com"},"hoverEvent":{"action":"text","value":[{text:"hover me"}]}}]
```
Now, its up to you to decide which is easier to read.
There are also some other data sources: 

|TextComponent.translate| |
|--|--|
|String|the translate key (required)|
|conversionFlags|a List of strings that replace placeholder values(e.g $s)|
|...same properties...|from TextComponent|

|TextComponent.score| |
|--|--|
|Entity|the entity with the score(required)|
|objective|Name of the Scoreboard Objective(required)|
|...same properties...|from TextComponent|

```dart
TextComponent.score(
	Entity.Selected(),
	objective: "myscores",
	color:Color.Black
)
⇒ {"score":{"name": "@s","objective":"myscores"},"color":"black"}
```

|TextComponent.selector| |
|--|--|
|Entity|the entity whose name you want to display(required)|
|...same properties...|from TextComponent|

```dart
TextComponent.selector(
	Entity(name:"hello"),
	color:Color.Black
)
⇒ {"selector":"@e[name=hello]","color":"black"}
```

|TextComponent.entityNbt| |
|--|--|
|Entity|the entity which has nbt to display|
|path| the path as a String |
|interpret|bool if nbt should be interpreted as TextComponent(optional)|
|...same properties...|from TextComponent|

```dart
TextComponent.entityNbt(
	Entity.Selected(),
	path: "CustomName"
	underlined: true
)
⇒ {"entity":"@s","nbt":"CustomName","underlined":true}
```

|TextComponent.blockNbt| |
|--|--|
|Location|a location of a block|
|path| the path as a String |
|interpret|bool if nbt should be interpreted as TextComponent(optional)|
|...same properties...|from TextComponent|

```dart
TextComponent.blockNbt(
	Location.glob(x:5,y:10,z:100),
	path: "Items[0].tag.display.Name"
	interpret: true
)
⇒ {"block":"5 10 100","nbt":"Items[0].tag.display.Name","interpret":true}
```

|TextComponent.lineBreak|
|--|--|
|This inserts a simple line break|

|TextComponent.customFont||
|--|--|
|String| a Custom Font Character(\u[HEX]) to insert in your text|
|...same properties...|from TextComponent|

```dart
TextComponent.customFont("\uFaa4")
⇒ {"text":"\uFaa4","color":"white"}
```

**Attention: This requires a custom negative spaces font by AmberW installed(https://cdn.discordapp.com/attachments/157097006500806656/486915349569208322/NegativeSpaceFont3.zip)**

|TextComponent.space|  |
|--|--|
|int| the pixel amount you want to move the next TextComponent (positive or negative)|
|...same properties...|from TextComponent|

This automatically calculates the custom characters for moving your text horizontally.

```dart
Tellraw(
	Entity.All(),
	show:[
		TextComponent.space(478),
		TextComponent("This is moved")
	]
)
⇒ tellraw  @a  [{"text":"\uF82D\uF82C\uF82B\uF829\uF828\uF826"},{"text":"This is moved"}]
```


[//]: # (text/colors)
## Colors

|Color([color_name]) |or |
|--|--|
|Color.[color_name]|Uppercase!|

See all available colors: https://minecraft.gamepedia.com/Formatting_codes#Color_codes

**Examples:**
```dart
Color.Black,
Color.DarkPurple
Color("gold")
Color('dark_green')
```

[//]: # (text/click)
## TextClickEvent
Fires on left click, Part of TextComponent.

|constructors||
|--|--|
|TextClickEvent.open_url(String)|Opens the specified web url|
|TextClickEvent.run_command(Command)|runs the command|
|TextClickEvent.suggest(Command)|puts the command in the chat input|
|TextClickEvent.change_page(int)|turns a books page to the value(just Books!)|


[//]: # (text/hover)
## TextHoverEvent
Fires on mouse over, Part of TextComponent.

|constructors||
|--|--|
|TextClickEvent.text(List\<TextComponent>)|Accepts a new List of TextComponents to display|
|TextClickEvent.achievement(String)|shows achievement|
|TextClickEvent.item(Item)|shows item|
|TextClickEvent.entity(String,String,String)|displays a dummy entity with name, type and UUID(in this order))|

[//]: # (text/log)
## Log
The log widgets displays a console logging in the players chat. That way you can quickly check execution times, score values and entities.

|constructor||
|--|--|
|String, Score or Entity| message to display |
|to|which player you want to send the log(default = `Entity.All()`) |
|color|the color of the console indicator(default = Color.DarkAqua)|

**Example:**
```dart
Log("Hello there!",color:Color.White),
⇒ tellraw @a [{"text":"Console > ","color":"white"},{"text":"Hello there!"}]
Log(Score(Entity.Selected(),"objective"),to: Entity.Selected())
⇒ tellraw @s [{"text":"Console > ","color":"dark_aqua"},{"score":{"name":"@s","objective":"objective"}}]
```

[//]: # (text/title)
## Title
To display our TextComponent, we need the `/title` command and the Title class wrapper.

|constructor||
|--|--|
|selector|the Entity for the title to show|
|show|A List of TextComponents to show|

**Example**
```dart
Title(
	Entity.Player(),
	show: List<TextComponent>[
		TextComponent(
			"hey",
			color: Color.Black
		)
	]
)
⇒ title @p title [{"text":"hey","color":"black"}]
```
The same goes also for subtitle and actionbar:

|Title.subtitle or Title.actionbar||
|--|--|
|selector|the Entity for the title to show|
|show|A List of TextComponents to show|

Title.clear clears all titles again:

|Title.clear||
|--|--|
|selector|clears title for the selector|

Title.times sets the timings

|Title.times||
|--|--|
|selector|edit the durations for this selector|
|fadein|the fadein time in ticks(default 20)|
|display|the time the title stays in ticks(default 60)|
|fadeout|the fadeout time in ticks(default 20)|

And also a resetter for that:

|Title.resetTimes||
|--|--|
|selector|resets times for this selector|

**Examples:**
```dart
Title.actionbar(
	Entity.All(),
	show: [
		TextComponent("hey")
	]
)
⇒ title @a actionbar [{"text":"hey"}]
Title.clear(Entity())
⇒ title @e clear

Title.times(Entity.All(),fadein:30,display:40,fadeout:20)
⇒ title @a times 30 40 20

Title.resetTimes(Entity.All())
⇒ title @a reset
```

[//]: # (text/tellraw)
## Tellraw 
The Tellraw class is very similar to the Title class, but shows its texts in the chat:

|constructor||
|--|--|
|selector|the Entity for the text to show|
|show|A List of TextComponents to show|

**Example**
```dart
Tellraw(
	Entity.Player(),
	show: List<TextComponent>[
		TextComponent(
			"hey",
			color: Color.Black
		)
	]
)
⇒ tellraw @p [{"text":"hey","color":"black"}]
```
### Item.Book
This provides a book generator to use TextComponents with Books.
| Item.Book |  |
|--|--|
| List of BookPage | content of the pages |
| title | a String to give the book a title(optional) |
|author| displays an author message (optional) |
|...| same as **Item**|

The page itself is another class:
| BookPage |  |
|--|--|
| content | either a String, TextComponent or List of TextComponents |

Or with a custom font character:

|BookPage.customFont|  |
|--|--|
| String | your custom character(\u[HEX]) |

A possible book could look like this:

```dart
Item.Book(
 [
   BookPage("This is the title page"),
   BookPage(
     TextComponent("Colored text",color:Color.Blue),
   ),
   BookPage.customFont("\uEaa2"),
   BookPage([
     TextComponent("one text"),
     TextComponent(
	     "another clickable text",
	     clickEvent:TextClickEvent.change_page(0)
     )
   ])
 ],
 title: "my book",
 lore: [TextComponent("This is my description")]
)
⇒ minecraft:written_book{"title":"my book","author":"","pages":["[{\"text\":\"This is the title page\"}]","[{\"text\":\"Colored text\",\"color\":\"blue\"}]","[{\"text\":\"\uEaa2\",\"color\":\"white\"}]","[{\"text\":\"one text\"},{\"text\":\"another clickable text\",\"clickEvent\":{\"action\":\"change_page\",\"value\":\"0\"}}]"],"display":{"Lore":["{\"text\":\"This is my description\"}"]}}
```
[//]: # (text/Book Generator)
### Item.Book
This provides a book generator to use TextComponents with Books.
| Item.Book |  |
|--|--|
| List of BookPage | content of the pages |
| title | a String to give the book a title(optional) |
|author| displays an author message (optional) |
|...| same as **Item**|

The page itself is another class:
| BookPage |  |
|--|--|
| content | either a String, TextComponent or List of TextComponents |

Or with a custom font character:

|BookPage.customFont|  |
|--|--|
| String | your custom character(\u[HEX]) |

A possible book could look like this:

```dart
Item.Book(
 [
   BookPage("This is the title page"),
   BookPage(
     TextComponent("Colored text",color:Color.Blue),
   ),
   BookPage.customFont("\uEaa2"),
   BookPage([
     TextComponent("one text"),
     TextComponent(
	     "another clickable text",
	     clickEvent:TextClickEvent.change_page(0)
     )
   ])
 ],
 title: "my book",
 lore: [TextComponent("This is my description")]
)
⇒ minecraft:written_book{"title":"my book","author":"","pages":["[{\"text\":\"This is the title page\"}]","[{\"text\":\"Colored text\",\"color\":\"blue\"}]","[{\"text\":\"\uEaa2\",\"color\":\"white\"}]","[{\"text\":\"one text\"},{\"text\":\"another clickable text\",\"clickEvent\":{\"action\":\"change_page\",\"value\":\"0\"}}]"],"display":{"Lore":["{\"text\":\"This is my description\"}"]}}
```

[//]: # (text/bossbar)
## Bossbar
The Bossbar shows up on the top of a specific player screen and displays a text with a value bar.

|constructor||
|--|--|
|String|id of the bossbar(tip: use [namespace]:id to avoid interference)|
|name| a String for the displayed text(optional) |

This alone would add a new bossbar to the game:
```dart
Bossbar("test:mybar","This is my bar")
⇒ bossbar add test:mybar {"text":"This is my bar"}
```
To modifiy some properties, there are some methods on the Bossbar to change the output:
### Methods

**remove** - removes the selected bossbar in the game
**show** - takes in an entity and shows the bossbar for the selected players
**get** - gets an BossbarOption of the specified Bossbar

> BossbarOption.max, BossbarOption.value, BossbarOption.visible or BossbarOption.players

|set| sets an option of the bossbar |
|--|--|
|name| displayed String |
|nameTexts| a List of TextComponents that override the name with more control |
|color| the Color of the Bossbar |
|style| a Style Mode |
|value| the displayed value |
|max| the maximum amount of the displayed value |
|visible| bool if the bossbar is visible|
|players| the Entityselector to which the bossbar is displayed |

The set method generates multiple commands: 
```dart
Bossbar("test:mybar").set(
	name:"My name",
	value: 5,
	max: 10,
	color: Color.Red,
	players: Entity.All()
)
⇒ bossbar set test:mybar name {"text":"My name"}
⇒ bossbar set test:mybar color red
⇒ bossbar set test:mybar value 5
⇒ bossbar set test:mybar max 10
⇒ bossbar set test:mybar players @a 
```

[//]: # (utils/main)
# Utils
Util Widgets provide a complete solution that Minecraft does not support that easily out of the box and make your workflow easier and faster.
They are often generating packs, scoreboards and files themselves.

[//]: # (utils/timeout)
## Timeout
A Timeout is a simple delay in your code. It is done with the Schedule Command and generates a File under the hood.

| constructor |  |
|--|--|
| String | the name of the timeout(used as filename) |
| children | the content that should be delayed |
| ticks | the delay as integer ticks |
| path |the folder path(optional, default = "timers")|

**Example:**
```dart
Timeout(
	"timeout1",
	children: [Say("Timeout reached")],
	ticks: 100
)
⇒ schedule function example:timers/timeout1 100t
// timers/timeout1:
⇒ say Timeout reached
```
[//]: # (utils/timer)
## Timer
A Timer is very similar to a Timeout, but instead of delaying the code it is run over and over again always delayed by the ticks. In the end it creates a loop with slower tick speed as 20t/s to perform some operations more performant.

| constructor |  |
|--|--|
| String | the name of the timeout(used as filename) |
| children | the content that should be delayed |
| ticks | the delay as integer ticks |
|infinite| should it run infinitely? (default = true) |
| path |the folder path(optional, default = "timers")|

**Example:**
```dart
Timer(
	"timer1",
	children: [Say("Timer reached")],
	ticks: 100
)
⇒ function example:timers/timer1
// timers/timer1:
⇒ say Timer reached
⇒ schedule function example:timers/timer1 100t
```
It is recommended to start these timers in your load function. 

With a finite timer, you can also stop the timer with `Timer.stop`:

```dart
Timer(
	"timer2",
	infinite:false,
	children: [Say("Timer reached")],
	ticks: 10
)
Timer.stop("timer2")
```
This uses a tag internally to stop scheduling the next timeout if the tag is existing.

[//]: # (utils/repeat)
## Repeat
The Repeat Widget repeats a given action multiple times with a tick delay.

|constructor| |
|--|--|
|String|name of the Repeat|
|child|the action to perform(required)|
|to| times to repeat(required) |
|ticks| ticks between repetitions(default = 1 tick)  |
|path|where to generate a new repeat file(default = timers)|
|counter|the objective used to hold the current iteration(default = objd_repeat)|

**Example:**
```dart
Repeat("repeat1",
	to:  10,
	child:  Log("test"),
	ticks:  20
)
⇒ scoreboard players set repeat1 objd_repeat 0
⇒ function mypack:timers/repeat1
```
This would save the current iteration in a fake player repeat1 in objd_repeat and generate a schedule function:
```mcfunction
# timers/repeat1
tellraw @a [{"text":"Console > ","color":"dark_aqua"},{"text":"test"}]
scoreboard players add repeat1 objd_repeat 1
execute if score repeat1 objd_repeat matches ..10 run schedule function mypack:timers/repeat1  20t
```
This function is executed until the score becomes 11.

[//]: # (utils/armorstand)
## ArmorStand
An armorstand can be created with the Summon Widget, but there is also a specific Widget with special properties for an ArmorStand.

|constructor| |
|--|--|
|Location| the location as type Location(default Location.here())|
|name|a TextComponent respresenting the name of the entity|
|nameVisible|bool if name is shown|
|invulnerable|bool|
|invisible|bool|
|marker|bool|
|basePlate|bool|
|hasArms|bool|
|small|bool|
|gravity|bool|
|glowing|bool|
|tags|List of tags as String|
|fire|ticks(int) the entity should be on fire|
|rotation|initial Rotation|
|mainHand| An Item placed in the main hand|
|offHand| An Item placed in the offhand|
|head| An Item placed in the head slot|
|chest| An Item placed in the chest slot|
|legs| An Item placed in the legs slot|
|boots| An Item placed in the boots slot|
|nbt|additional nbt as Map(key-value pairs)|

> Pose is coming soon

This generates a summon command: 
```dart
ArmorStand(
Location.here(),
name:  TextComponent("Test", color:  Color.DarkPurple),
nameVisible:  true,
marker:  true,
mainHand:  Item(ItemType.clock),
)
⇒ summon armor_stand ~  ~  ~  {"Marker":1,"HandItems":[{"id":"minecraft:clock"},{}],"CustomName":"{\"text\":\"Test\",\"color\":\"dark_purple\"}","CustomNameVisible":1}
```
Often times you need a static armorstand that just acts as a marker for a location, there is ArmorStand.staticMarker that sets properties automatically.
```dart
ArmorStand.staticMarker(Location.glob(),tags:["experimental"])
⇒ summon armor_stand 0  0  0  {"Marker":1,"Invisible":1,"Invulnerable":1,"NoGravity":1,"Tags":["experimental"]}
```
[//]: # (utils/areaeffectcloud)
## AreaEffectCloud
An areaeffectcloud can be created with the Summon Widget, but there is also a specific Widget with special properties for an AreaEffectCloud.

| constructor |  |
|--|--|
|Location| the location as type Location(default Location.here())|
|name|a TextComponent respresenting the name of the entity|
|age|int|
|radius|the radius an effect applies|
|applicationDelay|int|
|tags|List of tags|
|duration|int|
|waitTime|int|
|nbt|additional nbt as Map|

This would create an Areaeffectcloud that only lasts the current tick: 
```dart
AreaEffectCloud(
	Location.here(),
	name: TextComponent("myname"),
	waitTime: 10,
)
⇒ summon area_effect_cloud ~  ~  ~  {"WaitTime":10,"CustomName":"{\"text\":\"myname\"}"}
```
To keep the entity alive there is`AreaEffectCloud.persistent` that sets the age to multiple years.

| AreaEffectCloud.persistent|  |
|--|--|
|Location| the location as type Location(default Location.here())|
|name|a TextComponent respresenting the name of the entity|
|radius|the radius an effect applies|
|applicationDelay|int|
|tags|List of tags|
|nbt|additional nbt as Map|

**Example:**
```dart
AreaEffectCloud.persistent(Location.here(),tags:["new_tag"])
⇒ summon area_effect_cloud ~  ~  ~  {"Duration":-1,"WaitTime":-2147483648,"Tags":["new_tag"],"Age":-2147483648}
```
[//]: # (utils/hologram)
A Hologram shows a floating text at a specific Location using Armorstands.

| constructor |  |
|--|--|
|String|the text to display(can also be multiline string)|
|location|the position(required)|
|color|a Color|
|tags|additional tags for the armorstands|
|space|the space in between the lines(default = 0.25)|

**Example:**
```dart
Hologram("""
Hello,
World!
""",
	location:  Location.here(),
	color:Color.Aqua,
)
⇒ summon armor_stand ~  ~0.25  ~  {"Marker":1,"Invisible":1,"CustomName":"{\"text\":\"Hello,\",\"color\":\"aqua\"}","Invulnerable":1,"CustomNameVisible":1,"NoGravity":1,"Tags":["objd_hologram"]}

⇒ summon armor_stand ~  ~  ~  {"Marker":1,"Invisible":1,"CustomName":"{\"text\":\"World!\",\"color\":\"aqua\"}","Invulnerable":1,"CustomNameVisible":1,"NoGravity":1,"Tags":["objd_hologram"]}
```
If you wish you can also assign each line a seperate TextComponent with `Hologram.multiple`

| Hologram.multiple|  |
|--|--|
|List of TextComponents|Component for each line|
|...| same as Hologram|

[//]: # (utils/randomscore)
## RandomScore
The RandomScore Widget assigns a random value to a score using the UUID of an areaeffectcloud.

| constructor |  |
|--|--|
|Entity| the entity to save the result to |
|to|the max value(required)|
|from|the minimum value(default = 0)|
|objective|The scoreboard objective to save the values(default = objd_random)|
|targetFileName|force a specific file|
|targetFilePath|force a specific folder(other than objd)|

**Example:**
```dart
RandomScore(
	Entity.Selected(),
	from: 5
	to:  100,
	targetFileName:  "random"
)
⇒ scoreboard players set #max objd_random 96
⇒ function mypack:objd/random
⇒ scoreboard players add @s objd_random 5
```
```mcfunction
# objd/random1
summon area_effect_cloud ~ ~ ~ {"Tags":["objd_random"]}
execute store result score @s objd_random run data get entity @e[tag=objd_random,sort=nearest,limit=1] UUIDMost 0.0000000001
scoreboard players operation @s objd_random %= #max objd_random
```
[//]: # (utils/aroundlocation)
## AroundLocation
Often times you need to check blocks or entities around one Location. AroundLocation utilizes this by using just one build method for all sides:

| constructor |  |
|--|--|
|double| the amount you want to go to each side(required)|
|build| a method requiring one Location argument and returning a Widget(required)|
|top|bool for +y|
|bottom|bool for -y|
|left|boo for +x|
|right|bool for -x|
|front|bool for +z|
|back|bool for -z|

**Example:**
```dart
AroundLocation(
	1,
	build: (Location loc){
		return Setblock(Block.stone,location:loc)
	}
)
⇒ setblock ~1 ~ ~ stone
⇒ setblock ~-1 ~ ~ stone
⇒ setblock ~ ~1 ~ stone
⇒ setblock ~ ~-1 ~ stone
⇒ setblock ~ ~ ~1 stone
⇒ setblock ~ ~ ~-1 stone
```
[//]: # (utils/Raycast)
## Raycast
The Raycast Widget is one of the most powerful widgets by giving you many options to configure raytracing in Minecraft.
Internally it uses local coordinates, a distance counter and recursion.

|constructor|  |
|--|--|
| Entity | from which entity to go from |
|onhit|a List of Widgets that execute on a hit|
|max| maximum block distance(optional)|
|step| how many steps to go forward each iteration(default = 1) |
|through| a Block or Blocktag with passable Blocks(default = air) |
|ray|a Function with an interface for each iteration(optional)|
|scoreName|option to specify counter score(default = objd_count)|

There are a lot of values to play around, but this here would make a fully functioning raycast function:
```dart
Raycast(
	Entity.All(),
	onhit: [
		SetBlock(Block.sandstone,location:Location.here())
	]
)
⇒ execute as @a at @s anchored eyes positioned ^  ^  ^ anchored feet run function mypack:objd/ray1
```
```mcfunction
# objd/ray1 file
execute unless block ~ ~ ~ minecraft:air run tag @s add objd_ray_hit
execute unless entity @s[tag=objd_ray_hit] positioned ^ ^ ^1 run function mypack:objd/ray1
execute if entity @s[tag=objd_ray_hit] run function mypack:objd/rayhit1
execute if entity @s[tag=objd_ray_hit] run tag @s remove objd_ray_hit

# objd/rayhit1 file
setblock  ~  ~  ~  minecraft:sandstone
```

objD takes the hard work and generates the commands based on your inputs.
### Customization
There is the ray argument to give you more control over the ray.
Here you can execute Widgets for each step and optionally stop or let the ray hit an obstacle.
In Dart this is done with a Function:
```dart
Raycast(
	Entity.All(),
	onhit: [
		SetBlock(Block.sandstone,location:Location.here())
	],
	ray: (stop, hit){
		return If(...,Then:[stop()]); 
		// stop and hit are functions as well 
		//that can be executed to perform actions
	}
)
```
Let's also change other inputs:
```dart
Raycast(
	Entity.All(),
	onhit: [
		SetBlock(Block.sandstone,location:Location.here())
	],
	ray: (stop, hit) => If(...,Then:[stop()]),
	max: 10, // set maximum distance to 10 blocks
	step: 0.1,
	through: Block("#minecraft:transparent"),
)
⇒ scoreboard players set @s objd_count 0
⇒ execute as @a at @s anchored eyes positioned ^ ^ ^ anchored feet run function mypack:objd/ray1
```
```mcfunction
# objd/ray1 file
# our blocktag:
execute unless block ~ ~ ~ #minecraft:transparent run tag @s add objd_ray_hit
# the result of the ray function:
execute if ... run tag @s add objd_ray_stop
# our distance increases:
scoreboard players add @s objd_count 1
# command changed depending on our inputs:
execute unless entity @s[tag=objd_ray_hit] unless entity @s[tag=objd_ray_stop] if score @s objd_count matches ..100 positioned ^ ^ ^0.1 run function mypack:objd/ray1
execute if entity @s[tag=objd_ray_hit] run function mypack:objd/rayhit1
execute if entity @s[tag=objd_ray_hit] run tag @s remove objd_ray_hit
tag @s remove objd_ray_stop
```
[//]: # (utils/Do-Loop)
## Do Until/While Loop
This Loop repeats a set of widget as long/until a condition is/becomes true.
The Loop uses a Grouped File and Recursion to repeat commands.

| Do.While|  |
|--|--|
|Condition or conditional value| a condition to test for each iteration |
|then| a List of Widgets to execute each time |
|testBefore| test before entering the loop if condition is true(optional) |

> Until just negates the Condition

**Example:**

```dart
Do.Until(Tag("istrue",entity:  Entity.All()),then:[
	Say("repeat")
])
⇒ execute unless entity @a[tag=istrue] run function  mypack:objd/doloop1
```
```mcfunction
# objd/doloop1 file
say repeat
execute unless entity @a[tag=istrue] run function  mypack:objd/doloop1
```

[//]: # (utils/ForEach)
## ForEach Loop
The ForEach Loop repeats a set of widgets for each value in a Score.
Therefore a file is called recursively and a counter score is increased.

| constructor |  |
|--|--|
|Score| the score to iterate through |
|then| A Function that takes in the count Score |
|from| the initial value for the counter(default = 0) |
|counter| an Entity to hold the count value(default = #objd_foreach) |
|step| how much to increase or decrease the counter each time(default = 1) |

**Example:**
```dart
ForEach(
	Score(Entity.All(), "myscore"), 
	then: (score) {
		return  Log(score);
	}
)
⇒ scoreboard players set #objd_foreach objd_count 0
⇒ execute if score #objd_foreach objd_count < @a myscore run function mypack:objd/foreach2
```
```mcfunction
# objd/foreach2 file
tellraw  @a  [{"text":"Console > ","color":"dark_aqua"},{"score":{"name":"#objd_foreach","objective":"objd_count"}}]
scoreboard players add #objd_foreach objd_count 1
execute if score #objd_foreach objd_count <= @a myscore run function  mypack:objd/foreach2
```


[//]: # (global_commands)
## Global CLI Commands
objD has some useful console commands. To activate the global package(will be available anywhere on your system), run this command:
```
pub global activate objd
```
This will add the commands to your console.
To run a command run:  
```
objd [command] [args]
```
OR
```
pub global run objd:[command] [args]
```
> If the objd command is not available, you have to add the pub cache to your system path. Follow this tutorial: [https://www.dartlang.org/tools/pub/cmd/pub-global#running-a-script-from-your-path](https://www.dartlang.org/tools/pub/cmd/pub-global#running-a-script-from-your-path)



### Commands
* **help** - opens a help menu with all commands
* **new** [project_name] - generates a new project from a boilerplate
* **run** [project_root] - builds one project
* **serve** [directory] [project_root] - watches the directory to change and builds the project on change

### Build Options
You can use certain arguments to pass options to the build methods.
This argument list can directly be edited in createProject:
```dart
createProject(
	Project(...),
	["arg1","arg2", ... ] // arguments as optional List
)
```
**OR** (what I recommend) you can just take the program arguments from main:
```dart
void main(List<String> args) {
  createProject(
    Project(...),
    args
  );
}
```
This allows you to use the arguments in the execution command, like:
* ```dart index.dart arg1 -min``` 
* ```objd run index.dart arg1 -min``` 
* ```objd serve . index.dart -min``` 

**All Available Arguments:**
* `-min`: This minifies the file amount by ignoring the mcmeta and tag files
* `-prod`: This creates a production build of your project and saves it into another datapack(`(prod)` added).
In Production Comments and line breaks are removed and every widget can access the prod value in Context to get notified.
* `-debug`: This creates a debug json file in your project root, that lists all properties and other generated files