class TuringTest < ActiveRecord::Base
  belongs_to :turing_machine, inverse_of: :turing_tests

  ADMIN_PERMITTED_PARAMS = [turing_tests_attributes: [:id, :tape, :answer, :direction, :final_state, :symbols, :max_states, :max_steps, :_destroy]]
end
