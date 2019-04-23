## 0.2
* Completly reworked build algorithms that run the generate method just once.
* improved performace
* added new build arguments in createProject
* new build arguments -min -prod and -debug
* access to the prod property on context to change widget behaviour in productive build
* comments and line breaks get automatically removed in productive build
* added number and boolean arguments for Log
* fixed double and unmatching group ids with multiple packs and widgets
* fixed TextClickEvent.runCommand to include a / (Thanks Dommi)
* fixed data modify command generator (Thanks Vinicius Rangel for pull)

## 0.1.3

* added Bossbar
* added nbt TextComponents
* added encapsulate to If
* added strNbt to Data and Entity to support unvalid json chars
* reworked the global console commands and binaries
* fixed data modify
* fixed missing datatype and scale with entity.storeResult

## 0.1.2
* added RandomScore
* added a Team wrapper
* added a team option for entities as well as joinTeam and leaveTeam methods
* added Repeat to repeat code with delay
* added Log Widget to quickly print Messages, Scores or Entities in the chat
* added ArmorStand Widget to create an armorstand
* added Hologram to display text
* added AreaEffectCloud
* added Tag.toggle
* added a create option to File
* added a nbt option for Setblock
* added Score.fromSelected to avoid annoying Entity.Selected
* changed summon arguments
* changed effect to also support nbt effects
* changed Location to optional arguments
* fixed when there are two identical files that they would extend

## 0.1.1
* added AroundLocation widget
* added Trigger wrapper
* added Effect wrapper
* added Particle wrapper
* added clone wrapper
* added nbt option for entities
* added score.con for constants
* added display name and lore for items
* changed global commands and boilerplate project
* fixed execute align
* fixed execute bug if targetPath was null
* fixed timer not generating schedule


## 0.1
with the first proper release there are the first util classes:
* added Timeout and Timer widgets for delays and clocks
* added Tag widget
* added Schedule widget
* added scores and tags parameters in any entity constructor
* added addTag, addTags and removeTag Methods on entity
* added targetFilePath and targetFileName parameters for the execute and if constructors to force a folder or filename 
* added suffix option for groups
* added tag condition
* added compile time
* added experimental global commands
* changed if behaviour to use a Tag instead with or conditions, else statement or multiple then children
* fixed: nested groups generated in the wrong order
* fixed entity Range generating unvalid results for `-10..0`
* fixed groups that generated a different file than execution name(still some issues)

## 0.0.10
* added experimental if else statements(may be changed later on)
* added an if option for execute as well
* added the area class
* fixed group
* fixed requirement for slot and count for items
* changed entity static functions to named constructors(for Entity.Selected...)
* updated fill to use area instead
* updated teleport to use rotation
* updated to dart 2.1.1
* added inline documentation for many widgets
* split the build process into multiple files

## 0.0.9
* added subcommands for execute
* added methods for execute
* added storeResult to Location and Entity
* added Rotation
* fixed reference issue for groups(they prefixed everything :o)

## 0.0.8
* added Entity.PlayerName()
* fixed readme
* modified score.setToResult
* made Block, EntityType and ItemType constants to use them in defaults

## 0.0.7
* added score generation
* added Scoreboard
* added Score with calculation and condition methods
* fixed that main and load functions were not executed
## 0.0.6
* added teleport
* added fill
* added data widget and DataModify to edit nbt data
* updated entity with area parameter
## 0.0.5
* added Extend
* added Item utils
* added Give
* added Replaceitem
* added online documentation at https://stevertus.com/objD/documentation

## 0.0.4
* added Summon command wrapper
* added TextComponents
* added Title and Tellraw
* added Color class
* added TextClickEvent class
* added TextHoverEvent class
## 0.0.3
* added Block
* added Location
* added Setblock
* added Say
## 0.0.2
* Fixed ReadMe

## 0.0.1
* Initial Project with Basics and Builder