# Постепенный рендер - обработка за один тик
# Обрабатывает до 50 кадров за тик (безопасно)

# Проверка: есть ли еще сегменты для обработки
execute unless data storage cutscene:render process_points[1] run function cutscene:edit/workspace_render_progressive_finish
execute unless data storage cutscene:render process_points[1] run return 0

# Получить две точки для текущего сегмента
data modify storage cutscene:temp point1 set from storage cutscene:render process_points[0]
data modify storage cutscene:temp point2 set from storage cutscene:render process_points[1]

# Инициализировать #t если это новый сегмент
execute unless score #segment_t cutscene.temp matches 0.. run scoreboard players set #segment_t cutscene.temp 0

# Обработать до 50 кадров этого сегмента за тик
scoreboard players operation #t cutscene.temp = #segment_t cutscene.temp
scoreboard players set #batch_count cutscene.temp 0
function cutscene:edit/workspace_render_progressive_batch

# Сохранить прогресс сегмента
scoreboard players operation #segment_t cutscene.temp = #t cutscene.temp

# Проверить, завершен ли текущий сегмент
execute if score #segment_t cutscene.temp >= #ticks_per_segment cutscene.temp run data remove storage cutscene:render process_points[0]
execute if score #segment_t cutscene.temp >= #ticks_per_segment cutscene.temp run scoreboard players add #current_segment cutscene.temp 1
execute if score #segment_t cutscene.temp >= #ticks_per_segment cutscene.temp run scoreboard players set #segment_t cutscene.temp 0

# Обновить прогресс в bossbar
scoreboard players set #100 cutscene.temp 100
scoreboard players operation #progress cutscene.temp = #rendered_frames cutscene.temp
scoreboard players operation #progress cutscene.temp *= #100 cutscene.temp
scoreboard players operation #progress cutscene.temp /= #total_frames cutscene.temp
execute store result bossbar cutscene:render value run scoreboard players get #progress cutscene.temp

# Обновить текст bossbar (каждые 5 тиков для производительности)
execute if score #current_tick cutscene.temp matches 0 run function cutscene:edit/workspace_render_update_bossbar
scoreboard players operation #tick_mod cutscene.temp = #current_tick cutscene.temp
scoreboard players set #5 cutscene.temp 5
scoreboard players operation #tick_mod cutscene.temp %= #5 cutscene.temp
execute if score #tick_mod cutscene.temp matches 0 run function cutscene:edit/workspace_render_update_bossbar
