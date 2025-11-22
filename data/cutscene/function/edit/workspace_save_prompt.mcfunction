# Cutscene System - Save Workspace Prompt
# Запрос на сохранение workspace

# Показать кнопку для ввода ID катсцены (Russian)
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 1 run tellraw @s [{"text":"[Editor] ","color":"gold","bold":true},{"text":"Сохранение Workspace","color":"yellow"}]
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s {"text":"Введите ID для катсцены:","color":"white"}
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"  [💾 Нажмите для ввода ID]  ","color":"green","bold":true,"click_event":{"action":"suggest_command","command":"/function cutscene:edit/workspace_save {id:\"cutscene_id\"}"}}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 store result score #count cutscene.temp run data get storage cutscene:workspace points
execute if score localization l matches 1 run tellraw @s [{"text":"Точек для сохранения: ","color":"gray"},{"score":{"name":"#count","objective":"cutscene.temp"},"color":"white"}]
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 1 run tellraw @s ""

# Показать кнопку для ввода ID катсцены (English)
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 2 run tellraw @s [{"text":"[Editor] ","color":"gold","bold":true},{"text":"Saving Workspace","color":"yellow"}]
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s {"text":"Enter cutscene ID:","color":"white"}
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"  [💾 Click to enter ID]  ","color":"green","bold":true,"click_event":{"action":"suggest_command","command":"/function cutscene:edit/workspace_save {id:\"cutscene_id\"}"}}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 store result score #count cutscene.temp run data get storage cutscene:workspace points
execute if score localization l matches 2 run tellraw @s [{"text":"Points to save: ","color":"gray"},{"score":{"name":"#count","objective":"cutscene.temp"},"color":"white"}]
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 2 run tellraw @s ""
playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1
