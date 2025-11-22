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

# Восстановление workspace из бэкапа (если есть)
function cutscene:edit/workspace_restore

# Инициализация системы локализации
function cutscene:localization/init

# Сообщение об успешной загрузке (локализованное)
execute if score localization l matches 1 run tellraw @a {"text":"[Cutscene Engine] Датапак загружен!","color":"green"}
execute if score localization l matches 2 run tellraw @a {"text":"[Cutscene Engine] Datapack loaded!","color":"green"}
