# Cutscene System - Save Workspace
# Сохранение workspace в катсцену с указанным ID

# Создать катсцену
$function cutscene:cutscene/create {id:"$(id)",name:"Workspace Cutscene",duration:200}

# Сохранить точки
$data modify storage cutscene:temp cutscene_id set value "$(id)"
function cutscene:edit/save_points

# Сохранить настройки окончания
$execute if data storage cutscene:workspace settings.ending run data modify storage cutscene:data cutscenes.$(id).ending set from storage cutscene:workspace settings.ending

# Сохранить original_points для возможности редактирования
$execute if data storage cutscene:workspace original_points[0] run data modify storage cutscene:data cutscenes.$(id).original_points set from storage cutscene:workspace original_points

# Сообщение
$execute if score localization l matches 1 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Workspace сохранен в катсцену: ","color":"green"},{"text":"$(id)","color":"yellow"}]
$execute if score localization l matches 2 run tellraw @s [{"text":"[Editor] ","color":"gold"},{"text":"Workspace saved to cutscene: ","color":"green"},{"text":"$(id)","color":"yellow"}]
execute store result score #point_count cutscene.temp run data get storage cutscene:workspace points
execute if score localization l matches 1 run tellraw @s [{"text":"Точек: ","color":"gray"},{"score":{"name":"#point_count","objective":"cutscene.temp"},"color":"white"}]
execute if score localization l matches 2 run tellraw @s [{"text":"Points: ","color":"gray"},{"score":{"name":"#point_count","objective":"cutscene.temp"},"color":"white"}]
$execute if score localization l matches 1 run tellraw @s [{"text":"[▶ Запустить катсцену]","color":"aqua","bold":true,"click_event":{"action":"suggest_command","command":"/function cutscene:cutscene/play {id:\"$(id)\"}"}}]
$execute if score localization l matches 2 run tellraw @s [{"text":"[▶ Play cutscene]","color":"aqua","bold":true,"click_event":{"action":"suggest_command","command":"/function cutscene:cutscene/play {id:\"$(id)\"}"}}]
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.2

# Убрать флаг несохраненной катсцены
scoreboard players reset @s cutscene.unsaved

# FIX: Обновить название в bossbar
$data modify storage cutscene:workspace name set value "$(id)"
$function cutscene:edit/workspace_update_bossbar {id:"$(id)"}
