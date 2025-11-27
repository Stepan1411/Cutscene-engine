# Cutscene System - Load Function
# Инициализация всех scoreboards и storage

# Создание scoreboards
scoreboard objectives add cutscene.id dummy
scoreboard objectives add cutscene.frame dummy
scoreboard objectives add cutscene.timer dummy
scoreboard objectives add cutscene.state dummy
scoreboard objectives add cutscene.editor dummy
scoreboard objectives add cutscene.temp dummy
scoreboard objectives add cutscene.render dummy
scoreboard objectives add cutscene.const dummy
scoreboard objectives add cutscene.menu_point dummy
scoreboard objectives add cutscene.slot dummy
scoreboard objectives add cutscene.use minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add cutscene.visualize dummy
scoreboard objectives add cutscene.duration dummy
scoreboard objectives add cutscene.cooldown dummy
scoreboard objectives add cutscene.has_saved_inv dummy
scoreboard objectives add cutscene.unsaved dummy
scoreboard objectives add cutscene.settings_mode dummy
scoreboard objectives add cutscene.settings_point dummy
scoreboard objectives add cutscene.messages_mode dummy
scoreboard objectives add cutscene.message_point dummy
scoreboard objectives add cutscene.vis_timer dummy
scoreboard objectives add cutscene.sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add cutscene.sneak_last dummy
scoreboard objectives add cutscene.attack minecraft.custom:minecraft.damage_dealt
scoreboard objectives add cutscene.attack_last dummy
scoreboard objectives add cutscene.rendering dummy
scoreboard objectives add cutscene.skippable dummy
scoreboard objectives add cutscene.skip_to_end dummy
scoreboard objectives add cutscene_engine_localization trigger

# Инициализация storage структуры
data merge storage cutscene:data {cutscenes:{},players:{},editor:{active_cutscene:"",current_frame:0,clipboard:{}}}
data merge storage cutscene:workspace {points:[],name:"Untitled",settings:{length:200}}

# Константы
scoreboard players set #20 cutscene.temp 20
scoreboard players set #20 cutscene.const 20
scoreboard players set #render_speed cutscene.const 2
scoreboard players set #-1 cutscene.const -1

# Инициализация счетчика уникальных ID (если еще не инициализирован)
execute unless score #next_cutscene_id cutscene.temp matches 1.. run scoreboard players set #next_cutscene_id cutscene.temp 1

# Очистка состояния катсцен у всех игроков (после reload)
scoreboard players set @a cutscene.state 0
scoreboard players reset @a cutscene.duration
scoreboard players reset @a cutscene.timer
scoreboard players reset @a cutscene.frame
scoreboard players reset @a cutscene.id
scoreboard players reset @a cutscene.skippable
scoreboard players reset @a cutscene.skip_to_end

# Удалить все сущности камер (они могли остаться после reload)
kill @e[tag=cutscene.camera]

# Очистить временные данные катсцен
data remove storage cutscene:temp ending_settings
data remove storage cutscene:temp active_cutscene_id
data remove storage cutscene:temp player_saved_state

# Восстановление workspace из бэкапа (если есть)
function cutscene:edit/workspace_restore

# Инициализация системы локализации
function cutscene:localization/init

# Проверка: если локализация не была установлена пользователем, показать напоминание
execute unless score #localization_set cutscene.temp matches 1 run function cutscene:localization/prompt

# Сообщение об успешной загрузке (локализованное)
execute if score localization l matches 1 run tellraw @a [{"text":"[Cutscene Engine] ","color":"gold","bold":true},{"text":"Система загружена!","color":"green"}]
execute if score localization l matches 2 run tellraw @a [{"text":"[Cutscene Engine] ","color":"gold","bold":true},{"text":"System loaded!","color":"green"}]