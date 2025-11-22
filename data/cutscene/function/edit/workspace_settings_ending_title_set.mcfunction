# Установить текст title для окончания
# Параметры: title, subtitle

$data modify storage cutscene:workspace settings.ending.title set value "$(title)"
$data modify storage cutscene:workspace settings.ending.subtitle set value "$(subtitle)"

tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Title установлен","color":"green"}]
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
function cutscene:edit/workspace_autosave
function cutscene:edit/workspace_settings_ending
