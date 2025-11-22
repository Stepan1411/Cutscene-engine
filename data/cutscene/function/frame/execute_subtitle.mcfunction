# Cutscene System - Execute Subtitle
# Отображение subtitle

# Копирование данных subtitle для макроса
data modify storage cutscene:temp subtitle_data set from storage cutscene:temp current_frame.subtitle
function cutscene:frame/execute_subtitle_macro with storage cutscene:temp subtitle_data
