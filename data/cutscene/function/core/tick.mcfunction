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

# Показ частиц для редактора (каждый тик) - только если не проигрывается катсцена
execute as @a[scores={cutscene.editor=2,cutscene.state=0}] run function cutscene:edit/workspace_show_points

# Визуализация точек
execute as @a[scores={cutscene.visualize=1..}] run function cutscene:edit/visualize_loop
