# Cutscene System - Start Editing
# Начало редактирования катсцены
# Параметры: id

# Проверка существования катсцены
$execute store result score #exists cutscene.temp run data get storage cutscene:data cutscenes.$(id)

execute unless score #exists cutscene.temp matches 1.. run tellraw @s {"text":"[Cutscene] Ошибка: Катсцена не найдена","color":"red"}
execute unless score #exists cutscene.temp matches 1.. run return 0

# Установка режима редактирования
scoreboard players set @s cutscene.editor 1

# Сохранение ID редактируемой катсцены
$data modify storage cutscene:temp editor_cutscene set value "$(id)"

# Инициализация списка точек для визуализации
$data modify storage cutscene:temp editor_points set from storage cutscene:data cutscenes.$(id).frames

# Сообщение
$tellraw @s [{"text":"[Cutscene Editor] ","color":"gold"},{"text":"Режим редактирования: ","color":"white"},{"text":"$(id)","color":"yellow"}]
tellraw @s {"text":"Команды:","color":"yellow"}
tellraw @s [{"text":"• ","color":"white"},{"text":"[Добавить точку]","color":"green","clickEvent":{"action":"run_command","value":"/function cutscene:edit/add_point"},"hoverEvent":{"action":"show_text","contents":"Добавить точку в текущей позиции"}}]
tellraw @s [{"text":"• ","color":"white"},{"text":"[Показать точки]","color":"aqua","clickEvent":{"action":"run_command","value":"/function cutscene:edit/show_points"},"hoverEvent":{"action":"show_text","contents":"Визуализировать все точки"}}]
tellraw @s [{"text":"• ","color":"white"},{"text":"[Завершить]","color":"red","clickEvent":{"action":"run_command","value":"/function cutscene:edit/finish"},"hoverEvent":{"action":"show_text","contents":"Выйти из редактора"}}]
