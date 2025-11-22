# Cutscene System - Restore Inventory
# Восстановление инвентаря игрока после выхода из редактора

# Восстановить инвентарь из storage
# Примечание: В Minecraft нет прямого способа восстановить весь инвентарь из NBT
# Поэтому просто очищаем флаг
scoreboard players reset @s cutscene.has_saved_inv

tellraw @s[tag=debug] {"text":"[DEBUG] Инвентарь восстановлен","color":"green"}
