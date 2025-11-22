# Cutscene System - Create Cutscene
# Создание новой катсцены
# Параметры: id, name, duration

# Проверка существования катсцены с таким ID
$execute store result score #exists cutscene.temp run data get storage cutscene:data cutscenes.$(id)

# Если катсцена уже существует - ошибка
execute if score #exists cutscene.temp matches 1.. run tellraw @s {"text":"[Cutscene] Ошибка: Катсцена с таким ID уже существует","color":"red"}
execute if score #exists cutscene.temp matches 1.. run return fail

# Валидация длительности (должна быть > 0 и <= 72000)
$scoreboard players set #duration cutscene.temp $(duration)
execute if score #duration cutscene.temp matches ..0 run tellraw @s {"text":"[Cutscene] Ошибка: Длительность должна быть больше 0","color":"red"}
execute if score #duration cutscene.temp matches ..0 run return fail

execute if score #duration cutscene.temp matches 72001.. run tellraw @s {"text":"[Cutscene] Ошибка: Длительность не может превышать 72000 тиков (1 час)","color":"red"}
execute if score #duration cutscene.temp matches 72001.. run return fail

# Создание записи катсцены в storage
$data modify storage cutscene:data cutscenes.$(id) set value {name:"$(name)",duration:$(duration),frames:[],created:0L,modified:0L}

# Установка timestamp создания
$execute store result storage cutscene:data cutscenes.$(id).created long 1 run time query gametime
$execute store result storage cutscene:data cutscenes.$(id).modified long 1 run time query gametime

# Сообщение об успехе
$tellraw @s [{"text":"[Cutscene] ","color":"green"},{"text":"Катсцена '$(name)' создана успешно!","color":"white"}]
$tellraw @s [{"text":"ID: ","color":"yellow"},{"text":"$(id)","color":"white"},{"text":" | Длительность: ","color":"yellow"},{"text":"$(duration)","color":"white"},{"text":" тиков","color":"gray"}]
