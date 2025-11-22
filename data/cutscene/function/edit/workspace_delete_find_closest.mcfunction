# Поиск ближайшей точки (рекурсивный цикл)

# Проверка окончания списка
execute unless data storage cutscene:temp search_points[0] run return 0

# Получить координаты текущей точки
execute store result score #point_x cutscene.temp run data get storage cutscene:temp search_points[0].pos[0] 1000
execute store result score #point_y cutscene.temp run data get storage cutscene:temp search_points[0].pos[1] 1000
execute store result score #point_z cutscene.temp run data get storage cutscene:temp search_points[0].pos[2] 1000

# Создать копии для вычисления разности
scoreboard players operation #dx cutscene.temp = #point_x cutscene.temp
scoreboard players operation #dy cutscene.temp = #point_y cutscene.temp
scoreboard players operation #dz cutscene.temp = #point_z cutscene.temp

# Вычислить разность
scoreboard players operation #dx cutscene.temp -= #player_x cutscene.temp
scoreboard players operation #dy cutscene.temp -= #player_y cutscene.temp
scoreboard players operation #dz cutscene.temp -= #player_z cutscene.temp

# Абсолютные значения
execute if score #dx cutscene.temp matches ..-1 run scoreboard players operation #dx cutscene.temp *= #-1 cutscene.const
execute if score #dy cutscene.temp matches ..-1 run scoreboard players operation #dy cutscene.temp *= #-1 cutscene.const
execute if score #dz cutscene.temp matches ..-1 run scoreboard players operation #dz cutscene.temp *= #-1 cutscene.const

# Сумма расстояний
scoreboard players operation #distance cutscene.temp = #dx cutscene.temp
scoreboard players operation #distance cutscene.temp += #dy cutscene.temp
scoreboard players operation #distance cutscene.temp += #dz cutscene.temp

# Если это ближайшая точка, сохранить индекс
execute if score #distance cutscene.temp < #min_distance cutscene.temp run scoreboard players operation #min_distance cutscene.temp = #distance cutscene.temp
execute if score #distance cutscene.temp < #min_distance cutscene.temp run scoreboard players operation #closest_index cutscene.temp = #current_index cutscene.temp

# Следующая точка
scoreboard players add #current_index cutscene.temp 1
data remove storage cutscene:temp search_points[0]
function cutscene:edit/workspace_delete_find_closest
