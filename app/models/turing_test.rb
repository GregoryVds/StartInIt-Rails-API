class TuringTest < ActiveRecord::Base
  belongs_to :turing_machine, inverse_of: :turing_tests
end