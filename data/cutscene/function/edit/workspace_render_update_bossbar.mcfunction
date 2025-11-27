# Обновление текста bossbar с прогрессом

# Вычислить процент
scoreboard players set #100 cutscene.temp 100
scoreboard players operation #progress_percent cutscene.temp = #rendered_frames cutscene.temp
scoreboard players operation #progress_percent cutscene.temp *= #100 cutscene.temp
scoreboard players operation #progress_percent cutscene.temp /= #total_frames cutscene.temp

# Обновить название bossbar с процентом
execute if score localization l matches 1 run bossbar set cutscene:render name [{"text":"🎬 Рендер: ","color":"light_purple","bold":true},{"score":{"name":"#rendered_frames","objective":"cutscene.temp"},"color":"white"},{"text":"/","color":"gray"},{"score":{"name":"#total_frames","objective":"cutscene.temp"},"color":"white"},{"text":" (","color":"gray"},{"score":{"name":"#progress_percent","objective":"cutscene.temp"},"color":"yellow"},{"text":"%)","color":"gray"}]
execute if score localization l matches 2 run bossbar set cutscene:render name [{"text":"🎬 Rendering: ","color":"light_purple","bold":true},{"score":{"name":"#rendered_frames","objective":"cutscene.temp"},"color":"white"},{"text":"/","color":"gray"},{"score":{"name":"#total_frames","objective":"cutscene.temp"},"color":"white"},{"text":" (","color":"gray"},{"score":{"name":"#progress_percent","objective":"cutscene.temp"},"color":"yellow"},{"text":"%)","color":"gray"}]
