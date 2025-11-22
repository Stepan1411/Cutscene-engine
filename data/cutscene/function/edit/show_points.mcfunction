# Cutscene System - Show Points
# Визуализация всех точек катсцены

# Проверка режима редактирования
execute unless score @s cutscene.editor matches 1 run tellraw @s {"text":"[Cutscene] Ошибка: Вы не в режиме редактирования","color":"red"}
execute unless score @s cutscene.editor matches 1 run return 0

# Копирование точек для визуализации
data modify storage cutscene:temp visualize_points set from storage cutscene:temp editor_points

# Запуск визуализации
function cutscene:edit/visualize_loop

# Сообщение
execute store result score #point_count cutscene.temp run data get storage cutscene:temp editor_points
tellraw @s [{"text":"[Cutscene Editor] ","color":"gold"},{"text":"Показано точек: ","color":"white"},{"score":{"name":"#point_count","objective":"cutscene.temp"},"color":"yellow"}]
