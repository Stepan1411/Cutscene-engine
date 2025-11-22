# Меню настроек - изменение слота
execute if score @s cutscene.slot > #current_slot cutscene.temp run scoreboard players remove @s cutscene.settings_point 1
execute if score @s cutscene.slot < #current_slot cutscene.temp run scoreboard players add @s cutscene.settings_point 1

# Ограничения меню (циклическая навигация)
execute if score @s cutscene.settings_point matches ..0 run scoreboard players set @s cutscene.settings_point 6
execute if score @s cutscene.settings_point matches 7.. run scoreboard players set @s cutscene.settings_point 1
