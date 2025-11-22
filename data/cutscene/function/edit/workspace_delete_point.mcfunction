# Cutscene System - Workspace Delete Point
# Удалить ближайшую точку

# Проверка наличия точек
execute store result score #point_count cutscene.temp run data get storage cutscene:workspace points
execute if score localization l matches 1 if score #point_count cutscene.temp matches 0 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Нет точек для удаления","color":"red"}]
execute if score localization l matches 2 if score #point_count cutscene.temp matches 0 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"No points to delete","color":"red"}]
execute if score #point_count cutscene.temp matches 0 run return 0

# Получить позицию игрока
execute store result score #player_x cutscene.temp run data get entity @s Pos[0] 1000
execute store result score #player_y cutscene.temp run data get entity @s Pos[1] 1000
execute store result score #player_z cutscene.temp run data get entity @s Pos[2] 1000

# Упрощенный подход - удалить последнюю точку
execute store result score #last_index cutscene.temp run data get storage cutscene:workspace points
scoreboard players remove #last_index cutscene.temp 1

# Проверка что индекс валидный
execute if score localization l matches 1 if score #last_index cutscene.temp matches ..-1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Ошибка: нет точек","color":"red"}]
execute if score localization l matches 2 if score #last_index cutscene.temp matches ..-1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Error: no points","color":"red"}]
execute if score #last_index cutscene.temp matches ..-1 run return 0

# Сохранить индекс для удаления
scoreboard players operation #closest_index cutscene.temp = #last_index cutscene.temp

# Удалить точку по индексу
execute store result storage cutscene:temp delete_index int 1 run scoreboard players get #closest_index cutscene.temp
function cutscene:edit/workspace_delete_execute with storage cutscene:temp

# Очистить generated_points (нужен новый рендер)
data remove storage cutscene:workspace generated_points

# Сообщение
execute if score localization l matches 1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Точка удалена (индекс: ","color":"yellow"},{"score":{"name":"#closest_index","objective":"cutscene.temp"},"color":"white"},{"text":")","color":"yellow"}]
execute if score localization l matches 2 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Point deleted (index: ","color":"yellow"},{"score":{"name":"#closest_index","objective":"cutscene.temp"},"color":"white"},{"text":")","color":"yellow"}]
playsound minecraft:entity.item.break master @s ~ ~ ~ 0.5 0.8

# Отметить как несохраненное
scoreboard players set @s cutscene.unsaved 1

# Автосохранение workspace
function cutscene:edit/workspace_autosave
