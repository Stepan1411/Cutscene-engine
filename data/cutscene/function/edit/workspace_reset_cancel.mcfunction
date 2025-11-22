# Cutscene System - Workspace Reset Cancel
# Отмена сброса

execute if score localization l matches 1 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Сброс отменен","color":"gray"}]
execute if score localization l matches 2 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Reset cancelled","color":"gray"}]
playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1
