# Применить настройки окончания катсцены
# Получаем настройки из сущности камеры (они были сохранены при создании)

# Получить ID катсцены из temp
execute unless data storage cutscene:temp active_cutscene_id run return 0

# Подготовить параметр для макроса
data modify storage cutscene:temp load_params set value {}
data modify storage cutscene:temp load_params.id set from storage cutscene:temp active_cutscene_id

# Загрузить настройки окончания из катсцены
function cutscene:player/load_ending_settings with storage cutscene:temp load_params

# Отладка - показать ID катсцены и настройки
execute if entity @s[tag=debug] run tellraw @s [{"text":"[DEBUG] ID катсцены: ","color":"gray"},{"nbt":"active_cutscene_id","storage":"cutscene:temp"}]
execute if entity @s[tag=debug] run tellraw @s [{"text":"[DEBUG] Настройки окончания: ","color":"gray"},{"nbt":"ending_settings","storage":"cutscene:temp"}]

# Применить телепортацию
execute if data storage cutscene:temp ending_settings{teleport:1b} if data storage cutscene:temp ending_settings.x run function cutscene:player/apply_ending_teleport with storage cutscene:temp ending_settings

# Применить режим игры
execute if data storage cutscene:temp ending_settings{set_gamemode:1b} run function cutscene:player/apply_ending_gamemode with storage cutscene:temp ending_settings

# Показать title
execute if data storage cutscene:temp ending_settings{show_title:1b} run function cutscene:player/apply_ending_title with storage cutscene:temp ending_settings
