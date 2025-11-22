# Cutscene System - Workspace Main
# Главная функция редактора (вызывается каждый тик для игроков в режиме редактирования)

# Инициализация menu_point если нет
execute unless score @s cutscene.menu_point = @s cutscene.menu_point run scoreboard players set @s cutscene.menu_point 1

# Инициализация slot при первом запуске
execute unless score @s cutscene.slot = @s cutscene.slot store result score @s cutscene.slot run data get entity @s SelectedItemSlot

# Инициализация таймера визуализации
execute unless score @s cutscene.vis_timer = @s cutscene.vis_timer run scoreboard players set @s cutscene.vis_timer 0

# Отслеживание смены слота (прокрутка колесика)
execute store result score #current_slot cutscene.temp run data get entity @s SelectedItemSlot

# Проверка изменения слота
execute unless score @s cutscene.slot = #current_slot cutscene.temp run function cutscene:edit/workspace_slot_changed

# Сохранить текущий слот
scoreboard players operation @s cutscene.slot = #current_slot cutscene.temp

# Обработка использования (ПКМ) с cooldown
execute if score @s cutscene.use matches 1.. unless score @s cutscene.cooldown matches 1.. run function cutscene:edit/workspace_use_action

# Уменьшить cooldown
execute if score @s cutscene.cooldown matches 1.. run scoreboard players remove @s cutscene.cooldown 1

# Сброс использования
scoreboard players reset @s cutscene.use

# Отображение меню в actionbar
# Проверка режима настроек
execute if score @s cutscene.settings_mode matches 1 run function cutscene:edit/workspace_settings_menu
execute if score @s cutscene.settings_mode matches 1 run return 0

# Проверка режима сообщений
execute if score @s cutscene.messages_mode matches 1 run function cutscene:edit/workspace_messages_menu
execute if score @s cutscene.messages_mode matches 1 run return 0

# Главное меню
function cutscene:edit/workspace_menu

# Визуализация точек каждые 20 тиков (1 секунда) - только если не в просмотре
execute if score @s cutscene.vis_timer matches 0.. run scoreboard players add @s cutscene.vis_timer 1
execute if score @s cutscene.vis_timer matches 20.. run tellraw @s[tag=debug] [{"text":"[DEBUG] Вызов workspace_show_points, vis_timer=20","color":"yellow"}]
execute if score @s cutscene.vis_timer matches 20.. run function cutscene:edit/workspace_show_points
execute if score @s cutscene.vis_timer matches 20.. run scoreboard players set @s cutscene.vis_timer 0
