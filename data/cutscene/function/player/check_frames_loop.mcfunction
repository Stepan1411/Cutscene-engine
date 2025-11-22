# Cutscene System - Check Frames Loop
# Динамический цикл для проверки кадров из storage (оптимизировано)
# Вызывается для сущности камеры

# Получить ID катсцены и текущий индекс кадра
data modify storage cutscene:temp check_cutscene_id set from entity @s data.cutscene_id
execute store result score #current_frame_index cutscene.temp run scoreboard players get @s cutscene.frame
execute store result storage cutscene:temp current_frame_index int 1 run scoreboard players get @s cutscene.frame

# Получить кадр по индексу через макрос
function cutscene:player/get_frame_by_index with storage cutscene:temp

# Проверить наличие кадра
execute unless data storage cutscene:temp current_frame.tick run return 0

# Получить tick кадра
execute store result score #frame_tick cutscene.temp run data get storage cutscene:temp current_frame.tick

# Если tick больше текущего таймера - кадр еще не наступил
execute if score #frame_tick cutscene.temp > #timer cutscene.temp run return 0

# Найти игрока и выполнить кадр
scoreboard players operation #find_id cutscene.temp = @s cutscene.id
execute as @a if score @s cutscene.id = #find_id cutscene.temp run function cutscene:frame/execute_simple

# Увеличить индекс кадра
scoreboard players add @s cutscene.frame 1

# Продолжить проверку следующих кадров
function cutscene:player/check_frames_loop
