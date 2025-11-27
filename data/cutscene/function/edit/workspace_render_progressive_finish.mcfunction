# Завершение постепенного рендера

# Установить прогресс на 100%
bossbar set cutscene:render value 100

# Сохранить результат
data modify storage cutscene:workspace generated_points set from storage cutscene:render result

# Очистка
data remove storage cutscene:render process_points
data remove storage cutscene:render result
scoreboard players set #render_active cutscene.temp 0

# Подсчет точек
execute store result score #total_points cutscene.temp run data get storage cutscene:workspace generated_points

# Сообщение об успехе
execute as @a[scores={cutscene.rendering=1}] if score localization l matches 1 run tellraw @s [{"text":"✓ Рендер завершен! Создано кадров: ","color":"green"},{"score":{"name":"#total_points","objective":"cutscene.temp"},"color":"white","bold":true}]
execute as @a[scores={cutscene.rendering=1}] if score localization l matches 2 run tellraw @s [{"text":"✓ Render complete! Frames created: ","color":"green"},{"score":{"name":"#total_points","objective":"cutscene.temp"},"color":"white","bold":true}]

# Звук
execute as @a[scores={cutscene.rendering=1}] at @s run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 2

# Пометить как несохраненное
scoreboard players set @a[scores={cutscene.rendering=1}] cutscene.unsaved 1

# Автосохранение workspace
execute as @a[scores={cutscene.rendering=1}] run function cutscene:edit/workspace_autosave

# Скрыть и удалить bossbar
bossbar set cutscene:render visible false
schedule function cutscene:edit/workspace_render_cleanup_bossbar 2s

# Сбросить флаг рендера
scoreboard players set @a cutscene.rendering 0
