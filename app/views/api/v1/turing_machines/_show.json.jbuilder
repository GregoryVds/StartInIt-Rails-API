json.turing_tests do
  json.array! turing_machine.turing_tests, partial: 'api/v1/turing_tests/show', as: :turing_test
end