# Настройки шрифта Actionbar
tellraw @s ""
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
tellraw @s {"text":"🎨 Настройки шрифта Actionbar","color":"gold","bold":true}
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
tellraw @s ""
tellraw @s {"text":"Используйте JSON формат для стилизации текста:","color":"yellow"}
tellraw @s [{"text":"• ","color":"gray"},{"text":"Жирный","bold":true},{"text":": ","color":"gray"},{"text":"\"bold\":true","color":"white"}]
tellraw @s [{"text":"• ","color":"gray"},{"text":"Курсив","italic":true},{"text":": ","color":"gray"},{"text":"\"italic\":true","color":"white"}]
tellraw @s [{"text":"• ","color":"gray"},{"text":"Подчёркнутый","underlined":true},{"text":": ","color":"gray"},{"text":"\"underlined\":true","color":"white"}]
tellraw @s [{"text":"• ","color":"gray"},{"text":"Зачёркнутый","strikethrough":true},{"text":": ","color":"gray"},{"text":"\"strikethrough\":true","color":"white"}]
tellraw @s [{"text":"• ","color":"gray"},{"text":"Цвет","color":"red"},{"text":": ","color":"gray"},{"text":"\"color\":\"red\"","color":"white"}]
tellraw @s ""
tellraw @s [{"text":"[↩ Назад]","color":"gray","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_messages_actionbar_menu"}}]
tellraw @s ""
