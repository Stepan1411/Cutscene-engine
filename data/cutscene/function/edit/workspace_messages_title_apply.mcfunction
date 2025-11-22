# Применить текст Title к ближайшей точке
# Проверка что есть точки
execute store result score #point_count cutscene.temp run data get storage cutscene:workspace points
execute if score #point_count cutscene.temp matches 0 run tellraw @s {"text":"❌ Нет точек! Добавьте точку сначала.","color":"red"}
execute if score #point_count cutscene.temp matches 0 run return 0

# Проверка что текст установлен
execute unless data storage cutscene:temp message_text run tellraw @s {"text":"❌ Текст не установлен! Сначала введите текст.","color":"red"}
execute unless data storage cutscene:temp message_text run return 0

# Найти ближайшую точку
function cutscene:edit/workspace_messages_find_closest_point

# Применить текст к найденной точке
execute store result storage cutscene:temp point_index int 1 run scoreboard players get #closest_point cutscene.temp
function cutscene:edit/workspace_messages_title_apply_macro with storage cutscene:temp

tellraw @s [{"text":"✓ Title применен к точке ","color":"green"},{"score":{"name":"#closest_point","objective":"cutscene.temp"},"color":"yellow"}]
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.5 2

# Автосохранение
function cutscene:edit/workspace_autosave
