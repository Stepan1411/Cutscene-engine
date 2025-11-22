# Телепортировать игрока в заданную позицию
# Параметры: x, y, z, yaw, pitch

$tp @s $(x) $(y) $(z) $(yaw) $(pitch)
tellraw @s[tag=debug] [{"text":"[DEBUG] Телепортация к точке окончания","color":"green"}]
