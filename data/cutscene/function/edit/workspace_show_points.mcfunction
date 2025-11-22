# Cutscene System - Show Points with Particles
# Визуализация точек камеры с частицами (как в CCF)

# Всегда показываем текущие точки зелеными
execute if data storage cutscene:workspace points[0] run data modify storage cutscene:temp visualize_list set from storage cutscene:workspace points
execute if data storage cutscene:workspace points[0] run scoreboard players set #particle_type cutscene.temp 1
execute if data storage cutscene:workspace points[0] run function cutscene:edit/workspace_show_points_loop

# Показать сгенерированные точки белыми (если есть)
execute if data storage cutscene:workspace generated_points[0] run data modify storage cutscene:temp visualize_list set from storage cutscene:workspace generated_points
execute if data storage cutscene:workspace generated_points[0] run scoreboard players set #particle_type cutscene.temp 2
execute if data storage cutscene:workspace generated_points[0] run function cutscene:edit/workspace_show_points_loop
