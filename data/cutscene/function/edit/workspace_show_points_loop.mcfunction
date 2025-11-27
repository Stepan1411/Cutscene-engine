# Loop through points and show particles (Optimized)
execute unless data storage cutscene:temp visualize_list[0] run return 0

# Счетчик итераций
scoreboard players add #vis_counter cutscene.temp 1

# Ограничение зависит от типа: 20 для исходных точек, 50 для сгенерированных
execute if score #particle_type cutscene.temp matches 1 if score #vis_counter cutscene.temp matches 101.. run return 0

# Для сгенерированных точек (тип 2) - показывать только каждую 10-ую
execute if score #particle_type cutscene.temp matches 2 run scoreboard players add #vis_skip cutscene.temp 1
execute if score #particle_type cutscene.temp matches 2 if score #vis_skip cutscene.temp matches ..9 run data remove storage cutscene:temp visualize_list[0]
execute if score #particle_type cutscene.temp matches 2 if score #vis_skip cutscene.temp matches ..9 run function cutscene:edit/workspace_show_points_loop
execute if score #particle_type cutscene.temp matches 2 if score #vis_skip cutscene.temp matches ..9 run return 0
execute if score #particle_type cutscene.temp matches 2 if score #vis_skip cutscene.temp matches 10.. run scoreboard players set #vis_skip cutscene.temp 0

# Получить координаты и поворот
data modify storage cutscene:temp vis_frame set value {}
data modify storage cutscene:temp vis_frame.x set from storage cutscene:temp visualize_list[0].pos[0]
data modify storage cutscene:temp vis_frame.y set from storage cutscene:temp visualize_list[0].pos[1]
data modify storage cutscene:temp vis_frame.z set from storage cutscene:temp visualize_list[0].pos[2]
data modify storage cutscene:temp vis_frame.rx set from storage cutscene:temp visualize_list[0].rot[0]
data modify storage cutscene:temp vis_frame.ry set from storage cutscene:temp visualize_list[0].rot[1]

# Показать частицы только если есть все координаты
execute if data storage cutscene:temp vis_frame.x if data storage cutscene:temp vis_frame.y if data storage cutscene:temp vis_frame.z run function cutscene:edit/workspace_show_point_particles with storage cutscene:temp vis_frame

# Следующая точка
data remove storage cutscene:temp visualize_list[0]
function cutscene:edit/workspace_show_points_loop
