# Cutscene System - Workspace Add Point
# Добавление точки в workspace

# Сохранение текущей позиции и поворота (новый формат с pos[] и rot[])
data remove storage cutscene:temp new_point
data modify storage cutscene:temp new_point set value {pos:[0d,0d,0d],rot:[0f,0f]}

execute store result storage cutscene:temp new_point.pos[0] double 1 run data get entity @s Pos[0] 1
execute store result storage cutscene:temp new_point.pos[1] double 1 run data get entity @s Pos[1] 1
execute store result storage cutscene:temp new_point.pos[2] double 1 run data get entity @s Pos[2] 1
execute store result storage cutscene:temp new_point.rot[0] float 1 run data get entity @s Rotation[0] 1
execute store result storage cutscene:temp new_point.rot[1] float 1 run data get entity @s Rotation[1] 1

# Добавить высоту глаз (1.62 блока)
execute store result score #y cutscene.temp run data get entity @s Pos[1] 100
scoreboard players add #y cutscene.temp 162
execute store result storage cutscene:temp new_point.pos[1] double 0.01 run scoreboard players get #y cutscene.temp

# FIX: Добавление только в points (original_points обновляется при рендере)
data modify storage cutscene:workspace points append from storage cutscene:temp new_point

# Если есть generated_points, очистить их (нужен новый рендер)
execute if data storage cutscene:workspace generated_points[0] run data remove storage cutscene:workspace generated_points
execute if score localization l matches 1 if data storage cutscene:workspace generated_points[0] run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Сгенерированные точки очищены. Выполните рендер заново.","color":"yellow"}]
execute if score localization l matches 2 if data storage cutscene:workspace generated_points[0] run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Generated points cleared. Re-render required.","color":"yellow"}]

# Визуализация
particle minecraft:end_rod ~ ~1.62 ~ 0.1 0.1 0.1 0 5 force @a
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.5 2

# Сообщение
execute store result score #count cutscene.temp run data get storage cutscene:workspace points
execute if score localization l matches 1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Точка ","color":"white"},{"score":{"name":"#count","objective":"cutscene.temp"},"color":"yellow"},{"text":" добавлена","color":"white"}]
execute if score localization l matches 2 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Point ","color":"white"},{"score":{"name":"#count","objective":"cutscene.temp"},"color":"yellow"},{"text":" added","color":"white"}]

# Отладка - показать координаты
tellraw @s[tag=debug] [{"text":"[DEBUG] Координаты: ","color":"gray"},{"nbt":"new_point","storage":"cutscene:temp","color":"white"}]

# Автосохранение workspace
function cutscene:edit/workspace_autosave
