class LogicOutput < ActiveRecord::Base
  belongs_to :logic, inverse_of: :logic_outputs
  validates_presence_of :value
  validates :value, numericality: { greater_than_or_equal_to: 0 }
end