# Cutscene System - Execute Title Macro
# Макрос для отображения title
# Параметры: title_data (JSON текст из storage)

# Отладка - проверить что передается в макрос
tellraw @a[tag=debug] [{"text":"[DEBUG] Title Macro - title_data: ","color":"gray"},{"nbt":"title_data","storage":"cutscene:temp","color":"white"}]

# Установка времени отображения (по умолчанию)
title @s times 10 40 10

# Отображение title
# title_data содержит JSON строку вида {"text":"Текст"}
# Используем её напрямую в команде title - майкрафт интерпретирует JSON
$title @s title $(title_data)
