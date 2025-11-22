# Cutscene System - Add Frame
# Добавление кадра в катсцену
# Параметры: cutscene, tick, title (опционально), subtitle (опционально), fadeIn, stay, fadeOut, sound (опционально), effects (опционально), camera (опционально), commands (опционально)

# Проверка существования катсцены
$execute store result score #exists cutscene.temp run data get storage cutscene:data cutscenes.$(cutscene)

execute unless score #exists cutscene.temp matches 1.. run tellraw @s {"text":"[Cutscene] Ошибка: Катсцена не найдена","color":"red"}
execute unless score #exists cutscene.temp matches 1.. run return fail

# Проверка диапазона tick
$execute store result score #duration cutscene.temp run data get storage cutscene:data cutscenes.$(cutscene).duration
$scoreboard players set #tick cutscene.temp $(tick)

execute if score #tick cutscene.temp matches ..-1 run tellraw @s {"text":"[Cutscene] Ошибка: Tick не может быть отрицательным","color":"red"}
execute if score #tick cutscene.temp matches ..-1 run return fail

execute if score #tick cutscene.temp > #duration cutscene.temp run tellraw @s {"text":"[Cutscene] Ошибка: Tick превышает длительность катсцены","color":"red"}
execute if score #tick cutscene.temp > #duration cutscene.temp run return fail

# Создание базовой структуры кадра
$data modify storage cutscene:temp new_frame set value {tick:$(tick)}

# Добавление опциональных параметров через макросы
# Примечание: параметры должны передаваться как JSON строки
# Пример вызова: /function cutscene:frame/add {cutscene:"intro",tick:0,title:'{"text":"Hello"}',fadeIn:10,stay:40,fadeOut:10}

# Добавление кадра в массив
$data modify storage cutscene:data cutscenes.$(cutscene).frames append from storage cutscene:temp new_frame

# Обновление timestamp изменения
$execute store result storage cutscene:data cutscenes.$(cutscene).modified long 1 run time query gametime

# Сообщение об успехе
$tellraw @s [{"text":"[Cutscene] ","color":"green"},{"text":"Кадр добавлен на тик $(tick)","color":"white"}]

# Очистка временных данных
data remove storage cutscene:temp new_frame
