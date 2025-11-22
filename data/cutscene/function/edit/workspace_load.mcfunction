# Cutscene System - Load Workspace
# Загрузка точек из катсцены в workspace

$data modify storage cutscene:temp load_id set value "$(id)"

# Проверка существования катсцены
$execute unless data storage cutscene:data cutscenes.$(id) if score localization l matches 1 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Ошибка: катсцена не найдена","color":"red"}]
$execute unless data storage cutscene:data cutscenes.$(id) if score localization l matches 2 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Error: cutscene not found","color":"red"}]
$execute unless data storage cutscene:data cutscenes.$(id) run return 0

# Загрузка точек: приоритет original_points, если нет - frames
$execute if data storage cutscene:data cutscenes.$(id).original_points[0] run data modify storage cutscene:workspace points set from storage cutscene:data cutscenes.$(id).original_points
$execute if data storage cutscene:data cutscenes.$(id).original_points[0] if score localization l matches 1 run tellraw @s [{"text":"[Editor] ","color":"gray"},{"text":"Загружены исходные точки","color":"aqua"}]
$execute if data storage cutscene:data cutscenes.$(id).original_points[0] if score localization l matches 2 run tellraw @s [{"text":"[Editor] ","color":"gray"},{"text":"Original points loaded","color":"aqua"}]

$execute unless data storage cutscene:data cutscenes.$(id).original_points[0] run data modify storage cutscene:workspace points set from storage cutscene:data cutscenes.$(id).frames
$execute unless data storage cutscene:data cutscenes.$(id).original_points[0] if score localization l matches 1 run tellraw @s [{"text":"[Editor] ","color":"gray"},{"text":"Загружены кадры (исходные точки не найдены)","color":"yellow"}]
$execute unless data storage cutscene:data cutscenes.$(id).original_points[0] if score localization l matches 2 run tellraw @s [{"text":"[Editor] ","color":"gray"},{"text":"Frames loaded (original points not found)","color":"yellow"}]

$data modify storage cutscene:workspace name set from storage cutscene:data cutscenes.$(id).name
$data modify storage cutscene:workspace settings.length set from storage cutscene:data cutscenes.$(id).duration

# Загрузить настройки окончания если есть
$execute if data storage cutscene:data cutscenes.$(id).ending run data modify storage cutscene:workspace settings.ending set from storage cutscene:data cutscenes.$(id).ending
$execute if data storage cutscene:data cutscenes.$(id).ending if score localization l matches 1 run tellraw @s [{"text":"[Editor] ","color":"gray"},{"text":"Настройки окончания загружены","color":"aqua"}]
$execute if data storage cutscene:data cutscenes.$(id).ending if score localization l matches 2 run tellraw @s [{"text":"[Editor] ","color":"gray"},{"text":"Ending settings loaded","color":"aqua"}]

# Очистить generated_points при загрузке
data remove storage cutscene:workspace generated_points

# Сообщение
execute if score localization l matches 1 run tellraw @s [{"text":"[Editor] ","color":"gold","bold":true},{"text":"Workspace загружен!","color":"green"}]
execute if score localization l matches 2 run tellraw @s [{"text":"[Editor] ","color":"gold","bold":true},{"text":"Workspace loaded!","color":"green"}]
$execute if score localization l matches 1 run tellraw @s [{"text":"Катсцена: ","color":"gray"},{"text":"$(id)","color":"yellow"}]
$execute if score localization l matches 2 run tellraw @s [{"text":"Cutscene: ","color":"gray"},{"text":"$(id)","color":"yellow"}]
execute store result score #count cutscene.temp run data get storage cutscene:workspace points
execute if score localization l matches 1 run tellraw @s [{"text":"Точек загружено: ","color":"gray"},{"score":{"name":"#count","objective":"cutscene.temp"},"color":"white"}]
execute if score localization l matches 2 run tellraw @s [{"text":"Points loaded: ","color":"gray"},{"score":{"name":"#count","objective":"cutscene.temp"},"color":"white"}]
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.5

# Автосохранение workspace
function cutscene:edit/workspace_autosave
