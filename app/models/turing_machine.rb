class TuringMachine < ActiveRecord::Base
  include Exercisable
  has_many :turing_tests, dependent: :destroy, inverse_of: :turing_machine
  accepts_nested_attributes_for :turing_tests, allow_destroy: true
end
