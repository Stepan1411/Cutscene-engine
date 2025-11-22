# Loop through points and show particles
# FIX: Ограничить количество точек за раз для избежания фриза
execute unless data storage cutscene:temp visualize_list[0] run return 0

# Счетчик итераций
execute unless score #vis_counter cutscene.temp = #vis_counter cutscene.temp run scoreboard players set #vis_counter cutscene.temp 0
scoreboard players add #vis_counter cutscene.temp 1

# Ограничение: максимум 10 точек за раз
execute if score #vis_counter cutscene.temp matches 11.. run scoreboard players set #vis_counter cutscene.temp 0
execute if score #vis_counter cutscene.temp matches 11.. run schedule function cutscene:edit/workspace_show_points_loop_continue 1t
execute if score #vis_counter cutscene.temp matches 11.. run return 0

# Получить координаты и поворот
data modify storage cutscene:temp vis_frame set value {}
data modify storage cutscene:temp vis_frame.x set from storage cutscene:temp visualize_list[0].pos[0]
data modify storage cutscene:temp vis_frame.y set from storage cutscene:temp visualize_list[0].pos[1]
data modify storage cutscene:temp vis_frame.z set from storage cutscene:temp visualize_list[0].pos[2]
data modify storage cutscene:temp vis_frame.rx set from storage cutscene:temp visualize_list[0].rot[0]
data modify storage cutscene:temp vis_frame.ry set from storage cutscene:temp visualize_list[0].rot[1]

# Добавить тип частицы в storage для макроса
execute store result storage cutscene:temp vis_frame.particle_type int 1 run scoreboard players get #particle_type cutscene.temp

# Показать частицы только если есть все координаты
execute if data storage cutscene:temp vis_frame.x if data storage cutscene:temp vis_frame.y if data storage cutscene:temp vis_frame.z run function cutscene:edit/workspace_show_point_particles with storage cutscene:temp vis_frame

# Следующая точка
data remove storage cutscene:temp visualize_list[0]
function cutscene:edit/workspace_show_points_loop
