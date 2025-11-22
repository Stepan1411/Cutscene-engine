# Cutscene System - Exit Workspace Editor
# Выход из редактора workspace

# Отключить режим редактирования
scoreboard players reset @s cutscene.editor
scoreboard players reset @s cutscene.menu_point
scoreboard players reset @s cutscene.visualize
scoreboard players reset @s cutscene.saved_slot

# Очистить весь хотбар от удочек
clear @s minecraft:carrot_on_a_stick

# Восстановить инвентарь если был сохранен
execute if score @s cutscene.has_saved_inv matches 1 run function cutscene:edit/restore_inventory

# Сообщение
tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Редактор закрыт","color":"yellow"}]
execute if score localization l matches 2 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Editor closed","color":"yellow"}]
tellraw @s ""
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.8
