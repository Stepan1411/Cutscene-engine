# Cutscene System - Example: Smooth Camera Movement
# Пример катсцены с плавным движением камеры

# Создание катсцены
function cutscene:cutscene/create {id:"smooth_camera",name:"Плавная камера",duration:200}

# Добавление точек для плавного движения (каждые 20 тиков)
function cutscene:frame/add {cutscene:"smooth_camera",tick:0,camera:{tp:{x:0.0,y:100.0,z:0.0,yaw:0.0f,pitch:-45.0f}}}
function cutscene:frame/add {cutscene:"smooth_camera",tick:20,camera:{tp:{x:10.0,y:105.0,z:5.0,yaw:45.0f,pitch:-30.0f}}}
function cutscene:frame/add {cutscene:"smooth_camera",tick:40,camera:{tp:{x:20.0,y:110.0,z:10.0,yaw:90.0f,pitch:-20.0f}}}
function cutscene:frame/add {cutscene:"smooth_camera",tick:60,camera:{tp:{x:25.0,y:115.0,z:20.0,yaw:135.0f,pitch:-10.0f}}}
function cutscene:frame/add {cutscene:"smooth_camera",tick:80,camera:{tp:{x:20.0,y:120.0,z:30.0,yaw:180.0f,pitch:0.0f}}}
function cutscene:frame/add {cutscene:"smooth_camera",tick:100,camera:{tp:{x:10.0,y:120.0,z:35.0,yaw:225.0f,pitch:10.0f}}}
function cutscene:frame/add {cutscene:"smooth_camera",tick:120,camera:{tp:{x:0.0,y:115.0,z:30.0,yaw:270.0f,pitch:20.0f}}}
function cutscene:frame/add {cutscene:"smooth_camera",tick:140,camera:{tp:{x:-10.0,y:110.0,z:20.0,yaw:315.0f,pitch:30.0f}}}
function cutscene:frame/add {cutscene:"smooth_camera",tick:160,camera:{tp:{x:-15.0,y:105.0,z:10.0,yaw:0.0f,pitch:40.0f}}}
function cutscene:frame/add {cutscene:"smooth_camera",tick:180,camera:{tp:{x:-10.0,y:100.0,z:0.0,yaw:45.0f,pitch:45.0f}}}

# Добавление титров
function cutscene:frame/add {cutscene:"smooth_camera",tick:0,title:{text:'{"text":"Плавное движение камеры","color":"gold","bold":true}',fadeIn:10,stay:40,fadeOut:10}}
function cutscene:frame/add {cutscene:"smooth_camera",tick:100,title:{text:'{"text":"Система рендера как в CCF","color":"aqua"}',fadeIn:10,stay:40,fadeOut:10}}

# Сообщение
tellraw @a [{"text":"[Cutscene] ","color":"gold"},{"text":"Пример 'smooth_camera' создан!","color":"green"}]
tellraw @a [{"text":"[▶ Запустить]","color":"green","bold":true,"clickEvent":{"action":"suggest_command","value":"/function cutscene:cutscene/play {id:\"smooth_camera\"}"}}]
