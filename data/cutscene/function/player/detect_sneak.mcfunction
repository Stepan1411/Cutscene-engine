# Cutscene System - Detect Sneak
# Обнаружение приседания игрока во время катсцены

# Проверить, что игрок присел (значение изменилось)
execute store result score #sneak_current cutscene.temp run scoreboard players get @s cutscene.sneak
execute store result score #sneak_last cutscene.temp run scoreboard players get @s cutscene.sneak_last

# Если значение увеличилось - игрок присел
execute if score #sneak_current cutscene.temp > #sneak_last cutscene.temp run function cutscene:player/on_sneak

# Сохранить текущее значение для следующей проверки
scoreboard players operation @s cutscene.sneak_last = @s cutscene.sneak
