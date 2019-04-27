# test
execute if entity @e run function mypack:objd/if1
give @e minecraft:written_book{"title":"","author":"","pages":["[{\"text\":\"\"}]"]} 
scoreboard players set #objd_foreach objd_count 0
execute if score #objd_foreach objd_count < @a t run function mypack:objd/foreach2
scoreboard players set @s objd_count 0
execute as @a at @s anchored eyes positioned ^ ^ ^ anchored feet run function mypack:objd/ray3