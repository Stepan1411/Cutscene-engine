# Cutscene System - Get Frame from Render Array
# Получить текущий кадр и телепортировать камеру

# Получить данные текущего кадра
function cutscene:player/check_frames

# Если есть данные камеры - телепортировать
execute if data storage cutscene:temp current_frame.camera.tp run function cutscene:camera/render_tp_smooth with storage cutscene:temp current_frame.camera.tp
