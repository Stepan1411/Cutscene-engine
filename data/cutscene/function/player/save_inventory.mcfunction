# Сохранить инвентарь игрока
data modify storage cutscene:temp saved_inventory set from entity @s Inventory
execute store result score #inv_count cutscene.temp run data get storage cutscene:temp saved_inventory
