# Cutscene System - Tick Function
# Обновление состояний всех активных катсцен

# Обработка смены языка через trigger
execute as @a[scores={cutscene_engine_localization=1}] run function cutscene:localization/set_russian
execute as @a[scores={cutscene_engine_localization=2}] run function cutscene:localization/set_english

# Обработка всех игроков с активными катсценами (state = 1)
execute as @a[scores={cutscene.state=1}] run function cutscene:player/update

# Обработка camera entities для плавного рендера
execute as @e[tag=cutscene.camera] run function cutscene:camera/render_main

# Обработка редактора workspace
execute as @a[scores={cutscene.editor=2}] run function cutscene:edit/workspace_main

# Показ частиц для редактора (каждые 5 тиков для оптимизации) - только если не проигрывается катсцена
execute unless score #particle_timer cutscene.temp matches 0.. run scoreboard players set #particle_timer cutscene.temp 0
scoreboard players add #particle_timer cutscene.temp 1
execute if score #particle_timer cutscene.temp matches 5.. run scoreboard players set #particle_timer cutscene.temp 0
execute if score #particle_timer cutscene.temp matches 0 as @a[scores={cutscene.editor=2,cutscene.state=0}] run function cutscene:edit/workspace_show_points

# Визуализация точек
execute as @a[scores={cutscene.visualize=1..}] run function cutscene:edit/visualize_loop

# Постепенный рендер (обработка каждый тик)
execute if score #render_active cutscene.temp matches 1 run function cutscene:edit/workspace_render_progressive_tick

# Проверка: если рендер активен, но нет игроков с флагом рендера - отменить
execute if score #render_active cutscene.temp matches 1 unless entity @a[scores={cutscene.rendering=1}] run function cutscene:edit/workspace_render_cancel
