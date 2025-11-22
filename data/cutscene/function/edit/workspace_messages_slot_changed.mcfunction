# Обработка изменения слота в меню сообщений

# Определить направление прокрутки
execute if score #current_slot cutscene.temp > @s cutscene.slot run scoreboard players add @s cutscene.message_point 1
execute if score #current_slot cutscene.temp < @s cutscene.slot run scoreboard players remove @s cutscene.message_point 1

# Ограничение диапазона (1-5)
execute if score @s cutscene.message_point matches ..0 run scoreboard players set @s cutscene.message_point 5
execute if score @s cutscene.message_point matches 6.. run scoreboard players set @s cutscene.message_point 1
