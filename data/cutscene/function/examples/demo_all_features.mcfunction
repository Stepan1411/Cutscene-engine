# Cutscene System - Demo All Features
# Демонстрация всех возможностей системы

tellraw @a [{"text":"\n========================================\n","color":"gold","bold":true}]
tellraw @a [{"text":"🎬 Cutscene System - Демонстрация\n","color":"gold","bold":true}]
tellraw @a [{"text":"========================================\n","color":"gold","bold":true}]

tellraw @a [{"text":"1. ","color":"yellow","bold":true},{"text":"Workspace редактор","color":"white","bold":false}]
tellraw @a [{"text":"   ","color":"gray"},{"text":"[Запустить]","color":"green","click_event":{"action":"run_command","command":"/function cutscene:edit/workspace_start"}}]
tellraw @a [{"text":"   Создавайте катсцены в реальном времени!\n","color":"gray"}]

tellraw @a [{"text":"2. ","color":"yellow","bold":true},{"text":"Плавная камера","color":"white","bold":false}]
tellraw @a [{"text":"   ","color":"gray"},{"text":"[Создать]","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:examples/create_smooth_camera"}},{"text":" "},{"text":"[Запустить]","color":"green","click_event":{"action":"run_command","command":"/function cutscene:cutscene/play {id:\"smooth_camera\"}"}}]
tellraw @a [{"text":"   Круговое движение камеры с титрами\n","color":"gray"}]

tellraw @a [{"text":"3. ","color":"yellow","bold":true},{"text":"Магические частицы","color":"white","bold":false}]
tellraw @a [{"text":"   ","color":"gray"},{"text":"[Создать]","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:examples/create_magic"}},{"text":" "},{"text":"[Запустить]","color":"green","click_event":{"action":"run_command","command":"/function cutscene:cutscene/play {id:\"magic\"}"}}]
tellraw @a [{"text":"   Фиолетовые частицы и огонь\n","color":"gray"}]

tellraw @a [{"text":"4. ","color":"yellow","bold":true},{"text":"Простой тест","color":"white","bold":false}]
tellraw @a [{"text":"   ","color":"gray"},{"text":"[Создать]","color":"aqua","click_event":{"action":"run_command","command":"/function cutscene:examples/create_test"}},{"text":" "},{"text":"[Запустить]","color":"green","click_event":{"action":"run_command","command":"/function cutscene:cutscene/play {id:\"test\"}"}}]
tellraw @a [{"text":"   Базовая катсцена с титрами\n","color":"gray"}]

tellraw @a [{"text":"========================================\n","color":"gold","bold":true}]

tellraw @a [{"text":"📖 Документация: ","color":"yellow"},{"text":"README_RU.md","color":"white"}]
tellraw @a [{"text":"🛠️ Быстрый старт: ","color":"yellow"},{"text":"QUICK_START.md","color":"white"}]

tellraw @a [{"text":"========================================\n","color":"gold","bold":true}]

# Звук
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1
