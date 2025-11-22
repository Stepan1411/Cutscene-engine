# Cutscene System - Execute Effects
# Применение эффектов

# Примечание: В Minecraft нет простого способа итерации по массивам
# Эта функция будет применять эффекты если они заданы в определенном формате
# Для полной реализации потребуется более сложная логика или предопределенные слоты

# Пример применения первого эффекта если он есть
execute if data storage cutscene:temp current_frame.effects[0] run function cutscene:frame/execute_effect_single {index:0}
