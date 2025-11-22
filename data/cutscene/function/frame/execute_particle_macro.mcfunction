# Cutscene System - Execute Particle Macro
# Макрос для воспроизведения частиц

# Частицы появляются относительно позиции игрока
$execute positioned as @s run particle $(type) ~$(x) ~$(y) ~$(z) $(dx) $(dy) $(dz) $(speed) $(count)
