# Cutscene System - Render Loop
# Цикл обработки точек для интерполяции

# Проверка наличия точек
execute unless data storage cutscene:temp render_points[0] run return 0

# Добавить текущую точку
data modify storage cutscene:temp render_result append from storage cutscene:temp render_points[0]

# Если есть следующая точка - добавить промежуточные
execute if data storage cutscene:temp render_points[1] run function cutscene:edit/workspace_render_add_intermediate

# Удалить обработанную точку
data remove storage cutscene:temp render_points[0]

# Рекурсия
execute if data storage cutscene:temp render_points[0] run function cutscene:edit/workspace_render_loop
