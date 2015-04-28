json.(track, :id, :description, :difficulty, :name, :pre_requisites)
json.achieved_count  track.achievements_count(current_user)
json.exercises_count track.exercises.count
