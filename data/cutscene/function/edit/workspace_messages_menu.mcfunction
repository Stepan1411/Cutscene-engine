# Cutscene System - Messages Menu
# Меню сообщений

# Russian
execute if score localization l matches 1 if score @s cutscene.message_point matches 1 run title @s actionbar [{"text":"[Title]","color":"gold"},{"text":" | Subtitle | Actionbar | Чат | ◀ Назад","color":"gray"}]
execute if score localization l matches 1 if score @s cutscene.message_point matches 2 run title @s actionbar [{"text":"Title | ","color":"gray"},{"text":"[Subtitle]","color":"gold"},{"text":" | Actionbar | Чат | ◀ Назад","color":"gray"}]
execute if score localization l matches 1 if score @s cutscene.message_point matches 3 run title @s actionbar [{"text":"Title | Subtitle | ","color":"gray"},{"text":"[Actionbar]","color":"gold"},{"text":" | Чат | ◀ Назад","color":"gray"}]
execute if score localization l matches 1 if score @s cutscene.message_point matches 4 run title @s actionbar [{"text":"Title | Subtitle | Actionbar | ","color":"gray"},{"text":"[Чат]","color":"gold"},{"text":" | ◀ Назад","color":"gray"}]
execute if score localization l matches 1 if score @s cutscene.message_point matches 5 run title @s actionbar [{"text":"Title | Subtitle | Actionbar | Чат | ","color":"gray"},{"text":"[◀ Назад]","color":"red"}]

# English
execute if score localization l matches 2 if score @s cutscene.message_point matches 1 run title @s actionbar [{"text":"[Title]","color":"gold"},{"text":" | Subtitle | Actionbar | Chat | ◀ Back","color":"gray"}]
execute if score localization l matches 2 if score @s cutscene.message_point matches 2 run title @s actionbar [{"text":"Title | ","color":"gray"},{"text":"[Subtitle]","color":"gold"},{"text":" | Actionbar | Chat | ◀ Back","color":"gray"}]
execute if score localization l matches 2 if score @s cutscene.message_point matches 3 run title @s actionbar [{"text":"Title | Subtitle | ","color":"gray"},{"text":"[Actionbar]","color":"gold"},{"text":" | Chat | ◀ Back","color":"gray"}]
execute if score localization l matches 2 if score @s cutscene.message_point matches 4 run title @s actionbar [{"text":"Title | Subtitle | Actionbar | ","color":"gray"},{"text":"[Chat]","color":"gold"},{"text":" | ◀ Back","color":"gray"}]
execute if score localization l matches 2 if score @s cutscene.message_point matches 5 run title @s actionbar [{"text":"Title | Subtitle | Actionbar | Chat | ","color":"gray"},{"text":"[◀ Back]","color":"red"}]
