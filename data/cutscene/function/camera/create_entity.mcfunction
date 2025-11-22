# Cutscene System - Create Camera Entity
# Создание сущности камеры для катсцены (как в ccf)

# Создание item_display entity с невидимой трансформацией
summon minecraft:item_display ~ ~ ~ {Tags:["cutscene.camera","cutscene.new"],teleport_duration:0,transformation:{scale:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f]}}

# Установка ID катсцены для entity
scoreboard players operation @e[tag=cutscene.new,limit=1] cutscene.id = @s cutscene.id

# Инициализация render счетчика
scoreboard players set @e[tag=cutscene.new,limit=1] cutscene.render -1

# FIX: Вместо копирования всех кадров, сохраняем только ID катсцены
# Это избегает фриза при большом количестве кадров
data modify entity @e[tag=cutscene.new,limit=1] data.cutscene_id set from storage cutscene:temp play_data.id
data modify entity @e[tag=cutscene.new,limit=1] data.duration set from storage cutscene:temp cutscene_data.duration
scoreboard players set @e[tag=cutscene.new,limit=1] cutscene.frame 0

# Отладка - количество кадров
execute store result score #frame_count cutscene.temp run data get storage cutscene:temp cutscene_data.frames
tellraw @a[tag=debug] [{"text":"[DEBUG] Camera entity создан для катсцены с ","color":"green"},{"score":{"name":"#frame_count","objective":"cutscene.temp"},"color":"white"},{"text":" кадрами","color":"green"}]

# Убираем тег new
tag @e[tag=cutscene.new] remove cutscene.new

# Сообщение
tellraw @s[tag=debug] {"text":"[DEBUG] Camera entity создан","color":"green"}
