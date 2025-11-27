# Cutscene System - Detect Attack
# Обнаружение удара игрока во время катсцены

# Проверить, что игрок ударил (значение изменилось)
execute store result score #attack_current cutscene.temp run scoreboard players get @s cutscene.attack
execute store result score #attack_last cutscene.temp run scoreboard players get @s cutscene.attack_last

# Если значение увеличилось - игрок ударил
execute if score #attack_current cutscene.temp > #attack_last cutscene.temp run function cutscene:player/on_attack

# Сохранить текущее значение для следующей проверки
scoreboard players operation @s cutscene.attack_last = @s cutscene.attack
