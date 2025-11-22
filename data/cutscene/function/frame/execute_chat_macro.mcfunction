# Макрос для отображения сообщения в чат
# Используем storage с interpret для правильной интерпретации JSON (как в меню)
tellraw @s [{"storage":"cutscene:temp","nbt":"chat_data","interpret":true}]
