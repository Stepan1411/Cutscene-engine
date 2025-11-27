# Cutscene System - Update Player
# Обновление состояния игрока в катсцене (вызывается каждый тик)

# Увеличение таймера
scoreboard players add @s cutscene.timer 1

# Принудительное вселение в камеру каждый тик (чтобы нельзя было выйти)
function cutscene:camera/spectate_entity

# Проверка достижения следующего кадра
function cutscene:player/check_frames

# Обнаружение приседания и удара (ДО проверки окончания, чтобы можно было пропустить)
function cutscene:player/detect_sneak
function cutscene:player/detect_attack

# Проверка завершения катсцены (В КОНЦЕ, после всех действий)
function cutscene:player/check_end
