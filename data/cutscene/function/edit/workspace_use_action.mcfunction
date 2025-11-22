# Cutscene System - Workspace Use Action
# Выполнить действие по текущему пункту меню

# Установить cooldown ПЕРЕД выполнением действия (10 тиков = 0.5 секунды)
scoreboard players set @s cutscene.cooldown 10

# Звук нажатия
execute at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 1.5

# Проверка режима настроек
execute if score @s cutscene.settings_mode matches 1 run function cutscene:edit/workspace_settings_use_action
execute if score @s cutscene.settings_mode matches 1 run return 0

# Проверка режима сообщений
execute if score @s cutscene.messages_mode matches 1 run function cutscene:edit/workspace_messages_use_action
execute if score @s cutscene.messages_mode matches 1 run return 0

# Главное меню
function cutscene:edit/workspace_main_use_action
