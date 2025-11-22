# Главное меню - изменение слота
# Проверка направления прокрутки с учетом wrap-around
execute if score @s cutscene.slot matches 8 if score #current_slot cutscene.temp matches 0 run scoreboard players add @s cutscene.menu_point 1
execute if score @s cutscene.slot matches 0 if score #current_slot cutscene.temp matches 8 run scoreboard players remove @s cutscene.menu_point 1

# Обычная прокрутка (если не wrap-around)
execute unless score @s cutscene.slot matches 0 unless score @s cutscene.slot matches 8 if score @s cutscene.slot > #current_slot cutscene.temp run scoreboard players remove @s cutscene.menu_point 1
execute unless score @s cutscene.slot matches 0 unless score @s cutscene.slot matches 8 if score @s cutscene.slot < #current_slot cutscene.temp run scoreboard players add @s cutscene.menu_point 1

# Ограничения меню (циклическая навигация)
execute if score @s cutscene.menu_point matches ..0 run scoreboard players set @s cutscene.menu_point 7
execute if score @s cutscene.menu_point matches 8.. run scoreboard players set @s cutscene.menu_point 1
