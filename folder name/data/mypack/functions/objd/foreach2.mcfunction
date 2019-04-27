# Generated foreach2 Group Widget from main
tellraw @a [{"text":"Console > ","color":"dark_aqua"},{"score":{"name":"#objd_foreach","objective":"objd_count"}}]
scoreboard players add #objd_foreach objd_count 1
execute if score #objd_foreach objd_count <= @a t run function mypack:objd/foreach2