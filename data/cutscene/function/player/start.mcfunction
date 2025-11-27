# Cutscene System - Start Player
# Запуск катсцены для игрока
# ID катсцены должен быть в cutscene:temp play_data.id

# Получение UUID игрока
data modify storage cutscene:temp player_uuid set from entity @s UUID

# Сохранить инвентарь игрока
function cutscene:player/save_inventory

# Сохранение текущего состояния игрока
data modify storage cutscene:temp saved_state set value {}
execute store result storage cutscene:temp saved_state.x double 1 run data get entity @s Pos[0]
execute store result storage cutscene:temp saved_state.y double 1 run data get entity @s Pos[1]
execute store result storage cutscene:temp saved_state.z double 1 run data get entity @s Pos[2]
execute store result storage cutscene:temp saved_state.yaw float 1 run data get entity @s Rotation[0]
execute store result storage cutscene:temp saved_state.pitch float 1 run data get entity @s Rotation[1]
data modify storage cutscene:temp saved_state.gamemode set from entity @s playerGameType

# Установка scoreboards для игрока
scoreboard players set @s cutscene.state 1
scoreboard players set @s cutscene.frame 0
scoreboard players set @s cutscene.timer -1

# Установить флаги skippable и skippable_to_end из параметров
execute store result score @s cutscene.skippable run data get storage cutscene:temp play_data.skippable
execute store result score @s cutscene.skip_to_end run data get storage cutscene:temp play_data.skippable_to_end

# Получение длительности катсцены - используем количество кадров
execute store result score @s cutscene.duration run data get storage cutscene:temp cutscene_data.frames

# Fallback: если кадров 0, использовать duration из настроек
execute if score @s cutscene.duration matches 0 store result score @s cutscene.duration run data get storage cutscene:temp cutscene_data.duration

# Если все еще 0, установить минимум 100 тиков
execute if score @s cutscene.duration matches 0 run scoreboard players set @s cutscene.duration 100

tellraw @s[tag=debug] [{"text":"[DEBUG] Duration: ","color":"gray"},{"score":{"name":"@s","objective":"cutscene.duration"},"color":"white"}]

# Генерация уникального ID для этой катсцены (используем UUID игрока как основу)
# Для простоты используем случайное число от 1 до 1000000
scoreboard players add #next_cutscene_id cutscene.temp 1
scoreboard players operation @s cutscene.id = #next_cutscene_id cutscene.temp

# Сохранение ID катсцены в temp для использования в check_frames
data modify storage cutscene:temp active_cutscene_id set from storage cutscene:temp play_data.id

# Сохранение состояния игрока для восстановления
data modify storage cutscene:temp player_saved_state set from storage cutscene:temp saved_state

# Создание сущности камеры
function cutscene:camera/create_entity

# FIX: Сохранить состояние игрока в NBT сущности камеры (используем ID для точного поиска)
scoreboard players operation #find_id cutscene.temp = @s cutscene.id
execute as @e[tag=cutscene.camera] if score @s cutscene.id = #find_id cutscene.temp run data modify entity @s data.saved_state set from storage cutscene:temp saved_state

# Отладка - проверить что saved_state сохранен в камеру
execute as @e[tag=cutscene.camera] if score @s cutscene.id = #find_id cutscene.temp run tellraw @a[tag=debug] [{"text":"[DEBUG] Saved_state сохранен в камеру: ","color":"green"},{"nbt":"data.saved_state","entity":"@s"}]

# Вселение игрока в камеру
function cutscene:camera/spectate_entity

# Сообщение о начале (только для debug)
tellraw @s[tag=debug] {"text":"[Cutscene Engine] Катсцена началась","color":"green"}

# Телепортация камеры к первому кадру
execute if data storage cutscene:temp cutscene_data.frames[0].pos run function cutscene:camera/tp_to_first_frame

# НЕ вызываем check_frames здесь - он вызовется в первом update
