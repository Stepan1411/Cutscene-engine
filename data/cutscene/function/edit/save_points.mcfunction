# Cutscene System - Save Points
# Сохранение точек workspace в катсцену

# FIX: Использовать generated_points если они есть (после рендера), иначе points
execute if data storage cutscene:workspace generated_points[0] run data modify storage cutscene:temp save_list set from storage cutscene:workspace generated_points
execute if data storage cutscene:workspace generated_points[0] run tellraw @a[tag=debug] [{"text":"[DEBUG] Сохранение сгенерированных точек","color":"green"}]

execute unless data storage cutscene:workspace generated_points[0] run data modify storage cutscene:temp save_list set from storage cutscene:workspace points
execute unless data storage cutscene:workspace generated_points[0] run tellraw @a[tag=debug] [{"text":"[DEBUG] Сохранение исходных точек","color":"yellow"}]

# Преобразование точек в кадры
data modify storage cutscene:temp save_frames set value []
function cutscene:edit/convert_points_loop

# Отладка - количество сохраненных кадров
execute store result score #saved_frames cutscene.temp run data get storage cutscene:temp save_frames
tellraw @a[tag=debug] [{"text":"[DEBUG] Сохранено кадров: ","color":"green"},{"score":{"name":"#saved_frames","objective":"cutscene.temp"},"color":"white"}]

# Сохранение кадров в катсцену через макрос
function cutscene:edit/save_points_macro with storage cutscene:temp

# Очистка
data remove storage cutscene:temp save_frames
data remove storage cutscene:temp save_list
