# Cutscene System - Get Cutscene Data
# Чтение данных катсцены
# Параметры: id

# Копирование данных катсцены во временное хранилище
$data modify storage cutscene:temp cutscene_data set from storage cutscene:data cutscenes.$(id)
