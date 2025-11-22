# Cutscene System - Get Player State
# Чтение состояния игрока

# Получение UUID игрока
data modify storage cutscene:temp player_uuid set from entity @s UUID

# Поиск и копирование данных игрока
function cutscene:player/find_player_data
