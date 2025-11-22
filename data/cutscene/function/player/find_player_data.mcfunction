# Cutscene System - Find Player Data
# Поиск данных игрока в storage по UUID

# Копирование данных игрока во временное хранилище
data modify storage cutscene:temp found_player set value {}

# Поиск игрока в массиве players
# Это упрощенная версия - в реальности нужна более сложная логика поиска
execute store result score #found cutscene.temp run data get storage cutscene:data players[0]
execute if score #found cutscene.temp matches 1.. run data modify storage cutscene:temp found_player set from storage cutscene:data players[0]
