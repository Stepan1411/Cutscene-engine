# Cutscene System - Uninstall Function
# Полная очистка системы

# Остановить все активные катсцены
execute as @a[scores={cutscene.state=1..}] run function cutscene:player/stop

# Удалить все scoreboards
scoreboard objectives remove cutscene.id
scoreboard objectives remove cutscene.frame
scoreboard objectives remove cutscene.timer
scoreboard objectives remove cutscene.state
scoreboard objectives remove cutscene.editor
scoreboard objectives remove cutscene.temp

# Очистить storage
data remove storage cutscene:data cutscenes
data remove storage cutscene:data players
data remove storage cutscene:data editor

# Сообщение об удалении
tellraw @a {"text":"[Cutscene System] Датапак удален. Все данные очищены.","color":"red"}
