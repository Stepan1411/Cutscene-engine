# Cutscene System - Create Magic Example
# Создание магической катсцены

# Создание катсцены
function cutscene:cutscene/create {id:"magic", name:"Магическая сцена", duration:120}

# Кадр 1: Магический титр + частицы зачарования
function cutscene:frame/add {cutscene:"magic", tick:0, title:'{"text":"✨ Магия ✨","color":"light_purple","bold":true}', fadeIn:10, stay:40, fadeOut:10}
data modify storage cutscene:data cutscenes.magic.frames[0].particle set value {type:"minecraft:enchant",x:0.0,y:1.5,z:0.0,dx:1.5,dy:1.5,dz:1.5,speed:0.2,count:50}

# Кадр 2: Портальные частицы
function cutscene:frame/add {cutscene:"magic", tick:40}
data modify storage cutscene:data cutscenes.magic.frames[1].particle set value {type:"minecraft:portal",x:0.0,y:1.0,z:0.0,dx:1.0,dy:2.0,dz:1.0,speed:0.5,count:100}

# Кадр 3: Частицы дыхания дракона
function cutscene:frame/add {cutscene:"magic", tick:80}
data modify storage cutscene:data cutscenes.magic.frames[2].particle set value {type:"minecraft:dragon_breath",x:0.0,y:1.5,z:0.0,dx:2.0,dy:1.0,dz:2.0,speed:0.1,count:30}

# Кадр 4: Финал с частицами тотема
function cutscene:frame/add {cutscene:"magic", tick:100, title:'{"text":"Красиво!","color":"gold"}', fadeIn:10, stay:30, fadeOut:10}
data modify storage cutscene:data cutscenes.magic.frames[3].particle set value {type:"minecraft:totem_of_undying",x:0.0,y:1.5,z:0.0,dx:1.0,dy:1.0,dz:1.0,speed:0.15,count:40}

# Сообщение об успехе
tellraw @a [{"text":"[Cutscene] ","color":"green"},{"text":"Магическая катсцена создана! Используйте ","color":"white"},{"text":"/function cutscene:cutscene/play {id:\"magic\"}","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function cutscene:cutscene/play {id:\"magic\"}"}}]
