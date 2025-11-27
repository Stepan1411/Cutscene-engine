# Отмена рендера (если игрок вышел или произошла ошибка)

# Очистка
data remove storage cutscene:render process_points
data remove storage cutscene:render result
scoreboard players set #render_active cutscene.temp 0

# Удалить bossbar
execute if entity @e[type=minecraft:marker,tag=cutscene.render_bossbar] run bossbar remove cutscene:render

# Сбросить флаг рендера
scoreboard players set @a cutscene.rendering 0

# Сообщение
execute if score localization l matches 1 run tellraw @a[scores={cutscene.editor=2}] [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Рендер отменен","color":"red"}]
execute if score localization l matches 2 run tellraw @a[scores={cutscene.editor=2}] [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Render cancelled","color":"red"}]
