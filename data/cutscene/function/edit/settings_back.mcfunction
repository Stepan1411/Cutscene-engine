# Cutscene System - Settings Back
# Возврат из настроек в главное меню

# Установить тег для отложенного выполнения
tag @s add cutscene.settings_back

# Отложить выполнение на 1 тик чтобы избежать добавления точки
schedule function cutscene:edit/settings_back_delayed 1t
