# Cutscene System - Language Selection Prompt
# Запрос выбора языка

# Display bilingual language selection menu
tellraw @a ""
tellraw @a {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
tellraw @a [{"text":"🌐 ","color":"aqua"},{"text":"Cutscene Engine","color":"gold","bold":true}]
tellraw @a ""
tellraw @a {"text":"Please select your language / Пожалуйста, выберите язык","color":"white"}
tellraw @a ""
tellraw @a [{"text":"[English]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger cutscene_engine_localization set 2"},"hoverEvent":{"action":"show_text","value":"Set language to English"}},{"text":"  ","color":"white"},{"text":"[Русский]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger cutscene_engine_localization set 1"},"hoverEvent":{"action":"show_text","value":"Установить русский язык"}}]
tellraw @a ""
tellraw @a {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}
tellraw @a ""
