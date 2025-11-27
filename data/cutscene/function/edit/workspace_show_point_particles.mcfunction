# Show particles for a single point using marker
# Вызывается с параметрами: x, y, z, rx, ry, particle_type

# Спавнить маркер для правильного отображения частиц
$summon marker $(x) $(y) $(z) {Tags:["cutscene.particle_marker"]}

# Тип 1 - исходные точки (зеленые с направлением взгляда)
execute if score #particle_type cutscene.temp matches 1 as @e[tag=cutscene.particle_marker,limit=1] at @s run particle wax_off ~ ~ ~ 0 0 0 0 1 force @a
$execute if score #particle_type cutscene.temp matches 1 as @e[tag=cutscene.particle_marker,limit=1] at @s rotated $(rx) $(ry) run particle wax_on ^ ^ ^0.2 0 0 0 0 1 force @a
$execute if score #particle_type cutscene.temp matches 1 as @e[tag=cutscene.particle_marker,limit=1] at @s rotated $(rx) $(ry) run particle wax_on ^ ^ ^0.4 0 0 0 0 1 force @a
$execute if score #particle_type cutscene.temp matches 1 as @e[tag=cutscene.particle_marker,limit=1] at @s rotated $(rx) $(ry) run particle wax_on ^ ^ ^0.6 0 0 0 0 1 force @a

# Тип 2 - сгенерированные точки (белые)
execute if score #particle_type cutscene.temp matches 2 as @e[tag=cutscene.particle_marker,limit=1] at @s run particle end_rod ~ ~ ~ 0 0 0 0 1 force @a

# Удалить маркер
kill @e[tag=cutscene.particle_marker]
