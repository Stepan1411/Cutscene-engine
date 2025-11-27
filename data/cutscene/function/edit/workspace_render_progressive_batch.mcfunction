# Обработка пакета кадров (до 50 за раз)
execute if score #t cutscene.temp >= #ticks_per_segment cutscene.temp run return 0
execute if score #batch_count cutscene.temp matches 50.. run return 0

# Защита от бесконечного цикла - если кадров больше чем ожидалось
execute if score #rendered_frames cutscene.temp > #total_frames cutscene.temp run return 0

# Получить координаты точки 1
execute store result score #p1_x cutscene.temp run data get storage cutscene:temp point1.pos[0] 1000
execute store result score #p1_y cutscene.temp run data get storage cutscene:temp point1.pos[1] 1000
execute store result score #p1_z cutscene.temp run data get storage cutscene:temp point1.pos[2] 1000
execute store result score #p1_rx cutscene.temp run data get storage cutscene:temp point1.rot[0] 100
execute store result score #p1_ry cutscene.temp run data get storage cutscene:temp point1.rot[1] 100

# Получить координаты точки 2
execute store result score #p2_x cutscene.temp run data get storage cutscene:temp point2.pos[0] 1000
execute store result score #p2_y cutscene.temp run data get storage cutscene:temp point2.pos[1] 1000
execute store result score #p2_z cutscene.temp run data get storage cutscene:temp point2.pos[2] 1000
execute store result score #p2_rx cutscene.temp run data get storage cutscene:temp point2.rot[0] 100
execute store result score #p2_ry cutscene.temp run data get storage cutscene:temp point2.rot[1] 100

# Вычислить разницу
scoreboard players operation #p2_x cutscene.temp -= #p1_x cutscene.temp
scoreboard players operation #p2_y cutscene.temp -= #p1_y cutscene.temp
scoreboard players operation #p2_z cutscene.temp -= #p1_z cutscene.temp
scoreboard players operation #p2_rx cutscene.temp -= #p1_rx cutscene.temp
scoreboard players operation #p2_ry cutscene.temp -= #p1_ry cutscene.temp

# Wraparound для yaw
execute if score #p2_rx cutscene.temp matches ..-18000 run scoreboard players add #p2_rx cutscene.temp 36000
execute if score #p2_rx cutscene.temp matches 18000.. run scoreboard players remove #p2_rx cutscene.temp 36000

# Интерполяция: delta * t / ticks_per_segment
scoreboard players operation #p2_x cutscene.temp *= #t cutscene.temp
scoreboard players operation #p2_y cutscene.temp *= #t cutscene.temp
scoreboard players operation #p2_z cutscene.temp *= #t cutscene.temp
scoreboard players operation #p2_rx cutscene.temp *= #t cutscene.temp
scoreboard players operation #p2_ry cutscene.temp *= #t cutscene.temp

scoreboard players operation #p2_x cutscene.temp /= #ticks_per_segment cutscene.temp
scoreboard players operation #p2_y cutscene.temp /= #ticks_per_segment cutscene.temp
scoreboard players operation #p2_z cutscene.temp /= #ticks_per_segment cutscene.temp
scoreboard players operation #p2_rx cutscene.temp /= #ticks_per_segment cutscene.temp
scoreboard players operation #p2_ry cutscene.temp /= #ticks_per_segment cutscene.temp

# Добавить к исходной точке
execute store result score #result_x cutscene.temp run data get storage cutscene:temp point1.pos[0] 1000
execute store result score #result_y cutscene.temp run data get storage cutscene:temp point1.pos[1] 1000
execute store result score #result_z cutscene.temp run data get storage cutscene:temp point1.pos[2] 1000
execute store result score #result_rx cutscene.temp run data get storage cutscene:temp point1.rot[0] 100
execute store result score #result_ry cutscene.temp run data get storage cutscene:temp point1.rot[1] 100

scoreboard players operation #result_x cutscene.temp += #p2_x cutscene.temp
scoreboard players operation #result_y cutscene.temp += #p2_y cutscene.temp
scoreboard players operation #result_z cutscene.temp += #p2_z cutscene.temp
scoreboard players operation #result_rx cutscene.temp += #p2_rx cutscene.temp
scoreboard players operation #result_ry cutscene.temp += #p2_ry cutscene.temp

# Wraparound для результата
execute if score #result_rx cutscene.temp matches ..-18000 run scoreboard players add #result_rx cutscene.temp 36000
execute if score #result_rx cutscene.temp matches 18000.. run scoreboard players remove #result_rx cutscene.temp 36000

# Создать точку
data remove storage cutscene:temp inter_point
data modify storage cutscene:temp inter_point set value {pos:[0d,0d,0d],rot:[0f,0f],tick:0}
execute store result storage cutscene:temp inter_point.tick int 1 run scoreboard players get #current_tick cutscene.temp
execute store result storage cutscene:temp inter_point.pos[0] double 0.001 run scoreboard players get #result_x cutscene.temp
execute store result storage cutscene:temp inter_point.pos[1] double 0.001 run scoreboard players get #result_y cutscene.temp
execute store result storage cutscene:temp inter_point.pos[2] double 0.001 run scoreboard players get #result_z cutscene.temp
execute store result storage cutscene:temp inter_point.rot[0] float 0.01 run scoreboard players get #result_rx cutscene.temp
execute store result storage cutscene:temp inter_point.rot[1] float 0.01 run scoreboard players get #result_ry cutscene.temp

# Добавить в результат
data modify storage cutscene:render result append from storage cutscene:temp inter_point

# Следующий кадр
scoreboard players add #t cutscene.temp 1
scoreboard players add #current_tick cutscene.temp 1
scoreboard players add #batch_count cutscene.temp 1
scoreboard players add #rendered_frames cutscene.temp 1

# Продолжить пакет
function cutscene:edit/workspace_render_progressive_batch
