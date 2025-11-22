# Cutscene System - Visualize Loop
# Цикл визуализации точек

# Проверка наличия точек
execute unless data storage cutscene:temp visualize_points[0] run return 0

# Получение первой точки
data modify storage cutscene:temp current_point set from storage cutscene:temp visualize_points[0]

# Визуализация точки через макрос
function cutscene:edit/visualize_point with storage cutscene:temp current_point

# Удаление обработанной точки
data remove storage cutscene:temp visualize_points[0]

# Рекурсивный вызов для следующей точки
execute if data storage cutscene:temp visualize_points[0] run function cutscene:edit/visualize_loop
