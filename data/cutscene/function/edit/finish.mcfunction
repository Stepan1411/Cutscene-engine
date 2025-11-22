# Cutscene System - Finish Editing
# Завершение редактирования и сохранение

# Проверка режима редактирования
execute unless score @s cutscene.editor matches 1 run tellraw @s {"text":"[Cutscene] Ошибка: Вы не в режиме редактирования","color":"red"}
execute unless score @s cutscene.editor matches 1 run return 0

# Сохранение точек в катсцену
function cutscene:edit/save_points with storage cutscene:temp

# Выход из режима редактирования
scoreboard players set @s cutscene.editor 0

# Очистка временных данных
data remove storage cutscene:temp editor_cutscene
data remove storage cutscene:temp editor_points

# Сообщение
tellraw @s [{"text":"[Cutscene Editor] ","color":"gold"},{"text":"Изменения сохранены!","color":"green"}]
