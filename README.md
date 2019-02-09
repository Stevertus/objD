
[//]: # (main)

ObjectiveD is a framework for developing Datapacks for Minecraft. It uses the [Dart](https://www.dartlang.org/guides/language/language-tour) programming language.

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
	objd: ^0.0.4
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
import 'package:objd/code.dart';
```
Then we need to create a new datapack project:
```dart
void main(){
	createProject(
		Project(
			name:"This is going to be the generated folder name",
			target:"./", // path for where to generate the project
			generate: CustomWidget() // The starting point of generation
		)
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
```dart
main: File(
	path: 'main',
	child: Log('Hello World')
)
```
But how to add a list of Actions then? Well there's also an Widget for that:
[For.of]()
```dart
child: For.of(List<Widget>[
	Log('Hello World'),
	Command('setblock 0 0 0 air')
])
```
So now we have a [List](https://www.dartlang.org/guides/language/language-tour#lists) of Widget, so we can use as many as we want

[//]: # (basics/widget)
## Widget
A widget is the base element for basically everything in objectiveD.

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
The [Pack]() class already required some files, therefore this is the definition.

The File constructor has two required arguments:

|constructor | |
|--|--|
| path | the desired file path going from `/data/:packId:/functions/` on |
| child| the content of the file |
| [execute] | Boolean if the function should be executed directly |

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
|type|[EntityType](), id of the entity|
|distance| [Range]() to the entity|
|level|Range of experience levels|
|gamemode|Gamemode type(e.g Gamemode.creative, Gamemode.survival)|
|horizontalRotation|Range of the horizontal facing direction|
|verticalRotation|Range of the vertical facing direction|
|**Methods** |  |
|sort|adds a sort attribute of type [Sort]()|

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
	entity: Entity(
		selector: "e",
		limit: 1,
		type: EntityType.armor_stand,
		distance: Range(to:2),
		level: Range(from: 1),
		gamemode: Gamemode.creative,
		horizontalRotation: Range(from:1),
		verticalRotation: Range(from: 20, to: 80),
	).sort(Sort.random)
)

⇒ say @e[limit=1,type=armor_stand,distance=..2,level=1..,gamemode=creative,y_rotation=1..,x_rotation=20..80,sort=random]
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

[//]: # (basics/item)
## Item
The Item class represents an item in an inventory in Minecraft. It is used in the [Give]() or Nbt Commands.

> This Class is incomplete, more functionality soon...

|constructor | |
|--|--|
|ItemType \| Block \| String|the type of item(required, see example)|
|count|Integer value for the amount of stacked items|
|slot|The current slot of the item(does not work for give)|
|damage|the used durability of the item|
|model|int describing which model varient should be used|
|nbt|addional NBT as Dart Map|

**Example:**
```dart
Give(Entity.Self(),
	item: Item(
		ItemType.iron_axe, // OR Block.stone OR "whatever id"
		count: 5,
		damage: 40,
		model: 3390001,
		nbt: {
			"customNBT":1
		}
	)
)

⇒ give @s minecraft:iron_axe{"customNBT":1,"Damage":40,"CustomModelData":3390001} 5
```
ItemType is like EntityType or Block a utility class to provide a list of all available blocks.

|ItemType([minecraft_item_id])| creates a ItemType from a String |
|--|--|
|ItemType.[minecraft_item_id]|there is also an value for each item in Minecraft|

[//]: # (wrappers/main)
# Command Wrappers
In this section are a few classes that build commands with inputs(Entities, Texts, Blocks, Locations).

[//]: # (wrappers/execute)
## Execute
One of the most used commands has a widget too. The execute command has multiple syntaxes that allow to manipulate the position, executer or condition.

|constructor | |
|--|--|
|children|a List of children that should be executed|
|[encapsulate]|weither the children should be in an extra file for a certain length |
| [as] | an [Entity](#entity) that runs the command|
|[at]|an [Entity](#entity) from where the command should run|

All Execute classes are also an Group, so they will group commands in seperate files and allow multiple children.
Example:
```dart
Execute(
	as: Entity.player(),
	at: Entity.self(),
	children: List<Widget> [
		Command("/say I get executed")
	]
),

⇒ execute as @p at @s run say I get executed
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
[//]: # (wrappers/setblock)
## SetBlock
The SetBlock Command Class sets a Block at the specified location:

|constructor| |
|--|--|
|Block|the Block type you want to set|
|location| where you want to set the block|

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
Give a item to a player.

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

[//]: # (wrappers/summon)
## Summon
The summon class creates a new entity at a given location.

|constructor| |
|--|--|
|EntityType|the type of entity(required)|
|location| the location as type Location(default Location.here())|
|name|a TextComponent respresenting the name of the entity|
|nbt|additional nbt as Map(key-value pairs)|
> This version is not final, there will be more properties in the future!

**Example:**
```dart
Summon(
	EntityType.armor_stand,
	location: Location.rel(x: 0,y:1,z:0),
	name: TextComponent("this is my name",color: Color.DarkBlue),
	nbt: {"Invisible":1}
)
⇒ summon armor_stand ~ ~1 ~ {"Invisible":1,"CustomName":"{\"text\":\"this is my name\",\"color\":\"dark_blue\"}"}
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
There are also some other data sources: TODO: new 1.14 types!

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
	Entity.Self(),
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
|TextClickEvent.item(String)|shows item(Warning!: Not final)|
|TextClickEvent.entity(String,String,String)|displays a dummy entity with name, type and UUID(in this order))|


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

Title.times sets the times

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