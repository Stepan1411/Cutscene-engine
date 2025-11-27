# Cutscene System - Примеры использования приседания и удара
# 
# Система автоматически отслеживает приседание и удар во время катсцены
# 
# Файлы для редактирования:
# - data/cutscene/function/player/on_sneak.mcfunction - вызывается при приседании
# - data/cutscene/function/player/on_attack.mcfunction - вызывается при ударе
#
# ПРИМЕРЫ ИСПОЛЬЗОВАНИЯ:
#
# 1. Пропуск катсцены при приседании:
#    В on_sneak.mcfunction раскомментируйте строку:
#    function cutscene:player/skip_cutscene
#
# 2. Пропуск катсцены при ударе:
#    В on_attack.mcfunction раскомментируйте строку:
#    function cutscene:player/skip_cutscene
#
# 3. Показать сообщение при приседании:
#    В on_sneak.mcfunction добавьте:
#    tellraw @s {"text":"Вы присели!","color":"yellow"}
#
# 4. Перемотка вперед на 5 секунд при ударе:
#    В on_attack.mcfunction добавьте:
#    scoreboard players add @s cutscene.timer 100
#
# 5. Пауза катсцены при приседании:
#    В on_sneak.mcfunction добавьте:
#    scoreboard players set @s cutscene.state 2
#    (Потребуется дополнительная логика для возобновления)
#
# 6. Открыть меню при ударе:
#    В on_attack.mcfunction добавьте свою логику меню
#
# ОТЛАДКА:
# Чтобы видеть когда срабатывают события, добавьте себе тег debug:
# /tag @s add debug

# Эта функция не выполняет никаких действий, она только для документации
