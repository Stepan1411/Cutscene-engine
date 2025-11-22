# Cutscene System - Validate Frame Coordinates
# Проверка координат кадра

execute unless data storage cutscene:temp current_frame.pos[0] run tellraw @a [{"text":"[Cutscene] ","color":"gold"},{"text":"ОШИБКА: Отсутствует координата X в кадре","color":"red"}]
execute unless data storage cutscene:temp current_frame.pos[1] run tellraw @a [{"text":"[Cutscene] ","color":"gold"},{"text":"ОШИБКА: Отсутствует координата Y в кадре","color":"red"}]
execute unless data storage cutscene:temp current_frame.pos[2] run tellraw @a [{"text":"[Cutscene] ","color":"gold"},{"text":"ОШИБКА: Отсутствует координата Z в кадре","color":"red"}]
