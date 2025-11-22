# Cutscene System - Execute Frame
# Выполнение действий кадра
# Параметры: cutscene, frame_index

# Получение данных кадра из storage
$data modify storage cutscene:temp current_frame set from storage cutscene:data cutscenes.$(cutscene).frames[$(frame_index)]

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

# Применение эффектов если есть
execute if data storage cutscene:temp current_frame.effects run function cutscene:frame/execute_effects

# Телепортация камеры если есть
execute if data storage cutscene:temp current_frame.camera run function cutscene:frame/execute_camera

# Воспроизведение частиц если есть
execute if data storage cutscene:temp current_frame.particle run function cutscene:frame/execute_particles

# Выполнение пользовательских команд если есть
execute if data storage cutscene:temp current_frame.commands run function cutscene:frame/execute_commands

# Очистка временных данных
data remove storage cutscene:temp current_frame
