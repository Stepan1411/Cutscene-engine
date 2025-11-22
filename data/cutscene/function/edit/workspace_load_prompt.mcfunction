# Cutscene System - Load Workspace Prompt
# Загрузка workspace из катсцены

# Russian
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 1 run tellraw @s [{"text":"[Editor] ","color":"gold","bold":true},{"text":"Загрузка Workspace","color":"yellow"}]
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s {"text":"Введите ID катсцены для загрузки:","color":"white"}
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"  [📂 Нажмите для ввода ID]  ","color":"yellow","bold":true,"click_event":{"action":"suggest_command","command":"/function cutscene:edit/workspace_load {id:\"cutscene_id\"}"}}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 1 run tellraw @s ""

# English
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 2 run tellraw @s [{"text":"[Editor] ","color":"gold","bold":true},{"text":"Loading Workspace","color":"yellow"}]
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s {"text":"Enter cutscene ID to load:","color":"white"}
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"  [📂 Click to enter ID]  ","color":"yellow","bold":true,"click_event":{"action":"suggest_command","command":"/function cutscene:edit/workspace_load {id:\"cutscene_id\"}"}}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 2 run tellraw @s ""
playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1
