# Меню настроек - действия
execute if score @s cutscene.settings_point matches 1 run function cutscene:edit/workspace_settings_length
execute if score @s cutscene.settings_point matches 2 run function cutscene:edit/workspace_save_prompt
execute if score @s cutscene.settings_point matches 3 run function cutscene:edit/workspace_load_prompt
execute if score @s cutscene.settings_point matches 4 run function cutscene:edit/workspace_settings_ending
execute if score @s cutscene.settings_point matches 5 run function cutscene:edit/workspace_reset_prompt
execute if score @s cutscene.settings_point matches 6 run function cutscene:edit/settings_back
