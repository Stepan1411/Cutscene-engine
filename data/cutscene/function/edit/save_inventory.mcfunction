# Cutscene System - Save Inventory
# Сохранение инвентаря игрока перед входом в редактор

# Сохранить весь инвентарь в storage
data modify storage cutscene:temp saved_inventory set value []
data modify storage cutscene:temp saved_inventory append from entity @s Inventory[]

# Установить флаг что инвентарь сохранен
scoreboard players set @s cutscene.has_saved_inv 1

tellraw @s[tag=debug] {"text":"[DEBUG] Инвентарь сохранен","color":"green"}
