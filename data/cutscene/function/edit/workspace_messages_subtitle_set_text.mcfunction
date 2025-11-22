# Установить текст для Subtitle
# Оборачиваем текст в JSON формат если это простой текст
$data modify storage cutscene:temp message_subtitle set value '{"text":"$(text)"}'
tellraw @s [{"text":"✓ Текст Subtitle установлен: ","color":"green"},{"storage":"cutscene:temp","nbt":"message_subtitle","interpret":true}]
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.5 1.5
