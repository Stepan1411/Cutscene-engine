# Cutscene System - Skip Cutscene
# Пропуск катсцены (можно вызвать при приседании или ударе)

# Сообщение
execute if score localization l matches 1 run tellraw @s [{"text":"[Cutscene] ","color":"gold"},{"text":"Катсцена пропущена","color":"yellow"}]
execute if score localization l matches 2 run tellraw @s [{"text":"[Cutscene] ","color":"gold"},{"text":"Cutscene skipped","color":"yellow"}]

# Остановить катсцену
function cutscene:player/stop
