# Cutscene System - Workspace Reset Confirm
# Подтверждение сброса - выполнить сброс

# Очистить все данные workspace
data remove storage cutscene:workspace points
data remove storage cutscene:workspace original_points
data remove storage cutscene:workspace generated_points
data modify storage cutscene:workspace settings set value {length:200}
data modify storage cutscene:workspace name set value "Untitled"

# Очистить настройки окончания
data remove storage cutscene:workspace settings.ending

# Сбросить флаг несохраненных изменений
scoreboard players reset @s cutscene.unsaved

# Обновить bossbar
execute if score localization l matches 1 run bossbar set cutscene:editor name [{"text":"Катсцена: ","color":"gold"},{"text":"Без названия","color":"white"}]
execute if score localization l matches 2 run bossbar set cutscene:editor name [{"text":"Cutscene: ","color":"gold"},{"text":"Untitled","color":"white"}]
bossbar set cutscene:editor value 0
bossbar set cutscene:editor max 200

# Сообщение
tellraw @s ""
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"green"}]
execute if score localization l matches 1 run tellraw @s [{"text":"✓ Рабочая область сброшена","color":"green","bold":true}]
execute if score localization l matches 2 run tellraw @s [{"text":"✓ Workspace reset","color":"green","bold":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"green"}]
tellraw @s ""

playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.5
