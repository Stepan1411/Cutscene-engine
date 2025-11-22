# Cutscene System - Delete Cutscene
# Удаление катсцены
# Параметры: id

# Проверка существования катсцены
$execute store result score #exists cutscene.temp run data get storage cutscene:data cutscenes.$(id)

# Если катсцена не существует - ошибка
execute unless score #exists cutscene.temp matches 1.. run tellraw @s {"text":"[Cutscene] Ошибка: Катсцена не найдена","color":"red"}
execute unless score #exists cutscene.temp matches 1.. run return fail

# Остановка всех игроков, которые смотрят эту катсцену
$execute as @a[scores={cutscene.state=1..}] if data storage cutscene:data players[{cutscene_id:"$(id)"}] run function cutscene:player/stop

# Удаление катсцены из storage
$data remove storage cutscene:data cutscenes.$(id)

# Сообщение об успехе
$tellraw @s [{"text":"[Cutscene] ","color":"green"},{"text":"Катсцена '$(id)' удалена успешно","color":"white"}]
