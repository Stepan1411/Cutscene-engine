# Установить режим игры
# Параметры: gamemode (0=survival, 1=creative, 2=adventure, 3=spectator)

$scoreboard players set #gamemode cutscene.temp $(gamemode)

execute if score #gamemode cutscene.temp matches 0 run gamemode survival @s
execute if score #gamemode cutscene.temp matches 1 run gamemode creative @s
execute if score #gamemode cutscene.temp matches 2 run gamemode adventure @s
execute if score #gamemode cutscene.temp matches 3 run gamemode spectator @s

tellraw @s[tag=debug] [{"text":"[DEBUG] Режим игры установлен из настроек окончания","color":"green"}]
