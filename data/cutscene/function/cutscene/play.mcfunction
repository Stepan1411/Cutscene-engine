# Cutscene System - Play Cutscene
# Запуск катсцены для игрока
# Параметры: id, skippable (опционально, по умолчанию 0), skippable_to_end (опционально, по умолчанию 0)

# Проверка существования катсцены
$execute store result score #exists cutscene.temp run data get storage cutscene:data cutscenes.$(id)

# Если катсцена не существует - ошибка
execute unless score #exists cutscene.temp matches 1.. run tellraw @s {"text":"[Cutscene] Ошибка: Катсцена не найдена","color":"red"}
execute unless score #exists cutscene.temp matches 1.. run return fail

# Проверка наличия кадров
$execute store result score #frames cutscene.temp run data get storage cutscene:data cutscenes.$(id).frames

execute if score #frames cutscene.temp matches 0 run tellraw @s {"text":"[Cutscene] Ошибка: Катсцена не содержит кадров","color":"red"}
execute if score #frames cutscene.temp matches 0 run return fail

# Проверка, что игрок не в другой катсцене
execute if entity @s[scores={cutscene.state=1..}] run tellraw @s {"text":"[Cutscene] Ошибка: Вы уже смотрите катсцену","color":"red"}
execute if entity @s[scores={cutscene.state=1..}] run return fail

# Сохранение ID катсцены и загрузка данных с параметрами skippable и skippable_to_end
$data modify storage cutscene:temp play_data set value {id:"$(id)",skippable:$(skippable),skippable_to_end:$(skippable_to_end)}
$data modify storage cutscene:temp cutscene_data set from storage cutscene:data cutscenes.$(id)

# Запуск катсцены для игрока
function cutscene:player/start
