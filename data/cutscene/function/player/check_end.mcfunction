# Cutscene System - Check End
# Проверка завершения катсцены

# Длительность хранится в cutscene.duration
# Таймер в cutscene.timer

# Отладка
execute if entity @s[tag=debug] run tellraw @s [{"text":"[DEBUG] Duration: ","color":"gray"},{"score":{"name":"@s","objective":"cutscene.duration"},"color":"white"},{"text":" Timer: ","color":"gray"},{"score":{"name":"@s","objective":"cutscene.timer"},"color":"white"}]

# Если таймер достиг длительности - завершить катсцену
execute if entity @s[tag=debug] if score @s cutscene.timer >= @s cutscene.duration run tellraw @s {"text":"[DEBUG] Завершение катсцены","color":"yellow"}
execute if score @s cutscene.timer >= @s cutscene.duration run function cutscene:player/stop
