# Меню сообщений - действия
execute if score @s cutscene.message_point matches 1 run function cutscene:edit/workspace_messages_title_menu
execute if score @s cutscene.message_point matches 2 run function cutscene:edit/workspace_messages_subtitle_menu
execute if score @s cutscene.message_point matches 3 run function cutscene:edit/workspace_messages_actionbar_menu
execute if score @s cutscene.message_point matches 4 run function cutscene:edit/workspace_messages_chat_menu
execute if score @s cutscene.message_point matches 5 run function cutscene:edit/workspace_messages_back
