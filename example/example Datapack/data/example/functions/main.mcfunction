execute as @a at @s run execute if block ~ ~-1 ~ minecraft:redstone_block run tag @p add objd_isTrue1
execute as @a at @s run execute if block ~ ~2 ~ minecraft:redstone_block run tag @p add objd_isTrue1
execute as @a at @s run execute as @p if entity @s[tag=objd_isTrue1] run execute if block ~ ~ ~ stone run say hey
execute as @a at @s run tag @p remove objd_isTrue1