# Cutscene System - Workspace Settings
# Открыть меню настроек

# Установить режим настроек
scoreboard players set @s cutscene.settings_mode 1
scoreboard players set @s cutscene.settings_point 1

tellraw @s ""
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
tellraw @s [{"text":"⚙ Настройки катсцены","color":"gold","bold":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
tellraw @s ""

# Текущая длительность
execute store result score #duration cutscene.temp run data get storage cutscene:workspace settings.length
tellraw @s [{"text":"Длительность: ","color":"yellow"},{"score":{"name":"#duration","objective":"cutscene.temp"},"color":"white"},{"text":" тиков (","color":"gray"},{"score":{"name":"#duration","objective":"cutscene.temp"},"color":"white"},{"text":" / 20 = секунды)","color":"gray"}]
tellraw @s [{"text":"[Изменить длину]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_length"}}]
tellraw @s ""

# Название
data modify storage cutscene:temp current_name set from storage cutscene:workspace name
tellraw @s [{"text":"Название: ","color":"yellow"},{"storage":"cutscene:temp","nbt":"current_name","color":"white"}]
tellraw @s ""

# Кнопки Сохранить/Загрузить
tellraw @s [{"text":"[💾 Сохранить]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_save_prompt"}},{"text":"  "},{"text":"[📂 Загрузить]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_load_prompt"}}]
tellraw @s ""

# Кнопка настроек окончания
tellraw @s [{"text":"[🏁 Окончание]","color":"light_purple","bold":true,"clickEvent":{"action":"run_command","value":"/function cutscene:edit/workspace_settings_ending"}}]
tellraw @s ""

tellraw @s [{"text":"[◀ Назад]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/function cutscene:edit/settings_back"}}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
tellraw @s ""

playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 1
