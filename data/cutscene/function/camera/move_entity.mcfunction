# Cutscene System - Move Camera Entity
# Движение сущности камеры по кадрам

# Получение данных камеры из текущего кадра
execute if data storage cutscene:temp current_frame.camera.tp run data modify storage cutscene:temp camera_tp set value {}
execute if data storage cutscene:temp current_frame.camera.tp run data modify storage cutscene:temp camera_tp.x set from storage cutscene:temp current_frame.camera.tp.x
execute if data storage cutscene:temp current_frame.camera.tp run data modify storage cutscene:temp camera_tp.y set from storage cutscene:temp current_frame.camera.tp.y
execute if data storage cutscene:temp current_frame.camera.tp run data modify storage cutscene:temp camera_tp.z set from storage cutscene:temp current_frame.camera.tp.z
execute if data storage cutscene:temp current_frame.camera.tp run data modify storage cutscene:temp camera_tp.rx set from storage cutscene:temp current_frame.camera.tp.yaw
execute if data storage cutscene:temp current_frame.camera.tp run data modify storage cutscene:temp camera_tp.ry set from storage cutscene:temp current_frame.camera.tp.pitch

# Поиск entity камеры
scoreboard players operation #find_id cutscene.temp = @s cutscene.id

# Телепортация entity
execute if data storage cutscene:temp camera_tp.x as @e[tag=cutscene.camera] if score @s cutscene.id = #find_id cutscene.temp run function cutscene:camera/tp_entity with storage cutscene:temp camera_tp

# Очистка
data remove storage cutscene:temp camera_tp
