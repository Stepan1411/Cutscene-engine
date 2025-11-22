# Загрузить настройки окончания из катсцены
# Параметры: id

$execute if data storage cutscene:data cutscenes.$(id).ending run data modify storage cutscene:temp ending_settings set from storage cutscene:data cutscenes.$(id).ending
