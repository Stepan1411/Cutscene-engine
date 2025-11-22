# Cutscene System - Restore Gamemode
# Восстановление режима игры
# playerGameType возвращает ЧИСЛО: 0=survival, 1=creative, 2=adventure, 3=spectator

# Отладка - показать что пытаемся восстановить
tellraw @s[tag=debug] [{"text":"[DEBUG] Попытка восстановить gamemode: ","color":"yellow"},{"nbt":"found_player.saved_state.gamemode","storage":"cutscene:temp"}]

# Проверить каждый возможный gamemode по числу и восстановить
execute if data storage cutscene:temp found_player.saved_state{gamemode:0} run gamemode survival @s
execute if data storage cutscene:temp found_player.saved_state{gamemode:1} run gamemode creative @s
execute if data storage cutscene:temp found_player.saved_state{gamemode:2} run gamemode adventure @s
execute if data storage cutscene:temp found_player.saved_state{gamemode:3} run gamemode spectator @s

tellraw @s[tag=debug] [{"text":"[DEBUG] Gamemode восстановлен","color":"green"}]
