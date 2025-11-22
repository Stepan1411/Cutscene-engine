# Cutscene System - Validate ID
# Валидация ID катсцены
# Параметры: id

# Проверка формата ID (должен содержать только a-z, 0-9, _, -)
# В Minecraft нет встроенной валидации строк, поэтому используем упрощенную проверку

# Проверка уникальности
$execute store result score #exists cutscene.temp run data get storage cutscene:data cutscenes.$(id)

# Результат валидации сохраняется в #valid cutscene.temp
# 0 = невалидный, 1 = валидный
scoreboard players set #valid cutscene.temp 1

# Если ID уже существует - невалидный
execute if score #exists cutscene.temp matches 1.. run scoreboard players set #valid cutscene.temp 0
