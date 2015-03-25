json.(logic, :inputs, :max_gates)
json.outputs do
  json.array! logic.logic_outputs.map(&:value)
end