# Cutscene System - Spectate Camera Entity
# Вселение игрока в сущность камеры

# Переключение в spectator
gamemode spectator @s

# Поиск entity камеры с таким же ID
scoreboard players operation #find_id cutscene.temp = @s cutscene.id

# Вселение в entity (исправлено: используем @s вместо @p)
execute as @e[tag=cutscene.camera] if score @s cutscene.id = #find_id cutscene.temp at @s run spectate @s

# Сообщение
tellraw @s[tag=debug] {"text":"[DEBUG] Вселение в камеру","color":"green"}
