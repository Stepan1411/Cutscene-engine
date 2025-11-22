# Cutscene System - Update Workspace Bossbar
# Обновление bossbar с названием катсцены

# Получить название из workspace или использовать ID и длину
execute store result score #length cutscene.temp run data get storage cutscene:workspace settings.length
scoreboard players operation #seconds cutscene.temp = #length cutscene.temp
scoreboard players operation #seconds cutscene.temp /= #20 cutscene.const

$execute if score localization l matches 1 run bossbar set cutscene:editor name [{"text":"Катсцена: ","color":"gold"},{"text":"$(id)","color":"white"},{"text":" | ","color":"gray"},{"text":"Длина: ","color":"yellow"},{"score":{"name":"#length","objective":"cutscene.temp"},"color":"white"},{"text":" тиков (","color":"gray"},{"score":{"name":"#seconds","objective":"cutscene.temp"},"color":"white"},{"text":"с)","color":"gray"}]
$execute if score localization l matches 2 run bossbar set cutscene:editor name [{"text":"Cutscene: ","color":"gold"},{"text":"$(id)","color":"white"},{"text":" | ","color":"gray"},{"text":"Length: ","color":"yellow"},{"score":{"name":"#length","objective":"cutscene.temp"},"color":"white"},{"text":" ticks (","color":"gray"},{"score":{"name":"#seconds","objective":"cutscene.temp"},"color":"white"},{"text":"s)","color":"gray"}]

# Обновить длительность
execute store result bossbar cutscene:editor max run scoreboard players get #length cutscene.temp

tellraw @a[tag=debug] [{"text":"[DEBUG] Bossbar обновлен: $(id)","color":"green"}]
