# Проверить расстояние до точки
$data modify storage cutscene:temp check_point set from storage cutscene:workspace points[$(check_index)]

# Вычислить расстояние (упрощенно - сумма квадратов разностей)
execute store result score #px cutscene.temp run data get entity @s Pos[0] 100
execute store result score #py cutscene.temp run data get entity @s Pos[1] 100
execute store result score #pz cutscene.temp run data get entity @s Pos[2] 100

execute store result score #tx cutscene.temp run data get storage cutscene:temp check_point.pos[0] 100
execute store result score #ty cutscene.temp run data get storage cutscene:temp check_point.pos[1] 100
execute store result score #tz cutscene.temp run data get storage cutscene:temp check_point.pos[2] 100

scoreboard players operation #dx cutscene.temp = #px cutscene.temp
scoreboard players operation #dx cutscene.temp -= #tx cutscene.temp
scoreboard players operation #dy cutscene.temp = #py cutscene.temp
scoreboard players operation #dy cutscene.temp -= #ty cutscene.temp
scoreboard players operation #dz cutscene.temp = #pz cutscene.temp
scoreboard players operation #dz cutscene.temp -= #tz cutscene.temp

# Абсолютные значения
execute if score #dx cutscene.temp matches ..-1 run scoreboard players operation #dx cutscene.temp *= #-1 cutscene.const
execute if score #dy cutscene.temp matches ..-1 run scoreboard players operation #dy cutscene.temp *= #-1 cutscene.const
execute if score #dz cutscene.temp matches ..-1 run scoreboard players operation #dz cutscene.temp *= #-1 cutscene.const

# Сумма (приближенное расстояние)
scoreboard players operation #distance cutscene.temp = #dx cutscene.temp
scoreboard players operation #distance cutscene.temp += #dy cutscene.temp
scoreboard players operation #distance cutscene.temp += #dz cutscene.temp

# Обновить минимум
execute if score #distance cutscene.temp < #min_distance cutscene.temp run scoreboard players operation #closest_point cutscene.temp = #current_index cutscene.temp
execute if score #distance cutscene.temp < #min_distance cutscene.temp run scoreboard players operation #min_distance cutscene.temp = #distance cutscene.temp
