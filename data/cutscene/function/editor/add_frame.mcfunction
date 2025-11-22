# Cutscene System - Add Frame (Editor)
# Добавление кадра через редактор
# Параметры: cutscene

# Показать интерфейс для ввода параметров кадра
tellraw @s {"text":"=== Добавление кадра ===","color":"gold","bold":true}
$tellraw @s [{"text":"Используйте команду: ","color":"white"},{"text":"/function cutscene:frame/add {cutscene:\\"$(cutscene)\\",tick:0,title:'{\\"text\\":\\"Текст\\"}',fadeIn:10,stay:40,fadeOut:10}","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function cutscene:frame/add {cutscene:\\"$(cutscene)\\",tick:0}"}}]
tellraw @s {"text":"Нажмите на команду выше для редактирования параметров","color":"gray"}

# Примеры параметров
tellraw @s {"text":"\\nПримеры параметров:","color":"yellow"}
tellraw @s {"text":"• tick: номер тика (0-длительность)","color":"white"}
tellraw @s {"text":"• title: JSON текст титра","color":"white"}
tellraw @s {"text":"• fadeIn, stay, fadeOut: время анимации","color":"white"}
