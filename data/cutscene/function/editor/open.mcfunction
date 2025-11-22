# Cutscene System - Open Editor
# Открытие редактора катсцен
# Параметры: id (ID катсцены)

# Проверка существования катсцены
$execute store result score #exists cutscene.temp run data get storage cutscene:data cutscenes.$(id)

execute unless score #exists cutscene.temp matches 1.. run tellraw @s {"text":"[Cutscene] Ошибка: Катсцена не найдена","color":"red"}
execute unless score #exists cutscene.temp matches 1.. run return 0

# Установка режима редактора
scoreboard players set @s cutscene.editor 1

# Сохранение активной катсцены в storage editor
$data modify storage cutscene:data editor.active_cutscene set value "$(id)"
data modify storage cutscene:data editor.current_frame set value 0

# Выдача книги с интерфейсом редактора
$execute if score localization l matches 1 run give @s minecraft:written_book[written_book_content={title:"Cutscene Editor",author:"System",pages:['[{"text":"=== Редактор катсцен ===\\n\\n","color":"gold","bold":true},{"text":"Катсцена: ","color":"white"},{"text":"$(id)","color":"yellow"},{"text":"\\n\\n"},{"text":"[Добавить кадр]","color":"green","clickEvent":{"action":"run_command","value":"/function cutscene:editor/add_frame {cutscene:\\"$(id)\\"}"}},{"text":"\\n"},{"text":"[Список кадров]","color":"yellow","clickEvent":{"action":"run_command","value":"/data get storage cutscene:data cutscenes.$(id).frames"}},{"text":"\\n"},{"text":"[Предпросмотр]","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:editor/preview {cutscene:\\"$(id)\\"}"}},{"text":"\\n"},{"text":"[Закрыть]","color":"red","clickEvent":{"action":"run_command","value":"/function cutscene:editor/close"}}]']}]
$execute if score localization l matches 2 run give @s minecraft:written_book[written_book_content={title:"Cutscene Editor",author:"System",pages:['[{"text":"=== Редактор катсцен ===\\n\\n","color":"gold","bold":true},{"text":"Cutscene: ","color":"white"},{"text":"$(id)","color":"yellow"},{"text":"\\n\\n"},{"text":"[Добавить кадр]","color":"green","clickEvent":{"action":"run_command","value":"/function cutscene:editor/add_frame {cutscene:\\"$(id)\\"}"}},{"text":"\\n"},{"text":"[Список кадров]","color":"yellow","clickEvent":{"action":"run_command","value":"/data get storage cutscene:data cutscenes.$(id).frames"}},{"text":"\\n"},{"text":"[Предпросмотр]","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:editor/preview {cutscene:\\"$(id)\\"}"}},{"text":"\\n"},{"text":"[Закрыть]","color":"red","clickEvent":{"action":"run_command","value":"/function cutscene:editor/close"}}]']}]

# Сообщение об открытии
$tellraw @s [{"text":"[Cutscene] ","color":"green"},{"text":"Редактор открыт для катсцены '$(id)'","color":"white"}]
