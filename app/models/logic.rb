class Logic < ActiveRecord::Base
  include Exercisable  
  has_many :logic_outputs, dependent: :destroy, inverse_of: :logic
  validates_presence_of :logic_outputs
  accepts_nested_attributes_for :logic_outputs, allow_destroy: true

  validate do
    check_logic_outputs_count
  end

  private 

  def check_logic_outputs_count
    unless logic_outputs_count_valid?
      errors.add(:base, "A Logic-type exercise must have at least 1 output.")
    end
  end

  def logic_outputs_count_valid?
    logic_outputs.reject(&:marked_for_destruction?).size > 0
  end

end