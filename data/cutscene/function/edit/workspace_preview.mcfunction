# Cutscene System - Workspace Preview
# Просмотр катсцены

# Проверка наличия точек
execute store result score #point_count cutscene.temp run data get storage cutscene:workspace points
execute if score localization l matches 1 if score #point_count cutscene.temp matches ..1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Ошибка: Нужно минимум 2 точки","color":"red"}]
execute if score localization l matches 2 if score #point_count cutscene.temp matches ..1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Error: Need at least 2 points","color":"red"}]
execute if score #point_count cutscene.temp matches ..1 run return 0

# Проверка наличия сгенерированных точек (рендер выполнен)
execute if score localization l matches 1 unless data storage cutscene:workspace generated_points[0] run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Ошибка: Сначала выполните рендер","color":"red"}]
execute if score localization l matches 2 unless data storage cutscene:workspace generated_points[0] run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Error: Render first","color":"red"}]
execute unless data storage cutscene:workspace generated_points[0] run return 0


# Остановить визуализацию точек
scoreboard players set @s cutscene.vis_timer -999

function cutscene:edit/workspace_save {id:"preview_temp"}
function cutscene:cutscene/play {id:"preview_temp"}
