# Cutscene System - Workspace Reset Prompt
# Подтверждение сброса рабочей области

# Russian
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red"}]
execute if score localization l matches 1 run tellraw @s [{"text":"⚠️ ВНИМАНИЕ","color":"red","bold":true}]
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red"}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s {"text":"Вы уверены что хотите сбросить рабочую область?","color":"yellow"}
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s {"text":"Это действие:","color":"gray"}
execute if score localization l matches 1 run tellraw @s [{"text":"  • ","color":"red"},{"text":"Удалит все точки","color":"white"}]
execute if score localization l matches 1 run tellraw @s [{"text":"  • ","color":"red"},{"text":"Удалит сгенерированные кадры","color":"white"}]
execute if score localization l matches 1 run tellraw @s [{"text":"  • ","color":"red"},{"text":"Сбросит настройки","color":"white"}]
execute if score localization l matches 1 run tellraw @s [{"text":"  • ","color":"red"},{"text":"НЕЛЬЗЯ ОТМЕНИТЬ","color":"red","bold":true}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"[✓ ДА, СБРОСИТЬ]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_reset_confirm"}},{"text":"  "},{"text":"[✗ ОТМЕНА]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_reset_cancel"}}]
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red"}]
execute if score localization l matches 1 run tellraw @s ""

# English
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red"}]
execute if score localization l matches 2 run tellraw @s [{"text":"⚠️ WARNING","color":"red","bold":true}]
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red"}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s {"text":"Are you sure you want to reset the workspace?","color":"yellow"}
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s {"text":"This action will:","color":"gray"}
execute if score localization l matches 2 run tellraw @s [{"text":"  • ","color":"red"},{"text":"Delete all points","color":"white"}]
execute if score localization l matches 2 run tellraw @s [{"text":"  • ","color":"red"},{"text":"Delete generated frames","color":"white"}]
execute if score localization l matches 2 run tellraw @s [{"text":"  • ","color":"red"},{"text":"Reset settings","color":"white"}]
execute if score localization l matches 2 run tellraw @s [{"text":"  • ","color":"red"},{"text":"CANNOT BE UNDONE","color":"red","bold":true}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"[✓ YES, RESET]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_reset_confirm"}},{"text":"  "},{"text":"[✗ CANCEL]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_reset_cancel"}}]
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red"}]
execute if score localization l matches 2 run tellraw @s ""

playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
