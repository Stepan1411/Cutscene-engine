# Cutscene System - List Cutscenes
# Показать список всех катсцен

# Заголовок списка
tellraw @s {"text":"========== Список катсцен ==========","color":"gold","bold":true}

# Копируем все катсцены во временное хранилище для отображения
data modify storage cutscene:temp list set from storage cutscene:data cutscenes

# Проверка наличия катсцен
execute store result score #has_cutscenes cutscene.temp run data get storage cutscene:temp list

# Если катсцен нет
execute if score #has_cutscenes cutscene.temp matches 0 run tellraw @s {"text":"Нет созданных катсцен","color":"yellow"}
execute if score #has_cutscenes cutscene.temp matches 0 run tellraw @s {"text":"Используйте /function cutscene:cutscene/create для создания","color":"gray"}

# Если катсцены есть, показываем их (требуется ручное перечисление или использование data modify)
# Примечание: В Minecraft нет встроенной итерации по объектам, поэтому показываем инструкцию
execute if score #has_cutscenes cutscene.temp matches 1.. run tellraw @s [{"text":"Катсцены хранятся в ","color":"white"},{"text":"[📦 storage]","color":"aqua","bold":true,"clickEvent":{"action":"suggest_command","value":"/data get storage cutscene:data cutscenes"}}]
execute if score #has_cutscenes cutscene.temp matches 1.. run tellraw @s {"text":"Используйте /data get storage cutscene:data cutscenes для просмотра всех катсцен","color":"gray"}

tellraw @s {"text":"====================================","color":"gold","bold":true}

# Очистка временных данных
data remove storage cutscene:temp list
