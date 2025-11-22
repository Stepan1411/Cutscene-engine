# Главное меню - действия
execute if score @s cutscene.menu_point matches 1 run function cutscene:edit/workspace_add_point
execute if score @s cutscene.menu_point matches 2 run function cutscene:edit/workspace_delete_point
execute if score @s cutscene.menu_point matches 3 run function cutscene:edit/workspace_preview
execute if score @s cutscene.menu_point matches 4 run function cutscene:edit/workspace_render
execute if score @s cutscene.menu_point matches 5 run function cutscene:edit/workspace_messages_open
execute if score @s cutscene.menu_point matches 6 run function cutscene:edit/workspace_settings_open
execute if score @s cutscene.menu_point matches 7 run function cutscene:edit/workspace_exit_check
