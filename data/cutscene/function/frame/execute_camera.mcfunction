# Cutscene System - Execute Camera
# Управление камерой (телепортация)

# Получение данных телепортации
execute if data storage cutscene:temp current_frame.camera.tp run data modify storage cutscene:temp tp_data set from storage cutscene:temp current_frame.camera.tp

# Телепортация через макрос
execute if data storage cutscene:temp tp_data run function cutscene:frame/execute_camera_macro with storage cutscene:temp tp_data
