# Cutscene System - Camera Render Main
# Главная функция рендера камеры (вызывается каждый тик для camera entity)

# Скрыть entity
data modify entity @s transformation.scale set value [0f,0f,0f]

# Увеличить счетчик рендера
scoreboard players add @s cutscene.render 1

# Установить teleport_duration для плавного движения
execute if score @s cutscene.render matches 1.. run data modify entity @s teleport_duration set value 10

# Получить ID катсцены
scoreboard players operation #camera_id cutscene.temp = @s cutscene.id

# Получить данные катсцены из storage
execute store result storage cutscene:temp camera_id int 1 run scoreboard players get @s cutscene.id

# Проверить, нужно ли переключить кадр (каждые N тиков)
scoreboard players operation #frame cutscene.temp = @s cutscene.render
scoreboard players operation #check cutscene.temp = #frame cutscene.temp
scoreboard players operation #check cutscene.temp %= #render_speed cutscene.const

# Если пора переключить кадр - выполнить телепортацию
execute if score #check cutscene.temp matches 0 run function cutscene:camera/render_next_frame

# Принудительно spectate для игрока
execute as @a if score @s cutscene.id = #camera_id cutscene.temp run spectate @e[tag=cutscene.camera,limit=1,sort=nearest] @s

# Проверить завершение катсцены
execute as @a if score @s cutscene.id = #camera_id cutscene.temp if score @s cutscene.timer >= @s cutscene.duration run function cutscene:player/stop
