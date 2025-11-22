# Простой цикл интерполяции между парами точек
execute unless data storage cutscene:temp process_points[1] run return 0

# Получить две точки
data modify storage cutscene:temp point1 set from storage cutscene:temp process_points[0]
data modify storage cutscene:temp point2 set from storage cutscene:temp process_points[1]

# Интерполировать между ними
scoreboard players set #t cutscene.temp 0
function cutscene:edit/workspace_render_segment

# Удалить первую точку и продолжить
data remove storage cutscene:temp process_points[0]
function cutscene:edit/workspace_render_simple_loop
