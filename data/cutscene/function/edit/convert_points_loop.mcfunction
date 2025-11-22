# Cutscene System - Convert Points Loop
# Преобразование точек в кадры

# Проверка наличия точек
execute unless data storage cutscene:temp save_list[0] run return 0

# Получение точки
data modify storage cutscene:temp current_save_point set from storage cutscene:temp save_list[0]

# Отладка - показать исходную точку
tellraw @a[tag=debug] [{"text":"[DEBUG] Исходная точка: ","color":"gray"},{"nbt":"current_save_point","storage":"cutscene:temp","color":"white"}]

# Создание кадра
data modify storage cutscene:temp new_frame set value {}
data modify storage cutscene:temp new_frame.tick set from storage cutscene:temp current_save_point.tick
data modify storage cutscene:temp new_frame.camera set value {tp:{}}

# Новый формат (pos[] и rot[])
data modify storage cutscene:temp new_frame.camera.tp.x set from storage cutscene:temp current_save_point.pos[0]
data modify storage cutscene:temp new_frame.camera.tp.y set from storage cutscene:temp current_save_point.pos[1]
data modify storage cutscene:temp new_frame.camera.tp.z set from storage cutscene:temp current_save_point.pos[2]
data modify storage cutscene:temp new_frame.camera.tp.yaw set from storage cutscene:temp current_save_point.rot[0]
data modify storage cutscene:temp new_frame.camera.tp.pitch set from storage cutscene:temp current_save_point.rot[1]

# Старый формат (x, y, z) - если новый формат не сработал
execute unless data storage cutscene:temp new_frame.camera.tp.x run data modify storage cutscene:temp new_frame.camera.tp.x set from storage cutscene:temp current_save_point.x
execute unless data storage cutscene:temp new_frame.camera.tp.y run data modify storage cutscene:temp new_frame.camera.tp.y set from storage cutscene:temp current_save_point.y
execute unless data storage cutscene:temp new_frame.camera.tp.z run data modify storage cutscene:temp new_frame.camera.tp.z set from storage cutscene:temp current_save_point.z
execute unless data storage cutscene:temp new_frame.camera.tp.yaw run data modify storage cutscene:temp new_frame.camera.tp.yaw set from storage cutscene:temp current_save_point.yaw
execute unless data storage cutscene:temp new_frame.camera.tp.pitch run data modify storage cutscene:temp new_frame.camera.tp.pitch set from storage cutscene:temp current_save_point.pitch

# Копирование сообщений если есть
execute if data storage cutscene:temp current_save_point.title run data modify storage cutscene:temp new_frame.title set from storage cutscene:temp current_save_point.title
execute if data storage cutscene:temp current_save_point.subtitle run data modify storage cutscene:temp new_frame.subtitle set from storage cutscene:temp current_save_point.subtitle
execute if data storage cutscene:temp current_save_point.actionbar run data modify storage cutscene:temp new_frame.actionbar set from storage cutscene:temp current_save_point.actionbar
execute if data storage cutscene:temp current_save_point.chat run data modify storage cutscene:temp new_frame.chat set from storage cutscene:temp current_save_point.chat

# Отладка
tellraw @a[tag=debug] [{"text":"[DEBUG] Кадр: ","color":"gray"},{"nbt":"new_frame","storage":"cutscene:temp","color":"white"}]

# Добавление кадра
data modify storage cutscene:temp save_frames append from storage cutscene:temp new_frame

# Удаление обработанной точки
data remove storage cutscene:temp save_list[0]

# Рекурсия
execute if data storage cutscene:temp save_list[0] run function cutscene:edit/convert_points_loop
