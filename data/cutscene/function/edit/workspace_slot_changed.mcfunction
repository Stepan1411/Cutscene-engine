# Cutscene System - Workspace Slot Changed
# Обработка изменения слота (прокрутка колесика)

# Звук пролистывания
execute at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 1.8

# Проверка режима настроек
execute if score @s cutscene.settings_mode matches 1 run function cutscene:edit/workspace_settings_slot_changed
execute if score @s cutscene.settings_mode matches 1 run return 0

# Проверка режима сообщений
execute if score @s cutscene.messages_mode matches 1 run function cutscene:edit/workspace_messages_slot_changed
execute if score @s cutscene.messages_mode matches 1 run return 0

# Главное меню
function cutscene:edit/workspace_main_slot_changed