# Cutscene System - Show Points with Particles (Optimized)
# Визуализация точек камеры с частицами (оптимизированная версия)

# Всегда показываем текущие точки зелеными (все)
execute if data storage cutscene:workspace points[0] run data modify storage cutscene:temp visualize_list set from storage cutscene:workspace points
execute if data storage cutscene:workspace points[0] run scoreboard players set #particle_type cutscene.temp 1
execute if data storage cutscene:workspace points[0] run scoreboard players set #vis_counter cutscene.temp 0
execute if data storage cutscene:workspace points[0] run function cutscene:edit/workspace_show_points_loop

# Показать сгенерированные точки белыми (каждую 10-ую для оптимизации)
execute if data storage cutscene:workspace generated_points[0] run data modify storage cutscene:temp visualize_list set from storage cutscene:workspace generated_points
execute if data storage cutscene:workspace generated_points[0] run scoreboard players set #particle_type cutscene.temp 2
execute if data storage cutscene:workspace generated_points[0] run scoreboard players set #vis_counter cutscene.temp 0
execute if data storage cutscene:workspace generated_points[0] run scoreboard players set #vis_skip cutscene.temp 0
execute if data storage cutscene:workspace generated_points[0] run function cutscene:edit/workspace_show_points_loop

# Отладка - показать количество точек (только для игроков с тегом debug)
execute store result score #gen_count cutscene.temp run data get storage cutscene:workspace generated_points
execute if score #gen_count cutscene.temp matches 1.. run tellraw @a[tag=debug] [{"text":"[DEBUG] Сгенерированных точек: ","color":"gray"},{"score":{"name":"#gen_count","objective":"cutscene.temp"},"color":"white"}]
