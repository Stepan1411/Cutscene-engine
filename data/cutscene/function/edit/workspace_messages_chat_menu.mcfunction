# Cutscene System - Chat Message Menu
# Меню настройки сообщения в чат

execute store result score #has_text cutscene.temp run data get storage cutscene:temp message_chat

# Russian
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
execute if score localization l matches 1 run tellraw @s {"text":"⚙ Настройка сообщения в чат","color":"gold","bold":true}
execute if score localization l matches 1 run tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"📝 ","color":"yellow"},{"text":"Добавить/изменить текст","color":"white","click_event":{"action":"suggest_command","command":"/function cutscene:edit/workspace_messages_chat_set_text {text:\"Text\"}"}}]
execute if score localization l matches 1 run tellraw @s [{"text":"✓ ","color":"green"},{"text":"Применить текст","color":"white","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_messages_chat_apply"}}]
execute if score localization l matches 1 run tellraw @s [{"text":"🎨 ","color":"aqua"},{"text":"Настройки шрифта","color":"white","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_messages_chat_font"}}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
execute if score localization l matches 1 if score #has_text cutscene.temp matches 1.. run tellraw @s [{"text":"📄 Текст: ","color":"gray"},{"storage":"cutscene:temp","nbt":"message_chat","interpret":true}]
execute if score localization l matches 1 unless score #has_text cutscene.temp matches 1.. run tellraw @s {"text":"📄 Текст: (не задан)","color":"dark_gray"}
execute if score localization l matches 1 run tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"[↩ Назад]","color":"gray","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_messages_back"}}]
execute if score localization l matches 1 run tellraw @s ""

# English
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
execute if score localization l matches 2 run tellraw @s {"text":"⚙ Chat Message Settings","color":"gold","bold":true}
execute if score localization l matches 2 run tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"📝 ","color":"yellow"},{"text":"Add/edit text","color":"white","click_event":{"action":"suggest_command","command":"/function cutscene:edit/workspace_messages_chat_set_text {text:\"Text\"}"}}]
execute if score localization l matches 2 run tellraw @s [{"text":"✓ ","color":"green"},{"text":"Apply text","color":"white","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_messages_chat_apply"}}]
execute if score localization l matches 2 run tellraw @s [{"text":"🎨 ","color":"aqua"},{"text":"Font settings","color":"white","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_messages_chat_font"}}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
execute if score localization l matches 2 if score #has_text cutscene.temp matches 1.. run tellraw @s [{"text":"📄 Text: ","color":"gray"},{"storage":"cutscene:temp","nbt":"message_chat","interpret":true}]
execute if score localization l matches 2 unless score #has_text cutscene.temp matches 1.. run tellraw @s {"text":"📄 Text: (not set)","color":"dark_gray"}
execute if score localization l matches 2 run tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"[↩ Back]","color":"gray","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_messages_back"}}]
execute if score localization l matches 2 run tellraw @s ""
