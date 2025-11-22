# Найти ближайшую точку к игроку
scoreboard players set #closest_point cutscene.temp -1
scoreboard players set #min_distance cutscene.temp 2147483647
scoreboard players set #current_index cutscene.temp 0

# Перебрать все точки
execute store result score #point_count cutscene.temp run data get storage cutscene:workspace points
function cutscene:edit/workspace_messages_find_closest_loop
