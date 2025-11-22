# Телепортация камеры к первому кадру
data modify storage cutscene:temp first_frame set value {}
data modify storage cutscene:temp first_frame.x set from storage cutscene:temp cutscene_data.frames[0].camera.tp.x
data modify storage cutscene:temp first_frame.y set from storage cutscene:temp cutscene_data.frames[0].camera.tp.y
data modify storage cutscene:temp first_frame.z set from storage cutscene:temp cutscene_data.frames[0].camera.tp.z
data modify storage cutscene:temp first_frame.rx set from storage cutscene:temp cutscene_data.frames[0].camera.tp.yaw
data modify storage cutscene:temp first_frame.ry set from storage cutscene:temp cutscene_data.frames[0].camera.tp.pitch

# Найти камеру и телепортировать
scoreboard players operation #find_id cutscene.temp = @s cutscene.id
execute as @e[tag=cutscene.camera] if score @s cutscene.id = #find_id cutscene.temp run function cutscene:camera/tp_entity with storage cutscene:temp first_frame
