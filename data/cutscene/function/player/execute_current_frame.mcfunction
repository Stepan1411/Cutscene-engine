# Cutscene System - Execute Current Frame
# Выполнение текущего кадра

# Копирование данных кадра во временное хранилище
$data modify storage cutscene:temp current_frame set from storage cutscene:data cutscenes.$(cutscene_id).frames[$(index)]

# Выполнение кадра
function cutscene:frame/execute
