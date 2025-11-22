# Cutscene System - Smooth Teleport
# Плавная телепортация камеры (макрос)

# Телепортировать camera entity
$execute as @e[tag=cutscene.camera] if score @s cutscene.id = #find_id cutscene.temp run tp @s $(x) $(y) $(z) $(yaw) $(pitch)
