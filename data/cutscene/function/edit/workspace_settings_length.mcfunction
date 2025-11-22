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
execute if score localization l matches 1 run tellraw @s [{"text":"Текущая длина: ","color":"yellow"},{"score":{"name":"#current_length","objective":"cutscene.temp"},"color":"white","bold":true},{"text":" тиков ","color":"gray"},{"text":"(","color":"dark_gray"},{"score":{"name":"#seconds","objective":"cutscene.temp"},"color":"white"},{"text":"с)","color":"dark_gray"}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"Выберите длину:","color":"yellow"}]
execute if score localization l matches 1 run tellraw @s [{"text":"[3с] ","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:60}"},"hoverEvent":{"action":"show_text","contents":"60 тиков"}},{"text":"[5с] ","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:100}"},"hoverEvent":{"action":"show_text","contents":"100 тиков"}},{"text":"[10с] ","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:200}"},"hoverEvent":{"action":"show_text","contents":"200 тиков"}},{"text":"[15с] ","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:300}"},"hoverEvent":{"action":"show_text","contents":"300 тиков"}},{"text":"[20с]","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:400}"},"hoverEvent":{"action":"show_text","contents":"400 тиков"}}]
execute if score localization l matches 1 run tellraw @s [{"text":"[30с] ","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:600}"},"hoverEvent":{"action":"show_text","contents":"600 тиков"}},{"text":"[60с] ","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:1200}"},"hoverEvent":{"action":"show_text","contents":"1200 тиков"}},{"text":"[Свой...]","color":"green","clickEvent":{"action":"suggest_command","value":"/function cutscene:edit/workspace_settings_length_set {length:200}"},"hoverEvent":{"action":"show_text","contents":"Введите свое значение в тиках"}}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"[↩ Назад]","color":"gray","clickEvent":{"action":"run_command","value":"/function cutscene:edit/settings_back"}}]
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
execute if score localization l matches 2 run tellraw @s [{"text":"[3s] ","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:60}"},"hoverEvent":{"action":"show_text","contents":"60 ticks"}},{"text":"[5s] ","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:100}"},"hoverEvent":{"action":"show_text","contents":"100 ticks"}},{"text":"[10s] ","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:200}"},"hoverEvent":{"action":"show_text","contents":"200 ticks"}},{"text":"[15s] ","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:300}"},"hoverEvent":{"action":"show_text","contents":"300 ticks"}},{"text":"[20s]","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:400}"},"hoverEvent":{"action":"show_text","contents":"400 ticks"}}]
execute if score localization l matches 2 run tellraw @s [{"text":"[30s] ","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:600}"},"hoverEvent":{"action":"show_text","contents":"600 ticks"}},{"text":"[60s] ","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length_set {length:1200}"},"hoverEvent":{"action":"show_text","contents":"1200 ticks"}},{"text":"[Custom...]","color":"green","clickEvent":{"action":"suggest_command","value":"/function cutscene:edit/workspace_settings_length_set {length:200}"},"hoverEvent":{"action":"show_text","contents":"Enter custom value in ticks"}}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"[↩ Back]","color":"gray","clickEvent":{"action":"run_command","value":"/function cutscene:edit/settings_back"}}]
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 2 run tellraw @s ""
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 1
