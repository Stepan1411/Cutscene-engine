# Cutscene System - Check Frames
# Проверка и выполнение кадров на текущем тике

# Получение текущего таймера
execute store result score #timer cutscene.temp run scoreboard players get @s cutscene.timer

# FIX: Найти сущность камеры по ID игрока и вызвать новый динамический цикл
scoreboard players operation #find_id cutscene.temp = @s cutscene.id
execute as @e[tag=cutscene.camera] if score @s cutscene.id = #find_id cutscene.temp run function cutscene:player/check_frames_loop
