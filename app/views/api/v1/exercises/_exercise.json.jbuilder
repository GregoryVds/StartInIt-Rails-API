json.(exercise, :id, :track_id, :description, :difficulty, :duration, :title)
json.achieved exercise.is_achieved?(current_user)
json.exercise_type exercise.type