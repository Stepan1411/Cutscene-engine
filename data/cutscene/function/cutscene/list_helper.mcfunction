# Cutscene System - List Helper
# Вспомогательная функция для отображения катсцен

# Эта функция будет вызываться для каждой катсцены
# Отображение информации о катсцене
$execute if data storage cutscene:data cutscenes run tellraw @s [{"text":"• ","color":"yellow"},{"text":"$(name)","color":"white","bold":true}]
$execute if data storage cutscene:data cutscenes run tellraw @s [{"text":"  ID: ","color":"gray"},{"text":"$(id)","color":"white"},{"text":" | Длительность: ","color":"gray"},{"text":"$(duration)","color":"white"},{"text":" тиков","color":"gray"}]
$execute if data storage cutscene:data cutscenes run tellraw @s [{"text":"  [Запустить]","color":"green","clickEvent":{"action":"suggest_command","value":"/function cutscene:cutscene/play {id:\"$(id)\",skippable:0,skippable_to_end:0}"},"hoverEvent":{"action":"show_text","contents":"Нажмите для запуска"}},{"text":" "},{"text":"[Редактировать]","color":"yellow","clickEvent":{"action":"suggest_command","value":"/function cutscene:editor/open {id:\"$(id)\"}"},"hoverEvent":{"action":"show_text","contents":"Открыть редактор"}},{"text":" "},{"text":"[Удалить]","color":"red","clickEvent":{"action":"suggest_command","value":"/function cutscene:cutscene/delete {id:\"$(id)\"}"},"hoverEvent":{"action":"show_text","contents":"Удалить катсцену"}}]
