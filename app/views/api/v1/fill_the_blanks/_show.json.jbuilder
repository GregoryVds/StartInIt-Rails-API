json.questions do
  json.array! fill_the_blank.questions, partial: 'api/v1/questions/show', as: :question
end