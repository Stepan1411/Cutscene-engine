# Установить текст для Title
# Оборачиваем текст в JSON формат если это простой текст
$data modify storage cutscene:temp message_text set value '{"text":"$(text)"}'
tellraw @s [{"text":"✓ Текст Title установлен: ","color":"green"},{"storage":"cutscene:temp","nbt":"message_text","interpret":true}]
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.5 1.5
