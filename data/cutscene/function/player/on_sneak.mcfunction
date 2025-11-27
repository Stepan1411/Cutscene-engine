# Cutscene System - On Sneak
# Вызывается когда игрок приседает во время катсцены

# Отладочное сообщение
tellraw @s[tag=debug] {"text":"[DEBUG] Приседание обнаружено!","color":"yellow"}

# Проверить, можно ли пропустить катсцену
execute if score @s cutscene.skippable matches 0 run return 0

# Если можно пропустить (skippable = 1)
# Режим 2: Полностью пропустить (skip_to_end = 0) - нужно отключить ending перед stop
execute if score @s cutscene.skip_to_end matches 0 run data remove storage cutscene:temp ending_settings

# Остановить катсцену (apply_ending_settings вызовется внутри stop если есть настройки)
function cutscene:player/stop
