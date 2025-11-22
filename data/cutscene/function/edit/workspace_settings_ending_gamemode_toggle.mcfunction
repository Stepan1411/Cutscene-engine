# Переключить установку режима игры при окончании

execute store result score #set_gamemode cutscene.temp run data get storage cutscene:workspace settings.ending.set_gamemode

execute if score #set_gamemode cutscene.temp matches 0 run data modify storage cutscene:workspace settings.ending.set_gamemode set value 1b
execute if score #set_gamemode cutscene.temp matches 0 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Установка режима игры включена","color":"green"}]

execute if score #set_gamemode cutscene.temp matches 1 run data modify storage cutscene:workspace settings.ending.set_gamemode set value 0b
execute if score #set_gamemode cutscene.temp matches 1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Установка режима игры выключена","color":"yellow"}]

playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
function cutscene:edit/workspace_autosave
function cutscene:edit/workspace_settings_ending
