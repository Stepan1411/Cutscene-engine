# Cutscene System - Set Cutscene Data
# Запись данных катсцены
# Параметры: id

# Копирование данных из временного хранилища в основное
$data modify storage cutscene:data cutscenes.$(id) set from storage cutscene:temp cutscene_data

# Обновление timestamp изменения
$execute store result storage cutscene:data cutscenes.$(id).modified long 1 run time query gametime
