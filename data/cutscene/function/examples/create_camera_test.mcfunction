# Cutscene System - Create Camera Test
# Создание тестовой катсцены с движением камеры

# Создание катсцены
function cutscene:cutscene/create {id:"camera_test", name:"Тест камеры", duration:200}

# Кадр 1: Начальная позиция + титр
function cutscene:frame/add {cutscene:"camera_test", tick:0, title:'{"text":"Полет начинается!","color":"gold","bold":true}', fadeIn:10, stay:40, fadeOut:10}
data modify storage cutscene:data cutscenes.camera_test.frames[0].camera set value {tp:{x:0.0,y:100.0,z:0.0,yaw:0.0f,pitch:-45.0f}}
data modify storage cutscene:data cutscenes.camera_test.frames[0].particle set value {type:"minecraft:end_rod",x:0.0,y:0.0,z:0.0,dx:1.0,dy:1.0,dz:1.0,speed:0.1,count:20}

# Кадр 2: Движение вперед
function cutscene:frame/add {cutscene:"camera_test", tick:40}
data modify storage cutscene:data cutscenes.camera_test.frames[1].camera set value {tp:{x:20.0,y:105.0,z:20.0,yaw:45.0f,pitch:-30.0f}}
data modify storage cutscene:data cutscenes.camera_test.frames[1].particle set value {type:"minecraft:firework",x:0.0,y:0.0,z:0.0,dx:2.0,dy:2.0,dz:2.0,speed:0.2,count:30}

# Кадр 3: Поворот
function cutscene:frame/add {cutscene:"camera_test", tick:80}
data modify storage cutscene:data cutscenes.camera_test.frames[2].camera set value {tp:{x:40.0,y:110.0,z:20.0,yaw:90.0f,pitch:-60.0f}}
data modify storage cutscene:data cutscenes.camera_test.frames[2].particle set value {type:"minecraft:dragon_breath",x:0.0,y:0.0,z:0.0,dx:1.5,dy:1.5,dz:1.5,speed:0.15,count:25}

# Кадр 4: Спуск
function cutscene:frame/add {cutscene:"camera_test", tick:120}
data modify storage cutscene:data cutscenes.camera_test.frames[3].camera set value {tp:{x:40.0,y:90.0,z:40.0,yaw:135.0f,pitch:-15.0f}}
data modify storage cutscene:data cutscenes.camera_test.frames[3].particle set value {type:"minecraft:portal",x:0.0,y:0.0,z:0.0,dx:2.0,dy:2.0,dz:2.0,speed:0.3,count:40}

# Кадр 5: Возврат + финальный титр
function cutscene:frame/add {cutscene:"camera_test", tick:160, title:'{"text":"Полет завершен!","color":"green"}', fadeIn:10, stay:30, fadeOut:10}
data modify storage cutscene:data cutscenes.camera_test.frames[4].camera set value {tp:{x:0.0,y:100.0,z:0.0,yaw:180.0f,pitch:-45.0f}}
data modify storage cutscene:data cutscenes.camera_test.frames[4].particle set value {type:"minecraft:totem_of_undying",x:0.0,y:0.0,z:0.0,dx:1.0,dy:1.0,dz:1.0,speed:0.2,count:50}

# Сообщение об успехе
tellraw @a [{"text":"[Cutscene] ","color":"green"},{"text":"Катсцена с камерой создана! Используйте ","color":"white"},{"text":"/function cutscene:cutscene/play {id:\"camera_test\"}","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function cutscene:cutscene/play {id:\"camera_test\"}"}}]
