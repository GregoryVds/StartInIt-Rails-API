json.partial! 'api/v1/exercises/exercise', exercise: @exercise

json.help_links do
  json.array! @exercise.exercisable.help_links, partial: 'api/v1/help_links/show', as: :help_link
end

json.data do
  json.partial! "api/v1/#{@exercise.exercisable_type.pluralize.underscore}/show", {@exercise.exercisable_type.underscore.downcase.to_sym => @exercise.exercisable}
end
