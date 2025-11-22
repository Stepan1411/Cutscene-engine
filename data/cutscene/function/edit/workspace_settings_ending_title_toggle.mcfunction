# Переключить показ title при окончании

execute store result score #show_title cutscene.temp run data get storage cutscene:workspace settings.ending.show_title

execute if score #show_title cutscene.temp matches 0 run data modify storage cutscene:workspace settings.ending.show_title set value 1b
execute if score #show_title cutscene.temp matches 0 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Показ title включен","color":"green"}]

execute if score #show_title cutscene.temp matches 1 run data modify storage cutscene:workspace settings.ending.show_title set value 0b
execute if score #show_title cutscene.temp matches 1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Показ title выключен","color":"yellow"}]

playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
function cutscene:edit/workspace_autosave
function cutscene:edit/workspace_settings_ending
