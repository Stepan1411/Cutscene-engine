# Cutscene System - Execute Chat
# Отображение сообщения в чат

# Копирование данных чата для отображения (как в меню)
data modify storage cutscene:temp chat_data set from storage cutscene:temp current_frame.chat

# Отображение сообщения
tellraw @s [{"storage":"cutscene:temp","nbt":"chat_data","interpret":true}]
