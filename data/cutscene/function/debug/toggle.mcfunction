# Cutscene System - Toggle Debug Mode
# Переключение режима отладки для игрока

# Toggle debug tag
execute if entity @s[tag=debug] run tag @s remove debug
execute if entity @s[tag=!debug] run tag @s add debug

# Feedback
execute if entity @s[tag=debug] run tellraw @s [{"text":"[Debug] ","color":"gold"},{"text":"Режим отладки включен","color":"green"}]
execute if entity @s[tag=!debug] run tellraw @s [{"text":"[Debug] ","color":"gold"},{"text":"Режим отладки выключен","color":"gray"}]
