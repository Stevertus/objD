scoreboard objectives add t dummy
execute as @s at @s run tellraw @a [{"text":"Console > ","color":"dark_aqua"},{"text":"t"}]
function mypack:objd/group1
execute if score @s t matches ..0 run function mypack:objd/if1
execute if score @s t matches ..0 run function mypack:objd/if2