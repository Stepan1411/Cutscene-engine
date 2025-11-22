# Cutscene System - Execute Particles
# Воспроизведение частиц

# Копирование данных для макроса
data modify storage cutscene:temp particle_data set from storage cutscene:temp current_frame.particle

# Воспроизведение частиц через макрос
function cutscene:frame/execute_particle_macro with storage cutscene:temp particle_data
