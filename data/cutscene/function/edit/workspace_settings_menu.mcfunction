# Cutscene System - Workspace Settings Menu
# Меню настроек в actionbar

# Russian
execute if score localization l matches 1 if score @s cutscene.settings_point matches 1 run title @s actionbar [{"text":"[📏 Длина]","color":"aqua"},{"text":" | 💾 Сохранить | 📂 Загрузить | 🏁 Окончание | 🔙 Сбросить | ◀ Назад","color":"gray"}]
execute if score localization l matches 1 if score @s cutscene.settings_point matches 2 run title @s actionbar [{"text":"📏 Длина | ","color":"gray"},{"text":"[💾 Сохранить]","color":"green"},{"text":" | 📂 Загрузить | 🏁 Окончание | 🔙 Сбросить | ◀ Назад","color":"gray"}]
execute if score localization l matches 1 if score @s cutscene.settings_point matches 3 run title @s actionbar [{"text":"📏 Длина | 💾 Сохранить | ","color":"gray"},{"text":"[📂 Загрузить]","color":"yellow"},{"text":" | 🏁 Окончание | 🔙 Сбросить | ◀ Назад","color":"gray"}]
execute if score localization l matches 1 if score @s cutscene.settings_point matches 4 run title @s actionbar [{"text":"📏 Длина | 💾 Сохранить | 📂 Загрузить | ","color":"gray"},{"text":"[🏁 Окончание]","color":"light_purple"},{"text":" | 🔙 Сбросить | ◀ Назад","color":"gray"}]
execute if score localization l matches 1 if score @s cutscene.settings_point matches 5 run title @s actionbar [{"text":"📏 Длина | 💾 Сохранить | 📂 Загрузить | 🏁 Окончание | ","color":"gray"},{"text":"[ 🔙 Сбросить]","color":"red"},{"text":" | ◀ Назад","color":"gray"}]
execute if score localization l matches 1 if score @s cutscene.settings_point matches 6 run title @s actionbar [{"text":"📏 Длина | 💾 Сохранить | 📂 Загрузить | 🏁 Окончание | 🔙 Сбросить | ","color":"gray"},{"text":"[◀ Назад]","color":"red"}]

# English
execute if score localization l matches 2 if score @s cutscene.settings_point matches 1 run title @s actionbar [{"text":"[📏 Length]","color":"aqua"},{"text":" | 💾 Save | 📂 Load | 🏁 Ending | 🔙 Reset | ◀ Back","color":"gray"}]
execute if score localization l matches 2 if score @s cutscene.settings_point matches 2 run title @s actionbar [{"text":"📏 Length | ","color":"gray"},{"text":"[💾 Save]","color":"green"},{"text":" | 📂 Load | 🏁 Ending | 🔙 Reset | ◀ Back","color":"gray"}]
execute if score localization l matches 2 if score @s cutscene.settings_point matches 3 run title @s actionbar [{"text":"📏 Length | 💾 Save | ","color":"gray"},{"text":"[📂 Load]","color":"yellow"},{"text":" | 🏁 Ending | 🔙 Reset | ◀ Back","color":"gray"}]
execute if score localization l matches 2 if score @s cutscene.settings_point matches 4 run title @s actionbar [{"text":"📏 Length | 💾 Save | 📂 Load | ","color":"gray"},{"text":"[🏁 Ending]","color":"light_purple"},{"text":" | 🔙 Reset | ◀ Back","color":"gray"}]
execute if score localization l matches 2 if score @s cutscene.settings_point matches 5 run title @s actionbar [{"text":"📏 Length | 💾 Save | 📂 Load | 🏁 Ending | ","color":"gray"},{"text":"[ 🔙 Reset]","color":"red"},{"text":" | ◀ Back","color":"gray"}]
execute if score localization l matches 2 if score @s cutscene.settings_point matches 6 run title @s actionbar [{"text":"📏 Length | 💾 Save | 📂 Load | 🏁 Ending | 🔙 Reset | ","color":"gray"},{"text":"[◀ Back]","color":"red"}]
