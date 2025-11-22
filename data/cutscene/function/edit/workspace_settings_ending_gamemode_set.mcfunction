# Установить режим игры для окончания
# Параметры: mode (0=survival, 1=creative, 2=adventure, 3=spectator)

$data modify storage cutscene:workspace settings.ending.gamemode set value $(mode)
$scoreboard players set #mode cutscene.temp $(mode)

execute if score #mode cutscene.temp matches 0 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Режим установлен: ","color":"green"},{"text":"Survival","color":"white"}]
execute if score #mode cutscene.temp matches 1 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Режим установлен: ","color":"green"},{"text":"Creative","color":"white"}]
execute if score #mode cutscene.temp matches 2 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Режим установлен: ","color":"green"},{"text":"Adventure","color":"white"}]
execute if score #mode cutscene.temp matches 3 run tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Режим установлен: ","color":"green"},{"text":"Spectator","color":"white"}]

playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2
function cutscene:edit/workspace_autosave
function cutscene:edit/workspace_settings_ending
