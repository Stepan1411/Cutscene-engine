# Cutscene System - Destroy Camera Entity
# Удаление сущности камеры

# Поиск entity камеры
scoreboard players operation #find_id cutscene.temp = @s cutscene.id

# Удаление entity
execute as @e[tag=cutscene.camera] if score @s cutscene.id = #find_id cutscene.temp run kill @s

# Выход из spectate
spectate

# Сообщение
tellraw @s[tag=debug] {"text":"[DEBUG] Camera entity удален","color":"yellow"}
