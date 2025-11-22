# Cutscene System - Workspace Render
# Рендер точек с интерполяцией для плавности (как в CCF)

# Проверка наличия точек
execute store result score #point_count cutscene.temp run data get storage cutscene:workspace points
execute if score localization l matches 1 if score #point_count cutscene.temp matches ..1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Ошибка: Нужно минимум 2 точки для рендера","color":"red"}]
execute if score localization l matches 2 if score #point_count cutscene.temp matches ..1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Error: Need at least 2 points to render","color":"red"}]
execute if score #point_count cutscene.temp matches ..1 run return 0

# Сообщение
execute if score localization l matches 1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold","bold":true},{"text":"Рендер точек...","color":"light_purple"}]
execute if score localization l matches 2 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold","bold":true},{"text":"Rendering points...","color":"light_purple"}]

# FIX: Всегда обновлять original_points при рендере
data modify storage cutscene:workspace original_points set from storage cutscene:workspace points

# Копировать точки для обработки
data modify storage cutscene:temp render_points set from storage cutscene:workspace points

# Интерполяция: добавить промежуточные точки между каждыми двумя
function cutscene:edit/workspace_render_interpolate

# FIX: НЕ заменять points! Сгенерированные точки уже в generated_points
# data modify storage cutscene:workspace points set from storage cutscene:temp render_result

# Подсчет новых точек
execute store result score #new_count cutscene.temp run data get storage cutscene:workspace generated_points

execute if score localization l matches 1 run tellraw @s [{"text":"✓ Рендер завершен!","color":"green"}]
execute if score localization l matches 2 run tellraw @s [{"text":"✓ Render complete!","color":"green"}]

playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 2

# Пометить как несохраненное
scoreboard players set @s cutscene.unsaved 1

# Автосохранение workspace
function cutscene:edit/workspace_autosave
