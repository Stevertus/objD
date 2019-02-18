say hey
execute as @a at @s anchored feet positioned ~ ~10 ~ in the_end run scoreboard players get hi hey2
scoreboard objectives add hey dummy
scoreboard players set hi hey2 10
scoreboard players operation @s hey -= @s hey2
execute store result score hi hey2 run say hjey
scoreboard objectives setdisplay sidebar hey2
replaceitem entity @p[x=0.0,y=0.0,z=0.0,dy=10.0,dz=100.0] hotbar.0 minecraft:iron_axe{"test":1,"Damage":5} 
data modify entity @s insert 2 from block ~ ~5 ~ Items[0].id