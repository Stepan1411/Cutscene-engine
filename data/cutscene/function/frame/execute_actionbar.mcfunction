# Cutscene System - Execute Actionbar
# Отображение actionbar

# Копирование данных actionbar для макроса
data modify storage cutscene:temp actionbar_data set from storage cutscene:temp current_frame.actionbar
function cutscene:frame/execute_actionbar_macro with storage cutscene:temp actionbar_data
