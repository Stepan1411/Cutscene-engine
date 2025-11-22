# Cutscene System - Stop Player
# Остановка катсцены для игрока

# FIX: Получить saved_state из сущности камеры перед удалением
scoreboard players operation #find_id cutscene.temp = @s cutscene.id
execute as @e[tag=cutscene.camera] if score @s cutscene.id = #find_id cutscene.temp run data modify storage cutscene:temp player_saved_state set from entity @s data.saved_state

# Отладка - проверить что saved_state получен
tellraw @s[tag=debug] [{"text":"[DEBUG] Saved state: ","color":"gray"},{"nbt":"player_saved_state","storage":"cutscene:temp"}]

# Удаление сущности камеры
function cutscene:camera/destroy_entity

# Восстановление состояния игрока из saved_state
execute if data storage cutscene:temp player_saved_state run data modify storage cutscene:temp found_player.saved_state set from storage cutscene:temp player_saved_state
execute if data storage cutscene:temp player_saved_state run function cutscene:player/restore_state

# Fallback: если не удалось восстановить - хотя бы выйти из spectator в survival
execute unless data storage cutscene:temp player_saved_state run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Ошибка: не удалось восстановить состояние, возврат в survival","color":"red"}]
execute unless data storage cutscene:temp player_saved_state run gamemode survival @s

# Очистка всех title (ДО применения настроек окончания)
title @s clear
title @s reset

# Снятие эффектов блокировки движения
effect clear @s minecraft:slowness
effect clear @s minecraft:jump_boost
effect clear @s minecraft:invisibility

# Применить настройки окончания (если они есть) - ДО очистки данных!
function cutscene:player/apply_ending_settings

# Очистка scoreboards
scoreboard players set @s cutscene.state 0
scoreboard players set @s cutscene.frame 0
scoreboard players set @s cutscene.timer 0
scoreboard players reset @s cutscene.id
scoreboard players reset @s cutscene.duration

# Очистка временных данных
data remove storage cutscene:temp active_cutscene_id
data remove storage cutscene:temp player_saved_state

# Сообщение о завершении (только для debug)
tellraw @s[tag=debug] {"text":"[Cutscene Engine] Катсцена завершена","color":"yellow"}

# Восстановить визуализацию точек если в режиме редактора
execute if score @s cutscene.editor matches 1 run scoreboard players set @s cutscene.vis_timer 0
