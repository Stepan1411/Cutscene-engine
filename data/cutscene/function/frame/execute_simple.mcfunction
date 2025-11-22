# Cutscene System - Execute Frame Simple
# Упрощенное выполнение кадра (без макросов)

# Отладка
tellraw @a[tag=debug] {"text":"[DEBUG] Выполнение кадра","color":"gray"}
execute if data storage cutscene:temp current_frame.title run tellraw @a[tag=debug] {"text":"[DEBUG] Есть title","color":"green"}
execute if data storage cutscene:temp current_frame.particle run tellraw @a[tag=debug] {"text":"[DEBUG] Есть particle","color":"green"}

# Выполнение title если есть
execute if data storage cutscene:temp current_frame.title run function cutscene:frame/execute_title

# Выполнение subtitle если есть
execute if data storage cutscene:temp current_frame.subtitle run function cutscene:frame/execute_subtitle

# Выполнение actionbar если есть
execute if data storage cutscene:temp current_frame.actionbar run function cutscene:frame/execute_actionbar

# Выполнение chat сообщения если есть
execute if data storage cutscene:temp current_frame.chat run function cutscene:frame/execute_chat

# Воспроизведение звука если есть
execute if data storage cutscene:temp current_frame.sound run function cutscene:frame/execute_sound

# Воспроизведение частиц если есть
execute if data storage cutscene:temp current_frame.particle run function cutscene:frame/execute_particles

# Движение камеры если есть
execute if data storage cutscene:temp current_frame.camera run function cutscene:camera/move_entity

# Очистка временных данных
data remove storage cutscene:temp current_frame
