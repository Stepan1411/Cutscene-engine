# Cutscene System - Add Point
# Добавление точки камеры в текущей позиции

# Проверка режима редактирования
execute unless score @s cutscene.editor matches 1 run tellraw @s {"text":"[Cutscene] Ошибка: Вы не в режиме редактирования","color":"red"}
execute unless score @s cutscene.editor matches 1 run return 0

# Получение текущей позиции игрока
data modify storage cutscene:temp new_point set value {}
execute store result storage cutscene:temp new_point.x double 1 run data get entity @s Pos[0]
execute store result storage cutscene:temp new_point.y double 1 run data get entity @s Pos[1]
execute store result storage cutscene:temp new_point.z double 1 run data get entity @s Pos[2]
execute store result storage cutscene:temp new_point.yaw float 1 run data get entity @s Rotation[0]
execute store result storage cutscene:temp new_point.pitch float 1 run data get entity @s Rotation[1]

# Получение следующего тика (количество точек * 20)
execute store result score #point_count cutscene.temp run data get storage cutscene:temp editor_points
scoreboard players operation #point_count cutscene.temp *= #20 cutscene.temp
execute store result storage cutscene:temp new_point.tick int 1 run scoreboard players get #point_count cutscene.temp

# Добавление точки в список
data modify storage cutscene:temp editor_points append from storage cutscene:temp new_point

# Визуализация новой точки
particle minecraft:end_rod ~ ~1 ~ 0 0 0 0 1 force @a

# Сообщение
tellraw @s [{"text":"[Cutscene Editor] ","color":"gold"},{"text":"Точка добавлена на тик ","color":"white"},{"score":{"name":"#point_count","objective":"cutscene.temp"},"color":"yellow"}]
