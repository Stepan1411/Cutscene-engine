# Cutscene System - Execute Title
# Отображение титров

# Установка времени отображения (по умолчанию)
title @s times 10 40 10

# Копирование данных title для макроса
data modify storage cutscene:temp title_data set from storage cutscene:temp current_frame.title

# Вызов макроса для отображения
function cutscene:frame/execute_title_macro with storage cutscene:temp title_data
