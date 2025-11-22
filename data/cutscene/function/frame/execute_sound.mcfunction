# Cutscene System - Execute Sound
# Воспроизведение звука

# Получение параметров звука
data modify storage cutscene:temp sound_data set from storage cutscene:temp current_frame.sound

# Воспроизведение звука через макрос
function cutscene:frame/execute_sound_macro with storage cutscene:temp sound_data
