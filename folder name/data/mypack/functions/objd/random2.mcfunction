# Generated random2 Group Widget from objd/if1
# Random UUID Generator from objd/if1
summon area_effect_cloud ~ ~ ~ {"Tags":["objd_random"]}
execute store result score @a objd_random run data get entity @e[tag=objd_random,sort=nearest,limit=1] UUIDMost 0.0000000001
scoreboard players operation @a objd_random %= #max objd_random