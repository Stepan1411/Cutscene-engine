# Get frame by index from storage
# Макрос для получения кадра из storage по ID катсцены и индексу

$data modify storage cutscene:temp current_frame set from storage cutscene:data cutscenes.$(check_cutscene_id).frames[$(current_frame_index)]
