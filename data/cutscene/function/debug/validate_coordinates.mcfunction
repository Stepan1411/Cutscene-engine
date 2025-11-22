# Cutscene System - Validate Coordinates
# Проверка валидности координат после интерполяции

# Проверить первую точку на нулевые координаты
execute store result score #check_x cutscene.temp run data get storage cutscene:workspace generated_points[0].pos[0] 1000
execute store result score #check_y cutscene.temp run data get storage cutscene:workspace generated_points[0].pos[1] 1000
execute store result score #check_z cutscene.temp run data get storage cutscene:workspace generated_points[0].pos[2] 1000

# Предупреждение если все координаты близки к нулю
execute if score #check_x cutscene.temp matches -10..10 if score #check_y cutscene.temp matches -10..10 if score #check_z cutscene.temp matches -10..10 run tellraw @a [{"text":"[Editor] ","color":"gold"},{"text":"ПРЕДУПРЕЖДЕНИЕ: Обнаружены точки близкие к 0,0,0. Проверьте корректность интерполяции!","color":"red"}]

# Проверить наличие данных в точках
execute unless data storage cutscene:workspace generated_points[0].pos[0] run tellraw @a [{"text":"[Editor] ","color":"gold"},{"text":"ОШИБКА: Отсутствуют координаты X в сгенерированных точках!","color":"red"}]
execute unless data storage cutscene:workspace generated_points[0].pos[1] run tellraw @a [{"text":"[Editor] ","color":"gold"},{"text":"ОШИБКА: Отсутствуют координаты Y в сгенерированных точках!","color":"red"}]
execute unless data storage cutscene:workspace generated_points[0].pos[2] run tellraw @a [{"text":"[Editor] ","color":"gold"},{"text":"ОШИБКА: Отсутствуют координаты Z в сгенерированных точках!","color":"red"}]

# Успешная валидация
execute if data storage cutscene:workspace generated_points[0].pos[0] if data storage cutscene:workspace generated_points[0].pos[1] if data storage cutscene:workspace generated_points[0].pos[2] run tellraw @a[tag=debug] [{"text":"[DEBUG] Валидация координат пройдена","color":"green"}]
