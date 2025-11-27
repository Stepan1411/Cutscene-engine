# Изменить длину катсцены
execute store result score #current_length cutscene.temp run data get storage cutscene:workspace settings.length

# Вычисление секунд
scoreboard players operation #seconds cutscene.temp = #current_length cutscene.temp
scoreboard players operation #seconds cutscene.temp /= #20 cutscene.const

# Russian
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 1 run tellraw @s [{"text":"📏 Настройка длины катсцены","color":"gold","bold":true}]
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"Текущая длительность: ","color":"yellow"},{"score":{"name":"#current_length","objective":"cutscene.temp"},"color":"white","bold":true},{"text":" тиков ","color":"gray"},{"text":"(","color":"dark_gray"},{"score":{"name":"#seconds","objective":"cutscene.temp"},"color":"white"},{"text":"с)","color":"dark_gray"}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"Выберите длину:","color":"yellow"}]
execute if score localization l matches 1 run tellraw @s [{"text":"[3с] ","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:60}"}},{"text":"[5с] ","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:100}"}},{"text":"[10с] ","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:200}"}},{"text":"[15с] ","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:300}"}},{"text":"[20с]","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:400}"}}]
execute if score localization l matches 1 run tellraw @s [{"text":"[30с] ","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:600}"}},{"text":"[45с] ","color":"green","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:900}"}},{"text":"[60с] ","color":"green","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:1200}"}},{"text":"[Свой...]","color":"yellow","click_event":{"action":"suggest_command","command":"/function cutscene:edit/workspace_settings_length_set {length:200}"}}]
execute if score localization l matches 1 run tellraw @s [{"text":"ℹ Постепенный рендер - любая длина!","color":"gray","italic":true}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"[↩ Назад]","color":"gray","click_event":{"action":"run_command","command":"/function cutscene:edit/settings_back"}}]
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 1 run tellraw @s ""

# English
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 2 run tellraw @s [{"text":"📏 Cutscene Length Settings","color":"gold","bold":true}]
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"Current length: ","color":"yellow"},{"score":{"name":"#current_length","objective":"cutscene.temp"},"color":"white","bold":true},{"text":" ticks ","color":"gray"},{"text":"(","color":"dark_gray"},{"score":{"name":"#seconds","objective":"cutscene.temp"},"color":"white"},{"text":"s)","color":"dark_gray"}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"Select length:","color":"yellow"}]
execute if score localization l matches 2 run tellraw @s [{"text":"[3s] ","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:60}"}},{"text":"[5s] ","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:100}"}},{"text":"[10s] ","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:200}"}},{"text":"[15s] ","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:300}"}},{"text":"[20s]","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:400}"}}]
execute if score localization l matches 2 run tellraw @s [{"text":"[30s] ","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:600}"}},{"text":"[45s] ","color":"green","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:900}"}},{"text":"[60s] ","color":"green","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_settings_length_set {length:1200}"}},{"text":"[Custom...]","color":"yellow","click_event":{"action":"suggest_command","command":"/function cutscene:edit/workspace_settings_length_set {length:200}"}}]
execute if score localization l matches 2 run tellraw @s [{"text":"ℹ Progressive render - any length!","color":"gray","italic":true}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"[↩ Back]","color":"gray","click_event":{"action":"run_command","command":"/function cutscene:edit/settings_back"}}]
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 2 run tellraw @s ""
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 1
