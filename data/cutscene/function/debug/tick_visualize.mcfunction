# Debug tick для визуализации
# Показывает информацию о таймере визуализации

# Показать vis_timer каждые 20 тиков
execute unless score @s cutscene.debug_vis_tick = @s cutscene.debug_vis_tick run scoreboard players set @s cutscene.debug_vis_tick 0
scoreboard players add @s cutscene.debug_vis_tick 1

execute if score @s cutscene.debug_vis_tick matches 20.. run tellraw @s [{"text":"[DEBUG] vis_timer: ","color":"gray"},{"score":{"name":"@s","objective":"cutscene.vis_timer"},"color":"white"},{"text":" | editor: ","color":"gray"},{"score":{"name":"@s","objective":"cutscene.editor"},"color":"white"}]
execute if score @s cutscene.debug_vis_tick matches 20.. run scoreboard players set @s cutscene.debug_vis_tick 0
