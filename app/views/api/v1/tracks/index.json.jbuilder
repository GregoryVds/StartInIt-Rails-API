json.data do
  json.array! @tracks, partial: 'api/v1/tracks/track', as: :track
end

json.partial! 'api/v1/paging', collection: @tracks