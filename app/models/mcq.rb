class Mcq < ActiveRecord::Base
  include Exercisable
  
  TYPES = [CheckBox.name, RadioButton.name]

  has_many :binary_answers, as: :exercisable, dependent: :destroy, inverse_of: :exercisable
  has_many :valid_binary_answers, -> { where value: true }, class_name: BinaryAnswer.name, as: :exercisable, inverse_of: :exercisable
  has_many :invalid_binary_answers, -> { where value: false }, class_name: BinaryAnswer.name, as: :exercisable, inverse_of: :exercisable
  accepts_nested_attributes_for :binary_answers, allow_destroy: true

  validate do
    check_binary_answer_count
  end

  private 

  def check_binary_answer_count
    unless binary_answer_count_valid?
      errors.add(:base, "A MCQ-type exercise must have at least 2 answers.")
    end
  end

  def binary_answer_count_valid?
    binary_answers.reject(&:marked_for_destruction?).size >= 2
  end
end