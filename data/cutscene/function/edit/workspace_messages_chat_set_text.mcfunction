# Установить текст для Chat
# Оборачиваем текст в JSON формат если это простой текст
$data modify storage cutscene:temp message_chat set value '{"text":"$(text)"}'
tellraw @s [{"text":"✓ Текст Chat установлен: ","color":"green"},{"storage":"cutscene:temp","nbt":"message_chat","interpret":true}]
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.5 1.5
