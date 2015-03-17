json.partial! 'api/v1/tracks/track', track: @track
json.exercises do
  json.array! @track.exercises, partial: 'api/v1/exercises/exercise', as: :exercise
end