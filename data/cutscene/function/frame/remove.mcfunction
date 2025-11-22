# Cutscene System - Remove Frame
# Удаление кадра из катсцены
# Параметры: cutscene, index

# Проверка существования катсцены
$execute store result score #exists cutscene.temp run data get storage cutscene:data cutscenes.$(cutscene)

execute unless score #exists cutscene.temp matches 1.. run tellraw @s {"text":"[Cutscene] Ошибка: Катсцена не найдена","color":"red"}
execute unless score #exists cutscene.temp matches 1.. run return fail

# Проверка существования кадра
$execute store result score #frame_count cutscene.temp run data get storage cutscene:data cutscenes.$(cutscene).frames
$scoreboard players set #index cutscene.temp $(index)

execute if score #index cutscene.temp < #frame_count cutscene.temp run tellraw @s {"text":"[Cutscene] Ошибка: Кадр с таким индексом не существует","color":"red"}
execute if score #index cutscene.temp < #frame_count cutscene.temp run return fail

# Удаление кадра
$data remove storage cutscene:data cutscenes.$(cutscene).frames[$(index)]

# Обновление timestamp изменения
$execute store result storage cutscene:data cutscenes.$(cutscene).modified long 1 run time query gametime

# Сообщение об успехе
tellraw @s [{"text":"[Cutscene] ","color":"green"},{"text":"Кадр удален","color":"white"}]
