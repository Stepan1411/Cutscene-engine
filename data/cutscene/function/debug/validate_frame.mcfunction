# Cutscene System - Validate Frame Data
# Проверка валидности данных кадра перед выполнением

# Проверить наличие обязательных полей
execute unless data storage cutscene:temp current_frame.tick run tellraw @a [{"text":"[Cutscene] ","color":"gold"},{"text":"ПРЕДУПРЕЖДЕНИЕ: Кадр без поля tick","color":"yellow"}]
execute unless data storage cutscene:temp current_frame.pos run tellraw @a[tag=debug] [{"text":"[DEBUG] Кадр без координат pos","color":"yellow"}]
execute unless data storage cutscene:temp current_frame.rot run tellraw @a[tag=debug] [{"text":"[DEBUG] Кадр без поворота rot","color":"yellow"}]

# Проверить валидность координат если они есть
execute if data storage cutscene:temp current_frame.pos run function cutscene:debug/validate_frame_coords

# Успешная валидация
execute if data storage cutscene:temp current_frame.tick run tellraw @a[tag=debug] [{"text":"[DEBUG] Валидация кадра пройдена","color":"green"}]
