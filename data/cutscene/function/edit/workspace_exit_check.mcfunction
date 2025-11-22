# Cutscene System - Exit Check
# Проверка перед выходом

# Если катсцена не сохранена - предупреждение (Russian)
execute if score localization l matches 1 if score @s cutscene.unsaved matches 1 run tellraw @s ""
execute if score localization l matches 1 if score @s cutscene.unsaved matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red"}]
execute if score localization l matches 1 if score @s cutscene.unsaved matches 1 run tellraw @s [{"text":"⚠ ВНИМАНИЕ","color":"red","bold":true}]
execute if score localization l matches 1 if score @s cutscene.unsaved matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red"}]
execute if score localization l matches 1 if score @s cutscene.unsaved matches 1 run tellraw @s ""
execute if score localization l matches 1 if score @s cutscene.unsaved matches 1 run tellraw @s {"text":"Катсцена не сохранена!","color":"yellow"}
execute if score localization l matches 1 if score @s cutscene.unsaved matches 1 run tellraw @s {"text":"Все изменения будут потеряны.","color":"gray"}
execute if score localization l matches 1 if score @s cutscene.unsaved matches 1 run tellraw @s ""
execute if score localization l matches 1 if score @s cutscene.unsaved matches 1 run tellraw @s [{"text":"[Выйти без сохранения]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_exit_force"}},{"text":"  "},{"text":"[Отмена]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/tellraw @s {\"text\":\"Выход отменен\",\"color\":\"green\"}"}}]
execute if score localization l matches 1 if score @s cutscene.unsaved matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red"}]
execute if score localization l matches 1 if score @s cutscene.unsaved matches 1 run tellraw @s ""

# Если катсцена не сохранена - предупреждение (English)
execute if score localization l matches 2 if score @s cutscene.unsaved matches 1 run tellraw @s ""
execute if score localization l matches 2 if score @s cutscene.unsaved matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red"}]
execute if score localization l matches 2 if score @s cutscene.unsaved matches 1 run tellraw @s [{"text":"⚠ WARNING","color":"red","bold":true}]
execute if score localization l matches 2 if score @s cutscene.unsaved matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red"}]
execute if score localization l matches 2 if score @s cutscene.unsaved matches 1 run tellraw @s ""
execute if score localization l matches 2 if score @s cutscene.unsaved matches 1 run tellraw @s {"text":"Cutscene not saved!","color":"yellow"}
execute if score localization l matches 2 if score @s cutscene.unsaved matches 1 run tellraw @s {"text":"All changes will be lost.","color":"gray"}
execute if score localization l matches 2 if score @s cutscene.unsaved matches 1 run tellraw @s ""
execute if score localization l matches 2 if score @s cutscene.unsaved matches 1 run tellraw @s [{"text":"[Exit without saving]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_exit_force"}},{"text":"  "},{"text":"[Cancel]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/tellraw @s {\"text\":\"Exit cancelled\",\"color\":\"green\"}"}}]
execute if score localization l matches 2 if score @s cutscene.unsaved matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red"}]
execute if score localization l matches 2 if score @s cutscene.unsaved matches 1 run tellraw @s ""
execute if score @s cutscene.unsaved matches 1 run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
execute if score @s cutscene.unsaved matches 1 run return 0

# Если сохранена - выходим сразу
function cutscene:edit/workspace_exit_force
