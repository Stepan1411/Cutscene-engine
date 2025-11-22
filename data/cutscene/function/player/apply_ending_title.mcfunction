# Показать title при окончании
# Параметры: title, subtitle

$title @s title {"text":"$(title)"}
$title @s subtitle {"text":"$(subtitle)"}
tellraw @s[tag=debug] [{"text":"[DEBUG] Title показан","color":"green"}]
