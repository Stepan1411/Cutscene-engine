# Cutscene System - Close Editor
# Закрытие редактора катсцен

# Отключение режима редактора
scoreboard players set @s cutscene.editor 0

# Очистка данных редактора
data modify storage cutscene:data editor.active_cutscene set value ""
data modify storage cutscene:data editor.current_frame set value 0
data modify storage cutscene:data editor.clipboard set value {}

# Удаление книги редактора
clear @s minecraft:written_book[written_book_content~{title:"Cutscene Editor"}]

# Сообщение о закрытии
tellraw @s {"text":"[Cutscene] Редактор закрыт","color":"yellow"}
