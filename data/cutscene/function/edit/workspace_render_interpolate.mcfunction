# Cutscene System - Interpolate Points
# Интерполяция точек для плавного движения (упрощенная версия)

# Инициализация
data remove storage cutscene:temp render_result

# Получить длину катсцены из настроек (по умолчанию 100 тиков)
execute unless data storage cutscene:workspace settings.length run data modify storage cutscene:workspace settings.length set value 100
execute store result score #t_max cutscene.temp run data get storage cutscene:workspace settings.length

# Проверка минимальной длины
execute if score localization l matches 1 if score #t_max cutscene.temp matches ..9 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Ошибка: Длина катсцены слишком мала (минимум 10 тиков)","color":"red"}]
execute if score localization l matches 2 if score #t_max cutscene.temp matches ..9 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Error: Cutscene length too short (minimum 10 ticks)","color":"red"}]
execute if score #t_max cutscene.temp matches ..9 run return 0

# Вычислить количество сегментов (точек - 1)
execute store result score #segments cutscene.temp run data get storage cutscene:temp render_points
scoreboard players remove #segments cutscene.temp 1

# Проверка наличия сегментов
execute if score localization l matches 1 if score #segments cutscene.temp matches ..0 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Нужно минимум 2 точки","color":"red"}]
execute if score localization l matches 2 if score #segments cutscene.temp matches ..0 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Need at least 2 points","color":"red"}]
execute if score #segments cutscene.temp matches ..0 run return 0

# Вычислить тики на сегмент (равномерное распределение)
scoreboard players operation #ticks_per_segment cutscene.temp = #t_max cutscene.temp
scoreboard players operation #ticks_per_segment cutscene.temp /= #segments cutscene.temp

# Проверка: ticks_per_segment должен быть > 0
execute if score localization l matches 1 if score #ticks_per_segment cutscene.temp matches ..0 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Ошибка: Слишком мало точек или слишком большая длина","color":"red"}]
execute if score localization l matches 2 if score #ticks_per_segment cutscene.temp matches ..0 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Error: Too few points or too long duration","color":"red"}]
execute if score #ticks_per_segment cutscene.temp matches ..0 run return 0

# Простая интерполяция - обрабатываем пары точек
data modify storage cutscene:temp process_points set from storage cutscene:temp render_points
scoreboard players set #current_tick cutscene.temp 0

# Отладка - количество исходных точек
execute store result score #source_points cutscene.temp run data get storage cutscene:temp render_points
tellraw @a[tag=debug] [{"text":"[DEBUG] Исходных точек: ","color":"gray"},{"score":{"name":"#source_points","objective":"cutscene.temp"},"color":"white"}]

function cutscene:edit/workspace_render_simple_loop

# FIX: Сохранить результат в правильное место
data modify storage cutscene:workspace generated_points set from storage cutscene:temp render_result

# Отладка - количество сгенерированных точек
execute store result score #total_points cutscene.temp run data get storage cutscene:workspace generated_points
tellraw @a[tag=debug] [{"text":"[DEBUG] Создано точек: ","color":"green"},{"score":{"name":"#total_points","objective":"cutscene.temp"},"color":"white"}]

# Отладка - координаты первой и последней точки
execute if data storage cutscene:workspace generated_points[0] run tellraw @a[tag=debug] [{"text":"[DEBUG] Первая точка: ","color":"gray"},{"nbt":"generated_points[0].pos","storage":"cutscene:workspace","color":"white"}]
execute store result score #last_index cutscene.temp run data get storage cutscene:workspace generated_points
scoreboard players remove #last_index cutscene.temp 1
execute if score #last_index cutscene.temp matches 0.. store result storage cutscene:temp debug_index int 1 run scoreboard players get #last_index cutscene.temp
execute if score #last_index cutscene.temp matches 0.. run function cutscene:debug/show_last_point with storage cutscene:temp

# Валидация координат
execute if data storage cutscene:workspace generated_points[0] run function cutscene:debug/validate_coordinates
