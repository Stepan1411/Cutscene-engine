# Цикл поиска ближайшей точки
execute if score #current_index cutscene.temp >= #point_count cutscene.temp run return 0

# Загрузить текущую точку
execute store result storage cutscene:temp check_index int 1 run scoreboard players get #current_index cutscene.temp
function cutscene:edit/workspace_messages_check_distance_macro with storage cutscene:temp

# Следующая итерация
scoreboard players add #current_index cutscene.temp 1
function cutscene:edit/workspace_messages_find_closest_loop
