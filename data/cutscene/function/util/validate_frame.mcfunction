# Cutscene System - Validate Frame
# Валидация параметров кадра
# Параметры: cutscene, tick

# Проверка существования катсцены
$execute store result score #exists cutscene.temp run data get storage cutscene:data cutscenes.$(cutscene)

scoreboard players set #valid cutscene.temp 1

# Если катсцена не существует - невалидный
execute unless score #exists cutscene.temp matches 1.. run scoreboard players set #valid cutscene.temp 0

# Проверка диапазона tick
$execute store result score #duration cutscene.temp run data get storage cutscene:data cutscenes.$(cutscene).duration
$scoreboard players set #tick cutscene.temp $(tick)

# Если tick отрицательный или больше длительности - невалидный
execute if score #tick cutscene.temp matches ..-1 run scoreboard players set #valid cutscene.temp 0
execute if score #tick cutscene.temp > #duration cutscene.temp run scoreboard players set #valid cutscene.temp 0
