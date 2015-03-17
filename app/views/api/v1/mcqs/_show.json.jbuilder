json.answers do
  json.array! mcq.binary_answers, partial: 'api/v1/binary_answers/show', as: :answer
end