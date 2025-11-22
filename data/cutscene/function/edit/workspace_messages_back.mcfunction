# Вернуться из меню сообщений
scoreboard players set @s cutscene.messages_mode 0
scoreboard players set @s cutscene.menu_point 5
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 1.2
function cutscene:edit/workspace_messages_back

# Принудительно обновить меню
function cutscene:edit/workspace_menu
