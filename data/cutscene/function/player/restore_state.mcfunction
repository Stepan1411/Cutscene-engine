# Cutscene System - Restore Player State
# Восстановление сохраненного состояния игрока

# Отладка
tellraw @s[tag=debug] [{"text":"[DEBUG] Восстановление состояния: ","color":"gray"},{"nbt":"found_player.saved_state","storage":"cutscene:temp"}]

# Восстановление позиции
execute if data storage cutscene:temp found_player.saved_state.x run function cutscene:player/restore_position with storage cutscene:temp found_player.saved_state

# Восстановление gamemode (без макроса, проверяем напрямую)
execute if data storage cutscene:temp found_player.saved_state.gamemode run function cutscene:player/restore_gamemode
execute unless data storage cutscene:temp found_player.saved_state.gamemode run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Ошибка: gamemode не найден в saved_state","color":"red"}]
