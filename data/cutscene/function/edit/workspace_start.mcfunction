# Cutscene System - Start Workspace Editor
# Запуск редактора рабочего пространства (как в ccf)

# Инициализация workspace
data merge storage cutscene:workspace {points:[],name:"Untitled",settings:{length:200}}

# Установка режима редактирования
scoreboard players set @s cutscene.editor 2

# Сохранить хотбар игрока
data modify storage cutscene:temp saved_hotbar set value []
item replace block ~ 0 ~ container.0 from entity @s hotbar.0
item replace block ~ 0 ~ container.1 from entity @s hotbar.1
item replace block ~ 0 ~ container.2 from entity @s hotbar.2
item replace block ~ 0 ~ container.3 from entity @s hotbar.3
item replace block ~ 0 ~ container.4 from entity @s hotbar.4
item replace block ~ 0 ~ container.5 from entity @s hotbar.5
item replace block ~ 0 ~ container.6 from entity @s hotbar.6
item replace block ~ 0 ~ container.7 from entity @s hotbar.7
item replace block ~ 0 ~ container.8 from entity @s hotbar.8

# Заполнить весь хотбар удочками "Кнопка эдитора" (5 кнопок)
item replace entity @s hotbar.0 with minecraft:carrot_on_a_stick[custom_name=[{"text":"Кнопка эдитора","italic":false,"color":"gold"}],lore=[[{"text":"➕ Добавить точку","italic":false,"color":"dark_green"}]]]
item replace entity @s hotbar.1 with minecraft:carrot_on_a_stick[custom_name=[{"text":"Кнопка эдитора","italic":false,"color":"gold"}],lore=[[{"text":"▶ Просмотр","italic":false,"color":"aqua"}]]]
item replace entity @s hotbar.2 with minecraft:carrot_on_a_stick[custom_name=[{"text":"Кнопка эдитора","italic":false,"color":"gold"}],lore=[[{"text":"🎬 Рендер","italic":false,"color":"light_purple"}]]]
item replace entity @s hotbar.3 with minecraft:carrot_on_a_stick[custom_name=[{"text":"Кнопка эдитора","italic":false,"color":"gold"}],lore=[[{"text":"⚙ Настройки","italic":false,"color":"gray"}]]]
item replace entity @s hotbar.4 with minecraft:carrot_on_a_stick[custom_name=[{"text":"Кнопка эдитора","italic":false,"color":"gold"}],lore=[[{"text":"❌ Выход","italic":false,"color":"red"}]]]
item replace entity @s hotbar.5 with minecraft:carrot_on_a_stick[custom_name=[{"text":"Кнопка эдитора","italic":false,"color":"gold"}],lore=[[{"text":"","italic":false}]]]
item replace entity @s hotbar.6 with minecraft:carrot_on_a_stick[custom_name=[{"text":"Кнопка эдитора","italic":false,"color":"gold"}],lore=[[{"text":"","italic":false}]]]
item replace entity @s hotbar.7 with minecraft:carrot_on_a_stick[custom_name=[{"text":"Кнопка эдитора","italic":false,"color":"gold"}],lore=[[{"text":"","italic":false}]]]
item replace entity @s hotbar.8 with minecraft:carrot_on_a_stick[custom_name=[{"text":"Кнопка эдитора","italic":false,"color":"gold"}],lore=[[{"text":"","italic":false}]]]

# Создать bossbar для катсцены
execute if score localization l matches 1 run bossbar add cutscene:editor [{"text":"Катсцена: ","color":"gold"},{"text":"Без названия","color":"white"}]
execute if score localization l matches 2 run bossbar add cutscene:editor [{"text":"Cutscene: ","color":"gold"},{"text":"Untitled","color":"white"}]
bossbar set cutscene:editor players @s
bossbar set cutscene:editor color purple
bossbar set cutscene:editor style notched_10
bossbar set cutscene:editor value 0
bossbar set cutscene:editor max 200

# Флаг что катсцена не сохранена
scoreboard players set @s cutscene.unsaved 1

# Сбросить режимы
scoreboard players set @s cutscene.settings_mode 0
scoreboard players set @s cutscene.messages_mode 0

# Установить начальный слот
scoreboard players set @s cutscene.slot 0
scoreboard players set @s cutscene.menu_point 1

# Сообщение
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 1 run tellraw @s [{"text":"🛠️ Cutscene Editor","color":"gold","bold":true}]
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s {"text":"✓ Редактор запущен!","color":"green"}
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s {"text":"Управление:","color":"yellow","bold":true}
execute if score localization l matches 1 run tellraw @s [{"text":"  • ","color":"gray"},{"text":"Прокрутка колесика","color":"white"},{"text":" - переключение меню","color":"gray"}]
execute if score localization l matches 1 run tellraw @s [{"text":"  • ","color":"gray"},{"text":"ПКМ","color":"white"},{"text":" - выбрать действие","color":"gray"}]
execute if score localization l matches 1 run tellraw @s ""
execute if score localization l matches 1 run tellraw @s {"text":"Меню отображается в actionbar (над хотбаром)","color":"aqua"}
execute if score localization l matches 1 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 1 run tellraw @s ""

execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 2 run tellraw @s [{"text":"🛠️ Cutscene Editor","color":"gold","bold":true}]
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s {"text":"✓ Editor started!","color":"green"}
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s {"text":"Controls:","color":"yellow","bold":true}
execute if score localization l matches 2 run tellraw @s [{"text":"  • ","color":"gray"},{"text":"Scroll wheel","color":"white"},{"text":" - switch menu","color":"gray"}]
execute if score localization l matches 2 run tellraw @s [{"text":"  • ","color":"gray"},{"text":"Right-click","color":"white"},{"text":" - select action","color":"gray"}]
execute if score localization l matches 2 run tellraw @s ""
execute if score localization l matches 2 run tellraw @s {"text":"Menu is displayed in actionbar (above hotbar)","color":"aqua"}
execute if score localization l matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold"}]
execute if score localization l matches 2 run tellraw @s ""
