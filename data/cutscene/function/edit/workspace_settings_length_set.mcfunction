# Установить длину катсцены
# Параметры: length (в тиках)

$data modify storage cutscene:workspace settings.length set value $(length)

# Вычисление секунд для отображения
$scoreboard players set #new_length cutscene.temp $(length)
scoreboard players operation #seconds cutscene.temp = #new_length cutscene.temp
scoreboard players operation #seconds cutscene.temp /= #20 cutscene.const

# Сообщение об успехе
tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Длина изменена на ","color":"green"},{"score":{"name":"#new_length","objective":"cutscene.temp"},"color":"white","bold":true},{"text":" тиков ","color":"green"},{"text":"(","color":"dark_gray"},{"score":{"name":"#seconds","objective":"cutscene.temp"},"color":"white"},{"text":"с)","color":"dark_gray"}]

# Звук
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2

# Автосохранение workspace
function cutscene:edit/workspace_autosave

# Вернуться в меню настроек
function cutscene:edit/workspace_settings_open
