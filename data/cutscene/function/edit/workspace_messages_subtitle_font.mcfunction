# Настройки шрифта Subtitle
# Russian
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
execute if score localization l matches 1 run tellraw @s {"text":"🎨 Настройки шрифта Subtitle","color":"gold","bold":true}
execute if score localization l matches 1 run tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s {"text":"Используйте JSON формат для стилизации текста:","color":"yellow"}
execute if score localization l matches 1 run tellraw @s [{"text":"• ","color":"gray"},{"text":"Жирный","bold":true},{"text":": ","color":"gray"},{"text":"\"bold\":true","color":"white"}]
execute if score localization l matches 1 run tellraw @s [{"text":"• ","color":"gray"},{"text":"Курсив","italic":true},{"text":": ","color":"gray"},{"text":"\"italic\":true","color":"white"}]
execute if score localization l matches 1 run tellraw @s [{"text":"• ","color":"gray"},{"text":"Подчёркнутый","underlined":true},{"text":": ","color":"gray"},{"text":"\"underlined\":true","color":"white"}]
execute if score localization l matches 1 run tellraw @s [{"text":"• ","color":"gray"},{"text":"Зачёркнутый","strikethrough":true},{"text":": ","color":"gray"},{"text":"\"strikethrough\":true","color":"white"}]
execute if score localization l matches 1 run tellraw @s [{"text":"• ","color":"gray"},{"text":"Цвет","color":"red"},{"text":": ","color":"gray"},{"text":"\"color\":\"red\"","color":"white"}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"[↩ Назад]","color":"gray","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_messages_subtitle_menu"}}]
execute if score localization l matches 1 run tellraw @s ""

# English
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
execute if score localization l matches 2 run tellraw @s {"text":"🎨 Subtitle Font Settings","color":"gold","bold":true}
execute if score localization l matches 2 run tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s {"text":"Use JSON format to style text:","color":"yellow"}
execute if score localization l matches 2 run tellraw @s [{"text":"• ","color":"gray"},{"text":"Bold","bold":true},{"text":": ","color":"gray"},{"text":"\"bold\":true","color":"white"}]
execute if score localization l matches 2 run tellraw @s [{"text":"• ","color":"gray"},{"text":"Italic","italic":true},{"text":": ","color":"gray"},{"text":"\"italic\":true","color":"white"}]
execute if score localization l matches 2 run tellraw @s [{"text":"• ","color":"gray"},{"text":"Underlined","underlined":true},{"text":": ","color":"gray"},{"text":"\"underlined\":true","color":"white"}]
execute if score localization l matches 2 run tellraw @s [{"text":"• ","color":"gray"},{"text":"Strikethrough","strikethrough":true},{"text":": ","color":"gray"},{"text":"\"strikethrough\":true","color":"white"}]
execute if score localization l matches 2 run tellraw @s [{"text":"• ","color":"gray"},{"text":"Color","color":"red"},{"text":": ","color":"gray"},{"text":"\"color\":\"red\"","color":"white"}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"[↩ Back]","color":"gray","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_messages_subtitle_menu"}}]
execute if score localization l matches 2 run tellraw @s ""
