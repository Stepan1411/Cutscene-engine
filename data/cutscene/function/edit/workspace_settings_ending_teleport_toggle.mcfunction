# Переключить телепортацию при окончании

execute store result score #teleport cutscene.temp run data get storage cutscene:workspace settings.ending.teleport

execute if score #teleport cutscene.temp matches 0 run data modify storage cutscene:workspace settings.ending.teleport set value 1b
execute if score #teleport cutscene.temp matches 0 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Телепортация включена","color":"green"}]

execute if score #teleport cutscene.temp matches 1 run data modify storage cutscene:workspace settings.ending.teleport set value 0b
execute if score #teleport cutscene.temp matches 1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Телепортация выключена","color":"yellow"}]

playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
function cutscene:edit/workspace_autosave
function cutscene:edit/workspace_settings_ending
