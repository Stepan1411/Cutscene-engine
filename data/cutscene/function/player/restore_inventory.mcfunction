# Восстановить инвентарь игрока

# Проверить, есть ли сохраненный инвентарь
execute unless data storage cutscene:temp saved_inventory run tellraw @s [{"text":"[Cutscene] ","color":"gold"},{"text":"Нет сохраненного инвентаря","color":"red"}]
execute unless data storage cutscene:temp saved_inventory run return 0

# Очистить текущий инвентарь
clear @s

# Создать временный chest с предметами
execute positioned ~ ~2 ~ run setblock ~ ~ ~ minecraft:chest{Items:[]}
execute positioned ~ ~2 ~ run data modify block ~ ~ ~ Items set from storage cutscene:temp saved_inventory

# Скопировать все слоты из chest в инвентарь игрока
execute positioned ~ ~2 ~ run item replace entity @s container.0 from block ~ ~ ~ container.0
execute positioned ~ ~2 ~ run item replace entity @s container.1 from block ~ ~ ~ container.1
execute positioned ~ ~2 ~ run item replace entity @s container.2 from block ~ ~ ~ container.2
execute positioned ~ ~2 ~ run item replace entity @s container.3 from block ~ ~ ~ container.3
execute positioned ~ ~2 ~ run item replace entity @s container.4 from block ~ ~ ~ container.4
execute positioned ~ ~2 ~ run item replace entity @s container.5 from block ~ ~ ~ container.5
execute positioned ~ ~2 ~ run item replace entity @s container.6 from block ~ ~ ~ container.6
execute positioned ~ ~2 ~ run item replace entity @s container.7 from block ~ ~ ~ container.7
execute positioned ~ ~2 ~ run item replace entity @s container.8 from block ~ ~ ~ container.8
execute positioned ~ ~2 ~ run item replace entity @s container.9 from block ~ ~ ~ container.9
execute positioned ~ ~2 ~ run item replace entity @s container.10 from block ~ ~ ~ container.10
execute positioned ~ ~2 ~ run item replace entity @s container.11 from block ~ ~ ~ container.11
execute positioned ~ ~2 ~ run item replace entity @s container.12 from block ~ ~ ~ container.12
execute positioned ~ ~2 ~ run item replace entity @s container.13 from block ~ ~ ~ container.13
execute positioned ~ ~2 ~ run item replace entity @s container.14 from block ~ ~ ~ container.14
execute positioned ~ ~2 ~ run item replace entity @s container.15 from block ~ ~ ~ container.15
execute positioned ~ ~2 ~ run item replace entity @s container.16 from block ~ ~ ~ container.16
execute positioned ~ ~2 ~ run item replace entity @s container.17 from block ~ ~ ~ container.17
execute positioned ~ ~2 ~ run item replace entity @s container.18 from block ~ ~ ~ container.18
execute positioned ~ ~2 ~ run item replace entity @s container.19 from block ~ ~ ~ container.19
execute positioned ~ ~2 ~ run item replace entity @s container.20 from block ~ ~ ~ container.20
execute positioned ~ ~2 ~ run item replace entity @s container.21 from block ~ ~ ~ container.21
execute positioned ~ ~2 ~ run item replace entity @s container.22 from block ~ ~ ~ container.22
execute positioned ~ ~2 ~ run item replace entity @s container.23 from block ~ ~ ~ container.23
execute positioned ~ ~2 ~ run item replace entity @s container.24 from block ~ ~ ~ container.24
execute positioned ~ ~2 ~ run item replace entity @s container.25 from block ~ ~ ~ container.25
execute positioned ~ ~2 ~ run item replace entity @s container.26 from block ~ ~ ~ container.26

# Удалить временный chest
execute positioned ~ ~2 ~ run setblock ~ ~ ~ minecraft:air
