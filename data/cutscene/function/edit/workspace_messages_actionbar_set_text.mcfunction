# Установить текст для Actionbar
# Оборачиваем текст в JSON формат если это простой текст
$data modify storage cutscene:temp message_actionbar set value '{"text":"$(text)"}'
tellraw @s [{"text":"✓ Текст Actionbar установлен: ","color":"green"},{"storage":"cutscene:temp","nbt":"message_actionbar","interpret":true}]
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.5 1.5
