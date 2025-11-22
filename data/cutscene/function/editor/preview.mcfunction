# Cutscene System - Preview (Editor)
# Предпросмотр катсцены
# Параметры: cutscene

# Сохранение режима редактора
scoreboard players set @s cutscene.editor 2

# Запуск катсцены для предпросмотра
$function cutscene:cutscene/play {id:"$(cutscene)"}

# Сообщение о предпросмотре
tellraw @s {"text":"[Cutscene] Режим предпросмотра. Используйте /function cutscene:player/stop для остановки","color":"yellow"}
