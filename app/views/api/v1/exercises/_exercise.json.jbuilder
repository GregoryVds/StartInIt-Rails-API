json.(exercise, :id, :track_id, :short_description, :description, :difficulty, :duration, :title)
json.achieved exercise.is_achieved?(current_user)
json.exercise_type exercise.type