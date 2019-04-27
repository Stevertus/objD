# Generated ray3 Group Widget from main
execute unless block ~ ~ ~ minecraft:air run tag @s add objd_ray_hit
tag @s add objd_ray_stop
scoreboard players add @s objd_count 1
execute unless entity @s[tag=objd_ray_hit] unless entity @s[tag=objd_ray_stop] if score @s objd_count matches ..10 positioned ^ ^ ^1 run function mypack:objd/ray3
execute if entity @s[tag=objd_ray_hit] run function mypack:objd/rayhit3
execute if entity @s[tag=objd_ray_hit] run tag @s remove objd_ray_hit
tag @s remove objd_ray_stop