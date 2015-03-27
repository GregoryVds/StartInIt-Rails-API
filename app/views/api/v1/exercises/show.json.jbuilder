json.partial! 'api/v1/exercises/exercise', exercise: @exercise

json.data do
  json.partial! "api/v1/#{@exercise.exercisable_type.pluralize.underscore}/show", {@exercise.exercisable_type.underscore.downcase.to_sym => @exercise.exercisable}
end  