# Cutscene System - Workspace Render (Progressive)
# Постепенный рендер точек с интерполяцией

# Проверка наличия точек
execute store result score #point_count cutscene.temp run data get storage cutscene:workspace points
execute if score localization l matches 1 if score #point_count cutscene.temp matches ..1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Ошибка: Нужно минимум 2 точки для рендера","color":"red"}]
execute if score localization l matches 2 if score #point_count cutscene.temp matches ..1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Error: Need at least 2 points to render","color":"red"}]
execute if score #point_count cutscene.temp matches ..1 run return 0

# Сообщение
execute if score localization l matches 1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold","bold":true},{"text":"Запуск постепенного рендера...","color":"light_purple"}]
execute if score localization l matches 2 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold","bold":true},{"text":"Starting progressive render...","color":"light_purple"}]

# Сохранить UUID игрока для отслеживания
data modify storage cutscene:render player_uuid set from entity @s UUID

# FIX: Всегда обновлять original_points при рендере
data modify storage cutscene:workspace original_points set from storage cutscene:workspace points

# Инициализация прогрессивного рендера
data modify storage cutscene:render process_points set from storage cutscene:workspace points
data remove storage cutscene:render result
scoreboard players set #render_active cutscene.temp 1
scoreboard players set #current_tick cutscene.temp 0
scoreboard players set #current_segment cutscene.temp 0
scoreboard players set #segment_t cutscene.temp 0

# Получить настройки длины
execute unless data storage cutscene:workspace settings.length run data modify storage cutscene:workspace settings.length set value 100
execute store result score #t_max cutscene.temp run data get storage cutscene:workspace settings.length

# Вычислить количество сегментов
execute store result score #segments cutscene.temp run data get storage cutscene:render process_points
scoreboard players remove #segments cutscene.temp 1

# Вычислить тики на сегмент
scoreboard players operation #ticks_per_segment cutscene.temp = #t_max cutscene.temp
scoreboard players operation #ticks_per_segment cutscene.temp /= #segments cutscene.temp

# Сохранить общее количество кадров для прогресса
scoreboard players operation #total_frames cutscene.temp = #t_max cutscene.temp
scoreboard players set #rendered_frames cutscene.temp 0

# Создать bossbar для прогресса
execute if score localization l matches 1 run bossbar add cutscene:render {"text":"🎬 Рендер катсцены","color":"light_purple","bold":true}
execute if score localization l matches 2 run bossbar add cutscene:render {"text":"🎬 Rendering Cutscene","color":"light_purple","bold":true}
bossbar set cutscene:render color purple
bossbar set cutscene:render style progress
bossbar set cutscene:render value 0
bossbar set cutscene:render max 100
bossbar set cutscene:render players @s
bossbar set cutscene:render visible true

# Установить флаг рендера для игрока
scoreboard players set @s cutscene.rendering 1

# Запустить первую итерацию
function cutscene:edit/workspace_render_progressive_tick
