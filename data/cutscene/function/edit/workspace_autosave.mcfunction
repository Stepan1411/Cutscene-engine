# Автосохранение workspace в постоянное хранилище
# Вызывается при изменениях workspace

# Сохранить все данные workspace в постоянное хранилище
data modify storage cutscene:persistent workspace_backup set from storage cutscene:workspace

# Отладка
tellraw @a[tag=debug] [{"text":"[DEBUG] Workspace автосохранен","color":"green"}]
