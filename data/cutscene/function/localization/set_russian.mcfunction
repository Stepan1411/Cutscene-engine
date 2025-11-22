# Cutscene System - Set Language to Russian
# Установить русский язык

# Set language score to 1 (Russian)
scoreboard players set localization l 1

# Display confirmation message in Russian
tellraw @s ""
tellraw @s [{"text":"[Cutscene Engine] ","color":"gold"},{"text":"Язык изменен на ","color":"green"},{"text":"Русский","color":"aqua","bold":true}]
tellraw @s ""

# Reset trigger score
scoreboard players reset @s cutscene_engine_localization
scoreboard players enable @s cutscene_engine_localization

# Play sound
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
