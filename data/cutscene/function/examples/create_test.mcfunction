# Cutscene System - Create Test Example
# Создание тестовой катсцены с частицами

# Создание катсцены
function cutscene:cutscene/create {id:"test", name:"Тестовая катсцена", duration:100}

# Кадр 1: Титр в начале
function cutscene:frame/add {cutscene:"test", tick:0, title:'{"text":"Привет!","color":"gold","bold":true}', fadeIn:10, stay:40, fadeOut:10}

# Кадр 2: Фиолетовые частицы на 20 тике
function cutscene:frame/add {cutscene:"test", tick:20}
data modify storage cutscene:data cutscenes.test.frames[1].particle set value {type:"minecraft:witch",x:0.0,y:1.0,z:0.0,dx:1.0,dy:1.0,dz:1.0,speed:0.1,count:20}

# Кадр 3: Огненные частицы на 40 тике
function cutscene:frame/add {cutscene:"test", tick:40}
data modify storage cutscene:data cutscenes.test.frames[2].particle set value {type:"minecraft:flame",x:0.0,y:2.0,z:0.0,dx:0.5,dy:0.5,dz:0.5,speed:0.05,count:30}

# Кадр 4: Финальный титр на 80 тике
function cutscene:frame/add {cutscene:"test", tick:80, title:'{"text":"Конец!","color":"green"}', fadeIn:10, stay:30, fadeOut:10}

# Сообщение об успехе
tellraw @a [{"text":"[Cutscene] ","color":"green"},{"text":"Тестовая катсцена создана! Используйте ","color":"white"},{"text":"/function cutscene:cutscene/play {id:\"test\"}","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function cutscene:cutscene/play {id:\"test\"}"}}]
