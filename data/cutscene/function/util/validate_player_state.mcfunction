# Cutscene System - Validate Player State
# Валидация состояния игрока

# Проверка что игрок не в другой катсцене
execute store result score #state cutscene.temp run scoreboard players get @s cutscene.state

scoreboard players set #valid cutscene.temp 1

# Если игрок уже в катсцене (state = 1) - невалидный
execute if score #state cutscene.temp matches 1.. run scoreboard players set #valid cutscene.temp 0
