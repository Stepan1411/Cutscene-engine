# Cutscene System - Edit Frame (Editor)
# Редактирование кадра через редактор
# Параметры: cutscene, index

# Показать текущие параметры кадра
tellraw @s {"text":"=== Редактирование кадра ===","color":"gold","bold":true}
$execute if score localization l matches 1 run tellraw @s [{"text":"Катсцена: ","color":"white"},{"text":"$(cutscene)","color":"yellow"},{"text":" | Кадр: ","color":"white"},{"text":"$(index)","color":"yellow"}]
$execute if score localization l matches 2 run tellraw @s [{"text":"Cutscene: ","color":"white"},{"text":"$(cutscene)","color":"yellow"},{"text":" | Кадр: ","color":"white"},{"text":"$(index)","color":"yellow"}]

# Показать данные кадра
$tellraw @s [{"text":"[Просмотр данных]","color":"aqua","clickEvent":{"action":"run_command","value":"/data get storage cutscene:data cutscenes.$(cutscene).frames[$(index)]"},"hoverEvent":{"action":"show_text","contents":"Показать все данные кадра"}}]

# Команда для редактирования
$tellraw @s [{"text":"\\nИспользуйте: ","color":"white"},{"text":"/function cutscene:frame/edit {cutscene:\\"$(cutscene)\\",index:$(index),title:'{\\"text\\":\\"New text\\"}'}","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function cutscene:frame/edit {cutscene:\\"$(cutscene)\\",index:$(index)}"}}]

# Команда для удаления
$tellraw @s [{"text":"[Удалить кадр]","color":"red","clickEvent":{"action":"suggest_command","value":"/function cutscene:frame/remove {cutscene:\\"$(cutscene)\\",index:$(index)}"},"hoverEvent":{"action":"show_text","contents":"Delete this frame"}}]
