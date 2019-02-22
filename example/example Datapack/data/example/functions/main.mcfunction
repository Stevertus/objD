say hey
execute unless entity @p if entity @r run say I'm done
execute unless entity @p if blocks 0 0 0 10 10 10 ~ ~ ~ run say I'm done
execute unless entity @p unless score @s test matches 0..5 run say I'm done

execute if blocks ~1 ~10 ~5 ~ ~ ~ ~ ~10 ~ run function example:objd/if3
execute unless entity @e[x=1,y=10,z=5,dx=1,dy=10,dz=5] run function example:objd/if3
execute if entity @s unless entity @p run function example:objd/if4
execute as @a at @s anchored feet positioned ~ ~10 ~ in the_end run scoreboard players get hi hey2
scoreboard objectives add hey dummy
scoreboard players set hi hey2 10
scoreboard players operation @s hey -= @s hey2
execute store result score hi hey2 run say hjey
scoreboard objectives setdisplay sidebar hey2
replaceitem entity @p hotbar.0 minecraft:iron_axe{"test":1,"Damage":5} 
data modify entity @s insert 2 from block ~ ~5 ~ Items[0].id