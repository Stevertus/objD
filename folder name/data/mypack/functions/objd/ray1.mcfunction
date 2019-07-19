# Generated ray1 Group Widget from main
say Hi
execute unless block ~ ~ ~ minecraft:air run tag @s add objd_ray_hit
execute unless entity @s[tag=objd_ray_hit] positioned ^ ^ ^0.25 run function mypack:objd/ray1
execute if entity @s[tag=objd_ray_hit] run function mypack:objd/rayhit1
execute if entity @s[tag=objd_ray_hit] run tag @s remove objd_ray_hit