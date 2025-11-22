# Восстановление workspace из постоянного хранилища
# Вызывается при загрузке датапака

# Проверить наличие бэкапа
execute unless data storage cutscene:persistent workspace_backup run return 0

# Восстановить данные (копируем все поля)
execute if data storage cutscene:persistent workspace_backup.points run data modify storage cutscene:workspace points set from storage cutscene:persistent workspace_backup.points
execute if data storage cutscene:persistent workspace_backup.name run data modify storage cutscene:workspace name set from storage cutscene:persistent workspace_backup.name
execute if data storage cutscene:persistent workspace_backup.settings run data modify storage cutscene:workspace settings set from storage cutscene:persistent workspace_backup.settings
execute if data storage cutscene:persistent workspace_backup.generated_points run data modify storage cutscene:workspace generated_points set from storage cutscene:persistent workspace_backup.generated_points
execute if data storage cutscene:persistent workspace_backup.original_points run data modify storage cutscene:workspace original_points set from storage cutscene:persistent workspace_backup.original_points

# Подсчитать точки
execute store result score #point_count cutscene.temp run data get storage cutscene:workspace points

# Если есть точки - восстановить визуализацию
execute if score #point_count cutscene.temp matches 1.. run tellraw @a[tag=debug] [{"text":"[DEBUG] Workspace восстановлен: ","color":"green"},{"score":{"name":"#point_count","objective":"cutscene.temp"},"color":"white"},{"text":" точек","color":"green"}]

# Восстановить маркеры точек для всех игроков в режиме редактирования
execute as @a[scores={cutscene.state=0}] if data storage cutscene:workspace points[0] run function cutscene:edit/workspace_show_points_loop
