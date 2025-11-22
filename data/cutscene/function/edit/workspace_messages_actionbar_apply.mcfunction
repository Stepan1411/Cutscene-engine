# Применить текст Actionbar к ближайшей точке
execute store result score #point_count cutscene.temp run data get storage cutscene:workspace points
execute if score #point_count cutscene.temp matches 0 run tellraw @s {"text":"❌ Нет точек! Добавьте точку сначала.","color":"red"}
execute if score #point_count cutscene.temp matches 0 run return 0

execute unless data storage cutscene:temp message_actionbar run tellraw @s {"text":"❌ Текст не установлен! Сначала введите текст.","color":"red"}
execute unless data storage cutscene:temp message_actionbar run return 0

function cutscene:edit/workspace_messages_find_closest_point
execute store result storage cutscene:temp point_index int 1 run scoreboard players get #closest_point cutscene.temp
function cutscene:edit/workspace_messages_actionbar_apply_macro with storage cutscene:temp

tellraw @s [{"text":"✓ Actionbar применен к точке ","color":"green"},{"score":{"name":"#closest_point","objective":"cutscene.temp"},"color":"yellow"}]
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.5 2
function cutscene:edit/workspace_autosave
