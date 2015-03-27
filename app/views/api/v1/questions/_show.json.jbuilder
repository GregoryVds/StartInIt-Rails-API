json.(question, :question)
json.answers do
  json.array! question.text_answers.map(&:answer)
end