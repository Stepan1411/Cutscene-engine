# Cutscene System - Settings Back Execute
# Выполнение выхода из настроек для конкретного игрока

# Убрать тег
tag @s remove cutscene.settings_back

# Выключить режим настроек
scoreboard players reset @s cutscene.settings_mode
scoreboard players reset @s cutscene.settings_point

# Вернуть на первую кнопку
scoreboard players set @s cutscene.menu_point 1

playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 0.8
