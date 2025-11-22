# Установить текущую позицию как точку телепортации

execute store result storage cutscene:workspace settings.ending.x double 1 run data get entity @s Pos[0]
execute store result storage cutscene:workspace settings.ending.y double 1 run data get entity @s Pos[1]
execute store result storage cutscene:workspace settings.ending.z double 1 run data get entity @s Pos[2]
execute store result storage cutscene:workspace settings.ending.yaw float 1 run data get entity @s Rotation[0]
execute store result storage cutscene:workspace settings.ending.pitch float 1 run data get entity @s Rotation[1]

tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Позиция телепортации установлена","color":"green"}]
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
function cutscene:edit/workspace_autosave
function cutscene:edit/workspace_settings_ending
