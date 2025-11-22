# Cutscene System - Render Next Frame
# Переключение на следующий кадр в render массиве

# Найти игрока с этой катсценой
scoreboard players operation #find_id cutscene.temp = @s cutscene.id

# Получить текущий кадр из storage игрока
execute as @a if score @s cutscene.id = #find_id cutscene.temp run function cutscene:camera/render_get_frame
