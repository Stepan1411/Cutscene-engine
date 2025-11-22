# Cutscene System - Show Last Point Debug
# Показать координаты последней точки для отладки

# Получить последнюю точку по индексу
$data modify storage cutscene:temp last_point set from storage cutscene:workspace generated_points[$(debug_index)]
tellraw @a[tag=debug] [{"text":"[DEBUG] Последняя точка: ","color":"gray"},{"nbt":"last_point.pos","storage":"cutscene:temp","color":"white"}]
